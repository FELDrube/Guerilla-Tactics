_plane = _this select 0;
_dertyp = _this select 1;
_id = _this select 2;
_speed = speed _plane;

_planepathlong = [Fahr_geupgr,_plane] call BIS_fnc_findNestedElement;  // hol mir die Adresse des LKWs
_speicher = (_planepathlong) select 0;
_plbool = [_speicher, 8];

if (!([Fahr_geupgr, _plbool] call BIS_fnc_returnNestedElement)) exitWith {"This plane does not have cargo in it"};

_itempathlong = [_speicher,4];
_magazinepathlong = [_speicher,5];
_weaponpathlong = [_speicher,6];
_backpackpathlong = [_speicher,7];


	
	if (((getpos _plane) select 2) > 30) then { 
		_chute = "B_Parachute_02_F" createVehicle [0,0,100]; 
		_chute attachTo [_plane, [0,-25, 0]];
		detach _chute;
		_Kiste = "Land_MetalCase_01_medium_F" createVehicle [0,0,0];
		[_Kiste,["<t color = '#ED0909'> DESTROY INVENTORY AND BOX",{_Kiste = _this select 0; deleteVehicle _Kiste}]] remoteExec ["addAction",0,true];
		[_Kiste,["<t color = '#EDCF24'> Pick up box","Base\kistepickup.sqf"]] remoteExec ["addAction",0,true];
		_itemarray = ([Fahr_geupgr, _itempathlong] call BIS_fnc_returnNestedElement) select 0;
		_itemzahlarray = ([Fahr_geupgr, _itempathlong] call BIS_fnc_returnNestedElement) select 1;
		_itemanzahl = (count _itemarray) - 1;
		_i = _itemanzahl;
		while {_i >= 0} do {
			_Kiste addItemCargoGlobal [(_itemarray select _i),(_itemzahlarray select _i)];
			_i = _i - 1;
		};
		_i = 0;

		_magazinearray = ([Fahr_geupgr, _magazinepathlong] call BIS_fnc_returnNestedElement) select 0;
		_magazinezahlarray = ([Fahr_geupgr, _magazinepathlong] call BIS_fnc_returnNestedElement) select 1;
		_magazineanzahl = (count _magazinearray) - 1;
		_i = _magazineanzahl;
		while {_i >= 0} do {
			_Kiste addItemCargoGlobal [(_magazinearray select _i),(_magazinezahlarray select _i)];
			_i = _i - 1;
		};
		_i = 0;


		_weaponarray = ([Fahr_geupgr, _weaponpathlong] call BIS_fnc_returnNestedElement) select 0;
		_weaponzahlarray = ([Fahr_geupgr, _weaponpathlong] call BIS_fnc_returnNestedElement) select 1;
		_weaponanzahl = (count _weaponarray) - 1;
		_i = _weaponanzahl;
		while {_i >= 0} do {
			_Kiste addItemCargoGlobal [(_weaponarray select _i),(_weaponzahlarray select _i)];
			_i = _i - 1;
		};
		_i = 0;


		_backpackarray = ([Fahr_geupgr, _backpackpathlong] call BIS_fnc_returnNestedElement) select 0;
		_backpackzahlarray = ([Fahr_geupgr, _backpackpathlong] call BIS_fnc_returnNestedElement) select 1;
		_backpackanzahl = (count _backpackarray) - 1;
		_i = _backpackanzahl;
		while {_i >= 0} do {
			_Kiste addItemCargoGlobal [(_backpackarray select _i),(_backpackzahlarray select _i)];
			_i = _i - 1;
		};
		_i = 0;

		_Kiste attachTo [_chute,[0,0,0]];
		[Fahr_geupgr, _plbool, false] call BIS_fnc_setNestedElement;

} else {
	_Kiste = "Land_MetalCase_01_medium_F" createVehicle [0,0,0];
	_Kiste attachTo [_plane, [0,-8,0]];
	detach _Kiste;
	_Kiste setVelocity [0,0,0.5];
	_itemarray = ([Fahr_geupgr, _itempathlong] call BIS_fnc_returnNestedElement) select 0;
	_itemzahlarray = ([Fahr_geupgr, _itempathlong] call BIS_fnc_returnNestedElement) select 1;
	_itemanzahl = (count _itemarray) - 1;
	_i = _itemanzahl;
	while {_i >= 0} do {
			_Kiste addItemCargoGlobal [(_itemarray select _i),(_itemzahlarray select _i)];
			_i = _i - 1;
		};
	_i = 0;

	_magazinearray = ([Fahr_geupgr, _magazinepathlong] call BIS_fnc_returnNestedElement) select 0;
	_magazinezahlarray = ([Fahr_geupgr, _magazinepathlong] call BIS_fnc_returnNestedElement) select 1;
	_magazineanzahl = (count _magazinearray) - 1;
	_i = _magazineanzahl;
	while {_i >= 0} do {
			_Kiste addItemCargoGlobal [(_magazinearray select _i),(_magazinezahlarray select _i)];
			_i = _i - 1;
		};
	_i = 0;


	_weaponarray = ([Fahr_geupgr, _weaponpathlong] call BIS_fnc_returnNestedElement) select 0;
	_weaponzahlarray = ([Fahr_geupgr, _weaponpathlong] call BIS_fnc_returnNestedElement) select 1;
	_weaponanzahl = (count _weaponarray) - 1;
	_i = _weaponanzahl;
	while {_i >= 0} do {
			_Kiste addItemCargoGlobal [(_weaponarray select _i),(_weaponzahlarray select _i)];
			_i = _i - 1;
		};
	_i = 0;


	_backpackarray = ([Fahr_geupgr, _backpackpathlong] call BIS_fnc_returnNestedElement) select 0;
	_backpackzahlarray = ([Fahr_geupgr, _backpackpathlong] call BIS_fnc_returnNestedElement) select 1;
	_backpackanzahl = (count _backpackarray) - 1;
	_i = _backpackanzahl;
	while {_i >= 0} do {
			_Kiste addItemCargoGlobal [(_backpackarray select _i),(_backpackzahlarray select _i)];
			_i = _i - 1;
		};
	_i = 0;
	[Fahr_geupgr, _plbool, false] call BIS_fnc_setNestedElement;

};
hint "Box unloaded";
publicVariable "Fahr_geupgr";
[_plane, _id] remoteExec ["removeAction",0,true];
[_plane, ["Load box","vehicles\flugzeug\flugzeugfracht.sqf"]] remoteExec ["addAction",0,true];
	
	// arrays der items zurücksetzen, aktion zum neuen einladne dazu bla;

