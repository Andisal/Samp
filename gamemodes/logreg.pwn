#include <a_samp>
#include <a_mysql>
#include <sscanf2>
#include <bcrypt>
#include <easyDialog>
#include <Pawn.CMD>
#include <streamer>
#include <foreach>
#include <getvehiclecolor>
#include <a_zone>

///modules
#include "modules/vehiclename.pwn"




//modules
#define	BCRYPT_COST	12
/*
#define MYSQL_HOSTNAME		"151.80.47.109" // Change this to your own MySQL hostname
#define MYSQL_USERNAME		"gs8957" // Change this
#define MYSQL_PASSWORD		"QipKhKjTAF" // If you have a password, type it there. If you don't leave it blank.
#define MYSQL_DATABASE		"gs8957" // Change this
*/
#define MYSQL_HOSTNAME		"localhost" // Change this to your own MySQL hostname
#define MYSQL_USERNAME		"root" // Change this
#define MYSQL_PASSWORD		"12345678" // If you have a password, type it there. If you don't leave it blank.
#define MYSQL_DATABASE		"new" // Change this

#define COLOR_GREEN 0x33AA33AA
#define COLOR_RED 0xAA3333AA
#define COLOR_YELLOW 0xFFFF00AA
#define COLOR_WHITE 0xFFFFFFAA
#define COLOR_BLUE 0x0000BBAA
#define COLOR_LIGHTBLUE 0x33CCFFAA
#define COLOR_ORANGE 0xFF9900AA
#define COLOR_GREY 0x888888C8
#define COLOR_ADMINCHAT 0x33EE33FF
#define COLOR_PURPLE 0xD0AEEBFF
#define MAX_HOUSES (500)

#define SendErrorMessage(%0,%1) \
	SendClientMessage(%0, COLOR_RED, "[ОШИБКА]:{FFFFFF} "%1)
	
#define SendHelpMessage(%0,%1) \
	SendClientMessage(%0, COLOR_BLUE, "[ПОДСКАЗКА]:{FFFFFF} "%1)
	

new
	MySQL: Database,
	bool:LoggedIn[MAX_PLAYERS]
;
main( ) { }
enum PlayerData
{
	user_id,
	user_cash,
	user_kills,
	user_deaths,
	user_skin,
	user_admin,
	user_admlevel,
	user_house,
	PlayerText:pTextdraws[83],
	pHouseLights,
	user_spawn,
	user_ownerhouse,
	user_name[32],
	user_soname[32]
};

enum houseData {
	houseID,
	houseLights,
	houseExists,
	houseOwner,
	housePrice,
	houseAddress[32],
	Float:housePos[4],
	Float:houseInt[4],
	Text3D:houseText3D,
	housePickup,
	houseInterior,
	houseExterior,
	houseExteriorVW
};

enum vehicleData {
	vehID,
	vehOwner,
	vehExists,
	vehFuel,
	vehPrice,
	vehModel,
	Float:vehPos[4],
	Text3D:vehText3D
};
new PlayerInfo[MAX_PLAYERS][PlayerData];
new HouseData[MAX_HOUSES][houseData];
new VehicleData[MAX_PLAYERS][vehicleData];

public OnGameModeInit()
{
	Database = mysql_connect(MYSQL_HOSTNAME, MYSQL_USERNAME, MYSQL_PASSWORD, MYSQL_DATABASE);
	if(Database == MYSQL_INVALID_HANDLE || mysql_errno(Database) != 0)
	{
		print("SERVER: MySQL Connection failed, shutting the server down!");
		SendRconCommand("exit");
		return 1;
	}

	SetGameModeText("willbedie");
	mysql_tquery(Database, "SELECT * FROM `houses`", "House_Load", "");
	mysql_tquery(Database, "SELECT * FROM `business`", "Business_Load", "");
	mysql_tquery(Database, "SELECT * FROM `vehicle`", "Vehicle_Load", "");
	print("SERVER: MySQL Connection was successful.");
	DisableInteriorEnterExits();
	EnableStuntBonusForAll(0);
	SetTimer("FuelUpdate", 10000, true);
	return 1;
}

public OnPlayerConnect(playerid)
{
	new query[300];
	mysql_format(Database, query, sizeof(query), "SELECT * FROM `players` WHERE `Username` = '%e'", GetName(playerid));
	mysql_tquery(Database, query, "CheckAccount", "d", playerid);
	CreateTextdraws(playerid);
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	new query[300];
	mysql_format(Database, query, sizeof(query), "UPDATE `players` SET `Cash` = '%i', `Kills` = '%i', `Deaths` = '%i', `Skin` = '%i', `Admin` = '%i', `Admlevel` = '%i', `Spawn` = '%i', `OwnerHouse` = '%i', `Name` = '%s', `Soname` = '%s'  WHERE `ID` = '%i'",
	PlayerInfo[playerid][user_cash],
	PlayerInfo[playerid][user_kills],
	PlayerInfo[playerid][user_deaths],
	PlayerInfo[playerid][user_skin],
	PlayerInfo[playerid][user_admin],
	PlayerInfo[playerid][user_admlevel],
	PlayerInfo[playerid][user_spawn],
	PlayerInfo[playerid][user_ownerhouse],
	PlayerInfo[playerid][user_name],
	PlayerInfo[playerid][user_soname],
	PlayerInfo[playerid][user_id]);
	mysql_query(Database, query);
	return 1;
}

