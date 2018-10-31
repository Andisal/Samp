CreateTextdraws(playerid)
{
	PlayerInfo[playerid][pTextdraws][6] = CreatePlayerTextDraw(playerid, 452.9165, 74.3703, "Box"); // ?????
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pTextdraws][6], 0.0000, 21.8698);
	PlayerTextDrawTextSize(playerid, PlayerInfo[playerid][pTextdraws][6], 572.0000, 0.0000);
	PlayerTextDrawAlignment(playerid, PlayerInfo[playerid][pTextdraws][6], 1);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pTextdraws][6], -1);
	PlayerTextDrawUseBox(playerid, PlayerInfo[playerid][pTextdraws][6], 1);
	PlayerTextDrawBoxColor(playerid, PlayerInfo[playerid][pTextdraws][6], 1684300894);
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pTextdraws][6], -1378294017);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][pTextdraws][6], 1);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pTextdraws][6], 1);
	PlayerTextDrawSetShadow(playerid, PlayerInfo[playerid][pTextdraws][6], 0);

	PlayerInfo[playerid][pTextdraws][7] = CreatePlayerTextDraw(playerid, 421.6665, 93.2963, ""); // ?????
	PlayerTextDrawTextSize(playerid, PlayerInfo[playerid][pTextdraws][7], 101.0000, 98.0000);
	PlayerTextDrawAlignment(playerid, PlayerInfo[playerid][pTextdraws][7], 1);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pTextdraws][7], -1);
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pTextdraws][7], -256);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][pTextdraws][7], 5);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pTextdraws][7], 0);
	PlayerTextDrawSetShadow(playerid, PlayerInfo[playerid][pTextdraws][7], 0);
	PlayerTextDrawSetPreviewModel(playerid, PlayerInfo[playerid][pTextdraws][7], 0);
	PlayerTextDrawSetPreviewRot(playerid, PlayerInfo[playerid][pTextdraws][7], 0.0000, 0.0000, 0.0000, 1.0000);

	PlayerInfo[playerid][pTextdraws][8] = CreatePlayerTextDraw(playerid, 481.2499, 78.5185, "PASSPORT"); // ?????
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pTextdraws][8], 0.4000, 1.6000);
	PlayerTextDrawAlignment(playerid, PlayerInfo[playerid][pTextdraws][8], 1);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pTextdraws][8], -1);
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pTextdraws][8], 255);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][pTextdraws][8], 1);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pTextdraws][8], 1);
	PlayerTextDrawSetShadow(playerid, PlayerInfo[playerid][pTextdraws][8], 0);

	PlayerInfo[playerid][pTextdraws][9] = CreatePlayerTextDraw(playerid, 492.5000, 252.2222, "CLOSE"); // ?????
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pTextdraws][9], 0.4000, 1.6000);
	PlayerTextDrawAlignment(playerid, PlayerInfo[playerid][pTextdraws][9], 1);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pTextdraws][9], -1);
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pTextdraws][9], 255);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][pTextdraws][9], 1);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pTextdraws][9], 1);
	PlayerTextDrawSetShadow(playerid, PlayerInfo[playerid][pTextdraws][9], 0);
	PlayerTextDrawSetSelectable(playerid, PlayerInfo[playerid][pTextdraws][9], true);

	PlayerInfo[playerid][pTextdraws][10] = CreatePlayerTextDraw(playerid, 491.6666, 254.8148, "Box"); // ?????
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pTextdraws][10], 0.0000, 1.1666);
	PlayerTextDrawTextSize(playerid, PlayerInfo[playerid][pTextdraws][10], 532.0000, 0.0000);
	PlayerTextDrawAlignment(playerid, PlayerInfo[playerid][pTextdraws][10], 1);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pTextdraws][10], -1);
	PlayerTextDrawUseBox(playerid, PlayerInfo[playerid][pTextdraws][10], 1);
	PlayerTextDrawBoxColor(playerid, PlayerInfo[playerid][pTextdraws][10], 255);
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pTextdraws][10], 255);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][pTextdraws][10], 1);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pTextdraws][10], 1);
	PlayerTextDrawSetShadow(playerid, PlayerInfo[playerid][pTextdraws][10], 0);

	PlayerInfo[playerid][pTextdraws][11] = CreatePlayerTextDraw(playerid, 502.0834, 116.8889, "NAME_I_"); // ?????
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pTextdraws][11], 0.2191, 0.9622);
	PlayerTextDrawTextSize(playerid, PlayerInfo[playerid][pTextdraws][11], -4.0000, 0.0000);
	PlayerTextDrawAlignment(playerid, PlayerInfo[playerid][pTextdraws][11], 1);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pTextdraws][11], -1);
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pTextdraws][11], 255);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][pTextdraws][11], 1);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pTextdraws][11], 1);
	PlayerTextDrawSetShadow(playerid, PlayerInfo[playerid][pTextdraws][11], 0);

    PlayerInfo[playerid][pTextdraws][12] = CreatePlayerTextDraw(playerid, 530.4165, 116.3703, "Pavel"); // ?????
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pTextdraws][12], 0.2269, 1.0066);
	PlayerTextDrawAlignment(playerid, PlayerInfo[playerid][pTextdraws][12], 1);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pTextdraws][12], -1);
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pTextdraws][12], 255);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][pTextdraws][12], 1);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pTextdraws][12], 1);
	PlayerTextDrawSetShadow(playerid, PlayerInfo[playerid][pTextdraws][12], 0);

	PlayerInfo[playerid][pTextdraws][13] = CreatePlayerTextDraw(playerid, 493.3333, 130.8888, "SONAME_I"); // ?????
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pTextdraws][13], 0.2099, 0.9200);
	PlayerTextDrawAlignment(playerid, PlayerInfo[playerid][pTextdraws][13], 1);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pTextdraws][13], -1);
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pTextdraws][13], 255);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][pTextdraws][13], 1);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pTextdraws][13], 1);
	PlayerTextDrawSetShadow(playerid, PlayerInfo[playerid][pTextdraws][13], 0);

    PlayerInfo[playerid][pTextdraws][14] = CreatePlayerTextDraw(playerid, 530.0000, 130.3703, "Markin"); // ?????
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pTextdraws][14], 0.2232, 1.0496);
	PlayerTextDrawAlignment(playerid, PlayerInfo[playerid][pTextdraws][14], 1);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pTextdraws][14], -1);
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pTextdraws][14], 255);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][pTextdraws][14], 1);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pTextdraws][14], 1);
	PlayerTextDrawSetShadow(playerid, PlayerInfo[playerid][pTextdraws][14], 0);
	
	PlayerInfo[playerid][pTextdraws][0] = CreatePlayerTextDraw(playerid, 644.000000, 1.000000, "_");
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pTextdraws][0], 255);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][pTextdraws][0], 1);
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pTextdraws][0], 0.530000, 51.000000);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pTextdraws][0], -1);
	PlayerTextDrawSetOutline(playerid, PlayerInfo[playerid][pTextdraws][0], 0);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pTextdraws][0], 1);
	PlayerTextDrawSetShadow(playerid, PlayerInfo[playerid][pTextdraws][0], 1);
	PlayerTextDrawUseBox(playerid, PlayerInfo[playerid][pTextdraws][0], 1);
	PlayerTextDrawBoxColor(playerid, PlayerInfo[playerid][pTextdraws][0], 119);
	PlayerTextDrawTextSize(playerid, PlayerInfo[playerid][pTextdraws][0], -6.000000, 30.000000);
	PlayerTextDrawSetSelectable(playerid, PlayerInfo[playerid][pTextdraws][0], 0);
	
	PlayerInfo[playerid][pTextdraws][1] = CreatePlayerTextDraw(playerid, 623.000000, 396.000000, "_");
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pTextdraws][1], 255);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][pTextdraws][1], 1);
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pTextdraws][1], 0.760000, 4.299999);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pTextdraws][1], -1);
	PlayerTextDrawSetOutline(playerid, PlayerInfo[playerid][pTextdraws][1], 0);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pTextdraws][1], 1);
	PlayerTextDrawSetShadow(playerid, PlayerInfo[playerid][pTextdraws][1], 1);
	PlayerTextDrawUseBox(playerid, PlayerInfo[playerid][pTextdraws][1], 1);
	PlayerTextDrawBoxColor(playerid, PlayerInfo[playerid][pTextdraws][1], 85);
	PlayerTextDrawTextSize(playerid, PlayerInfo[playerid][pTextdraws][1], 512.000000, 28.000000);
	PlayerTextDrawSetSelectable(playerid, PlayerInfo[playerid][pTextdraws][1], 0);

	PlayerInfo[playerid][pTextdraws][2] = CreatePlayerTextDraw(playerid, 518.000000, 397.000000, "~r~Fuel:~w~ 0%");
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pTextdraws][2], 255);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][pTextdraws][2], 1);
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pTextdraws][2], 0.280000, 1.000000);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pTextdraws][2], -1);
	PlayerTextDrawSetOutline(playerid, PlayerInfo[playerid][pTextdraws][2], 1);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pTextdraws][2], 1);
	PlayerTextDrawSetSelectable(playerid, PlayerInfo[playerid][pTextdraws][2], 0);

	PlayerInfo[playerid][pTextdraws][3] = CreatePlayerTextDraw(playerid, 518.000000, 406.200012, "~r~Speed:~w~ 0 mph");
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pTextdraws][3], 255);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][pTextdraws][3], 1);
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pTextdraws][3], 0.280000, 1.000000);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pTextdraws][3], -1);
	PlayerTextDrawSetOutline(playerid, PlayerInfo[playerid][pTextdraws][3], 1);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pTextdraws][3], 1);
	PlayerTextDrawSetSelectable(playerid, PlayerInfo[playerid][pTextdraws][3], 0);

	PlayerInfo[playerid][pTextdraws][4] = CreatePlayerTextDraw(playerid, 518.000000, 415.500000, "~r~Damage:~w~ 0/100%");
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pTextdraws][4], 255);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][pTextdraws][4], 1);
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pTextdraws][4], 0.280000, 1.000000);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pTextdraws][4], -1);
	PlayerTextDrawSetOutline(playerid, PlayerInfo[playerid][pTextdraws][4], 1);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pTextdraws][4], 1);
	PlayerTextDrawSetSelectable(playerid, PlayerInfo[playerid][pTextdraws][4], 0);

	PlayerInfo[playerid][pTextdraws][5] = CreatePlayerTextDraw(playerid, 518.000000, 425.000000, "~r~Windows:~w~ Up");
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pTextdraws][5], 255);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][pTextdraws][5], 1);
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pTextdraws][5], 0.280000, 1.000000);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pTextdraws][5], -1);
	PlayerTextDrawSetOutline(playerid, PlayerInfo[playerid][pTextdraws][5], 1);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pTextdraws][5], 1);
	PlayerTextDrawSetSelectable(playerid, PlayerInfo[playerid][pTextdraws][5], 0);
	
	PlayerInfo[playerid][pTextdraws][20] = CreatePlayerTextDraw(playerid, 492.9166, 325.8518, "Box"); // ?????
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pTextdraws][20], 0.0000, 8.0000);
	PlayerTextDrawTextSize(playerid, PlayerInfo[playerid][pTextdraws][20], 617.0000, 0.0000);
	PlayerTextDrawAlignment(playerid, PlayerInfo[playerid][pTextdraws][20], 1);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pTextdraws][20], -1);
	PlayerTextDrawUseBox(playerid, PlayerInfo[playerid][pTextdraws][20], 1);
	PlayerTextDrawBoxColor(playerid, PlayerInfo[playerid][pTextdraws][20], 1076368022);
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pTextdraws][20], 255);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][pTextdraws][20], 1);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pTextdraws][20], 1);
	PlayerTextDrawSetShadow(playerid, PlayerInfo[playerid][pTextdraws][20], 0);

	PlayerInfo[playerid][pTextdraws][21] = CreatePlayerTextDraw(playerid, 487.9165, 331.8149, ""); // ?????
	PlayerTextDrawTextSize(playerid, PlayerInfo[playerid][pTextdraws][21], 58.0000, 62.0000);
	PlayerTextDrawAlignment(playerid, PlayerInfo[playerid][pTextdraws][21], 1);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pTextdraws][21], -1);
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pTextdraws][21], -256);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][pTextdraws][21], 5);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pTextdraws][21], 0);
	PlayerTextDrawSetShadow(playerid, PlayerInfo[playerid][pTextdraws][21], 0);
	PlayerTextDrawSetPreviewModel(playerid, PlayerInfo[playerid][pTextdraws][21], 420);
	PlayerTextDrawSetPreviewRot(playerid, PlayerInfo[playerid][pTextdraws][21], 270.0000, 0.0000, 180.0000, 1.0000);
	PlayerTextDrawSetPreviewVehCol(playerid, PlayerInfo[playerid][pTextdraws][21], 1, 1);

	PlayerInfo[playerid][pTextdraws][22] = CreatePlayerTextDraw(playerid, 498.3331, 337.2591, "Box"); // ?????
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pTextdraws][22], 0.0000, 6.0416);
	PlayerTextDrawTextSize(playerid, PlayerInfo[playerid][pTextdraws][22], 496.0000, 0.0000);
	PlayerTextDrawAlignment(playerid, PlayerInfo[playerid][pTextdraws][22], 1);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pTextdraws][22], -1);
	PlayerTextDrawUseBox(playerid, PlayerInfo[playerid][pTextdraws][22], 1);
	PlayerTextDrawBoxColor(playerid, PlayerInfo[playerid][pTextdraws][22], 559708872);
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pTextdraws][22], 255);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][pTextdraws][22], 1);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pTextdraws][22], 1);
	PlayerTextDrawSetShadow(playerid, PlayerInfo[playerid][pTextdraws][22], 0);

	PlayerInfo[playerid][pTextdraws][23] = CreatePlayerTextDraw(playerid, 554.1660, 337.2591, "Box"); // ?????
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pTextdraws][23], 0.0000, -0.2082);
	PlayerTextDrawTextSize(playerid, PlayerInfo[playerid][pTextdraws][23], 0.0000, 111.0000);
	PlayerTextDrawAlignment(playerid, PlayerInfo[playerid][pTextdraws][23], 2);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pTextdraws][23], -1);
	PlayerTextDrawUseBox(playerid, PlayerInfo[playerid][pTextdraws][23], 1);
	PlayerTextDrawBoxColor(playerid, PlayerInfo[playerid][pTextdraws][23], 559708872);
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pTextdraws][23], 255);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][pTextdraws][23], 1);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pTextdraws][23], 1);
	PlayerTextDrawSetShadow(playerid, PlayerInfo[playerid][pTextdraws][23], 0);

	PlayerInfo[playerid][pTextdraws][24] = CreatePlayerTextDraw(playerid, 537.4993, 336.7406, "Box"); // ?????
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pTextdraws][24], 0.0000, 6.0416);
	PlayerTextDrawTextSize(playerid, PlayerInfo[playerid][pTextdraws][24], 534.0000, 0.0000);
	PlayerTextDrawAlignment(playerid, PlayerInfo[playerid][pTextdraws][24], 1);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pTextdraws][24], -1);
	PlayerTextDrawUseBox(playerid, PlayerInfo[playerid][pTextdraws][24], 1);
	PlayerTextDrawBoxColor(playerid, PlayerInfo[playerid][pTextdraws][24], 559708872);
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pTextdraws][24], 255);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][pTextdraws][24], 1);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pTextdraws][24], 1);
	PlayerTextDrawSetShadow(playerid, PlayerInfo[playerid][pTextdraws][24], 0);

	PlayerInfo[playerid][pTextdraws][25] = CreatePlayerTextDraw(playerid, 554.1666, 394.2962, "Box"); // ?????
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pTextdraws][25], 0.0000, -0.2082);
	PlayerTextDrawTextSize(playerid, PlayerInfo[playerid][pTextdraws][25], 0.0000, 112.0000);
	PlayerTextDrawAlignment(playerid, PlayerInfo[playerid][pTextdraws][25], 2);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pTextdraws][25], -1);
	PlayerTextDrawUseBox(playerid, PlayerInfo[playerid][pTextdraws][25], 1);
	PlayerTextDrawBoxColor(playerid, PlayerInfo[playerid][pTextdraws][25], 559726792);
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pTextdraws][25], 255);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][pTextdraws][25], 1);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pTextdraws][25], 1);
	PlayerTextDrawSetShadow(playerid, PlayerInfo[playerid][pTextdraws][25], 0);

	PlayerInfo[playerid][pTextdraws][26] = CreatePlayerTextDraw(playerid, 612.9168, 337.2593, "Box"); // ?????
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pTextdraws][26], 0.0000, 6.1250);
	PlayerTextDrawTextSize(playerid, PlayerInfo[playerid][pTextdraws][26], 609.0000, 0.0000);
	PlayerTextDrawAlignment(playerid, PlayerInfo[playerid][pTextdraws][26], 1);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pTextdraws][26], -1);
	PlayerTextDrawUseBox(playerid, PlayerInfo[playerid][pTextdraws][26], 1);
	PlayerTextDrawBoxColor(playerid, PlayerInfo[playerid][pTextdraws][26], 559708360);
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pTextdraws][26], 255);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][pTextdraws][26], 1);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pTextdraws][26], 1);
	PlayerTextDrawSetShadow(playerid, PlayerInfo[playerid][pTextdraws][26], 0);

	PlayerInfo[playerid][pTextdraws][27] = CreatePlayerTextDraw(playerid, 573.3333, 378.7408, "Box"); // ?????
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pTextdraws][27], 0.0000, -0.1666);
	PlayerTextDrawTextSize(playerid, PlayerInfo[playerid][pTextdraws][27], 0.0000, 73.0000);
	PlayerTextDrawAlignment(playerid, PlayerInfo[playerid][pTextdraws][27], 2);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pTextdraws][27], -1);
	PlayerTextDrawUseBox(playerid, PlayerInfo[playerid][pTextdraws][27], 1);
	PlayerTextDrawBoxColor(playerid, PlayerInfo[playerid][pTextdraws][27], 559708360);
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pTextdraws][27], 255);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][pTextdraws][27], 1);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pTextdraws][27], 1);
	PlayerTextDrawSetShadow(playerid, PlayerInfo[playerid][pTextdraws][27], 0);

	PlayerInfo[playerid][pTextdraws][28] = CreatePlayerTextDraw(playerid, 540.4160, 378.7406, "GPS_I"); // ?????
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pTextdraws][28], 0.1700, 1.1799);
	PlayerTextDrawAlignment(playerid, PlayerInfo[playerid][pTextdraws][28], 1);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pTextdraws][28], -1);
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pTextdraws][28], 255);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][pTextdraws][28], 2);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pTextdraws][28], 1);
	PlayerTextDrawSetShadow(playerid, PlayerInfo[playerid][pTextdraws][28], 0);

	PlayerInfo[playerid][pTextdraws][29] = CreatePlayerTextDraw(playerid, 559.5833, 379.2591, ""); // ?????
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pTextdraws][29], 0.1386, 1.0658);
	PlayerTextDrawAlignment(playerid, PlayerInfo[playerid][pTextdraws][29], 1);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pTextdraws][29], -1);
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pTextdraws][29], 255);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][pTextdraws][29], 2);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pTextdraws][29], 1);
	PlayerTextDrawSetShadow(playerid, PlayerInfo[playerid][pTextdraws][29], 0);

	PlayerInfo[playerid][pTextdraws][30] = CreatePlayerTextDraw(playerid, 541.8333, 364.7777, "HEALTH_I"); // ?????
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pTextdraws][30], 0.1533, 1.1437);
	PlayerTextDrawAlignment(playerid, PlayerInfo[playerid][pTextdraws][30], 1);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pTextdraws][30], -1);
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pTextdraws][30], 255);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][pTextdraws][30], 2);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pTextdraws][30], 1);
	PlayerTextDrawSetShadow(playerid, PlayerInfo[playerid][pTextdraws][30], 0);

	PlayerInfo[playerid][pTextdraws][31] = CreatePlayerTextDraw(playerid, 571.5836, 364.2591, "100"); // ?????
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pTextdraws][31], 0.1828, 1.2232);
	PlayerTextDrawTextSize(playerid, PlayerInfo[playerid][pTextdraws][31], -9.0000, 0.0000);
	PlayerTextDrawAlignment(playerid, PlayerInfo[playerid][pTextdraws][31], 1);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pTextdraws][31], 559708872);
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pTextdraws][31], 255);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][pTextdraws][31], 2);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pTextdraws][31], 1);
	PlayerTextDrawSetShadow(playerid, PlayerInfo[playerid][pTextdraws][31], 0);

	PlayerInfo[playerid][pTextdraws][32] = CreatePlayerTextDraw(playerid, 541.6666, 346.0739, "FUel_I"); // ?????
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pTextdraws][32], 0.1565, 1.1229);
	PlayerTextDrawAlignment(playerid, PlayerInfo[playerid][pTextdraws][32], 1);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pTextdraws][32], -1);
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pTextdraws][32], 255);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][pTextdraws][32], 2);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pTextdraws][32], 1);
	PlayerTextDrawSetShadow(playerid, PlayerInfo[playerid][pTextdraws][32], 0);

	PlayerInfo[playerid][pTextdraws][33] = CreatePlayerTextDraw(playerid, 562.8333, 345.9628, "100"); // ?????
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pTextdraws][33], 0.1836, 1.1662);
	PlayerTextDrawTextSize(playerid, PlayerInfo[playerid][pTextdraws][33], -9.0000, 0.0000);
	PlayerTextDrawAlignment(playerid, PlayerInfo[playerid][pTextdraws][33], 1);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pTextdraws][33], 559708872);
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pTextdraws][33], 255);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][pTextdraws][33], 2);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pTextdraws][33], 1);
	PlayerTextDrawSetShadow(playerid, PlayerInfo[playerid][pTextdraws][33], 0);

	PlayerInfo[playerid][pTextdraws][34] = CreatePlayerTextDraw(playerid, 541.4166, 355.4443, "DOORS_I"); // ?????
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pTextdraws][34], 0.1533, 1.1437);
	PlayerTextDrawAlignment(playerid, PlayerInfo[playerid][pTextdraws][34], 1);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pTextdraws][34], -1);
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pTextdraws][34], 559708872);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][pTextdraws][34], 2);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pTextdraws][34], 1);
	PlayerTextDrawSetShadow(playerid, PlayerInfo[playerid][pTextdraws][34], 0);

	PlayerInfo[playerid][pTextdraws][35] = CreatePlayerTextDraw(playerid, 567.8336, 355.4443, "OPEN"); // ?????
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pTextdraws][35], 0.1828, 1.2232);
	PlayerTextDrawTextSize(playerid, PlayerInfo[playerid][pTextdraws][35], -9.0000, 0.0000);
	PlayerTextDrawAlignment(playerid, PlayerInfo[playerid][pTextdraws][35], 1);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pTextdraws][35], 559708872);
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pTextdraws][35], 559708872);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][pTextdraws][35], 2);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pTextdraws][35], 1);
	PlayerTextDrawSetShadow(playerid, PlayerInfo[playerid][pTextdraws][35], 0);

	PlayerInfo[playerid][pTextdraws][36] = CreatePlayerTextDraw(playerid, 491.6665, 325.3334, "Box"); // ?????
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pTextdraws][36], 0.0000, 3.1665);
	PlayerTextDrawTextSize(playerid, PlayerInfo[playerid][pTextdraws][36], 491.0000, 0.0000);
	PlayerTextDrawAlignment(playerid, PlayerInfo[playerid][pTextdraws][36], 1);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pTextdraws][36], -1);
	PlayerTextDrawUseBox(playerid, PlayerInfo[playerid][pTextdraws][36], 1);
	PlayerTextDrawBoxColor(playerid, PlayerInfo[playerid][pTextdraws][36], 559708872);
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pTextdraws][36], 255);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][pTextdraws][36], 1);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pTextdraws][36], 1);
	PlayerTextDrawSetShadow(playerid, PlayerInfo[playerid][pTextdraws][36], 0);

	PlayerInfo[playerid][pTextdraws][37] = CreatePlayerTextDraw(playerid, 513.3330, 324.8146, "Box"); // ?????
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pTextdraws][37], 0.0000, -0.0833);
	PlayerTextDrawTextSize(playerid, PlayerInfo[playerid][pTextdraws][37], 0.0000, 43.0000);
	PlayerTextDrawAlignment(playerid, PlayerInfo[playerid][pTextdraws][37], 2);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pTextdraws][37], -1);
	PlayerTextDrawUseBox(playerid, PlayerInfo[playerid][pTextdraws][37], 1);
	PlayerTextDrawBoxColor(playerid, PlayerInfo[playerid][pTextdraws][37], 559708872);
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pTextdraws][37], 255);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][pTextdraws][37], 1);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pTextdraws][37], 1);
	PlayerTextDrawSetShadow(playerid, PlayerInfo[playerid][pTextdraws][37], 0);

	PlayerInfo[playerid][pTextdraws][38] = CreatePlayerTextDraw(playerid, 595.8330, 400.5184, "Box"); // ?????
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pTextdraws][38], 0.0000, -0.0833);
	PlayerTextDrawTextSize(playerid, PlayerInfo[playerid][pTextdraws][38], 0.0000, 43.0000);
	PlayerTextDrawAlignment(playerid, PlayerInfo[playerid][pTextdraws][38], 2);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pTextdraws][38], -1);
	PlayerTextDrawUseBox(playerid, PlayerInfo[playerid][pTextdraws][38], 1);
	PlayerTextDrawBoxColor(playerid, PlayerInfo[playerid][pTextdraws][38], 559708872);
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pTextdraws][38], 255);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][pTextdraws][38], 1);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pTextdraws][38], 1);
	PlayerTextDrawSetShadow(playerid, PlayerInfo[playerid][pTextdraws][38], 0);

	PlayerInfo[playerid][pTextdraws][39] = CreatePlayerTextDraw(playerid, 620.4165, 370.4446, "Box"); // ?????
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pTextdraws][39], 0.0000, 3.1665);
	PlayerTextDrawTextSize(playerid, PlayerInfo[playerid][pTextdraws][39], 616.0000, 0.0000);
	PlayerTextDrawAlignment(playerid, PlayerInfo[playerid][pTextdraws][39], 1);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pTextdraws][39], -1);
	PlayerTextDrawUseBox(playerid, PlayerInfo[playerid][pTextdraws][39], 1);
	PlayerTextDrawBoxColor(playerid, PlayerInfo[playerid][pTextdraws][39], 559708872);
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pTextdraws][39], 255);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][pTextdraws][39], 1);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pTextdraws][39], 1);
	PlayerTextDrawSetShadow(playerid, PlayerInfo[playerid][pTextdraws][39], 0);

	PlayerInfo[playerid][pTextdraws][40] = CreatePlayerTextDraw(playerid, 552.0831, 325.8518, "Box"); // ?????
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pTextdraws][40], 0.0000, -1.4582);
	PlayerTextDrawTextSize(playerid, PlayerInfo[playerid][pTextdraws][40], 617.0000, 0.0000);
	PlayerTextDrawAlignment(playerid, PlayerInfo[playerid][pTextdraws][40], 1);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pTextdraws][40], -1);
	PlayerTextDrawUseBox(playerid, PlayerInfo[playerid][pTextdraws][40], 1);
	PlayerTextDrawBoxColor(playerid, PlayerInfo[playerid][pTextdraws][40], 559708872);
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pTextdraws][40], 255);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][pTextdraws][40], 1);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pTextdraws][40], 1);
	PlayerTextDrawSetShadow(playerid, PlayerInfo[playerid][pTextdraws][40], 0);

	PlayerInfo[playerid][pTextdraws][41] = CreatePlayerTextDraw(playerid, 558.3330, 314.4443, "TAKSI"); // ?????
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pTextdraws][41], 0.2725, 0.9362);
	PlayerTextDrawTextSize(playerid, PlayerInfo[playerid][pTextdraws][41], -1.0000, 0.0000);
	PlayerTextDrawAlignment(playerid, PlayerInfo[playerid][pTextdraws][41], 1);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pTextdraws][41], -1);
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pTextdraws][41], 255);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][pTextdraws][41], 2);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pTextdraws][41], 1);
	PlayerTextDrawSetShadow(playerid, PlayerInfo[playerid][pTextdraws][41], 0);
	
	PlayerInfo[playerid][pTextdraws][42] = CreatePlayerTextDraw(playerid, 595.0000, 340.3703, "0"); // ?????
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pTextdraws][42], 0.1637, 1.4651);
	PlayerTextDrawTextSize(playerid, PlayerInfo[playerid][pTextdraws][42], 600.0000, 0.0000);
	PlayerTextDrawAlignment(playerid, PlayerInfo[playerid][pTextdraws][42], 1);
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pTextdraws][42], 255);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][pTextdraws][42], 2);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pTextdraws][42], 1);
	PlayerTextDrawSetShadow(playerid, PlayerInfo[playerid][pTextdraws][42], 0);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pTextdraws][42], -1);
	
	PlayerInfo[playerid][pTextdraws][43] = CreatePlayerTextDraw(playerid, 595.0000, 340.3703, "0"); // ?????
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pTextdraws][43], 0.1637, 1.4651);
	PlayerTextDrawTextSize(playerid, PlayerInfo[playerid][pTextdraws][43], 600.0000, 0.0000);
	PlayerTextDrawAlignment(playerid, PlayerInfo[playerid][pTextdraws][43], 1);
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pTextdraws][42], 255);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][pTextdraws][43], 2);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pTextdraws][43], 1);
	PlayerTextDrawSetShadow(playerid, PlayerInfo[playerid][pTextdraws][43], 0);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pTextdraws][43], -65281);
	
	PlayerInfo[playerid][pTextdraws][44] = CreatePlayerTextDraw(playerid, 595.0000, 340.3703, "0"); // ?????
	PlayerTextDrawLetterSize(playerid, PlayerInfo[playerid][pTextdraws][44], 0.1637, 1.4651);
	PlayerTextDrawTextSize(playerid, PlayerInfo[playerid][pTextdraws][44], 600.0000, 0.0000);
	PlayerTextDrawAlignment(playerid, PlayerInfo[playerid][pTextdraws][44], 1);
	PlayerTextDrawBackgroundColor(playerid, PlayerInfo[playerid][pTextdraws][44], 255);
	PlayerTextDrawFont(playerid, PlayerInfo[playerid][pTextdraws][44], 2);
	PlayerTextDrawSetProportional(playerid, PlayerInfo[playerid][pTextdraws][44], 1);
	PlayerTextDrawSetShadow(playerid, PlayerInfo[playerid][pTextdraws][44], 0);
	PlayerTextDrawColor(playerid, PlayerInfo[playerid][pTextdraws][44], -16776961);
//////////////////
}