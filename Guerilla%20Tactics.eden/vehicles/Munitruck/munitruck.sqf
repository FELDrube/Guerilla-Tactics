_truck = _this select 0;
_dertyp = _this select 1;
_id = _this select 2;
_speed = speed _truck;
_param = [_truck];
_ImLager = ResVert select 0;
_list = (nearestObjects [_truck, ["Land_fs_roof_F"], 10]);

_truckpathlong = [Fahr_geupgr,_truck] call BIS_fnc_findNestedElement;  // hol mir die Adresse des LKWs
_truckpathlong set [1,2];			// ändere die adresse auf das letzte element


AmTruck1name = {_obj = _this select 0;[_obj,"Munitruck1"] remoteExec ["setVehicleVarName",0,true]; AmTruck1alive = true; publicVariable "AmTruck1alive"};
AmTruck2name = {_obj = _this select 0;[_obj,"Munitruck2"] remoteExec ["setVehicleVarName",0,true]; AmTruck2alive = true; publicVariable "AmTruck2alive"};

MHQantiname = {_obj = _this select 0;[_obj,""] remoteExec ["setVehicleVarName",0,true];};
if ([Fahr_geupgr, _truckpathlong] call BIS_fnc_returnNestedElement) exitWith {		// wenn das panzerungs element schon auf true steht
	hint "That vehicle already is an MHQ!";										// mach nix weiter
	[_truck, _id] remoteExec ["removeAction",0,true]; 
	};

if (_speed > 3) exitWith{hint "You are still moving"};
if (!(_dertyp getUnitTrait "Engineer")) exitWith {hint "You need to be engineer!"};
if ((count _list) != 1) exitWith {hint "No Workshop around!"; _truck removeAction _id;};
if (_ImLager < 50) exitWith {hint "Not enough Resources!";};
if ((AmTruck1alive)&&(AmTruck2alive)) then {hint "There are too many Ammotransporters active at the moment"   //wenn es 3 MHQs gibt dann mach nix und zeig den text an
} else {
	_truck addMPEventHandler ["MPKilled",
	{
		_truck = _this select 0;
		_Name = vehicleVarName _truck;
		
		switch (_Name) do {
			case "Munitruck1" : {AmTruck1alive = false; publicVariable "AmTruck1alive"; ResVert set [1,0];};
			case "Munitruck2" : {AmTruck2alive = false; publicVariable "AmTruck2alive"; ResVert set [2,0];};
		};
		publicVariable "ResVert";
		_truck remoteExec ["removeAllActions",0,true];
		if (!local _truck) exitWith {};
		_truck removeMPEventHandler ["MPKilled", _thisEventHandler];
	}];
	
	if (!AmTruck1alive) then {_param remoteExec ["AmTruck1name"];} else {
		if (!AmTruck2alive) then {_param remoteExec ["AmTruck2name"];};};				// wenn MHQcount = x, nenne den LKW für alle Spieler MHQ x"      	
	
	_truck removeAction _id;
	[Fahr_geupgr, _truckpathlong, true] call BIS_fnc_setNestedElement;
	publicVariable "Fahr_geupgr";
	
	_Resneu = (ResVert select 0) - 50;
	ResVert set [0,_Resneu];
	publicVariable "ResVert";
	
	[_truck, ["<t color ='#EDCF24'>Scan for ammopacks",{				// aktion für resourcen-scan einfügen
	//----------------------------------------------------------------------------------------------------------------------------------------
		_MHQ = _this select 0;
		_fracht = 0;		// nur zu initialisierung
		_frachtalt = 0;
		_frachtraum = 1000;
		_Name = vehicleVarName _MHQ;
		
		switch (_Name) do {
			case "Munitruck1" : {_frachtalt =  MuniVert select 1;};
			case "Munitruck2" : {_frachtalt =  MuniVert select 2;};
		};																								
		_i = 0;

		_list = (nearestObjects [_MHQ, ["O_supplyCrate_F"], 10]);
		if (count _list == 0) then { hint "There are no ammopacks near the Ammotruck"} // wenn anzahl der arraysegmente == 0 dann hint
		else 
		{ 																	// wenn anzahl der arraysegmente > 0 dann weitermachen
			if (_frachtalt + (count _list * 100)<= _frachtraum) then 
			{																	// wenn noch platz im LKW dann weitermachen
				_fracht = _frachtalt + (count _list * 100);						// frachtwert drauf addieren
				while {_i < count _list} do 
				{																// solange _i kleiner als Länge des arrays mache
					_res = _list select _i;										// benenne das Objekt im Array an der Stelle _i auf _res
					deleteVehicle _res;											// lösche dieses
					_i = _i+1;													// mach _i um eins größer
				};
				
				switch (_Name) do {
					case "Munitruck1" :{MuniVert set [1,_fracht];};
					case "Munitruck2" :{MuniVert set [2,_fracht];};
				};															
				publicVariable "MuniVert";
				hint "Ammo loaded";
				//hint ((str (MuniVert select 0))+" "+(str (MuniVert select 1)+ " "+(str (MuniVert select 2))));					// zeig Fracht an
				
			} else 
			{
			hint "Cargohold full / Too many ammopacks in vicinity";			// wenn nicht genug Platz im LKW zeig den Text an
			};
		};
		}]] remoteExec ["addAction",0,true];
	//-------------------------------------------------------------------------------------------------------------------------------------
	[_truck, ["<t color ='#EDCF24'>Unload Ammo",{
		_MHQ = _this select 0;	// nur zu initialisierung
		_frachtalt = 0;
		_i = 0;
		_Name = vehicleVarName _MHQ;
		
		switch (_Name) do {
			case "Munitruck1" : {_frachtalt =  MuniVert select 1;};
			case "Munitruck2" : {_frachtalt =  MuniVert select 2;};
		};			
		
		while {_frachtalt >= 100} do {															// solange noch mehr als 100 resourcen im LKW sind mache folgendes
			_frachtalt = _frachtalt - 100;
			_i=_i+1;
			};																					// für jede volle resourcenkiste i um 1 erhöhen
						
		while {_i > 0} do {															
			_res = createVehicle ["O_supplyCrate_F", getPos _MHQ, [], 7, "NONE"];				// i kisten spawnen
			clearBackpackCargoGlobal _res;
			clearItemCargoGlobal _res;
			clearMagazineCargoGlobal _res;
			clearWeaponCargoGlobal _res;
			_i = _i -1;	
			};
			switch (_Name) do {
				case "Munitruck1" : {MuniVert set [1,_frachtalt];};
				case "Munitruck2" : {MuniVert set [2,_frachtalt];};
			};														
		publicVariable "MuniVert";
		hint "Ammo unloaded";
	}]] remoteExec ["addAction",0,true];
	//-------------------------------------------------------------------------------------------------------------------------------------------
};