public OnPlayerUpdate(playerid)
{
    static
		id = -1,
		str[64],
        vehicleid;
        
    if (IsPlayerInAnyVehicle(playerid))
		vehicleid = GetPlayerVehicleID(playerid);
	else
	    vehicleid = INVALID_VEHICLE_ID;
    switch (PlayerInfo[playerid][pHouseLights])
	{
	    case 0:
	    {
	        if ((id = House_Inside(playerid)) != -1 && !HouseData[id][houseLights])
			{
	        	PlayerInfo[playerid][pHouseLights] = true;
	            PlayerTextDrawShow(playerid, PlayerInfo[playerid][pTextdraws][0]);
	        }
	        else PlayerTextDrawHide(playerid, PlayerInfo[playerid][pTextdraws][0]);
	    }
	    case 1:
	    {
	        if ((id = House_Inside(playerid)) == -1 || (id != -1 && HouseData[id][houseLights]))
			{
	            PlayerInfo[playerid][pHouseLights] = false;
                PlayerTextDrawHide(playerid, PlayerInfo[playerid][pTextdraws][0]);
	        }
	    }
	}
	if (IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
	    if (IsSpeedoVehicle(vehicleid))
	    {
		    static
		        Float:fDamage,
		        Float:fSpeed,
		        Float:fVelocity[3],
				zone[MAX_ZONE_NAME];

	  		GetVehicleHealth(vehicleid, fDamage);
	  		GetVehicleVelocity(vehicleid, fVelocity[0], fVelocity[1], fVelocity[2]);

	  		fDamage = floatdiv(1000 - fDamage, 10) * 1.42999; // 1.33334;
 	  		fSpeed = floatmul(floatsqroot((fVelocity[0] * fVelocity[0]) + (fVelocity[1] * fVelocity[1]) + (fVelocity[2] * fVelocity[2])), 100.0);

			if (fDamage < 0.0) fDamage = 0.0;
			else if (fDamage > 100.0) fDamage = 100.0;

            format(str, sizeof(str), "%d", VehicleData[vehicleid][vehFuel]);
			PlayerTextDrawSetString(playerid, PlayerInfo[playerid][pTextdraws][33], str);
			if(fSpeed >= 0 && fSpeed < 30)
			{
   				PlayerTextDrawHide(playerid, PlayerInfo[playerid][pTextdraws][43]);
			    PlayerTextDrawHide(playerid, PlayerInfo[playerid][pTextdraws][44]);
			    PlayerTextDrawShow(playerid, PlayerInfo[playerid][pTextdraws][42]);
				format(str, sizeof(str), "%.0f", fSpeed);
				PlayerTextDrawSetString(playerid, PlayerInfo[playerid][pTextdraws][42], str);
			}
			if(fSpeed > 30.0 && fSpeed < 70.0)
			{
			    PlayerTextDrawHide(playerid, PlayerInfo[playerid][pTextdraws][42]);
			    PlayerTextDrawHide(playerid, PlayerInfo[playerid][pTextdraws][44]);
			    PlayerTextDrawShow(playerid, PlayerInfo[playerid][pTextdraws][43]);
				format(str, sizeof(str), "%.0f", fSpeed);
				PlayerTextDrawSetString(playerid, PlayerInfo[playerid][pTextdraws][43], str);
			}
			if(fSpeed > 70.0)
			{
			    PlayerTextDrawHide(playerid, PlayerInfo[playerid][pTextdraws][42]);
				PlayerTextDrawHide(playerid, PlayerInfo[playerid][pTextdraws][43]);
			    PlayerTextDrawShow(playerid, PlayerInfo[playerid][pTextdraws][44]);
				format(str, sizeof(str), "%.0f", fSpeed);
				PlayerTextDrawSetString(playerid, PlayerInfo[playerid][pTextdraws][44], str);
			}
			GetPlayer2DZone(playerid, zone, MAX_ZONE_NAME);
			format(str, sizeof(str), "%s", zone);
			PlayerTextDrawSetString(playerid, PlayerInfo[playerid][pTextdraws][29], str);
			
			format(str, sizeof(str), "%.0f/100%%", (fDamage > 100.0) ? (100.0) : (fDamage));
   			PlayerTextDrawSetString(playerid, PlayerInfo[playerid][pTextdraws][31], str);
		}
	}
	return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	static
	    color1,
	    color2;
 	PlayerTextDrawSetPreviewModel(playerid, PlayerInfo[playerid][pTextdraws][21], GetVehicleModel(vehicleid));
	PlayerTextDrawSetString(playerid, PlayerInfo[playerid][pTextdraws][41], GetVehicleName(vehicleid));
	GetVehicleColor(vehicleid, color1, color2);
	PlayerTextDrawSetPreviewVehCol(playerid, PlayerInfo[playerid][pTextdraws][21], color1, color2);

	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	static
	    vehicleid;
	vehicleid = GetPlayerVehicleID(playerid);
	if(oldstate == PLAYER_STATE_DRIVER)
	{
	    for (new i = 20; i < 45; i ++)
	    {
			PlayerTextDrawHide(playerid, PlayerInfo[playerid][pTextdraws][i]);
		}
	}
	else if (newstate == PLAYER_STATE_DRIVER)
	{
	    if (IsSpeedoVehicle(vehicleid))
		{
			for (new i = 20; i < 43; i ++)
			{
				PlayerTextDrawShow(playerid, PlayerInfo[playerid][pTextdraws][i]);
			}
		}
	}
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys & KEY_SECONDARY_ATTACK)
	{
	    static
		    id = -1;
		    
	    if ((id = House_Nearest(playerid)) != -1)
	    {

			SetPlayerPos(playerid, HouseData[id][houseInt][0], HouseData[id][houseInt][1], HouseData[id][houseInt][2]);
			SetPlayerFacingAngle(playerid, HouseData[id][houseInt][3]);

			SetPlayerInterior(playerid, HouseData[id][houseInterior]);
			SetPlayerVirtualWorld(playerid, HouseData[id][houseID] + 5000);

			SetCameraBehindPlayer(playerid);
			PlayerInfo[playerid][user_house] = HouseData[id][houseID];
			return 1;
		}
		
		if ((id = House_Inside(playerid)) != -1 && IsPlayerInRangeOfPoint(playerid, 2.5, HouseData[id][houseInt][0], HouseData[id][houseInt][1], HouseData[id][houseInt][2]))
	    {
			SetPlayerPos(playerid, HouseData[id][housePos][0], HouseData[id][housePos][1], HouseData[id][housePos][2]);
			SetPlayerFacingAngle(playerid, HouseData[id][housePos][3] - 180.0);

			SetPlayerInterior(playerid, HouseData[id][houseExterior]);
			SetPlayerVirtualWorld(playerid, HouseData[id][houseExteriorVW]);

			SetCameraBehindPlayer(playerid);
			PlayerInfo[playerid][user_house] = -1;
			return 1;
		}
	}
	else if(newkeys & KEY_NO)
	{
	    static
		    id = -1;
	    if ((id = House_Inside(playerid)) != -1 && IsPlayerInRangeOfPoint(playerid, 1.5, 2261.4292,-1223.3892,1049.0234))
	    {
			PlayerInfo[playerid][user_house] = HouseData[id][houseID];
			Dialog_Show(playerid, DIALOG_CHANGESKIN, DIALOG_STYLE_LIST, "Выберите одежду", "Первый слот\nВторой слот\nТретий слот", "Выбрать", "Отмена");
			return 1;
		}
 	}
	
	return 1;
}
public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}
public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	if(playertextid == PlayerInfo[playerid][pTextdraws][9])
	{
		for(new i = 6; i< 16;i++)
		{
			PlayerTextDrawHide(playerid, PlayerInfo[playerid][pTextdraws][i]);
		}
	    CancelSelectTextDraw(playerid);
	}
	return 1;
}
public OnPlayerSpawn(playerid)
{
	SetPlayerSkin(playerid, PlayerInfo[playerid][user_skin]);
	GivePlayerMoney(playerid, PlayerInfo[playerid][user_cash]);
	SetPlayerSpawn(playerid);
	return 1;
}
forward CheckAccount(playerid);
public CheckAccount(playerid)
{
	new string[300];
	if(cache_num_rows())
	{
		format(string, sizeof(string), "{FFFFFF}Welcome back to {AFAFAF}Server{FFFFFF}%s. Please input your password below to log-in.", GetName(playerid));
		Dialog_Show(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "Login to the server", string, "Login", "Dip");
	}
	else
	{
		format(string, sizeof(string), "{FFFFFF}Welcome to our server, %s. Please type a strong password below to continue.", GetName(playerid));
		Dialog_Show(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD, "Register to the server", string, "Register", "Dip");
	}
	return 1;
}
///////////////////////////////////////ДИАЛОГИ/////////////////////////////////
Dialog:DIALOG_REGISTER(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		bcrypt_hash(inputtext, BCRYPT_COST, "OnPasswordHashed", "d", playerid);
	}
	else
		Kick(playerid);
	return 1;
}

