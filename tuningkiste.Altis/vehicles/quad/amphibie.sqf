 _fahr = _this select 0;
 _ID1 = _this select 2;

_boot = "C_Rubberboat" createVehicle position _fahr;
_fahr attachTo [_boot, [0, 0.5, 0.35]];
_fahr removeAction _ID1;

_fahr addAction ["Remove Boat",{
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
		_fahr removeAction _ID2;
		_fahr addAction ["Buckle quadbike on boat", "vehicles\quad\amphibie.sqf"];
	}
	ELSE 
	{
		hint "Die Scheiße geht net!";
	};
// Else show "You are too far ...."
}];	