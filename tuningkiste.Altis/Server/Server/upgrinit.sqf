UPG_2 = ["C_Quadbike_01_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","C_SUV_01_F","C_Van_01_box_F","O_G_Quadbike_01_F","C_Offroad_02_unarmed_F","C_Truck_02_transport_F","C_Truck_02_covered_F","O_Truck_03_ammo_F"];
UPG_AMMO = ["C_Plane_Civil_01_F","C_Plane_Civil_01_racing_F","C_Offroad_01_F","C_Offroad_01_repair_F"];


{
	if ((typeOf _x) in UPG_2) then
	{
		Fahr_geupgr pushBack [_x,false,false];	
		_x addMPEventHandler ["MPKilled",
		{
			_x = _this select 0;
			_vehpathlong = [Fahr_geupgr,_x] call BIS_fnc_findNestedElement;  // hol mir die Adresse des LKWs
			_vehpath = _vehpathlong select 0;
			Fahr_geupgr deleteAt _vehpath;
			publicVariable "Fahr_geupgr";
			_x remoteExec ["removeAllActions",0,true];
			if (!local _x) exitWith {};
			_x removeMPEventHandler ["MPKilled", 0];
		}];
	} else {
		if ((typeOf _x) in UPG_AMMO) then 
			{Fahr_geupgr pushBack [_x,false,false,0,[],[],[],[],false];
			_x addMPEventHandler ["MPKilled",
			{
				_x = _this select 0;
				_vehpathlong = [Fahr_geupgr,_x] call BIS_fnc_findNestedElement;  // hol mir die Adresse des LKWs
				_vehpath = _vehpathlong select 0;
				Fahr_geupgr deleteAt _vehpath;
				publicVariable "Fahr_geupgr";
				_x remoteExec ["removeAllActions",0,true];
				if (!local _x) exitWith {};
				_x removeMPEventHandler ["MPKilled", 0];
			}];}	
		};
} forEach (vehicles);
publicVariable "Fahr_geupgr";