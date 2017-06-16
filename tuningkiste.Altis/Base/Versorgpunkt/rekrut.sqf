_spieler = _this select 1;
_id = _this select 2;

_soldat = (group player) createUnit ["B_G_Soldier_lite_F", getPos player,[],3,"NONE"];

_soldat addAction ["Kick out of group", {
	_soldat = _this select 0;
	_id = _this select 2;
	[_soldat] joinSilent grpNull;
	_soldat removeAction _id;
	[_soldat,["Add to Group","Server\rekrutieren.sqf"]] remoteExec ["addAction",0,true];
}];