private ["_pos","_shift","_log","_dist","_m","_array","_group"];

_pos = _this select 0;_shift = _this select 1;_m = 0;_log = "";_dist = 20;_array = [];_group = objNull;

if(!(_shift)) then
{
	_array = nearestObjects [[(_pos select 0),(_pos select 1)], [], 20];
	{
		if(format["%1",group _x] != "<NULL-group>") then
		{
			if(isNull _group) then
			{
				if(group _x != group player) then
				{
					_group = (group _x);
					{sleep random 0.3;(vehicle _x) setdammage 1;_x setdammage 1}foreach units _group;
				};
			};
		};
	}	foreach _array;
	if(isNull _group) then
	{
		player groupchat "No group in range. Please try again.";
	};
}
else
{
	player setpos _pos;
};