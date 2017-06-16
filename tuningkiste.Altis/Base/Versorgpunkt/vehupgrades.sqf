_Werkstatt = _this select 0;
_id = _this select 2;

_list = (nearestObjects [_Werkstatt, [], 10]);

{
	_Art = typeOf _x;
	switch (_Art) do 
		{
			case "C_Van_01_box_F" :
			{
				_x addAction ["<t color = '#4EB555'> Upgrade to MHQ [900 Res]","vehicles\Tbox\mhqWerkstatt.sqf"];
				_x addAction ["<t color = '#4EB555'> Install armor [400 Res]","vehicles\Tbox\panzern.sqf"];
			};
			case "C_SUV_01_F" :
			{
				_x addAction ["<t color = '#4EB555'> Install smokelauncher [350 Res]","vehicles\SUV\rauch.sqf"];
				_x addAction ["<t color = '#4EB555'> Install armor [300 Res]","vehicles\SUV\panzer.sqf"];
			};
			case "C_Hatchback_01_sport_F" :
			{
				_x addAction ["<t color = '#4EB555'> Install armor [300 Res]","vehicles\limo\panzer.sqf"];
				_x addAction ["<t color = '#4EB555'> Install boost [450 Res]","vehicles\limo\nitroinstal.sqf"];
			};
			case "C_Offroad_01_F" : 
			{
				_x addAction ["<t color = '#4EB555'> Install armor [300 Res]","vehicles\offroad\panzer.sqf"];
				_x addAction ["<t color = '#4EB555'> Install minelayer [550 Res]","vehicles\offroad\minenlegerinstal.sqf"];
			};
			case "C_Offroad_01_repair_F":
			{
				_x addAction ["<t color = '#4EB555'> Install armor [300 Res]","vehicles\offroad\panzer.sqf"];
				_x addAction ["<t color = '#4EB555'> Install minelayer [550 Res]","vehicles\offroad\minenlegerinstal.sqf"];
			};
			case "O_Quadbike_01_F" :
			{
				_x addAction ["<t color = '#4EB555'> Install bomb [200 Res]","vehicles\quad\kamikazeinstal.sqf"];
				_x addAction ["<t color = '#4EB555'> Install amphibic mode [150 Res]","vehicles\quad\amphibieinstal.sqf"];
			};
			case "C_Quadbike_01_F" :
			{
				_x addAction ["<t color = '#4EB555'> Install bomb [200 Res]","vehicles\quad\kamikazeinstal.sqf"];
				_x addAction ["<t color = '#4EB555'> Install amphibic mode [150 Res]","vehicles\quad\amphibieinstal.sqf"];
			};
			case "B_G_Quadbike_01_F" :
			{
				_x addAction ["<t color = '#4EB555'> Install bomb [200 Res]","vehicles\quad\kamikazeinstal.sqf"];
				_x addAction ["<t color = '#4EB555'> Install amphibic mode [150 Res]","vehicles\quad\amphibieinstal.sqf"];
			};			
			case "C_Offroad_02_unarmed_F" :
			{
				_x addAction ["<t color = '#4EB555'> Install armor [300 Res]","vehicles\wrangler\panzerung.sqf"];
				_x addAction ["<t color = '#4EB555'> Install medicbox [150 Res]","vehicles\wrangler\Saniboxinstal.sqf"];
			};
			case "O_Truck_03_ammo_F" :
			{
				_x addAction ["<t color = '#4EB555'> Upgrade to Ammotransporter [50 Res]","vehicles\Munitruck\munitruck.sqf"];
			}
		};
} forEach _list;