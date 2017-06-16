_Fahrzeugarray = ["C_SUV_01_F","C_Hatchback_01_sport_F","C_Hatchback_01_F","C_Offroad_01_F","C_Offroad_01_repair_F","C_Van_01_box_F","C_Van_01_fuel_F","C_Van_01_transport_F","C_Offroad_02_unarmed_F","C_Quadbike_01_F","C_Truck_02_covered_F","C_Truck_02_transport_F","C_Truck_02_box_F","C_Truck_02_fuel_F","C_Heli_Light_01_civil_F","C_Plane_Civil_01_F"];
_Orte = ["Chotain","Durras","EntreDeux","Gravette","Meaux","Figari","Lamentin","LeMoule","Laruns","Levie","Morton","Montignac","Provins","Regina","SaintPhillipe","SaintPierre","Vernon","Tyrone"]
while {true} do 
{
	if (Basealive) then 
		{
		_Ressourcen = ResVert select 0;
		_Muni = MuniVert select 0;
		
		Kaempfer = Kaempfer + ((GrosseSiedlungen * 1)+(KleineSiedlungen *0.3));
		publicVariable "Kaempfer";
		Fahrzeuge = Fahrzeuge + ((GrosseSiedlungen * 1)+(KleineSiedlungen *0.3));
		publicVariable "Fahrzeuge";
		if (Fahrzeuge > 15) then {
			_veh createVehicle [(selectRandom _Fahrzeugarray),(getPos (selectRandom _Orte)),[],30,"NONE"];
			Fahrzeuge = Fahrzeuge - 15;
			[_veh] execVM "Server\newvehicle.sqf";
		};		
		_Ressourcen = _Ressourcen + (GrosseSiedlungen * 60) + (KleineSiedlungen * 10);
		ResVert set [0,_Ressourcen];
		publicVariable "ResVert";
		_Muni = _Muni + Munitionsproduktion;
		MuniVert set [0,_Muni];
		publicVariable "MuniVert";
		};
		
	if ((ChotainBefreit) AND (DurrasBefreit) AND(EntreDeuxBefreit) AND(GravetteBefreit) AND(FlughafenBefreit) AND (FigariBefreit) AND (LamentinBefreit) AND(LeMouleBefreit) AND(LarunsBefreit) AND(LevieBefreit) AND (MBasisBefreit) AND (MBasis2Befreit) AND(MeauxBefreit) AND(MortonBefreit) AND (MontignacBefreit) AND (ProvinsBefreit) AND(ReginaBefreit) AND (SaintPhillipeBefreit) AND (SaintPierreBefreit) AND (VernonBefreit) AND (TyroneBefreit)) then {"end1" call BIS_fnc_endMission;};
	sleep 300;
};