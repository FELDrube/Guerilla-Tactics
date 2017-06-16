_veh = _this select 0;
_dertyp = _this select 1;
_id = _this select 2;
_speed = speed _veh;
_Imlager = ResVert select 0;
_list = (nearestObjects [_veh, ["Land_fs_roof_F"], 10]);

_vehpathlong = [Fahr_geupgr,_veh] call BIS_fnc_findNestedElement;  // hol mir die Adresse des LKWs
_vehpathlong set [1,1];			// ändere die adresse auf das __Panzerungselement
if ([Fahr_geupgr, _vehpathlong] call BIS_fnc_returnNestedElement) exitWith {		// wenn das _Panzerungs element schon auf true steht
	hint "You already installed armor on that vehicle!";										// mach nix weiter
	_veh removeAction _id;
};

if (_speed > 3) exitWith{hint "You are still moving"};
if (!(_dertyp getUnitTrait "Engineer")) exitWith {hint "You need to be engineer!"};
if ((count _list) != 1) exitWith {hint "No Workshop around!"; _veh removeAction _id;};
if (_ImLager < 300) exitWith {hint "Not enough Resources!";};

 _veh removeAction _id;
 _Imlager = _Imlager - 300;
 ResVert set [0,_Imlager];
 publicVariable "ResVert";
 _veh setVehicleLock "LOCKED";
 _fuel = fuel _veh;
 _veh setFuel 0;
 _dertyp playMoveNow "AinvPknlMstpSlayWrflDnon_medicOther";
 
 _Panzer = "Land_CncBarrier_F" createVehicle position _veh;
 _Panzer attachTo [_veh,[1, -0.2, -0.8]];
 _Panzer setVectorDirAndUp [[1, 0, 0], [0, 0, 1]];
sleep 0.5;
 _Panzer = "Land_CncBarrier_F" createVehicle position _veh;
 _Panzer attachTo [_veh,[-1.1, -0.2, -0.8]];
 _Panzer setVectorDirAndUp [[1, 0, 0], [0, 0, 1]];

 _Panzer = "Land_CncBarrier_F" createVehicle position _veh;
 _Panzer attachTo [_veh,[-1.1, -0.2, -0.3]];
 _Panzer setVectorDirAndUp [[5, 0, -1], [0, 0, 1]];
sleep 0.5;
 _Panzer = "Land_CncBarrier_F" createVehicle position _veh;
 _Panzer attachTo [_veh,[1, -0.2, -0.3]];
 _Panzer setVectorDirAndUp [[5, 0, 1], [0, 0, 1]];

 _Panzer = "Land_CncBarrier_F" createVehicle position _veh;
 _Panzer attachTo [_veh,[1, -2, -0.8]];
 _Panzer setVectorDirAndUp [[1, 0, 0], [0, 0, 1]];
sleep 0.5;
 _Panzer = "Land_CncBarrier_F" createVehicle position _veh;
 _Panzer attachTo [_veh,[-1.1, -2, -0.8]];
 _Panzer setVectorDirAndUp [[1, 0, 0], [0, 0, 1]];

 _Panzer = "Land_CncBarrier_F" createVehicle position _veh;
 _Panzer attachTo [_veh,[-1.1, -2, -0.3]];
 _Panzer setVectorDirAndUp [[5, 0, -1], [0, 0, 1]];
sleep 0.5;
 _Panzer = "Land_CncBarrier_F" createVehicle position _veh;
 _Panzer attachTo [_veh,[1, -2, -0.3]];
 _Panzer setVectorDirAndUp [[5, 0, 1], [0, 0, 1]];

 _Panzer = "Land_CncBarrier_F" createVehicle position _veh;
 _Panzer attachTo [_veh,[1, 1.3, -0.8]];
 _Panzer setVectorDirAndUp [[1, 0, 0], [0, 0, 1]];
sleep 0.5;
 _Panzer = "Land_CncBarrier_F" createVehicle position _veh;
 _Panzer attachTo [_veh,[-1.1, 1.3, -0.8]];
 _Panzer setVectorDirAndUp [[1, 0, 0], [0, 0, 1]];
 
 _Panzer = "Land_CncBarrier_F" createVehicle position _veh;
 _Panzer attachTo [_veh,[-1.1, 1.3, -0.3]];
 _Panzer setVectorDirAndUp [[5, 0, -1], [0, 1, 8]];
sleep 0.5;
 _Panzer = "Land_CncBarrier_F" createVehicle position _veh;
 _Panzer attachTo [_veh,[1, 1.3, -0.3]];
 _Panzer setVectorDirAndUp [[5, 0, 1], [0, 1, 8]];
 
 _Panzer = "Land_CncBarrier_F" createVehicle position _veh;
 _Panzer attachTo [_veh,[0, 2.5, -0.4]];
 _Panzer setVectorDirAndUp [[0, 2, 1], [0, 0, 1]];
sleep 0.5;
 _Panzer = "Land_CncBarrier_F" createVehicle position _veh;
 _Panzer attachTo [_veh,[0, 2, -0.15]];
 _Panzer setVectorDirAndUp [[0, 1, 4], [0, 0, 1]];
 
 _Panzer = "Land_CncBarrier_F" createVehicle position _veh;
 _Panzer attachTo [_veh,[0, 2.7, -0.8]];
 _Panzer setVectorDirAndUp [[0, 0, 1], [0, 0, 1]];
sleep 0.5;
 _Panzer = "Land_CncBarrier_F" createVehicle position _veh;
 _Panzer attachTo [_veh,[0, -3.1, -0.8]];
 _Panzer setVectorDirAndUp [[0, 0, 1], [0, 0, 1]];
 
 _Panzer = "Land_CncBarrier_F" createVehicle position _veh;
 _Panzer attachTo [_veh,[0, -3.1, -0.3]];
 _Panzer setVectorDirAndUp [[0, 0, 1], [0, 0, 1]];
sleep 0.5;
 _Panzer = "Land_CncBarrier_F" createVehicle position _veh;
 _Panzer attachTo [_veh,[-1.1, 0, 0.2]];
 _Panzer setVectorDirAndUp [[3, 0, -1], [0, 0, 1]];

 _Panzer = "Land_CncBarrier_F" createVehicle position _veh;
 _Panzer attachTo [_veh,[1, 0, 0.2]];
 _Panzer setVectorDirAndUp [[3, 0, 1], [0, 0, 1]];
sleep 0.5; 
 _Panzer = "Land_CncBarrier_F" createVehicle position _veh;
 _Panzer attachTo [_veh,[0, -0.6, 0.2]];
 _Panzer setVectorDirAndUp [[0, 0, 1], [0, 0, 1]];
 
 _veh setVehicleLock "UNLOCKED";
 _veh setFuel _fuel;
 [Fahr_geupgr, _vehpathlong, true] call BIS_fnc_setNestedElement; //setze __Panzerung auf true