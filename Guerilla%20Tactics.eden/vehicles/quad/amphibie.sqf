 _fahr = _this select 0;
 _ID1 = _this select 2;

_boot = "C_Rubberboat" createVehicle position _fahr;
_fahr attachTo [_boot, [0, 0.5, 0.35]];
[_fahr, _ID1] remoteExec ["removeAction",0,true];

[_fahr, ["Remove Boat",{
 _fahr = _this select 0;
 _ID2 = _this select 2;
 _list = (nearestObjects [_fahr, ["C_Rubberboat"], 5]);
 //hint str count _boot;
IF (count _list == 1)
// If there is one vehicle within 5m

THEN 
	{
		_boot = _list select 0;
		deleteVehicle _boot;
		[_fahr, _ID2] remoteExec ["removeAction",0,true];
		[_fahr, ["Buckle quadbike on boat", "vehicles\quad\amphibie.sqf"]] remoteExec ["addAction",0,true];
	}
	ELSE 
	{
		hint "Die Scheiße geht net!";
	};
// Else show "You are too far ...."
}]]	remoteExec ["addAction",0,true];