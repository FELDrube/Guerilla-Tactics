_Versorgpunkt = _this select 0;
_spieler = _this select 1;
_id = _this select 2;
_veh = (vehicle _spieler);

_LKW = ["O_Truck_03_repair_F","C_Truck_02_box_F","C_Offroad_01_repair_F"];
if ((typeOf _veh) in _LKW) then {
	_speed = speed _veh;
	_Res = getRepairCargo _veh;
	_Faktor = 3000;
	_treibstoff = fuel _veh;
	_ImLager = ResVert select 0;
	if (_speed <= 3) then
	{
		_BenRes = (1 - _Res) * _Faktor;
		if (_ImLager >= _BenRes) then {
			[_Versorgpunkt, _id] remoteExec ["removeAction",0,true];
			_ImLager = _ImLager - _BenRes;
			ResVert set [0,_ImLager];
			publicVariable "ResVert";
			_veh setFuel 0;
			sleep 50;
			_veh setRepairCargo 1;
			_veh setFuel _treibstoff;
			[_Versorgpunkt,["<t color = '#4EB555'> Refill Repairtruck","Base\Versorgpunkt\Truckrep.sqf"]] remoteExec ["addAction",0,true];
		}else {hint "Not enough resources!"};
	} else {hint "You have to stand still"};
} else {hint "You are not driving a repairtruck"};