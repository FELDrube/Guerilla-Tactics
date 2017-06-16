_limo = _this select 0;
_dertyp = _this select 1;
_id = _this select 2;
_speed = speed _limo;
_Imlager = ResVert select 0;
_list = (nearestObjects [_limo, ["Land_fs_roof_F"], 10]);

_limopathlong = [Fahr_geupgr,_limo] call BIS_fnc_findNestedElement;  // hol mir die Adresse des LKWs
_limopathlong set [1,2];			// ändere die adresse auf das letzte element

if (_speed > 3) exitWith{hint "You are still moving"};
if (!(_dertyp getUnitTrait "Engineer")) exitWith {hint "You need to be engineer!"};
if ((count _list) != 1) exitWith {hint "No Workshop around!"; _limo removeAction _id;};
if (_ImLager < 450) exitWith {hint "Not enough Resources!";};
if ([Fahr_geupgr, _limopathlong] call BIS_fnc_returnNestedElement) exitWith {		// wenn das panzerungs element schon auf true steht
	hint "That vehicle already has boost!";										// mach nix weiter
	_limo removeAction _id;
	};
[Fahr_geupgr, _limopathlong, true] call BIS_fnc_setNestedElement;
_ImLager = _ImLager - 450;
ResVert set [0, _ImLager];
publicVariable "ResVert";
publicVariable "Fahr_geupgr";
_limo removeAction _id;
_limo addAction ["BOOST!","vehicles\limo\cliS_actionNitro.sqf"];
