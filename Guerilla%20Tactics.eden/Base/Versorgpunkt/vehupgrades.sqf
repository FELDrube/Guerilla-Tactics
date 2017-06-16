_Werkstatt = _this select 0;
_id = _this select 2;

_list = (nearestObjects [_Werkstatt, [], 10]);

{
	_Art = typeOf _x;
	switch (_Art) do 
		{
			case "C_Van_01_box_F" :
			{
				[_x, ["<t color = '#4EB555'> Upgrade to MHQ [900 Res]","vehicles\Tbox\mhqWerkstatt.sqf"]] remoteExec ["addAction",0,true];
				[_x, ["<t color = '#4EB555'> Install armor [400 Res]","vehicles\Tbox\panzern.sqf"]] remoteExec ["addAction",0,true];
			};
			case "C_SUV_01_F" :
			{
				[_x, ["<t color = '#4EB555'> Install smokelauncher [350 Res]","vehicles\SUV\rauch.sqf"]] remoteExec ["addAction",0,true];
				[_x, ["<t color = '#4EB555'> Install armor [300 Res]","vehicles\SUV\panzer.sqf"]] remoteExec ["addAction",0,true];
			};
			case "C_Hatchback_01_sport_F" :
			{
				[_x, ["<t color = '#4EB555'> Install armor [300 Res]","vehicles\limo\panzer.sqf"]] remoteExec ["addAction",0,true];
				[_x, ["<t color = '#4EB555'> Install boost [450 Res]","vehicles\limo\nitroinstal.sqf"]] remoteExec ["addAction",0,true];
			};
			case "C_Hatchback_01_F" :
			{
				[_x, ["<t color = '#4EB555'> Install armor [300 Res]","vehicles\limo\panzer.sqf"]] remoteExec ["addAction",0,true];
				[_x, ["<t color = '#4EB555'> Install boost [450 Res]","vehicles\limo\nitroinstal.sqf"]] remoteExec ["addAction",0,true];
			};
			case "C_Offroad_01_F" : 
			{
				[_x, ["<t color = '#4EB555'> Install armor [300 Res]","vehicles\offroad\panzer.sqf"]] remoteExec ["addAction",0,true];
				[_x, ["<t color = '#4EB555'> Install minelayer [550 Res]","vehicles\offroad\minenlegerinstal.sqf"]] remoteExec ["addAction",0,true];
			};
			case "C_Offroad_01_repair_F":
			{
				[_x, ["<t color = '#4EB555'> Install armor [300 Res]","vehicles\offroad\panzer.sqf"]] remoteExec ["addAction",0,true];
				[_x, ["<t color = '#4EB555'> Install minelayer [550 Res]","vehicles\offroad\minenlegerinstal.sqf"]] remoteExec ["addAction",0,true];
			};
			case "O_Quadbike_01_F" :
			{
				[_x, ["<t color = '#4EB555'> Install bomb [200 Res]","vehicles\quad\kamikazeinstal.sqf"]] remoteExec ["addAction",0,true];
				[_x, ["<t color = '#4EB555'> Install amphibic mode [150 Res]","vehicles\quad\amphibieinstal.sqf"]] remoteExec ["addAction",0,true];
			};
			case "C_Quadbike_01_F" :
			{
				[_x, ["<t color = '#4EB555'> Install bomb [200 Res]","vehicles\quad\kamikazeinstal.sqf"]] remoteExec ["addAction",0,true];
				[_x, ["<t color = '#4EB555'> Install amphibic mode [150 Res]","vehicles\quad\amphibieinstal.sqf"]] remoteExec ["addAction",0,true];
			};
			case "B_G_Quadbike_01_F" :
			{
				[_x, ["<t color = '#4EB555'> Install bomb [200 Res]","vehicles\quad\kamikazeinstal.sqf"]] remoteExec ["addAction",0,true];
				[_x, ["<t color = '#4EB555'> Install amphibic mode [150 Res]","vehicles\quad\amphibieinstal.sqf"]] remoteExec ["addAction",0,true];
			};			
			case "C_Offroad_02_unarmed_F" :
			{
				[_x, ["<t color = '#4EB555'> Install armor [300 Res]","vehicles\wrangler\panzerung.sqf"]] remoteExec ["addAction",0,true];
				[_x, ["<t color = '#4EB555'> Install medicbox [150 Res]","vehicles\wrangler\Saniboxinstal.sqf"]] remoteExec ["addAction",0,true];
			};
			case "O_Truck_03_ammo_F" :
			{
				[_x, ["<t color = '#4EB555'> Upgrade to Ammotransporter [50 Res]","vehicles\Munitruck\munitruck.sqf"]] remoteExec ["addAction",0,true];
			}
		};
} forEach _list;