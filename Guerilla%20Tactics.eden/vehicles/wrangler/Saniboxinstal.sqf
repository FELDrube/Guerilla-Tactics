_veh = _this select 0;
_dertyp = _this select 1;
_id = _this select 2;
_speed = speed _veh;
_Imlager = ResVert select 0;
_list = (nearestObjects [_veh, ["Land_fs_roof_F"], 10]);

_vehpathlong = [Fahr_geupgr,_veh] call BIS_fnc_findNestedElement;  // hol mir die Adresse des LKWs
_vehpathlong set [1,2];			// ändere die adresse auf das letzte element
_vehpath = _vehpathlong select 0;

if (_speed > 3) exitWith{hint "You are still moving"};
if (!(_dertyp getUnitTrait "Engineer")) exitWith {hint "You need to be engineer!"};
if ((count _list) != 1) exitWith {hint "No Workshop around!"; [_veh, _id] remoteExec ["removeAction",0,true];};
if (_ImLager < 150) exitWith {hint "Not enough Resources!";};
if ([Fahr_geupgr, _vehpathlong] call BIS_fnc_returnNestedElement) exitWith {		// wenn das panzerungs element schon auf true steht
	hint "That vehicle already has a medicbox!";										// mach nix weiter
	[_veh, _id] remoteExec ["removeAction",0,true];
	};
[Fahr_geupgr, _vehpathlong, true] call BIS_fnc_setNestedElement;
_ImLager = _ImLager - 150;
ResVert set [0, _ImLager];
publicVariable "ResVert";
publicVariable "Fahr_geupgr";
[_veh, _id] remoteExec ["removeAction",0,true];

_Sanibox = "Box_NATO_Wps_F" createVehicle position _veh;
_Sanibox attachTo [_veh,[0, -2.1, -0.35]];
_Sanibox setVectorDirAndUp [[0, 0, 1], [0, -1, 0]];

_Sanibox addAction ["Heal yourself","vehicles\wrangler\Sanibox.sqf"];
(Fahr_geupgr select _vehpath) pushBack _Sanibox;
_Sanibox addMPEventHandler ["MPKilled",
{
	_Sanibox = _this select 0;
	detach _Sanibox;
	_vehpathlong = [Fahr_geupgr,_Sanibox] call BIS_fnc_findNestedElement;  // hol mir die Adresse des LKWs
	_vehpathlong set [1,2];			// ändere die adresse auf das letzte element
	[Fahr_geupgr, _vehpathlong, false] call BIS_fnc_setNestedElement;
	[Fahr_geupgr, _Sanibox] call BIS_fnc_removeNestedElement;
	publicVariable "Fahr_geupgr";
	[_veh] remoteExec ["removeAllActions",0,true];
	if (!local _Sanibox) exitWith {};
	_Sanibox removeMPEventHandler ["MPKilled", 0];
}];

clearItemCargoGlobal _Sanibox;
clearWeaponCargoGlobal _Sanibox;
clearMagazineCargoGlobal _Sanibox;
_Sanibox addItemCargoGlobal ["FirstAidKit",10];
_Sanibox addItemCargoGlobal ["MediKit",1];