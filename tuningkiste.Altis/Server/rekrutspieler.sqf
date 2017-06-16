_Host = _this select 0;
_spieler = _this select 1;
_groupspieler = units _spieler;
_id = _this select 2;


_groupspieler join (group _Host);
{
	[_x,["Leave group/ Dismiss",{
		_unit = _this select 0;
		_id = _this select 2;
		[_unit] joinSilent grpNull;
		[_unit,_id] remoteExec ["removeAction",0,true];
	}]] remoteExec ["addAction",0,true];
} forEach _groupspieler;
/*_Host addAction ["Kick out of group", {
	_Host = _this select 0;
	_id = _this select 2;
	[_Host] joinSilent grpNull;
	_Host removeAction _id;
	[_Host,["Add to Group","\Server\rekrutieren.sqf"]] remoteExec ["addAction",0,true];
}];