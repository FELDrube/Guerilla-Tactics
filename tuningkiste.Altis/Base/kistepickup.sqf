_Kiste = _this select 0;
_spieler = _this select 1;
_id = _this select 2;

_Kiste attachTo [_spieler, [0,1.7,1.2]];
_Kiste setVectorDirAndUp [[0, 1, 0], [0, 0, 1]];
_spieler addAction ["<t color = '#EDCF24'> Put down box","Base\kisteput.sqf"];
[_Kiste, _id] remoteExec ["removeAction",0,true]; 
