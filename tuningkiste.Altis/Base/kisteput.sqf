_spieler = _this select 1;
_id = _this select 2;

_Kiste = (attachedObjects player) select 0;
detach _Kiste;
_Kiste setVelocity [0,0,-0.1];

[_Kiste, ["<t color = '#EDCF24'> Pick up box","Base\kistepickup.sqf"]] remoteExec ["addAction",0,true];
_spieler removeAction _id;