Dialog:DIALOG_LOGIN(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		new query[300], Password[BCRYPT_HASH_LENGTH];
		mysql_format(Database, query, sizeof(query), "SELECT `Password` FROM `players` WHERE `Username` = '%e'", GetName(playerid));
		mysql_query(Database, query);
		cache_get_value_name(0, "Password", Password, BCRYPT_HASH_LENGTH);
		bcrypt_check(inputtext, Password, "OnPasswordChecked", "d", playerid);
	}
	else
		Kick(playerid);
	return 1;
}

Dialog:DIALOG_CHANGESKIN(playerid, response, listitem, inputtext[])
{
	if(response)
	{
        switch(listitem)
		{
		    case 0:
			{
				SetTimerEx("GivePlayerSkin", 3000, false, "dd", playerid, 120);
				ApplyAnimation(playerid, "CLOTHES",	"CLO_POSE_TORSO", 4.1, 0, 1, 1, 0, 0, 1);
				SetPlayerAttachedObject(playerid, 0, 2819, 3, 0.400000, 0.000000, -0.800000, 0.000000, 90.000000, 180.000000);
				SetTimerEx("RemoveAttachedObject", 3000, false, "dd", playerid, 0);
			}
		    case 1:
		    {
		        SetTimerEx("GivePlayerSkin", 3000, false, "dd", playerid, 121);
		        ApplyAnimation(playerid, "CLOTHES",	"CLO_POSE_TORSO", 4.1, 0, 0, 0, 0, 0, 1);
				SetPlayerAttachedObject(playerid, 0, 2819, 3, 0.400000, 0.000000, -0.800000, 0.000000, 90.000000, 180.000000);
				SetTimerEx("RemoveAttachedObject", 3000, false, "dd", playerid, 0);
			}
		    case 2:
		    {
		        SetTimerEx("GivePlayerSkin", 3000, false, "dd", playerid, 122);
		        ApplyAnimation(playerid, "CLOTHES",	"CLO_POSE_TORSO", 4.1, 0, 0, 0, 0, 0, 1);
				SetPlayerAttachedObject(playerid, 0, 2819, 3, 0.400000, 0.000000, -0.800000, 0.000000, 90.000000, 180.000000);
				SetTimerEx("RemoveAttachedObject", 3000, false, "dd", playerid, 0);
			}
		}
	}
	return 1;
}
///////////////////////////////////////ДИАЛОГИ/////////////////////////////////

stock IsSpeedoVehicle(vehicleid)
{
	if (GetVehicleModel(vehicleid) == 509 || GetVehicleModel(vehicleid) == 510 || GetVehicleModel(vehicleid) == 481) {
	    return 0;
	}
	return 1;
}

forward RemoveAttachedObject(playerid, slot);
public RemoveAttachedObject(playerid, slot)
{
	RemovePlayerAttachedObject(playerid, slot);
	return 1;
}

forward GivePlayerSkin(playerid, skin);
public GivePlayerSkin(playerid, skin)
{
	SetPlayerSkin(playerid, skin);
	PlayerInfo[playerid][user_skin] = skin;
	return 1;
}

forward OnPasswordHashed(playerid);
public OnPasswordHashed(playerid)
{
	new hash[BCRYPT_HASH_LENGTH], query[300];
	bcrypt_get_hash(hash);
	mysql_format(Database, query, sizeof(query), "INSERT INTO `players` (`Username`, `Password`, `IPAddress`, `Spawn`) VALUES ('%e', '%e', '%e', '0')", GetName(playerid), hash, ReturnIP(playerid));
	mysql_tquery(Database, query, "OnPlayerRegister", "d", playerid);
	return 1;
}

forward OnPlayerRegister(playerid);
public OnPlayerRegister(playerid)
{
	SpawnPlayer(playerid);
	SendClientMessage(playerid, -1, "You have been successfully registered in our server.");
	return 1;	
}

forward OnPasswordChecked(playerid);
public OnPasswordChecked(playerid)
{
	new bool:match = bcrypt_is_equal();
	if(match)
	{
		new query[300];
		mysql_format(Database, query, sizeof(query), "SELECT * FROM `players` WHERE `Username` = '%e'", GetName(playerid));
		mysql_tquery(Database, query, "OnPlayerLoad", "d", playerid);
	}
	else
	{
		new string[100];
		format(string, sizeof(string), "Wrong Password!\nPlease type your correct password below.");
		Dialog_Show(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "Login to our server", string, "Register", "Dip");
	}
	return 1;
}

forward OnPlayerLoad(playerid);
public OnPlayerLoad(playerid)
{
	cache_get_value_name_int(0, "ID", PlayerInfo[playerid][user_id]);
	cache_get_value_name_int(0, "Cash", PlayerInfo[playerid][user_cash]);
	cache_get_value_name_int(0, "Kills", PlayerInfo[playerid][user_kills]);
	cache_get_value_name_int(0, "Deaths", PlayerInfo[playerid][user_deaths]);
	cache_get_value_name_int(0, "Skin", PlayerInfo[playerid][user_skin]);
	cache_get_value_name_int(0, "Admin", PlayerInfo[playerid][user_admin]);
	cache_get_value_name_int(0, "Admlevel", PlayerInfo[playerid][user_admlevel]);
	cache_get_value_name_int(0, "Spawn", PlayerInfo[playerid][user_spawn]);
    cache_get_value_name_int(0, "OwnerHouse", PlayerInfo[playerid][user_ownerhouse]);
    cache_get_value_name_int(0, "OwnerHouse", PlayerInfo[playerid][user_ownerhouse]);
    cache_get_value_name(0, "Name", PlayerInfo[playerid][user_name], 32);
    cache_get_value_name(0, "Soname", PlayerInfo[playerid][user_soname], 32);
	LoggedIn[playerid] = true;
	SendClientMessage(playerid, -1, "Welcome back to our server.");
	SpawnPlayer(playerid);
	return 1;
}

