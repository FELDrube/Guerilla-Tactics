_fahr = _this select 0;
_ID = _this select 2;
[_fahr, _ID] remoteExec ["removeAction",0,true];
_bombe = "Bo_GBU12_lgb" createVehicle (position _fahr);