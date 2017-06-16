_plane = _this select 0;
_dertyp = _this select 1;
_id = _this select 2;
_speed = speed _plane;
_Kiste = nearestObject [position _plane, "Land_MetalCase_01_medium_F"];
_items = getItemCargo _Kiste;
_weapons = getWeaponCargo _Kiste;
_magazines = getMagazineCargo _Kiste;
_backpacks = getBackpackCargo _Kiste;

_planepathlong = [Fahr_geupgr,_plane] call BIS_fnc_findNestedElement;  // hol mir die Adresse des LKWs
_speicher = _planepathlong;
_speicher set [1,8];

if ([Fahr_geupgr, _speicher] call BIS_fnc_returnNestedElement) exitWith{"This plane already has cargo in it"};
if (_speed > 3) exitWith{hint "You are still moving"};

_speicher = _planepathlong;
_speicher set [1,4];			// ändere die adresse auf das letzte element
_itempathlong = _speicher;
[Fahr_geupgr, _itempathlong, _items] call BIS_fnc_setNestedElement;
_speicher set [1,5];	
_magazinepathlong = _speicher;
[Fahr_geupgr, _magazinepathlong, _magazines] call BIS_fnc_setNestedElement;
_speicher set [1,6];	
_weaponpathlong = _speicher;
[Fahr_geupgr, _weaponpathlong, _weapons] call BIS_fnc_setNestedElement;
_speicher set [1,7];
_backpackpathlong = _speicher;
[Fahr_geupgr, _backpackpathlong, _backpacks] call BIS_fnc_setNestedElement;
_speicher set [1,8];
[Fahr_geupgr, _speicher, true] call BIS_fnc_setNestedElement;

deleteVehicle _Kiste;

hint "Box loaded";
publicVariable "Fahr_geupgr";
[_plane, _id] remoteExec ["removeAction",0,true];
[_plane, ["Drop box","vehicles\flugzeug\flugzeugfrachtabwurf.sqf"]] remoteExec ["addAction",0,true];











/*		_itemarray = ([Fahr_geupgr, _itempathlong] call BIS_fnc_returnNestedElement) select 0;
		_itemzahlarray = ([Fahr_geupgr, _itempathlong] call BIS_fnc_returnNestedElement) select 1;
		_itemanzahl = (count _itemarray) - 1;
		_i = _itemanzahl;
		 while {_i >= 0} do {
				_Kiste addItemCargoGlobal [(_itemarray select _i),(_itemzahlarray select _i)];
				_i = _i - 1;
			};
		_i = 0;