GetName(playerid)
{
	new name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, sizeof(name));
	return name;
}

ReturnIP(playerid)
{
	new PlayerIP[17];
	GetPlayerIp(playerid, PlayerIP, sizeof(PlayerIP));
	return PlayerIP;
}

stock GetEngineStatus(vehicleid)
{
	static
	    engine,
	    lights,
	    alarm,
	    doors,
	    bonnet,
	    boot,
	    objective;

	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);

	if (engine != 1)
		return 0;

	return 1;
}

stock SetEngineStatus(vehicleid, status)
{
	static
	    engine,
	    lights,
	    alarm,
	    doors,
	    bonnet,
	    boot,
	    objective;

	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
	return SetVehicleParamsEx(vehicleid, status, lights, alarm, doors, bonnet, boot, objective);
}

ReturnDate()
{
	static
	    date[36];

	getdate(date[2], date[1], date[0]);
	gettime(date[3], date[4], date[5]);

	format(date, sizeof(date), "%02d/%02d/%d, %02d:%02d", date[0], date[1], date[2], date[3], date[4]);
	return date;
}

ReturnName(playerid, underscore=1)
{
	static
	    name[MAX_PLAYER_NAME + 1];

	GetPlayerName(playerid, name, sizeof(name));

 	if (!underscore) {
	    for (new i = 0, len = strlen(name); i < len; i ++) {
	        if (name[i] == '_') name[i] = ' ';
		}
	}

	return name;
}

stock Log_Write(const path[], const str[], {Float,_}:...)
{
	static
	    args,
	    start,
	    end,
	    File:file,
	    string[1024]
	;
	if ((start = strfind(path, "/")) != -1) {
	    strmid(string, path, 0, start + 1);

	    if (!fexist(string))
	        return printf("** Warning: Directory \"%s\" doesn't exist.", string);
	}
	#emit LOAD.S.pri 8
	#emit STOR.pri args

	file = fopen(path, io_append);

	if (!file)
	    return 0;

	if (args > 8)
	{
		#emit ADDR.pri str
		#emit STOR.pri start

	    for (end = start + (args - 8); end > start; end -= 4)
		{
	        #emit LREF.pri end
	        #emit PUSH.pri
		}
		#emit PUSH.S str
		#emit PUSH.C 1024
		#emit PUSH.C string
		#emit PUSH.C args
		#emit SYSREQ.C format

		fwrite(file, string);
		fwrite(file, "\r\n");
		fclose(file);

		#emit LCTRL 5
		#emit SCTRL 4
		#emit RETN
	}
	fwrite(file, str);
	fwrite(file, "\r\n");
	fclose(file);

	return 1;
}

stock SendAdminAlert(color, const str[], {Float,_}:...)
{
	static
	    args,
	    start,
	    end,
	    string[144]
	;
	#emit LOAD.S.pri 8
	#emit STOR.pri args

	if (args > 8)
	{
		#emit ADDR.pri str
		#emit STOR.pri start

	    for (end = start + (args - 8); end > start; end -= 4)
		{
	        #emit LREF.pri end
	        #emit PUSH.pri
		}
		#emit PUSH.S str
		#emit PUSH.C 144
		#emit PUSH.C string

		#emit LOAD.S.pri 8
		#emit ADD.C 4
		#emit PUSH.pri

		#emit SYSREQ.C format
		#emit LCTRL 5
		#emit SCTRL 4

        foreach (new i : Player)
		{
			if (PlayerInfo[i][user_admin] == 1) {
  				SendClientMessage(i, color, string);
			}
		}
		return 1;
	}
	foreach (new i : Player)
	{
		if (PlayerInfo[i][user_admin] == 1) {
			SendClientMessage(i, color, str);
		}
	}
	return 1;
}

GiveMoney(playerid, amount)
{
    PlayerInfo[playerid][user_cash] += amount;
	GivePlayerMoney(playerid, amount);
	return 1;
}
///////////////////////////////////////SPAWN/////////////////////////////////////
stock SetPlayerSpawn(playerid)
{
	if(PlayerInfo[playerid][user_spawn] == 0)
	{
		SetPlayerPos(playerid, 271, -51, 2);
		SetPlayerVirtualWorld(playerid, 0);
		return 1;
	}
	if(PlayerInfo[playerid][user_spawn] == 1)
	{
		static
		    interior,
		    vw,
		    owner;
		owner = PlayerInfo[playerid][user_ownerhouse];
	    interior = HouseData[owner][houseInterior];
	    vw = HouseData[owner][houseID] + 5000;
	    if(interior == 10)
	    {
   			SetPlayerPos(playerid, 2258.4309,-1223.7205,1049.7917);
			SetPlayerVirtualWorld(playerid, vw);
			SetPlayerInterior(playerid, interior);
			SetPlayerFacingAngle(playerid, 270);
			PlayerInfo[playerid][user_house] = HouseData[owner][houseID];
			ApplyAnimation(playerid, "CRACK", "CRCKIDLE2", 4.1, 1, 1, 1, 1, 1, 1);
	    }
	}
	return 1;
}

///////////////////////////////////////SPAWN/////////////////////////////////////
/////////////////////////////////////////СИСТЕМА ТРАНСПОРТА////////////////////////

GetVehicleName(vehicleid)
{
    new
	    name[32] = "None",
	    model;
	model = GetVehicleModel(vehicleid);
    if (model < 400 || model > 611)
	    return name;

	format(name, sizeof(name), g_arrVehicleNames[model - 400]);
	return name;
}

forward Vehicle_Load();
public Vehicle_Load()
{
	static
	    rows;

	cache_get_row_count(rows);

	for (new i = 0; i < rows; i ++) if (i < MAX_PLAYERS)
	{
		VehicleData[i][vehExists] = true;

		cache_get_value_name_int(i, "ID", VehicleData[i][vehID]);
		cache_get_value_name_int(i, "vehModel", VehicleData[i][vehModel]);
	 	cache_get_value_name_int(i, "vehOwner", VehicleData[i][vehOwner]);
	 	cache_get_value_name_int(i, "vehPrice", VehicleData[i][vehPrice]);
	 	cache_get_value_name_int(i, "vehFuel", VehicleData[i][vehFuel]);

	 	cache_get_value_name_float(i, "vehPosX", VehicleData[i][vehPos][0]);
		cache_get_value_name_float(i, "vehPosY", VehicleData[i][vehPos][1]);
		cache_get_value_name_float(i, "vehPosZ", VehicleData[i][vehPos][2]);
		cache_get_value_name_float(i, "vehPosA", VehicleData[i][vehPos][3]);

		Vehicle_Refresh(i);
	}
	return 1;
}
Vehicle_Refresh(vehid)
{
	static
	    id,
	    string[128];
	if(vehid != -1)
	{
		id = CreateVehicle(VehicleData[vehid][vehModel], VehicleData[vehid][vehPos][0], VehicleData[vehid][vehPos][1], VehicleData[vehid][vehPos][2], VehicleData[vehid][vehPos][3], -1, -1, 0);
		format(string, sizeof(string), "[%s]", FormatNumber(VehicleData[vehid][vehPrice]));
  		VehicleData[vehid][vehText3D] = CreateDynamic3DTextLabel(string, 0x33AA33FF, VehicleData[vehid][vehPos][0], VehicleData[vehid][vehPos][1], VehicleData[vehid][vehPos][2], 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 0, 0);
	    SetEngineStatus(id, 0);
	    VehicleData[vehid][vehFuel] = 100;
	}
	return 1;
}

