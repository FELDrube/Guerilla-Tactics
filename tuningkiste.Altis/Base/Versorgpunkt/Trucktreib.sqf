_spieler = _this select 1;
_veh = (vehicle _spieler);

_LKW = ["O_Truck_03_fuel_F","C_Truck_02_fuel_F","C_Van_01_fuel_F"];
if ((typeOf _veh) in _LKW) then {
	_speed = speed _veh;
	_treibstoff = fuel _veh;
	if (_speed <= 3) then
	{
		_veh setFuel 0;
		sleep 50;
		_veh setFuelCargo 1;
		_veh setFuel _treibstoff;
	} else {hint "You have to stand still"};
} else {hint "You are not driving a fueltruck"};