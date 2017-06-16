_veh = _this select 0;
	if ((typeOf _veh) in UPG_2) then
	{
		Fahr_geupgr pushBack [_veh,false,false];	
		_veh addMPEventHandler ["MPKilled",
		{
			_veh = _this select 0;
			_vehpathlong = [Fahr_geupgr,_veh] call BIS_fnc_findNestedElement;  // hol mir die Adresse des LKWs
			_vehpath = _vehpathlong select 0;
			Fahr_geupgr deleteAt _vehpath;
			publicVariable "Fahr_geupgr";
			_veh remoteExec ["removeAllActions",0,true];
			if (!local _veh) exitWith {};
			_veh removeMPEventHandler ["MPKilled", 0];
		}];
	} else {
		if ((typeOf _veh) in UPG_AMMO) then 
			{Fahr_geupgr pushBack [_veh,false,false,0,[],[],[],[],false];
			_veh addMPEventHandler ["MPKilled",
			{
				_veh = _this select 0;
				_vehpathlong = [Fahr_geupgr,_veh] call BIS_fnc_findNestedElement;  // hol mir die Adresse des LKWs
				_vehpath = _vehpathlong select 0;
				Fahr_geupgr deleteAt _vehpath;
				publicVariable "Fahr_geupgr";
				_veh remoteExec ["removeAllActions",0,true];
				if (!local _veh) exitWith {};
				_veh removeMPEventHandler ["MPKilled", 0];
			}];}	
		};
publicVariable "Fahr_geupgr";