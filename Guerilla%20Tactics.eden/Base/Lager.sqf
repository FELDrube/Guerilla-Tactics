_spieler = _this select 1;
_Lager = _this select 0;
_Auswahl = (_this select 3) select 0;
_Ort = (_this select 3) select 1;


switch (_Auswahl) do
	{
		case 0 :
			{
			//---------------------- Rohstoffe Einlagern --------------------------------------------------------------------------------------------------------------------------
			_Imlager = ResVert select 0;														//funktionsweise dieser aktion siehe MHQ
			_i = 0;

			_list = (nearestObjects [_Lager, ["CargoNet_01_box_F"], 40]);
			if (count _list == 0) then { hint "There are no resources near the storage"}		// wenn anzahl der arraysegmente == 0 dann hint
			else 
				{
					if (_Imlager + (count _list * 100)<= LagerBasemaxres) then
						{
							_Imlager = _Imlager + (count _list * 100);						// frachtwert drauf addieren
							while {_i < count _list} do 
								{																// solange _i kleiner als Länge des arrays mache
									_res = _list select _i;										// benenne das Objekt im Array an der Stelle _i auf _res
									deleteVehicle _res;											// lösche dieses
									_i = _i+1;													// mach _i um eins größer
								};
							ResVert set [0,_Imlager];
							publicVariable "ResVert";
						}
					else {hint "Storage full / Too many resources in vicinity";};
				};	
			};				
			//----------------------------------------------------------------------------------------------------------------------------------------------------
		case 1 : 
			{
			//----------------------- Rohstoffe Auslagern --------------------------------------------------------------------------------------------------
			_Imlager = ResVert select 0;														//funktionsweise dieser aktion siehe MHQ
			_i = 0;		
			
			if (_Imlager >= 300) then 
				{

				_i = 3;
				_Imlager = _Imlager - 300;
				while {_i > 0} do 
					{
						_res = createVehicle ["CargoNet_01_box_F", _Ort, [], 4, "NONE"];
						_i = _i-1;
					};
				}
			else
				{
					while {_Imlager >= 100} do 
						{															// solange noch mehr als 100 resourcen im LKW sind mache folgendes
							_Imlager = _Imlager - 100;
							_i=_i+1;
						};	
					while {_i > 0} do 
						{
							_res = createVehicle ["CargoNet_01_box_F", _Ort , [], 4, "NONE"];
							_i = _i-1;
						};
				};
			ResVert set [0,_Imlager];
			publicVariable "ResVert";
			};
			//----------------------------------------------------------------------------------------------------------------------------------------------
		case 2 : 
			{
			//----------------------- Munition Einlagern --------------------------------------------------------------------------------------------------
			_MuniImlager = MuniVert select 0;														//funktionsweise dieser aktion siehe MHQ
			_i = 0;

			_list = (nearestObjects [_Lager, ["O_supplyCrate_F"], 40]);
			if (count _list == 0) then { hint "There is no ammo near the storage"}		// wenn anzahl der arraysegmente == 0 dann hint
			else 
				{
					if (_MuniImlager + (count _list * 100)<= LagerBasemaxmuni) then
						{
							_MuniImlager = _MuniImlager + (count _list * 100);						// frachtwert drauf addieren
							while {_i < count _list} do 
								{																// solange _i kleiner als Länge des arrays mache
									_res = _list select _i;										// benenne das Objekt im Array an der Stelle _i auf _res
									deleteVehicle _res;											// lösche dieses
									_i = _i+1;													// mach _i um eins größer
								};
							MuniVert set [0,_MuniImlager];
							publicVariable "MuniVert";
						}
					else {hint "Storage full / Too much ammo in vicinity";};
				};	
			};		
			//---------------------------------------------------------------------------------------------------------------------------------------------
		case 3 :
			{
			//----------------------- Munition Auslagern --------------------------------------------------------------------------------------------------
			_MuniImlager = MuniVert select 0;														//funktionsweise dieser aktion siehe MHQ
			_i = 0;
			if (_MuniImlager >= 300) then 
				{
				_i = 3;
				_MuniImlager = _MuniImlager - 300;
				while {_i > 0} do 
					{
						_res = createVehicle ["O_supplyCrate_F", _Ort, [], 4, "NONE"];
						clearBackpackCargoGlobal _res;
						clearItemCargoGlobal _res;
						clearMagazineCargoGlobal _res;
						clearWeaponCargoGlobal _res;
						_i = _i-1;
					};
				}
			else
				{
					while {_MuniImlager >= 100} do 
						{															// solange noch mehr als 100 resourcen im LKW sind mache folgendes
							_MuniImlager = _MuniImlager - 100;
							_i=_i+1;
						};	
					while {_i > 0} do 
						{
							_res = _resbox createVehicle ["O_supplyCrate_F", _Ort , [], 4, "NONE"];
							_i = _i-1;
						};
				};
			MuniVert set [0,_MuniImlager];
			publicVariable "MuniVert";
			};
			//---------------------------------------------------------------------------------------------------------------------------------------------
		case 4 : 
			{
				_idup = _this select 2;
				_Imlager = ResVert select 0;	

				if (_Imlager >= 1500) then 
				{
					_Imlager = _Imlager - 1500;
					ResVert set [0,_Imlager];
					publicVariable "ResVert";
					_Upgrade1 = "Land_u_Addon_01_V1_F" createVehicle getPos _Lager;
					_Upgrade1 attachTo [_Lager, [2, 7.4, 0]];
					_Upgrade1 setVectorDirAndUp [[0,-1,0],[0,0,1]];
					_Lager removeAction _idup;
					LagerBasemaxres = 5000;
					LagerBasemaxmuni = 1800;
					publicVariable "LagerBasemaxmuni";
					publicVariable "LagerBasemaxres";
					[_Lager,["<t color = '#77C3E0'> Upgrade storage to stage 3 [4000 Res]","Base\Lager.sqf",[5]]] remoteExec ["addAction",0,true];
					[_Lager, _idup] remoteExec ["removeAction",0,true]; 
				}
				else {hint "Not enough resources in storage"};
			};
		case 5 :
			{
				_idup = _this select 2;
				_Imlager = ResVert select 0;	

				if (_Imlager >= 3500) then 
				{
					_Imlager = _Imlager - 3000;
					ResVert set [0,_Imlager];
					publicVariable "ResVert";
					_Upgrade2 = "Land_u_Addon_01_V1_F" createVehicle getPos _Lager;
					_Upgrade2 attachTo [_Lager, [-2, -7, 0]];
					_Upgrade2 setVectorDirAndUp [[0,1,0],[0,0,1]];
					_Lager removeAction _idup;
					LagerBasemaxres = 8000;
					LagerBasemaxmuni = 2700;
					publicVariable "LagerBasemaxmuni";
					publicVariable "LagerBasemaxres";
					[_Lager, _idup] remoteExec ["removeAction",0,true]; 
				}
				else {hint "Not enough resources in storage"};
			};
		case 10:
			{
				_Kiste = createVehicle ["Land_MetalCase_01_medium_F",_Ort, [], 4,"NONE"];
				clearBackpackCargoGlobal _Kiste; 
				clearItemCargoGlobal _Kiste; 
				clearMagazineCargoGlobal _Kiste; 
				clearWeaponCargoGlobal _Kiste;
				[_Kiste,["<t color = '#ED0909'> DESTROY INVENTORY AND BOX",{_Kiste = _this select 0; deleteVehicle _Kiste}]] remoteExec ["addAction",0,true];
				[_Kiste,["<t color = '#EDCF24'> Pick up box","Base\kistepickup.sqf"]] remoteExec ["addAction",0,true];
			}
		};
	