Vehicle_Create(playerid, model, price)
{
    static
	    Float:x,
	    Float:y,
	    Float:z,
		Float:angle;

	if (GetPlayerPos(playerid, x, y, z) && GetPlayerFacingAngle(playerid, angle))
	{
	    for (new i = 0; i != MAX_PLAYERS; i ++)
		{
			if(VehicleData[i][vehExists] !=1)
			{
			    VehicleData[i][vehExists] = 1;
			    VehicleData[i][vehOwner] = 0;
			    VehicleData[i][vehPrice] = price;
                VehicleData[i][vehModel] = model;
                VehicleData[i][vehFuel] = 100;
                
			    VehicleData[i][vehPos][0] = x;
	      		VehicleData[i][vehPos][1] = y;
	   			VehicleData[i][vehPos][2] = z;
	      		VehicleData[i][vehPos][3] = angle;

				Vehicle_Refresh(i);
				mysql_tquery(Database, "INSERT INTO `vehicle` (`vehOwner`) VALUES(0)", "OnVehicleCreated", "d", i);
				return i;
			}
		}
	}
	return -1;
}

Vehicle_Save(vehid)
{
	static
	    query[1536];

	format(query, sizeof(query), "UPDATE `vehicle` SET `vehOwner` = '%d', `vehModel` = '%d', `vehFuel` = '%d', `vehPrice` = '%d', `vehPosX` = '%.4f', `vehPosY` = '%.4f', `vehPosZ` = '%.4f', `vehPosA` = '%.4f' WHERE `ID` = '%d'",
	    VehicleData[vehid][vehOwner],
	    VehicleData[vehid][vehModel],
	    VehicleData[vehid][vehFuel],
	    VehicleData[vehid][vehPrice],
	    VehicleData[vehid][vehPos][0],
	    VehicleData[vehid][vehPos][1],
	    VehicleData[vehid][vehPos][2],
	    VehicleData[vehid][vehPos][3],
        VehicleData[vehid][vehID]
	);
	return mysql_tquery(Database, query);
}

forward OnVehicleCreated(vehid);
public OnVehicleCreated(vehid)
{
	if (vehid == -1 || !VehicleData[vehid][vehExists])
	    return 0;

	VehicleData[vehid][vehID] = cache_insert_id();
	Vehicle_Save(vehid);
	return 1;
}

forward FuelUpdate();
public FuelUpdate()
{
	for (new i = 1; i != MAX_VEHICLES; i ++) if (GetEngineStatus(i))
	{
	    if (VehicleData[i][vehFuel] > 0)
	    {
	        VehicleData[i][vehFuel]--;

			if (VehicleData[i][vehFuel] >= 1 && VehicleData[i][vehFuel] <= 5)
			{
			    SendClientMessage(GetVehicleDriver(i), COLOR_RED, "[WARNING]:{FFFFFF} This vehicle is low on fuel. You must visit a fuel station!");
			}
		}
		if (VehicleData[i][vehFuel] <= 0)
		{
		    VehicleData[i][vehFuel] = 0;
		    SetEngineStatus(i, false);
		}
	}
}
GetVehicleDriver(vehicleid) {
	foreach (new i : Player) {
		if (GetPlayerState(i) == PLAYER_STATE_DRIVER && GetPlayerVehicleID(i) == vehicleid) return i;
	}
	return INVALID_PLAYER_ID;
}
////////////////////////////////////////СИСТЕМА ТРАНСПОРТА///////////////////////////


////////////////////////////////////////СИСТЕМА ДОМОВ////////////////////////////////

House_Create(playerid, price, address[])
{
    static
	    Float:x,
	    Float:y,
	    Float:z,
		Float:angle;

	if (GetPlayerPos(playerid, x, y, z) && GetPlayerFacingAngle(playerid, angle))
	{
	    for (new i = 0; i != MAX_HOUSES; i ++)
		{
			if(HouseData[i][houseExists] !=1)
			{
			    HouseData[i][houseExists] = 1;
			    HouseData[i][houseLights] = false;
			    HouseData[i][houseOwner] = 0;
			    HouseData[i][housePrice] = price;

			    format(HouseData[i][houseAddress], 32, address);

			    HouseData[i][housePos][0] = x;
	      		HouseData[i][housePos][1] = y;
	   			HouseData[i][housePos][2] = z;
	      		HouseData[i][housePos][3] = angle;

				HouseData[i][houseInt][0] = 2269.8772;
				HouseData[i][houseInt][1] = -1210.3240;
				HouseData[i][houseInt][2] = 1047.5625;
				HouseData[i][houseInt][3] = 90.0000;

				HouseData[i][houseInterior] = 10;
				HouseData[i][houseExterior] = GetPlayerInterior(playerid);
				HouseData[i][houseExteriorVW] = GetPlayerVirtualWorld(playerid);

				House_Refresh(i);
				mysql_tquery(Database, "INSERT INTO `houses` (`Owner`) VALUES(0)", "OnHouseCreated", "d", i);
				return i;
			}
		}
	}
	return -1;
}

