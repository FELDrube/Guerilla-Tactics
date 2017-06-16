_Kiste = _this select 0;
_auswahl = [[_Kiste, "HuntRifles", 2,1,3,2,3], [_Kiste, "GUERc", 4,0,1,5,3], [_Kiste, "backpacks", 4,1,0,5,3], [_Kiste, "sbags", 2,1,0,5,3]];
_gewahlt = (selectRandom _auswahl);
if (!isServer) exitWith {};
_null = _gewahlt execVM "Server\gearrandomizer.sqf";