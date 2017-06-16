_limo = _this select 0;
_dertyp = _this select 1;
_id = _this select 2;
_speed = speed _limo;
_Imlager = ResVert select 0;
_list = (nearestObjects [_limo, ["Land_fs_roof_F"], 10]);

_limopathlong = [Fahr_geupgr,_limo] call BIS_fnc_findNestedElement;  // hol mir die Adresse des LKWs
_limopathlong set [1,1];			// ändere die adresse auf das __Panzerungselement
if ([Fahr_geupgr, _limopathlong] call BIS_fnc_returnNestedElement) exitWith {		// wenn das _Panzerungs element schon auf true steht
	hint "You already installed armor on that vehicle!";										// mach nix weiter
	_limo removeAction _id;
};

if (_speed > 3) exitWith{hint "You are still moving"};
if (!(_dertyp getUnitTrait "Engineer")) exitWith {hint "You need to be engineer!"};
if ((count _list) != 1) exitWith {hint "No Workshop around!"; _limo removeAction _id;};
if (_ImLager < 300) exitWith {hint "Not enough Resources!";};

 _limo removeAction _id;
 _Imlager = _Imlager - 300;
 ResVert set [0,_Imlager];
 publicVariable "ResVert";
 _limo setVehicleLock "LOCKED";
 _fuel = fuel _limo;
 _limo setFuel 0;
 _dertyp playMoveNow "AinvPknlMstpSlayWrflDnon_medicOther";

 _Panzer = "Land_Mil_WallBig_Corner_F" createVehicle position _limo;
 _Panzer attachTo [_limo,[0.8, -0.3, -0.2]];
 _Panzer setVectorDirAndUp [[1, 0, -0.5], [0, 1, 0]];
 sleep 1;
 _Panzer = "Land_Mil_WallBig_Corner_F" createVehicle position _limo;
 _Panzer attachTo [_limo,[-0.8, -0.3, -0.2]];
 _Panzer setVectorDirAndUp [[-0.5, 0, 1], [0, 1, 0]];
 sleep 1;
 _Panzer = "Land_CncBarrier_F" createVehicle position _limo;
 _Panzer attachTo [_limo,[0, 2.3, -0.6]];
 _Panzer setVectorDirAndUp [[0, 0, 1], [0, 0, 1]];
 sleep 1;
 _Panzer = "Land_CncBarrier_F" createVehicle position _limo;
 _Panzer attachTo [_limo,[0, 2, -0.15]];
 _Panzer setVectorDirAndUp [[0, 1, 4], [0, 0, 1]];
 sleep 1;
 _Panzer = "Land_CncBarrier_F" createVehicle position _limo;
 _Panzer attachTo [_limo,[-0.1, -3, -0.7]];
 _Panzer setVectorDirAndUp [[0, 4, 1], [0, 0, 1]];
 sleep 1;
 _Panzer = "Land_CncBarrier_F" createVehicle position _limo;
 _Panzer attachTo [_limo,[-0.1, -3, -0.2]];
 _Panzer setVectorDirAndUp [[0, -2, 1], [0, 0, 1]]; 
 
 _limo setVehicleLock "UNLOCKED";
 _limo setFuel _fuel;
 [Fahr_geupgr, _limopathlong, true] call BIS_fnc_setNestedElement; //setze __Panzerung auf true
 publicVariable "Fahr_geupgr";