House_Refresh(houseid)
{
	if (houseid != -1)
	{
		if (IsValidDynamic3DTextLabel(HouseData[houseid][houseText3D]))
		    DestroyDynamic3DTextLabel(HouseData[houseid][houseText3D]);

		if (IsValidDynamicPickup(HouseData[houseid][housePickup]))
		    DestroyDynamicPickup(HouseData[houseid][housePickup]);

		static
		    string[128];

		if (!HouseData[houseid][houseOwner]) {
			format(string, sizeof(string), "[%s]\n%s", FormatNumber(HouseData[houseid][housePrice]), HouseData[houseid][houseAddress]);
            HouseData[houseid][houseText3D] = CreateDynamic3DTextLabel(string, 0x33AA33FF, HouseData[houseid][housePos][0], HouseData[houseid][housePos][1], HouseData[houseid][housePos][2], 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, HouseData[houseid][houseExteriorVW], HouseData[houseid][houseExterior]);
		}
		else {
			format(string, sizeof(string), "%s", HouseData[houseid][houseAddress]);
			HouseData[houseid][houseText3D] = CreateDynamic3DTextLabel(string, COLOR_WHITE, HouseData[houseid][housePos][0], HouseData[houseid][housePos][1], HouseData[houseid][housePos][2], 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, HouseData[houseid][houseExteriorVW], HouseData[houseid][houseExterior]);
		}
        HouseData[houseid][housePickup] = CreateDynamicPickup(1273, 23, HouseData[houseid][housePos][0], HouseData[houseid][housePos][1], HouseData[houseid][housePos][2], HouseData[houseid][houseExteriorVW], HouseData[houseid][houseExterior]);
		//HouseData[houseid][houseMapIcon] = CreateDynamicMapIcon(HouseData[houseid][housePos][0], HouseData[houseid][housePos][1], HouseData[houseid][housePos][2], (HouseData[houseid][houseOwner] != 0) ? (32) : (31), 0, HouseData[houseid][houseExteriorVW], HouseData[houseid][houseExterior]);
	}
	return 1;
}

House_Save(houseid)
{
	static
	    query[1536];

	format(query, sizeof(query), "UPDATE `houses` SET `Owner` = '%d', `Price` = '%d', `Address` = '%s', `housePosX` = '%.4f', `housePosY` = '%.4f', `housePosZ` = '%.4f', `housePosA` = '%.4f', `houseIntX` = '%.4f', `houseIntY` = '%.4f', `houseIntZ` = '%.4f', `houseIntA` = '%.4f', `houseInterior` = '%d', `houseExterior` = '%d', `houseExteriorVW` = '%d' WHERE `ID` = '%d'",
	    HouseData[houseid][houseOwner],
	    HouseData[houseid][housePrice],
	    HouseData[houseid][houseAddress],
	    HouseData[houseid][housePos][0],
	    HouseData[houseid][housePos][1],
	    HouseData[houseid][housePos][2],
	    HouseData[houseid][housePos][3],
	    HouseData[houseid][houseInt][0],
	    HouseData[houseid][houseInt][1],
	    HouseData[houseid][houseInt][2],
	    HouseData[houseid][houseInt][3],
        HouseData[houseid][houseInterior],
        HouseData[houseid][houseExterior],
        HouseData[houseid][houseExteriorVW],
        HouseData[houseid][houseID]
	);
	return mysql_tquery(Database, query);
}

forward OnHouseCreated(houseid);
public OnHouseCreated(houseid)
{
	if (houseid == -1 || !HouseData[houseid][houseExists])
	    return 0;

	HouseData[houseid][houseID] = cache_insert_id();
	House_Save(houseid);
	return 1;
}

forward House_Load();
public House_Load()
{
	static
	    rows;

	cache_get_row_count(rows);

	for (new i = 0; i < rows; i ++) if (i < MAX_HOUSES)
	{
		HouseData[i][houseExists] = true;
		HouseData[i][houseLights] = false;

		cache_get_value_name_int(i, "ID", HouseData[i][houseID]);
	 	cache_get_value_name_int(i, "Owner", HouseData[i][houseOwner]);
	 	cache_get_value_name_int(i, "Price", HouseData[i][housePrice]);

		cache_get_value_name(i, "Address", HouseData[i][houseAddress], 32);
		
	 	cache_get_value_name_float(i, "housePosX", HouseData[i][housePos][0]);
		cache_get_value_name_float(i, "housePosY", HouseData[i][housePos][1]);
		cache_get_value_name_float(i, "housePosZ", HouseData[i][housePos][2]);
		cache_get_value_name_float(i, "housePosA", HouseData[i][housePos][3]);
		cache_get_value_name_float(i, "houseIntX", HouseData[i][houseInt][0]);
		cache_get_value_name_float(i, "houseIntY", HouseData[i][houseInt][1]);
		cache_get_value_name_float(i, "houseIntZ", HouseData[i][houseInt][2]);
		cache_get_value_name_float(i, "houseIntA", HouseData[i][houseInt][3]);
		cache_get_value_name_int(i, "houseInterior", HouseData[i][houseInterior]);
		cache_get_value_name_int(i, "houseExterior", HouseData[i][houseExterior]);
	 	cache_get_value_name_int(i, "houseExteriorVW", HouseData[i][houseExteriorVW]);

		House_Refresh(i);
	}
	return 1;
}

House_Nearest(playerid)
{
    for (new i = 0; i != MAX_HOUSES; i ++) if (HouseData[i][houseExists] && IsPlayerInRangeOfPoint(playerid, 2.5, HouseData[i][housePos][0], HouseData[i][housePos][1], HouseData[i][housePos][2]))
	{
		if (GetPlayerInterior(playerid) == HouseData[i][houseExterior] && GetPlayerVirtualWorld(playerid) == HouseData[i][houseExteriorVW])
			return i;
	}
	return -1;
}

House_Inside(playerid)
{
	if (PlayerInfo[playerid][user_house] != -1)
	{
	    for (new i = 0; i != MAX_HOUSES; i ++) if (HouseData[i][houseExists] && HouseData[i][houseID] == PlayerInfo[playerid][user_house] && GetPlayerInterior(playerid) == HouseData[i][houseInterior] && GetPlayerVirtualWorld(playerid) > 0) {
	        return i;
		}
	}
	return -1;
}

FormatNumber(number, prefix[] = "$")
{
	static
		value[32],
		length;

	format(value, sizeof(value), "%d", (number < 0) ? (-number) : (number));

	if ((length = strlen(value)) > 3)
	{
		for (new i = length, l = 0; --i >= 0; l ++) {
		    if ((l > 0) && (l % 3 == 0)) strins(value, ",", i + 1);
		}
	}
	if (prefix[0] != 0)
	    strins(value, prefix, 0);

	if (number < 0)
		strins(value, "-", 0);

	return value;
}
////////////////////////////////////////СИСТЕМА ДОМОВ////////////////////////////////

stock PlayerPlaySoundEx(playerid, sound)
{
	new
	    Float:x,
	    Float:y,
	    Float:z;

	GetPlayerPos(playerid, x, y, z);

	foreach (new i : Player) if (IsPlayerInRangeOfPoint(i, 20.0, x, y, z)) {
	    PlayerPlaySound(i, sound, x, y, z);
	}
	return 1;
}

