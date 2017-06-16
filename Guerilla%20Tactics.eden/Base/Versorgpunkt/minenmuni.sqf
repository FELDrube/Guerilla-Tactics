_punkt = _this select 0;
_spieler = _this select 1;
_id = _this select 2;
_veh = (vehicle player);
_speed = speed _veh;
_veharray = ["C_Offroad_01_F","C_Offroad_01_repair_F","B_G_Offroad_01_repair_F","B_G_Offroad_01_F"];
_Imlager = MuniVert select 0;

if (!((typeOf _veh) in  _veharray)) exitWith {hint "You are not driving an offroad!"};
_vehpathlong = [Fahr_geupgr,_veh] call BIS_fnc_findNestedElement;  // hol mir die Adresse des Flugzeugs
_vehpathlong set [1,3];			// ändere die adresse auf das letzte element (munition)
_ammo = [Fahr_geupgr, _vehpathlong] call BIS_fnc_returnNestedElement;

_munikosten = (10 - _ammo) * 7;
if (_munikosten > _Imlager) exitWith {hint "Not enough ammo in storage!"};
_Imlager = _Imlager - _munikosten;
MuniVert set [0,_Imlager];
publicVariable "MuniVert";

[Fahr_geupgr, _vehpathlong, 10] call BIS_fnc_setNestedElement;
publicVariable "Fahr_geupgr";
hint "Mines restocked!";