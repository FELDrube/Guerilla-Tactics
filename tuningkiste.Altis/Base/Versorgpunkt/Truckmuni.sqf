_Versorgpunkt = _this select 0;
_spieler = _this select 1;
_id = _this select 2;
_veh = (vehicle _spieler);

_LKW = "O_Truck_03_ammo_F";
if ((typeOf _veh) == _LKW) then {
	_speed = speed _veh;
	_Muni = getAmmoCargo _veh;
	_Faktor = 600;
	_treibstoff = fuel _veh;
	_ImLager = MuniVert select 0;
	if (_speed <= 3) then
	{
		_BenMuni = (1 - _Muni) * _Faktor;
		if (_ImLager >= _BenMuni) then {
			_Versorgpunkt removeAction _id;
			_ImLager = _ImLager - _BenMuni;
			MuniVert set [0,_ImLager];
			publicVariable "MuniVert";
			_veh setFuel 0;
			sleep 50;
			_veh setAmmoCargo 1;
			_veh setFuel _treibstoff;
			_Versorgpunkt addAction ["<t color = '#4EB555'> Refill Ammotruck","Base\Versorgpunkt\Truckmuni.sqf"];
		}else {hint "Not enough Ammo!"};
	} else {hint "You have to stand still"};
} else {hint "You are not driving an ammotruck"};