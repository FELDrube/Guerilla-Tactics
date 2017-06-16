_plane = _this select 0;
_dertyp = _this select 1;
_id = _this select 2;
_speed = speed _plane;
_plpathlong = [Fahr_geupgr,_plane] call BIS_fnc_findNestedElement;  // hol mir die Adresse des Flugzeugs
_plpathlong set [1,3];			// ändere die adresse auf das letzte element (munition)
_ammo = [Fahr_geupgr, _plpathlong] call BIS_fnc_returnNestedElement;
_plpath = _plpathlong select 0;
_listerep = nearestObjects [_plane,["O_Truck_03_repair_F","C_Truck_02_box_F"],20];
_listemun = nearestObjects [_plane,["O_Truck_03_ammo_F"],20];

if (_speed > 3) exitWith{hint "You are still moving"};
if (!(_dertyp getUnitTrait "Engineer")) exitWith {hint "You need to be engineer!"};
if (((count _listemun) > 0) && ((count _listerep) > 0))  then{
	if(_ammo == 0) then {
		_dertyp playMoveNow "AinvPknlMstpSlayWrflDnon_medicOther";
		[Fahr_geupgr, _plpathlong, 2] call BIS_fnc_setNestedElement;
		sleep 3;
		_bombe1 = "Land_MetalBarrel_F" createVehicle getPos _plane;
		_bombe1 attachto [_plane,[-1.6,0.5,-1.1]];
		_bombe1 setVectorDirAndUp [[5, 0, 1], [0, 1, 0]];
		(Fahr_geupgr select _plpath) pushBack _bombe1;
		sleep 3;
		_bombe2 = "Land_MetalBarrel_F" createVehicle getPos _plane;
		_bombe2 attachto [_plane,[1.6,0.5,-1.1]];
		_bombe2 setVectorDirAndUp [[5, 0, 1], [0, 1, 0]];
		(Fahr_geupgr select _plpath) pushBack _bombe2;
		[_plane,["Detach Barrelbomb","vehicles\flugzeug\Fassbooom.sqf"]] remoteExec ["addAction",0,true];
		publicVariable "Fahr_geupgr";
		[_plane,_id] remoteExec ["removeAction",0,true];
		} else {hint "There are still bombs attached to the plane!"};
	} else {hint "You need have an ammotruck and a repairtruck standing next to the plane!"};