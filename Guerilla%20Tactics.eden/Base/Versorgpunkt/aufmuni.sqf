_Versorgpunkt = _this select 0;
_spieler = _this select 1;
_id = _this select 2;
_Fahrzeuge = ["C_Quadbike_01_F","C_Offroad_02_unarmed_F","C_Plane_Civil_01_racing_F","C_Plane_Civil_01_F","C_Kart_01_F","C_Kart_01_Fuel_F","C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Vrana_F","C_Kart_01_green_F","C_Kart_01_orange_F","C_Kart_01_white_F","C_Kart_01_yellow_F","C_Kart_01_black_F","C_Van_01_fuel_F","C_Van_01_box_F","C_Van_01_transport_F","C_Truck_02_box_F","C_Truck_02_fuel_F","C_SUV_01_F","C_Hatchback_01_sport_F","C_Hatchback_01_F","C_Truck_02_covered_F","C_Truck_02_transport_F","C_Offroad_01_F","C_Offroad_01_repair_F","C_Rubberboat","C_Heli_Light_01_civil_F","O_Heli_Light_02_F","O_Heli_Light_02_unarmed_F","O_Heli_Light_02_v2_F","O_Heli_Attack_02_F","O_APC_Tracked_02_cannon_F","O_APC_Tracked_02_AA_F","O_MBT_02_cannon_F","O_MBT_02_arty_F","O_Boat_Armed_01_hmg_F","O_Boat_Transport_01_F","O_Lifeboat","O_G_Boat_Transport_01_F","O_MRAP_02_F","O_MRAP_02_hmg_F","O_MRAP_02_gmg_F","O_Quadbike_01_F","O_Truck_02_covered_F","O_Truck_02_transport_F","O_Truck_02_box_F","O_Truck_02_medical_F","O_Truck_02_Ammo_F","O_Truck_02_fuel_F","O_Plane_CAS_02_F","O_Heli_Transport_04_bench_F","O_APC_Wheeled_02_rcws_F","O_Truck_03_transport_F","O_Truck_03_covered_F","O_Truck_03_repair_F","O_Truck_03_ammo_F","O_Truck_03_fuel_F","O_Truck_03_medical_F","O_Truck_03_device_F","O_T_LSV_02_armed_F","O_T_LSV_02_unarmed_F"];

_Panzer = ["O_APC_Tracked_02_cannon_F","O_APC_Tracked_02_AA_F","O_MBT_02_cannon_F","O_MBT_02_arty_F","O_APC_Wheeled_02_rcws_F"];
_MRAP = ["O_MRAP_02_F","O_MRAP_02_hmg_F","O_UGV_01_F","O_UGV_01_rcws_F"];
_LKW = ["O_Truck_03_transport_F","O_Truck_03_covered_F","O_Truck_03_repair_F","O_Truck_03_ammo_F","O_Truck_03_fuel_F","O_Truck_03_medical_F","C_Truck_02_covered_F","C_Truck_02_transport_F","C_Truck_02_fuel_F","C_Truck_02_box_F"];
_audohs = ["O_T_LSV_02_unarmed_arid_F","O_T_LSV_02_armed_arid_F","C_Offroad_01_F","C_Offroad_01_repair_F","C_Offroad_default_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","C_SUV_01_F","C_Van_01_transport_F","C_Van_01_box_F","C_Van_01_fuel_F","C_Kart_01_F","C_Offroad_02_unarmed_F"];
_Hubschrauber = ["O_Heli_Transport_04_F","O_Heli_Attack_02_F"]; 	
_kleineHubschrauber = ["O_Heli_Light_02_F","O_Heli_Light_02_unarmed_F","B_Heli_Light_01_F","B_Heli_Light_01_armed_F","C_Heli_Light_01_civil_F"];

_veh = (vehicle _spieler);
_faktor = 1;
_vehart = "";
if (typeOf_veh in _Panzer) then {_vehart = "Panzer";};
if (typeOf_veh in _MRAP) then {_vehart = "MRAP";};
if (typeOf_veh in _LKW) then {_vehart = "LKW";};
if (typeOf_veh in _audohs) then {_vehart = "audohs";};
if (typeOf_veh in _Hubschrauber) then {_vehart = "Hubschrauber";};
if (typeOf_veh in _kleineHubschrauber) then {_vehart = "kleineHubschrauber";};

switch (_vehart) do 
	{
	case ("Panzer") : {_faktor = 500;};
	case ("MRAP") : {_faktor = 200;};
	case ("LKW") : {_faktor = 350;};
	case ("audohs") : {_faktor = 200;};
	case ("Hubschrauber") : {_faktor = 450;};
	case ("kleineHubschrauber") : {_faktor = 350;};
	};
if((typeOf_veh) in _Fahrzeuge) then 			//wenn Spieler ein Fahrzeug ist
	{
	_speed = speed_veh;							//Geschw. abholen
	_treibstoff = fuel_veh;
	_ImLager = MuniVert select 0;
	if (_speed <= 3) then //wenn Spieler zumindest fast steht
		{
		_BenRes = _faktor;
		if (_BenRes <= _ImLager) then {
			[_Versorgpunkt, _id] remoteExec ["removeAction",0,true];
			_ImLager = _ImLager - _BenRes;
			_veh setVehicleLock "LOCKED";
			_veh setFuel 0;
			sleep 10;
			_veh setVehicleAmmoDef 1;
			[_Versorgpunkt,["<t color = '#4EB555'> Rearm","Base\Versorgpunkt\aufmuni.sqf"]] remoteExec ["addAction",0,true];
			_veh setFuel _treibstoff;
			hint "Vehicle rearmed!";
			MuniVert set [0,_ImLager];
			publicVariable "MuniVert";
			_veh setVehicleLock "UNLOCKED";
		}
		else {hint "Not enough resources in storage!"}
		} else {hint "You have to stand still"};
	};