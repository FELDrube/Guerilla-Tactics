_truck = _this select 0;

_param = [_truck];
_truckpathlong = [Fahr_geupgr,_truck] call BIS_fnc_findNestedElement;  // hol mir die Adresse des LKWs
_truckpathlong set [1,2];			// ändere die adresse auf das letzte element (munition)
[Fahr_geupgr, _truckpathlong, true] call BIS_fnc_setNestedElement;

MHQ1name = {_obj = _this select 0;_obj setVehicleVarName "MHQ1"; MHQ1alive = true};
MHQantiname = {_obj = _this select 0;_obj setVehicleVarName "";};

if ((MHQ1alive)&&(MHQ2alive)&&(MHQ3alive)) then {hint "There are too many MHQs active at the moment"   //wenn es 3 MHQs gibt dann mach nix und zeig den text an
} else {
	_truck addMPEventHandler ["MPKilled",
	{
		_truck = _this select 0;
		_Name = vehicleVarName _truck;
		
		MHQ1alive = false;
		ResVert set [1,0];
		publicVariable "MHQ1alive";
		_param remoteExec "MHQantiname";

		publicVariable "ResVert";
		removeAllActions _truck;
		if (!local _truck) exitWith {};
		_truck removeMPEventHandler ["MPKilled", _thisEventHandler];
	}];
	_param remoteExec ["MHQ1name"];			// wenn MHQcount = x, nenne den LKW für alle Spieler MHQ x"      	
	_Fahne = "Flag_FIA_F" createVehicle getPos _truck; 		// Flagge anbringen und ausrichten
	_Fahne attachto [_truck,[0,-1.6,0.75]];
	publicVariable "Fahr_geupgr";
	[west, _truck] call BIS_fnc_addRespawnPosition;			// respawn funktion für MHQ

	
	_truck addAction ["<t color ='#EDCF24'>Scan for resources",{				// aktion für resourcen-scan einfügen
	//----------------------------------------------------------------------------------------------------------------------------------------
		_MHQ = _this select 0;
		_fracht = 0;		// nur zu initialisierung
		_frachtalt = 0;
		_frachtraum = 1000;
		_Name = vehicleVarName _MHQ;
		
		switch (_Name) do {
			case "MHQ1" : {_frachtalt =  ResVert select 1;};
			case "MHQ2" : {_frachtalt =  ResVert select 2;};
			case "MHQ3" : {_frachtalt =  ResVert select 3;};
		};																								
		_i = 0;

		_list = (nearestObjects [_MHQ, ["CargoNet_01_box_F"], 10]);
		if (count _list == 0) then { hint "There are no resources near the MHQ"} // wenn anzahl der arraysegmente == 0 dann hint
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
					case "MHQ1" :{ResVert set [1,_fracht];};
					case "MHQ2" :{ResVert set [2,_fracht];};
					case "MHQ3" :{ResVert set [3,_fracht];};
				};															
				publicVariable "ResVert";
				hint "Resources loaded";
				//hint ((str (ResVert select 1))+" "+(str (ResVert select 2)+ " "+(str (ResVert select 3))));					// zeig Fracht an
				
			} else 
			{
			hint "Cargohold full / Too many resources in vicinity";			// wenn nicht genug Platz im LKW zeig den Text an
			};
		};
		}];
	//-------------------------------------------------------------------------------------------------------------------------------------
	_truck addAction ["<t color ='#EDCF24'>Unload resources",{
		_MHQ = _this select 0;	// nur zu initialisierung
		_frachtalt = 0;
		_i = 0;
		_Name = vehicleVarName _MHQ;
		
		switch (_Name) do {
			case "MHQ1" : {_frachtalt =  ResVert select 1;};
			case "MHQ2" : {_frachtalt =  ResVert select 2;};
			case "MHQ3" : {_frachtalt =  ResVert select 3;};
		};			
		
		while {_frachtalt >= 100} do {															// solange noch mehr als 100 resourcen im LKW sind mache folgendes
			_frachtalt = _frachtalt - 100;
			_i=_i+1;
			};																					// für jede volle resourcenkiste i um 1 erhöhen
						
		while {_i > 0} do {															
			_res = _resbox createVehicle ["CargoNet_01_box_F", getPos _MHQ, [], 7, "NONE"];				// i kisten spawnen
			_i = _i -1;	
			};
			switch (_Name) do {
				case "MHQ1" : {ResVert set [1,_frachtalt];};
				case "MHQ2" : {ResVert set [2,_frachtalt];};
				case "MHQ3" : {ResVert set [3,_frachtalt];};
			};														
		publicVariable "ResVert";
		hint "Resources unloaded";
	}];
	//-------------------------------------------------------------------------------------------------------------------------------------------
};