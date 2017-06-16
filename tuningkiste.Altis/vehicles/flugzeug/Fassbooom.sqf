_plane = _this select 0;
_id = _this select 2;
_plpathlong = [Fahr_geupgr,_plane] call BIS_fnc_findNestedElement;  // hol mir die Adresse des Flugzeugs
_plpathlong set [1,3];			// ändere die adresse auf das element (munition)
_ammo = [Fahr_geupgr, _plpathlong] call BIS_fnc_returnNestedElement;		// hol mir den muni wert von der Adresse
_fasspath = _plpathlong;
_fasspath set [1,9];
_plspeed = velocity _plane;
_plpath = _plpathlong select 0;
_i=0;

switch (_ammo) do 
{	case 2: {
			scopeName "main";
			_fass = [Fahr_geupgr, _fasspath] call BIS_fnc_returnNestedElement;
			[Fahr_geupgr, _fass] call BIS_fnc_removeNestedElement;
			detach _fass;
			_fass setVelocity _plspeed;			
			_ammo = 1;
			_plpathlong set [1,3];
			//_absspeed = abs((velocity _fass) select 0) + abs((velocity _fass) select 1) +abs((velocity _fass) select 2);
			//hint str(_absspeed);
			[Fahr_geupgr, _plpathlong, _ammo] call BIS_fnc_setNestedElement;
			/*_null = _fass addMPEventHandler ["Dammaged",{
				_bombe = "Bo_GBU12_LGB" createVehicle (getPos _fass);
				_fass removeMPEventHandler ["Dammaged", _thisEventHandler];
				deleteVehicle _fass;
				}];*/
			while {((getPos _fass) select 2) > 3} do {
			sleep 0.2;
			_i = _i + 0.2;
			if (_i >= 8) then {
			_bombe = "Bo_GBU12_LGB" createVehicle (getPos _fass);
			deleteVehicle _fass;
			breakTo "main";
			}			
			};		 //((_plspeed select 0) + (_plspeed select 1) + (_plspeed select 2)) > 2
			/*while {_absspeed > 3} do {
				sleep 0.2;
				_absspeed = abs((velocity _fass) select 0) + abs((velocity _fass) select 1) +abs((velocity _fass) select 2);
				};*/
			_bombe = "Bo_GBU12_LGB" createVehicle (getPos _fass);
			deleteVehicle _fass;
			};
	case 1: {
			scopeName "main2";
			_fass = [Fahr_geupgr, _fasspath] call BIS_fnc_returnNestedElement;
			[Fahr_geupgr, _fass] call BIS_fnc_removeNestedElement;
			detach _fass;
			[_plane,_id] remoteExec ["removeAction",0,true];
			_fass setVelocity _plspeed;
			_ammo = 0;
			//_plpathlong set [1,3];
			[Fahr_geupgr, _plpathlong, _ammo] call BIS_fnc_setNestedElement;
			while {((getPos _fass) select 2) > 3} do {
			sleep 0.2;
			_i = _i + 0.2;
			if (_i >= 8) then {
			_bombe = "Bo_GBU12_LGB" createVehicle (getPos _fass);
			deleteVehicle _fass;
			breakTo "main2";
			}	
			};			//((getPos _fass) select 2) > 1
			/*while {_absspeed > 3} do {
				sleep 0.2;
				_absspeed = abs((velocity _fass) select 0) + abs((velocity _fass) select 1) +abs((velocity _fass) select 2);
				};*/
			_bombe = "Bo_GBU12_LGB" createVehicle (getPos _fass);
			deleteVehicle _fass;
			[_plane,["Attach Barrelbombs","vehicles\flugzeug\Fassbombe.sqf"]] remoteExec ["addAction",0,true];
			};
};
publicVariable "Fahr_geupgr";