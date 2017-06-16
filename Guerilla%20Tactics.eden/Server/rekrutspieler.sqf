_Host = _this select 0;
_spieler = _this select 1;
_groupspieler = units _spieler;
_id = _this select 2;

if (_Host == _spieler) exitWith{hint "You just joined your own group.....yay..."; _Host removeAction _id;};
_groupspieler join (group _Host);
_Host removeAction _id;
{
	[_x,["Leave group/ Dismiss",{
		_unit = _this select 0;
		_id = _this select 2;
		_Host = (units group _unit) select 0;
		[_unit] joinSilent grpNull;
		[_unit,_id] remoteExec ["removeAction",0,true];
		_Host addAction ["Join group","Server\rekrutspieler.sqf"];
	},"",0]] remoteExec ["addAction",0,true];
} forEach _groupspieler;
/*_Host addAction ["Kick out of group", {
	_Host = _this select 0;
	_id = _this select 2;
	[_Host] joinSilent grpNull;
	_Host removeAction _id;
	[_Host,["Add to Group","\Server\rekrutieren.sqf"]] remoteExec ["addAction",0,true];
}];