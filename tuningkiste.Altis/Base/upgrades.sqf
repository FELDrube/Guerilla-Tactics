_Auswahl = (_this select 3) select 0;
_Ort = (_this select 3) select 1;
_id = _this select 2;
_Mast = _this select 0;

_Fahrzeuge = ["C_Quadbike_01_F","C_Offroad_02_unarmed_F","C_Plane_Civil_01_racing_F","C_Plane_Civil_01_F","C_Kart_01_F","C_Kart_01_Fuel_F","C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Vrana_F","C_Kart_01_green_F","C_Kart_01_orange_F","C_Kart_01_white_F","C_Kart_01_yellow_F","C_Kart_01_black_F","C_Van_01_fuel_F","C_Van_01_box_F","C_Van_01_transport_F","C_Truck_02_box_F","C_Truck_02_fuel_F","C_SUV_01_F","C_Hatchback_01_sport_F","C_Hatchback_01_F","C_Truck_02_covered_F","C_Truck_02_transport_F","C_Offroad_01_F","C_Offroad_01_repair_F","C_Rubberboat","C_Heli_Light_01_civil_F","O_Heli_Light_02_F","O_Heli_Light_02_unarmed_F","O_Heli_Light_02_v2_F","O_Heli_Attack_02_F","O_APC_Tracked_02_cannon_F","O_APC_Tracked_02_AA_F","O_MBT_02_cannon_F","O_MBT_02_arty_F","O_Boat_Armed_01_hmg_F","O_Boat_Transport_01_F","O_Lifeboat","O_G_Boat_Transport_01_F","O_MRAP_02_F","O_MRAP_02_hmg_F","O_MRAP_02_gmg_F","O_Quadbike_01_F","O_Truck_02_covered_F","O_Truck_02_transport_F","O_Truck_02_box_F","O_Truck_02_medical_F","O_Truck_02_Ammo_F","O_Truck_02_fuel_F","O_Plane_CAS_02_F","O_Heli_Transport_04_bench_F","O_APC_Wheeled_02_rcws_F","O_Truck_03_transport_F","O_Truck_03_covered_F","O_Truck_03_repair_F","O_Truck_03_ammo_F","O_Truck_03_fuel_F","O_Truck_03_medical_F","O_Truck_03_device_F","O_T_LSV_02_armed_F","O_T_LSV_02_unarmed_F"];

switch (_Auswahl) do 
	{
		case 0 :
		{
		//-----------------------------Werkstatt----------------------------------------------------------------------------------------
		_Imlager = ResVert select 0;
		if (_Imlager >= 800) then 
			{
			_Imlager = _Imlager - 800;
			ResVert set [0,_Imlager];
			publicVariable "ResVert";
			_Werkstatt = createVehicle ["Land_fs_roof_F", _Ort, [], 0, "NONE"];
			
			[_Werkstatt,["<t color = '#4EB555'> Train as engineer [100 Res]",
			{
				_Imlager = ResVert select 0;
				_dertyp = _this select 1;
				if ((_Imlager >= 100) && (!(_dertyp getUnitTrait "Engineer"))) then {
					_dertyp setUnitTrait ["Engineer",true];
					_Imlager = _Imlager - 100;
					ResVert set [0,_Imlager];
				} else {hint "Not enough Resources, or you already are Engineer!"};
			}]] remoteExec ["addAction",0,true];
			[_Werkstatt,["<t color = '#4EB555'> Scan for vehicles","Base\Versorgpunkt\vehupgrades.sqf"]] remoteExec ["addAction",0,true];
			[_Mast, _id] remoteExec ["removeAction",0,true];
			}
		else {hint "Not enough Resources in the Storage!";};
		//----------------------------------------------------------------------------------------------------------------------------------
		};
		case 1 : 
		{
		//----------------------------------Lazarett----------------------------------------------------------------------------------------
		_Imlager = ResVert select 0;
		if (_Imlager >= 600) then 
			{
			_Imlager = _Imlager - 600;
			ResVert set [0,_Imlager];
			publicVariable "ResVert";
			_Lazarett = createVehicle ["CDF_WarfareBFieldhHospital", _Ort, [], 0, "NONE"];
			[_Lazarett, ["<t color = '#4EB666'> Get a new recruit","Base\Versorgpunkt\rekrut.sqf"]] remoteExec ["addAction",0,true];
			[_Lazarett, ["<t color = '#4EB555'> Train as medic [100 Res]",
			{
				_Imlager = ResVert select 0;
				_dertyp = _this select 1;
				if ((_Imlager >= 100) && (!(_dertyp getUnitTrait "Medic"))) then {
					_dertyp setUnitTrait ["Medic",true];
					_Imlager = _Imlager - 100;
					ResVert set [0,_Imlager];
				} else {hint "Not enough Resources, or you already are Medic!"};
			}]] remoteExec ["addAction",0,true];
			[_Mast, _id] remoteExec ["removeAction",0,true];
			}
		else {hint "Not enough Resources in the Storage!";};
		//--------------------------------------------------------------------------------------------------------------------------------------
		};
		case 2 :
		//--------------------------------------Versorgung--------------------------------------------------------------------------------------
		{_Imlager = ResVert select 0;
		if (_Imlager >= 300) then 
			{
			_Imlager = _Imlager - 300;
			ResVert set [0,_Imlager];
			publicVariable "ResVert";	
			_Versorgpunkt = createVehicle ["Land_BC_Court_F", _Ort, [], 0, "NONE"];
			_Versorgpunkt setPos [getPos _obj select 0, getPos _obj select 1, -0.5];
			[_Versorgpunkt, ["<t color = '#4EB555'> Repair and refuel","Base\Versorgpunkt\reparieren.sqf"]] remoteExec ["addAction",0,true];
			[_Versorgpunkt, ["<t color = '#4EB555'> Rearm","Base\Versorgpunkt\aufmuni.sqf"]] remoteExec ["addAction",0,true];
			[_Versorgpunkt, ["<t color = '#4EB555'> Refill Ammotruck","Base\Versorgpunkt\Truckmuni.sqf"]] remoteExec ["addAction",0,true];
			[_Versorgpunkt, ["<t color = '#4EB555'> Refill Repairtruck","Base\Versorgpunkt\Truckrep.sqf"]] remoteExec ["addAction",0,true];
			[_Versorgpunkt, ["<t color = '#4EB555'> Refill Fueltruck","Base\Versorgpunkt\Trucktreibbasis.sqf"]] remoteExec ["addAction",0,true];
			[_Mast, _id] remoteExec ["removeAction",0,true];
			}
		//--------------------------------------------------------------------------------------------------------------------------------------
		};
		case 3 : 
		//-------------------------------------Werkstatt schon gebaut---------------------------------------------------------------------------
		{
			[_Ort,["<t color = '#4EB555'> Train as engineer [100 Res]",
			{
				_Imlager = ResVert select 0;
				_dertyp = _this select 1;
				if ((_Imlager >= 100) && (!(_dertyp getUnitTrait "Engineer"))) then {
					_dertyp setUnitTrait ["Engineer",true];
					_Imlager = _Imlager - 100;
					ResVert set [0,_Imlager];
				} else {hint "Not enough Resources, or you already are Engineer!"};
			}]] remoteExec ["addAction",0,true];
			[_Ort,["<t color = '#4EB555'> Scan for vehicles","Base\Versorgpunkt\vehupgrades.sqf"]] remoteExec ["addAction",0,true];
		};
	};