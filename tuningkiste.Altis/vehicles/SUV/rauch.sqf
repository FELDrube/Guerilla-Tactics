_SUV = _this select 0;
_dertyp = _this select 1;
_id = _this select 2;
_speed = speed _SUV;
_Imlager = ResVert select 0;
_list = (nearestObjects [_SUV, ["Land_fs_roof_F"], 10]);

if (_speed > 3) exitWith{hint "You are still moving"};
_SUVpathlong = [Fahr_geupgr,_SUV] call BIS_fnc_findNestedElement;  // hol mir die Adresse des LKWs
_SUVpathlong set [1,2];			// ändere die adresse auf das letzte element

if (!(_dertyp getUnitTrait "Engineer")) exitWith {hint "You need to be engineer!"};
if ((count _list) != 1) exitWith {hint "No Workshop around!"; _SUV removeAction _id;};
if (_ImLager < 350) exitWith {hint "Not enough Resources!";};
if ([Fahr_geupgr, _SUVpathlong] call BIS_fnc_returnNestedElement) exitWith {		// wenn das panzerungs element schon auf true steht
	hint "That vehicle already has a smokelauncher!";										// mach nix weiter
	_SUV removeAction _id;
	};
[Fahr_geupgr, _SUVpathlong, true] call BIS_fnc_setNestedElement;
_ImLager = _ImLager - 350;
ResVert set [0, _ImLager];
publicVariable "ResVert";
publicVariable "Fahr_geupgr";
_SUV removeAction _id;
_SUV addAction ["Launch smoke","vehicles\SUV\rauchwerfer.sqf"];
