_veh = _this select 0;
_dertyp = _this select 1;
_id = _this select 2;
_speed = speed _veh;
_Imlager = ResVert select 0;
_list = (nearestObjects [_veh, ["Land_fs_roof_F"], 10]);

_vehpathlong = [Fahr_geupgr,_veh] call BIS_fnc_findNestedElement;  // hol mir die Adresse des LKWs
_vehpathlong set [1,1];			// ändere die adresse auf das letzte element

if (_speed > 3) exitWith{hint "You are still moving"};
if (!(_dertyp getUnitTrait "Engineer")) exitWith {hint "You need to be engineer!"};
if ((count _list) != 1) exitWith {hint "No Workshop around!"; _veh removeAction _id;};
if (_ImLager < 200) exitWith {hint "Not enough Resources!";};
if ([Fahr_geupgr, _vehpathlong] call BIS_fnc_returnNestedElement) exitWith {		// wenn das panzerungs element schon auf true steht
	hint "That vehicle already has a bomb installed";										// mach nix weiter
	_veh removeAction _id;
	};
[Fahr_geupgr, _vehpathlong, true] call BIS_fnc_setNestedElement;
_ImLager = _ImLager - 200;
ResVert set [0, _ImLager];
publicVariable "ResVert";
publicVariable "Fahr_geupgr";
_veh removeAction _id;

_veh addAction ["Detonate bomb",{
_veh = _this select 0;
_id = _this select 2;
_veh removeAction _id;
_bombe = "Bo_GBU12_lgb" createVehicle (position _veh);
}];