stock SendNearbyMessage(playerid, Float:radius, color, const str[], {Float,_}:...)
{
	static
	    args,
	    start,
	    end,
	    string[144]
	;
	#emit LOAD.S.pri 8
	#emit STOR.pri args

	if (args > 16)
	{
		#emit ADDR.pri str
		#emit STOR.pri start

	    for (end = start + (args - 16); end > start; end -= 4)
		{
	        #emit LREF.pri end
	        #emit PUSH.pri
		}
		#emit PUSH.S str
		#emit PUSH.C 144
		#emit PUSH.C string

		#emit LOAD.S.pri 8
		#emit CONST.alt 4
		#emit SUB
		#emit PUSH.pri

		#emit SYSREQ.C format
		#emit LCTRL 5
		#emit SCTRL 4

        foreach (new i : Player)
		{
			if (IsPlayerNearPlayer(i, playerid, radius)) {
  				SendClientMessage(i, color, string);
			}
		}
		return 1;
	}
	foreach (new i : Player)
	{
		if (IsPlayerNearPlayer(i, playerid, radius)) {
			SendClientMessage(i, color, str);
		}
	}
	return 1;
}


stock IsPlayerNearPlayer(playerid, targetid, Float:radius)
{
	static
		Float:fX,
		Float:fY,
		Float:fZ;

	GetPlayerPos(targetid, fX, fY, fZ);

	return (GetPlayerInterior(playerid) == GetPlayerInterior(targetid) && GetPlayerVirtualWorld(playerid) == GetPlayerVirtualWorld(targetid)) && IsPlayerInRangeOfPoint(playerid, radius, fX, fY, fZ);
}

cmd:gmx(playerid, params[])
{
	GameModeExit();
	return 1;
}

cmd:givepos(playerid, params[])
{
	new Float:x,
	    Float:y,
	    Float:z,
	    string[56];
    GetPlayerPos(playerid, x, y, z);
	format(string, sizeof(string), "%f,%f,%f",x,y,z);
	SendClientMessage(playerid, COLOR_RED, string);
	return 1;
}

cmd:veh(playerid, params[])
{
	new model;
	if(sscanf(params, "d", model))
	    return SendHelpMessage(playerid, "/veh [model] [color1] [color2]");
	
	new Float:x,
	    Float:y,
	    Float:z,
	    Float:a;
	GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, a);
	new vehicleid = CreateVehicle(model, x, y + 2, z, a, -1, -1, 0);
	PutPlayerInVehicle(playerid, vehicleid, 0);
	SetEngineStatus(vehicleid, 0);
	return 1;
}

cmd:givegun(playerid, params[])
{
    static
	    userid,
	    weaponid,
	    ammo;
	    
    if (sscanf(params, "udI(500)", userid, weaponid, ammo))
	    return SendHelpMessage(playerid, "/givegun [id игрока][id оружия][ammo]");
    GivePlayerWeapon(userid, weaponid, ammo);
	return 1;
}

