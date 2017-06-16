_veh = _this select 0;
_id = _this select 2;

_ammopathlong = [Fahr_geupgr,_veh] call BIS_fnc_findNestedElement;  // hol mir die Adresse des Flugzeugs
_ammopathlong set [1,3];			// ändere die adresse auf das element (munition)
_ammo = [Fahr_geupgr, _ammopathlong] call BIS_fnc_returnNestedElement;
if (_ammo == 0) exitWith {hint "No ammo left"};

_ammo = _ammo - 1;
[Fahr_geupgr, _ammopathlong, _ammo] call BIS_fnc_setNestedElement;
publicVariable "Fahr_geupgr";
hint ("Ammo: " + str(_ammo));
_mine1= "ATMine_Range_Ammo" createVehicle getPos _veh;
_mine1 attachto [_veh,[0,-2,-1.5]];
detach _mine1;
_mine2= "ATMine_Range_Ammo" createVehicle getPos _veh;
_mine2 attachto [_veh,[1.8,-2,-1.5]];
detach _mine2;
_mine3= "ATMine_Range_Ammo" createVehicle getPos _veh;
_mine3 attachto [_veh,[-1.8,-2,-1.5]];
detach _mine3;

_veh removeAction _id;
sleep 3;
_veh addAction ["Put down mines","vehicles\offroad\minenleger.sqf"]

//_mine4= "ATMine_Range_Ammo" createVehicle getPos _veh;
//_mine4 attachto [_veh,[-4,-7,-1]];
//detach _mine4;
//_mine5= "ATMine_Range_Ammo" createVehicle getPos _veh;
//_mine5 attachto [_veh,[4,-7,-1]];
//detach _mine5;