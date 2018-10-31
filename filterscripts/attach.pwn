#include <a_samp>
#include <zcmd>
#include <sscanf2>

enum MInfo
{
	Float: X,
	Float: Y,
	Float: Z,
	Float: RotX,
	Float: RotY,
	Float: RotZ,
	modelid,
	bone,
	slot
};
new ModelInfo[MAX_PLAYERS][MInfo];

COMMAND:attach(playerid, params[])
{
	new slott, modelidd, bonee, Float: XX, Float: YY, Float: ZZ, Float: RXX, Float: RYY, Float: RZZ;
	if(sscanf(params, "iiiffffff", slott, modelidd, bonee, XX, YY, ZZ, RXX, RYY, RZZ)) return SendClientMessage(playerid, 0xF0F0F0FF, "USAGE: /attach [slot] [modelid] [bone] [X] [Y] [Z] [RX] [RY] [RZ]");
	{
	    new string[64];
	    SetPlayerAttachedObject(playerid, slott, modelidd, bonee, XX, YY, ZZ, RXX, RYY, RZZ);
    	ModelInfo[playerid][X] = XX;
    	ModelInfo[playerid][Y] = YY;
    	ModelInfo[playerid][Z] = ZZ;
    	ModelInfo[playerid][RotX] = RXX;
    	ModelInfo[playerid][RotY] = RYY;
    	ModelInfo[playerid][RotZ] = RZZ;
    	ModelInfo[playerid][bone] = bonee;
    	ModelInfo[playerid][modelid] = modelidd;
    	ModelInfo[playerid][slot] = slott;
    	format(string, 64, "Object %d has attached to slot %d, bone is %d", modelidd, slott, bonee);
    	SendClientMessage(playerid, 0xF0F0F0, string);
	}
	return 1;
}

COMMAND:savepos(playerid, params[])
{
    new File: tmp, buffer[512];
	if(!fexist("positions.txt"))
	{
		tmp = fopen("positions.txt", io_write);
		fclose(tmp);
	}
	tmp = fopen("positions.txt", io_append);
	format(buffer, 512, "SetPlayerAttachedObject(playerid, %d, %d, %d, %f, %f, %f, %f, %f, %f);\r\n", ModelInfo[playerid][slot], ModelInfo[playerid][modelid], ModelInfo[playerid][bone], ModelInfo[playerid][X], ModelInfo[playerid][Y], ModelInfo[playerid][Z], ModelInfo[playerid][RotX], ModelInfo[playerid][RotY], ModelInfo[playerid][RotZ]);
	fwrite(tmp, buffer);
	fclose(tmp);
	SendClientMessage(playerid, 0xF0F0F0FF, buffer);
	SendClientMessage(playerid, 0xF0F0F0FF, "-> Position saved on positions.txt");
	return 1;
}
