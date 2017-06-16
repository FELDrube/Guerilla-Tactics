_SUV = _this select 0;
_dertyp = _this select 1;
_id = _this select 2;
_speed = speed _SUV;
_Imlager = ResVert select 0;
_list = (nearestObjects [_SUV, ["Land_fs_roof_F"], 10]);

_SUVpathlong = [Fahr_geupgr,_SUV] call BIS_fnc_findNestedElement;  // hol mir die Adresse des LKWs
_SUVpathlong set [1,1];			// ändere die adresse auf das __Panzerungselement
if ([Fahr_geupgr, _SUVpathlong] call BIS_fnc_returnNestedElement) exitWith {		// wenn das _Panzerungs element schon auf true steht
	hint "You already installed armor on that vehicle!";										// mach nix weiter
	_SUV removeAction _id;
};

if (_speed > 3) exitWith{hint "You are still moving"};
if (!(_dertyp getUnitTrait "Engineer")) exitWith {hint "You need to be engineer!"};
if ((count _list) != 1) exitWith {hint "No Workshop around!"; _SUV removeAction _id;};
if (_ImLager < 300) exitWith {hint "Not enough Resources!";};

 _SUV removeAction _id;
 _Imlager = _Imlager - 300;
 ResVert set [0,_Imlager];
 publicVariable "ResVert";
 _SUV setVehicleLock "LOCKED";
 _fuel = fuel _SUV;
 _SUV setFuel 0;
 _dertyp playMoveNow "AinvPknlMstpSlayWrflDnon_medicOther";

 _Panzer = "Land_Mil_WallBig_Corner_F" createVehicle position _SUV;
 _Panzer attachTo [_SUV,[0.8, -0.3, -0.2]];
 _Panzer setVectorDirAndUp [[1, 0, -0.5], [0, 1, 0]];
 sleep 1;
 _Panzer = "Land_Mil_WallBig_Corner_F" createVehicle position _SUV;
 _Panzer attachTo [_SUV,[-0.8, -0.3, -0.2]];
 _Panzer setVectorDirAndUp [[-0.5, 0, 1], [0, 1, 0]];
 sleep 1;
 _Panzer = "Land_CncBarrier_F" createVehicle position _SUV;
 _Panzer attachTo [_SUV,[0, 2.3, -0.6]];
 _Panzer setVectorDirAndUp [[0, 0, 1], [0, 0, 1]];
 sleep 1;
 _Panzer = "Land_CncBarrier_F" createVehicle position _SUV;
 _Panzer attachTo [_SUV,[0, 2, -0.15]];
 _Panzer setVectorDirAndUp [[0, 1, 4], [0, 0, 1]];
 sleep 1;
 _Panzer = "Land_CncBarrier_F" createVehicle position _SUV;
 _Panzer attachTo [_SUV,[-0.1, -3, -0.7]];
 _Panzer setVectorDirAndUp [[0, 4, 1], [0, 0, 1]];
 sleep 1;
 _Panzer = "Land_CncBarrier_F" createVehicle position _SUV;
 _Panzer attachTo [_SUV,[-0.1, -3, -0.2]];
 _Panzer setVectorDirAndUp [[0, -2, 1], [0, 0, 1]]; 
 
 _SUV setVehicleLock "UNLOCKED";
 _SUV setFuel _fuel;
 [Fahr_geupgr, _SUVpathlong, true] call BIS_fnc_setNestedElement; //setze __Panzerung auf true
 publicVariable "Fahr_geupgr";