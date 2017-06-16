_truck = _this select 0;
_dertyp = _this select 1;
_id = _this select 2;
_speed = speed _truck;
_Imlager = ResVert select 0;
_list = (nearestObjects [_truck, ["Land_fs_roof_F"], 10]);

_truckpathlong = [Fahr_geupgr,_truck] call BIS_fnc_findNestedElement;  // hol mir die Adresse des LKWs
_truckpathlong set [1,1];			// ändere die adresse auf das _Panzerungselement
if ([Fahr_geupgr, _truckpathlong] call BIS_fnc_returnNestedElement) exitWith {		// wenn das panzerungs element schon auf true steht
	hint "You already installed armor on that vehicle!";										// mach nix weiter
	_truck removeAction _id;
	};

if (_speed > 3) exitWith{hint "You are still moving"};
if (!(_dertyp getUnitTrait "Engineer")) exitWith {hint "You need to be engineer!"};
if ((count _list) != 1) exitWith {hint "No Workshop around!"; _truck removeAction _id;};
if (_Imlager >= 400) then {
 _truck removeAction _id;
 _Imlager = _Imlager - 400;
 ResVert set [0,_Imlager];
 publicVariable "ResVert";
 _truck setVehicleLock "LOCKED";
 _fuel = fuel _truck;
 _truck setFuel 0;
 _dertyp playMoveNow "AinvPknlMstpSlayWrflDnon_medicOther";
 
	_Panzer = "Land_Mil_WallBig_Corner_F" createVehicle position _truck;
	_Panzer attachTo [_truck,[0.9, -1.4, -0.2]];
	_Panzer setVectorDirAndUp [[1, 0, -1], [0, 1, 0]];

	_Panzer = "Land_Mil_WallBig_Corner_F" createVehicle position _truck;
	_Panzer attachTo [_truck,[-0.9, -1.4, -0.2]];
	_Panzer setVectorDirAndUp [[-1, 0, 1], [0, 1, 0]];
sleep 0.5;
	_Panzer = "Land_CncBarrier_F" createVehicle position _truck;
	_Panzer attachTo [_truck,[1, -2.5, 1]];
	_Panzer setVectorDirAndUp [[1, 0, 0], [0, 0, -1]];

	_Panzer = "Land_CncBarrier_F" createVehicle position _truck;
	_Panzer attachTo [_truck,[-1, -2.5, 1]];
	_Panzer setVectorDirAndUp [[1, 0, 0], [0, 0, -1]];
 sleep 0.5;
	_Panzer = "Land_CncBarrier_F" createVehicle position _truck;
	_Panzer attachTo [_truck,[1, -0.5, 1]];
	_Panzer setVectorDirAndUp [[1, 0, 0], [0, 0, -1]];

	_Panzer = "Land_CncBarrier_F" createVehicle position _truck;
	_Panzer attachTo [_truck,[-1, -0.5, 1]];
	_Panzer setVectorDirAndUp [[1, 0, 0], [0, 0, -1]];
 sleep 0.5;
	_Panzer = "Land_CncBarrier_F" createVehicle position _truck;
	_Panzer attachTo [_truck,[1, 1.5, -0.2]];
	_Panzer setVectorDirAndUp [[3, 1, 0], [0, 0, -1]];

	_Panzer = "Land_CncBarrier_F" createVehicle position _truck;
	_Panzer attachTo [_truck,[-1, 1.5, -0.2]];
	_Panzer setVectorDirAndUp [[-3, 1, 0], [0, 0, -1]];
 sleep 0.5;
	_Panzer = "Land_CncBarrier_F" createVehicle position _truck;
	_Panzer attachTo [_truck,[1, 1.5, -0.8]];
	_Panzer setVectorDirAndUp [[3, 1, 0], [0, 0, 1]];

	_Panzer = "Land_CncBarrier_F" createVehicle position _truck;
	_Panzer attachTo [_truck,[-1, 1.5, -0.8]];
	_Panzer setVectorDirAndUp [[-3, 1, 0], [0, 0, 1]];
 sleep 0.5;
	_Panzer = "Land_CncBarrier_F" createVehicle position _truck;
	_Panzer attachTo [_truck,[0, 2.5, -0.8]];
	_Panzer setVectorDirAndUp [[0, 0, 1], [0, 0, 1]];

	_Panzer = "Land_CncBarrier_F" createVehicle position _truck;
	_Panzer attachTo [_truck,[0, 2.3, -0.2]];
	_Panzer setVectorDirAndUp [[0, 1, 2], [0, 0, 1]];

	_Panzer = "Land_CncBarrier_F" createVehicle position _truck;
	_Panzer attachTo [_truck,[0, 1.7, 0]];
	_Panzer setVectorDirAndUp [[0, 1, 4], [0, 0, 1]];
 sleep 0.5;
	_Panzer = "Land_CncBarrier_F" createVehicle position _truck;
	_Panzer attachTo [_truck,[0, -3.7, -0.4]];
	_Panzer setVectorDirAndUp [[0, 0, 1], [0, 0, 1]];

	_Panzer = "Land_CncBarrier_F" createVehicle position _truck;
	_Panzer attachTo [_truck,[0, -3.7, -1]];
	_Panzer setVectorDirAndUp [[0, 0, 1], [0, 0, 1]];
 sleep 0.5;
	_Panzer = "Land_CncBarrier_F" createVehicle position _truck;
	_Panzer attachTo [_truck,[0, -3.7, 0.2]];
	_Panzer setVectorDirAndUp [[0, 0, 1], [0, 0, 1]];

	_Panzer = "Land_CncBarrier_F" createVehicle position _truck;
	_Panzer attachTo [_truck,[0, -3.7, 0.8]];
	_Panzer setVectorDirAndUp [[0, 0, 1], [0, 0, 1]];

	_Panzer = "Land_CncBarrier_F" createVehicle position _truck;
	_Panzer attachTo [_truck,[0, -3.7, 1.2]];
	_Panzer setVectorDirAndUp [[0, 0, 1], [0, 0, 1]];
 sleep 0.5;
	_Panzer = "Land_CncBarrier_F" createVehicle position _truck;
	_Panzer attachTo [_truck,[0, 1, 0.8]];
	_Panzer setVectorDirAndUp [[0, 1, 2], [0, 0, 1]];

	_Panzer = "Land_CncBarrier_F" createVehicle position _truck;
	_Panzer attachTo [_truck,[0, 0.5, 1.2]];
	_Panzer setVectorDirAndUp [[0, 1, 2], [0, 0, -1]];
 sleep 0.5;
	_Panzer = "Land_CncBarrier_F" createVehicle position _truck;
	_Panzer attachTo [_truck,[0, 0.1, 1.3]];
	_Panzer setVectorDirAndUp [[0, 0, 1], [0, 1, 0]];
	
 _truck setVehicleLock "UNLOCKED";
 _truck setFuel _fuel;
 [Fahr_geupgr, _truckpathlong, true] call BIS_fnc_setNestedElement; //setze _Panzerung auf true
 publicVariable "Fahr_geupgr";
 } else {hint "Not enough Resources!";};