cmd:engine(playerid, params[])
{
    new vehicleid = GetPlayerVehicleID(playerid);
    
    if (GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
	    return SendErrorMessage(playerid, "Вы должны быть за рулем.");
    if (VehicleData[vehicleid][vehFuel] < 1)
	    return SendErrorMessage(playerid, "Пустой бак.");
    switch (GetEngineStatus(vehicleid))
	{
	    case false:
	    {
	        SetEngineStatus(vehicleid, true);
		}
		case true:
		{
		    SetEngineStatus(vehicleid, false);
		}
	}
	return 1;
}

cmd:setskin(playerid, params[])
{
    static
		userid,
		skinid;
		
	if (sscanf(params, "ud", userid, skinid))
	    return SendHelpMessage(playerid, "/setskin [id игрока] [skindid]");
	PlayerInfo[playerid][user_skin] = skinid;
	SetPlayerSkin(playerid, PlayerInfo[playerid][user_skin]);
	return 1;
}

cmd:beltup(playerid, params[])
{
    new vehicleid = GetPlayerVehicleID(playerid);
    if(!vehicleid)
        return SendErrorMessage(playerid, "Вы должны быть за рулем.");
	SetPlayerTeam(playerid, 0xbbbbbbFF);
	return 1;
}

cmd:givemoney(playerid, params[])
{
	static
	    userid,
	    money,
	    reason[128];
    if(PlayerInfo[playerid][user_admin] !=1)
		return SendErrorMessage(playerid, "Вы не админ.");
    if(PlayerInfo[playerid][user_admlevel] !=6)
		return SendErrorMessage(playerid, "Вы не админ 6 уровня.");
	if(sscanf(params, "uds[128]", userid, money, reason))
		return SendHelpMessage(playerid, "/givemoney [id игрока] [reason]");

	SendAdminAlert(COLOR_ADMINCHAT, "[ADMIN CHAT] %s: выдал %s деньги в размере %d по причине: %s", ReturnName(playerid, 0), ReturnName(userid, 0), money, reason);
	PlayerInfo[userid][user_cash] += money;
 	GivePlayerMoney(playerid, money);
 	
	Log_Write("gamelogs/money_log.txt", "[%s] %s dal %s money v kolvo:%d reason: %s.", ReturnDate(), ReturnName(playerid, 0), ReturnName(userid, 0), money, reason);
	return 1;
}

cmd:setadmin(playerid, params[])
{
	static
	    userid,
		level;
		
	if(PlayerInfo[playerid][user_admin] !=1)
		return SendErrorMessage(playerid, "Вы не админ.");
    if(PlayerInfo[playerid][user_admlevel] !=6)
		return SendErrorMessage(playerid, "Вы не админ 6 уровня.");
	if(sscanf(params, "ud", userid, level))
	    return SendHelpMessage(playerid, "/makeadmin [id игрока][level]");
	if(PlayerInfo[userid][user_admin] !=0 )
        return SendErrorMessage(playerid, "Игрок уже админ воспользуйтесь /setadminlevel.");
        
	PlayerInfo[userid][user_admin] = 1;
	PlayerInfo[userid][user_admlevel] = level;

    SendAdminAlert(COLOR_ADMINCHAT, "[ADMIN CHAT] %s: выдал %s админку уровня %d", ReturnName(playerid, 0), ReturnName(userid, 0), level);

	Log_Write("gamelogs/setadmin_log.txt", "[%s] %s dal %s adminky :%d levela.", ReturnDate(), ReturnName(playerid, 0), ReturnName(userid, 0), level);
	return 1;
}

cmd:deleteadmin(playerid, params[])
{
	static
	    userid;
	    
	if(PlayerInfo[playerid][user_admin] !=1)
		return SendErrorMessage(playerid, "Вы не админ.");
    if(PlayerInfo[playerid][user_admlevel] !=6)
		return SendErrorMessage(playerid, "Вы не админ 6 уровня.");
	if(sscanf(params, "u", userid))
	    return SendHelpMessage(playerid, "/deleteadmin [id игрока]");
	    
	PlayerInfo[userid][user_admin] = 0;
	PlayerInfo[userid][user_admlevel] = 0;
	
    SendAdminAlert(COLOR_ADMINCHAT, "[ADMIN CHAT] %s: убрал %s с поста администратора %d", ReturnName(playerid, 0), ReturnName(userid, 0));
	Log_Write("gamelogs/deleteadmin_log.txt", "[%s] %s ubral %s adminky", ReturnDate(), ReturnName(playerid, 0), ReturnName(userid, 0));

	return 1;
}
cmd:admtest(playerid, params[])
{
    PlayerInfo[playerid][user_admin] = 1;
	PlayerInfo[playerid][user_admlevel] = 6;
	return 1;
}

cmd:createhouse(playerid, params[])
{
	static
	    id,
	    price,
	    address[32];

    if(PlayerInfo[playerid][user_admin] !=1)
		return SendErrorMessage(playerid, "Вы не админ.");
    if(PlayerInfo[playerid][user_admlevel] !=6)
		return SendErrorMessage(playerid, "Вы не админ 6 уровня.");
	if(sscanf(params, "ds[32]", price, address))
	    return SendHelpMessage(playerid, "/createhouse [price] [address]");
	id = House_Create(playerid, price, address);
	if (id == -1)
	    return SendClientMessage(playerid,COLOR_RED,"grg");
	return 1;
}

cmd:buy(playerid, params[])
{
    static
		id = -1;

	if ((id = House_Nearest(playerid)) != -1)
	{

		if (HouseData[id][houseOwner] != 0)
		    return SendErrorMessage(playerid, "Этот дом уже имеет владельца.");

		if (HouseData[id][housePrice] > PlayerInfo[playerid][user_cash])
		    return SendErrorMessage(playerid, "У вас не хватает денег, чтобы купить дом.");

	    HouseData[id][houseOwner] = PlayerInfo[playerid][user_id];

		House_Refresh(id);
		House_Save(id);

	    GiveMoney(playerid, -HouseData[id][housePrice]);
	    PlayerInfo[playerid][user_ownerhouse] = id;
	    Log_Write("gamelogs/house_log.txt", "[%s] %s kupil dom ID: %d za %s.", ReturnDate(), ReturnName(playerid), id, FormatNumber(HouseData[id][housePrice]));
	}
	return 1;
}

cmd:switch(playerid, params[])
{
	static
	    id = -1;

	if ((id = House_Inside(playerid)) != -1)
	{
		if (!HouseData[id][houseLights])
		{
		    foreach (new i : Player) if (House_Inside(i) == id) {
		        PlayerTextDrawHide(i, PlayerInfo[i][pTextdraws][0]);
		    }
		    HouseData[id][houseLights] = true;
		}
		else
		{
		    foreach (new i : Player) if (House_Inside(i) == id) {
		        PlayerTextDrawShow(i, PlayerInfo[i][pTextdraws][0]);
		    }
		    HouseData[id][houseLights] = false;
		}
	}
	else {
	    SendErrorMessage(playerid, "Вы должны находится в доме.");
	}
	return 1;
}

cmd:get(playerid, params[])
{
	static
	    interior,
	    vw;
	interior = GetPlayerInterior(playerid);
	vw = GetPlayerVirtualWorld(playerid);
	printf("%d %d", interior, vw);
	return 1;
}

cmd:setspawn(playerid, params[])
{
	static
	    spawnpoint;
    if(PlayerInfo[playerid][user_admin] !=1)
		return SendErrorMessage(playerid, "Вы не админ.");
    if(PlayerInfo[playerid][user_admlevel] !=6)
		return SendErrorMessage(playerid, "Вы не админ 6 уровня.");
	if(sscanf(params, "d", spawnpoint))
	    return SendHelpMessage(playerid, "/createhouse [price] [address]");
	    
	PlayerInfo[playerid][user_spawn] = spawnpoint;
	return 1;
}

cmd:respawn(playerid, params[])
{
    if(PlayerInfo[playerid][user_admin] !=1)
		return SendErrorMessage(playerid, "Вы не админ.");
    if(PlayerInfo[playerid][user_admlevel] !=6)
		return SendErrorMessage(playerid, "Вы не админ 6 уровня.");

	SetPlayerHealth(playerid, 0);
	return 1;
}

cmd:doorbell(playerid, params[])
{
	new id = House_Nearest(playerid);

	if (id == -1)
	    return SendErrorMessage(playerid, "Вы должны быть рядом с домом.");

	foreach (new i : Player) if (House_Inside(i) == id) {
	    SendClientMessage(i, COLOR_PURPLE, "** Вы слышите звонок в дверь.");
	    PlayerPlaySound(i, 20801, 0, 0, 0);
	}
	PlayerPlaySoundEx(playerid, 20801);
	SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s звонит в дверь.", ReturnName(playerid, 0));
	return 1;
}

cmd:createveh(playerid, params[])
{
    static
	    id,
	    model,
	    price;

    if(PlayerInfo[playerid][user_admin] !=1)
		return SendErrorMessage(playerid, "Вы не админ.");
    if(PlayerInfo[playerid][user_admlevel] !=6)
		return SendErrorMessage(playerid, "Вы не админ 6 уровня.");
	if(sscanf(params, "dd", model, price))
	    return SendHelpMessage(playerid, "/createveh [model] [price]");
	    
	id = Vehicle_Create(playerid, model, price);
	if (id == -1)
	    return SendClientMessage(playerid,COLOR_RED,"grg");
	return 1;
}

cmd:showpass(playerid, params[])
{
	static
	    userid;
	    
    if(sscanf(params, "u", userid))
	    return SendHelpMessage(playerid, "/showpass [id Игрока]");
    if (userid == INVALID_PLAYER_ID || !IsPlayerNearPlayer(playerid, userid, 5.0))
	    return SendErrorMessage(playerid, "Этот игрок далеко от вас.");
	PlayerTextDrawSetPreviewModel(userid, PlayerInfo[userid][pTextdraws][7], PlayerInfo[playerid][user_skin]);



	PlayerTextDrawSetString(userid, PlayerInfo[userid][pTextdraws][12], PlayerInfo[playerid][user_name]);
	PlayerTextDrawSetString(userid, PlayerInfo[userid][pTextdraws][14], PlayerInfo[playerid][user_soname]);
	for(new i = 6; i<16; i++)
	{
		PlayerTextDrawShow(userid, PlayerInfo[userid][pTextdraws][i]);
	}
	SelectTextDraw(userid, COLOR_RED);
	return 1;
}

cmd:setname(playerid, params[])
{
	static
		userid,
		name[32],
		soname[32];
    if(sscanf(params, "us[32]s[32]", userid, name, soname))
	    return SendHelpMessage(playerid, "/showpass [id Игрока]");
	    
    PlayerInfo[userid][user_name] = name;
    PlayerInfo[userid][user_soname] = soname;
 	return 1;
}


#include "modules/createtextdraws.pwn"
