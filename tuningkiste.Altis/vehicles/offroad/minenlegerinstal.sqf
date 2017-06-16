_veh = _this select 0;
_dertyp = _this select 1;
_id = _this select 2;
_speed = speed _veh;
_Imlager = ResVert select 0;
_list = (nearestObjects [_veh, ["Land_fs_roof_F"], 10]);

_vehpathlong = [Fahr_geupgr,_veh] call BIS_fnc_findNestedElement;  // hol mir die Adresse des LKWs
_vehpathlong set [1,2];			// ändere die adresse auf das letzte element
_ammopathlong = [Fahr_geupgr,_veh] call BIS_fnc_findNestedElement;  // hol mir die Adresse des Flugzeugs
_ammopathlong set [1,3];			// ändere die adresse auf das element (munition)
[Fahr_geupgr, _ammopathlong, 10] call BIS_fnc_setNestedElement;

if (!(_dertyp getUnitTrait "Engineer")) exitWith {hint "You need to be engineer!"};
if ((count _list) != 1) exitWith {hint "No Workshop around!"; _veh removeAction _id;};
if (_ImLager < 550) exitWith {hint "Not enough Resources!";};
if ([Fahr_geupgr, _vehpathlong] call BIS_fnc_returnNestedElement) exitWith {		// wenn das panzerungs element schon auf true steht
	hint "That vehicle already has a minelayer!";										// mach nix weiter
	_veh removeAction _id;
	};
[Fahr_geupgr, _vehpathlong, true] call BIS_fnc_setNestedElement;
_ImLager = _ImLager - 550;
ResVert set [0, _ImLager];
publicVariable "ResVert";
publicVariable "Fahr_geupgr";
_veh removeAction _id;
_veh addAction ["Put down mines","vehicles\offroad\minenleger.sqf"]

//_mine4= "ATMine_Range_Ammo" createVehicle getPos _veh;
//_mine4 attachto [_veh,[-4,-7,-1]];
//detach _mine4;
//_mine5= "ATMine_Range_Ammo" createVehicle getPos _veh;
//_mine5 attachto [_veh,[4,-7,-1]];
//detach _mine5;