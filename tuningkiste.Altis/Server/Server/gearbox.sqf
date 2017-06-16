_Kiste = _this select 0;

_waffen = [_Kiste, "HuntRifles", 2,1,3,2,3];
_kleidung = [_Kiste, "GUERc", 4,0,1,5,3];
_rucksaecke = [_Kiste, "backpacks", 4,1,0,5,3];
_spawns = [_Kiste, "sbags", 2,1,0,5,3];

_auswahl = [_waffen, _kleidung, _rucksaecke, _spawns];
if (!isServer) exitWith {};
_null = selectRandom _auswahl execVM "Server\gearrandomizer.sqf";