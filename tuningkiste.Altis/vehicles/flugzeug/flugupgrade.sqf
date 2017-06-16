_plane = _this select 0;
_id = _this select 2;

	_plane addAction ["Kiste einladen","vehicles\flugzeug\flugzeugfracht.sqf"];
	_plane addAction ["Flugshow","vehicles\flugzeug\rauch.sqf"];
	_plane addAction ["Fassbomben anbringen","vehicles\flugzeug\Fassbombe.sqf"];
	_plane removeAction _id;