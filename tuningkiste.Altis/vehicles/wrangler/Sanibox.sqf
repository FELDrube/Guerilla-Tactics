_kiste = _this select 0;
_sold = _this select 1;

_sold addEventHandler ["AnimDone",{
	_sold setDamage 0;
	_sold removeEventHandler ["AnimDone", _thisEventHandler];
}];

_sold playMoveNow "AinvPknlMstpSlayWrflDnon_medic";




