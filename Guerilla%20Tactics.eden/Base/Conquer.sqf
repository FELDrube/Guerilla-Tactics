_Mast = _this select 0;
_idcon = _this select 2;

switch (vehicleVarName _Mast) do
	{
	case "Flagge_Chotain" : 
		{
		ChotainPruef = true;
		sleep 1;
		if (Chotain_FF == 0) then														// wenn Gravette Feindfrei ist.....
			{
			KleineSiedlungen = KleineSiedlungen + 1;
			ChotainBefreit = true;
			publicVariable "KleineSiedlungen";
			publicVariable "ChotainBefreit";
			"marker_Chotain" setMarkerColor "ColorGUER";
			["DACChotain"] remoteExec ["DAC_fDeleteZone",0,true];			//... entferne dessen DAC zone --> funktioniert net
			[_Mast,"\A3\Data_F\Flags\Flag_FIA_CO.paa"]remoteExec ["setFlagTexture",0,true];			//... Hisse die Flagge der Revolution
			["erobern",["Chotain was captured","PLAIN DOWN",2]] remoteExec ["cutText"];									//... und gib eine nachricht aus
			[_Mast, _idcon] remoteExec ["removeAction",0,true]; 
			[_Mast,["<t color='#FF9100'>Establish Base",{
			//--------------------------------------------------------------------------------------------------------------------------------------------------			
				_id = _this select 2;
				_Mast = _this select 3;
				if (!Basealive) then 
				{
				Basealive = true;
				publicVariable "Basealive";
				Base = "Chotain";
				publicVariable "Base";
				[west, _Mast] call BIS_fnc_addRespawnPosition;
				LagerBasemaxres = 3000;
				publicVariable "LagerBasemaxres";
				LagerBasemaxmuni = 700;
				publicVariable "LagerBasemaxmuni";
				[Lager_Chotain,["<t color = '#EDCF24'> Store RESOURCES","Base\Lager.sqf", [0,Hilfe_Chotain]]] remoteExec ["addAction",0,true];
				[Lager_Chotain,["<t color = '#EDCF24'> Get RESOURCES","Base\Lager.sqf", [1,Hilfe_Chotain]]] remoteExec ["addAction",0,true];
				[Lager_Chotain,["<t color = '#EDCF24'> Store AMMO","Base\Lager.sqf", [2,Hilfe_Chotain]]] remoteExec ["addAction",0,true];
				[Lager_Chotain,["<t color = '#EDCF24'> Get AMMO","Base\Lager.sqf", [3,Hilfe_Chotain]]] remoteExec ["addAction",0,true];
				[Lager_Chotain,["<t color = '#EDCF24'> Build a storage box","Base\Lager.sqf", [10,Hilfe_Chotain]]] remoteExec ["addAction",0,true];
				[Lager_Chotain,["<t color = '#77C3E0'> Upgrade storage to stage 2 [1500 Res]","Base\Lager.sqf", [4]]] remoteExec ["addAction",0,true];
				
				[_Mast,["<t color = '#FF9100'> Show Resources","Base\Resourcen.sqf"]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build Workshop [800 Res]","Base\upgrades.sqf",[0,Hilfe_Chotain_Werkstatt]]]remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build MASH [600 Res]","Base\upgrades.sqf",[1,Hilfe_Chotain_Lazarett]]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build Resupply-point [300 Res]","Base\upgrades.sqf",[2,Hilfe_Chotain_Versorgung]]] remoteExec ["addAction",0,true];
				
				[_Mast,_id] remoteExec ["removeAction",0,true];
				}
				else {hint "You already have a Base!";};
				},_Mast]] remoteExec ["addAction",0,true]; 
			//-----------------------------------------------------------------------------------------------------------------------------------------------------


			}
			else {hint format["There still %1 are enemies at Chotain",Chotain_FF]}					//wenn gravette nicht feindfrei ist gib die nachricht aus
		};
	case "Flagge_Durras" : 
		{
		DurrasPruef = true;
		sleep 1;
		if (Durras_FF == 0) then														// wenn Gravette Feindfrei ist.....
			{
			KleineSiedlungen = KleineSiedlungen + 1;
			DurrasBefreit = true;
			publicVariable "KleineSiedlungen";
			publicVariable "DurrasBefreit";
			"marker_Durras" setMarkerColor "ColorGUER";
			["DACDurras"] remoteExec ["DAC_fDeleteZone",0,true];			//... entferne dessen DAC zone
			[_Mast,"\A3\Data_F\Flags\Flag_FIA_CO.paa"]remoteExec ["setFlagTexture",0,true];		//... Hisse die Flagge der Revolution 
			["erobern",["Durras was captured","PLAIN DOWN",2]] remoteExec ["cutText"];								//... und gib eine nachricht aus
			[_Mast, _idcon] remoteExec ["removeAction",0,true]; 
			[_Mast,["<t color='#FF9100'>Establish Base",{
			//--------------------------------------------------------------------------------------------------------------------------------------------------			
				_id = _this select 2;
				_Mast = _this select 3;
				if (!Basealive) then 
				{
				Basealive = true;
				publicVariable "Basealive";
				Base = "Durras";
				publicVariable "Base";
				[west, _Mast] call BIS_fnc_addRespawnPosition;
				LagerBasemaxres = 3000;
				publicVariable "LagerBasemaxres";
				LagerBasemaxmuni = 700;
				publicVariable "LagerBasemaxmuni";
				[Lager_Durras,["<t color = '#EDCF24'> Store RESOURCES","Base\Lager.sqf", [0,Hilfe_Durras]]] remoteExec ["addAction",0,true];
				[Lager_Durras,["<t color = '#EDCF24'> Get RESOURCES","Base\Lager.sqf", [1,Hilfe_Durras]]] remoteExec ["addAction",0,true]; 
				[Lager_Durras,["<t color = '#EDCF24'> Store AMMO","Base\Lager.sqf", [2,Hilfe_Durras]]] remoteExec ["addAction",0,true];		//LAger hat nicht funktioniert
				[Lager_Durras,["<t color = '#EDCF24'> Get AMMO","Base\Lager.sqf", [3,Hilfe_Durras]]] remoteExec ["addAction",0,true];
				[Lager_Durras,["<t color = '#EDCF24'> Build a storage box","Base\Lager.sqf", [10,Hilfe_Durras]]] remoteExec ["addAction",0,true];
				[Lager_Durras,["<t color = '#77C3E0'> Upgrade storage to stage 2 [1500 Res]","Base\Lager.sqf", [4]]] remoteExec ["addAction",0,true];
				
				[_Mast,["<t color = '#FF9100'> Show Resources","Base\Resourcen.sqf"]]remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build Workshop [800 Res]","Base\upgrades.sqf",[0,Hilfe_Durras_Werkstatt]]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build MASH [600 Res]","Base\upgrades.sqf",[1,Hilfe_Durras_Lazarett]]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build Resupply-point [300 Res]","Base\upgrades.sqf",[2,Hilfe_Durras_Versorgung]]] remoteExec ["addAction",0,true];
				
				[_Mast,_id] remoteExec ["removeAction",0,true];
				}
				else {hint "You already have a Base!";};
				},_Mast]] remoteExec ["addAction",0,true]; // nochmal remote exec angucken
				//-----------------------------------------------------------------------------------------------------------------------------------------------------


			}
			else {hint format["There still %1 are enemies at Durras",Durras_FF]}					//wenn gravette nicht feindfrei ist gib die nachricht aus
		};
	case "Flagge_Entre_Deux" : 
		{
		EntreDeuxPruef = true;
		sleep 1;
		if (EntreDeux_FF == 0) then														// wenn Gravette Feindfrei ist.....
			{
			KleineSiedlungen = KleineSiedlungen + 1;
			EntreDeuxBefreit = true;
			publicVariable "KleineSiedlungen";
			publicVariable "EntreDeuxBefreit";
			"marker_EntreDeux" setMarkerColor "ColorGUER";
			["DACEntre_Deux"] remoteExec ["DAC_fDeleteZone",0,true];			//... entferne dessen DAC zone
			[_Mast,"\A3\Data_F\Flags\Flag_FIA_CO.paa"]remoteExec ["setFlagTexture",0,true];			//... Hisse die Flagge der Revolution
			["erobern",["Entre Deux was captured","PLAIN DOWN",2]] remoteExec ["cutText"];										//... und gib eine nachricht aus
			[_Mast, _idcon] remoteExec ["removeAction",0,true]; 
			[_Mast,["<t color='#FF9100'>Establish Base",{
			//--------------------------------------------------------------------------------------------------------------------------------------------------			
				_id = _this select 2;
				_Mast = _this select 3;
				if (!Basealive) then 
				{
				Basealive = true;
				publicVariable "Basealive";
				Base = "EntreDeux";
				publicVariable "Base";
				[west, _Mast] call BIS_fnc_addRespawnPosition;
				LagerBasemaxres = 3000;
				publicVariable "LagerBasemaxres";
				LagerBasemaxmuni = 700;
				publicVariable "LagerBasemaxmuni";
				[Lager_EntreDeux,["<t color = '#EDCF24'> Store RESOURCES","Base\Lager.sqf", [0,Hilfe_EntreDeux]]] remoteExec ["addAction",0,true];
				[Lager_EntreDeux,["<t color = '#EDCF24'> Get RESOURCES","Base\Lager.sqf", [1,Hilfe_EntreDeux]]] remoteExec ["addAction",0,true];
				[Lager_EntreDeux,["<t color = '#EDCF24'> Store AMMO","Base\Lager.sqf", [2,Hilfe_EntreDeux]]] remoteExec ["addAction",0,true];
				[Lager_EntreDeux,["<t color = '#EDCF24'> Get AMMO","Base\Lager.sqf", [3,Hilfe_EntreDeux]]] remoteExec ["addAction",0,true];
				[Lager_EntreDeux,["<t color = '#EDCF24'> Build a storage box","Base\Lager.sqf", [10,Hilfe_EntreDeux]]] remoteExec ["addAction",0,true];
				[Lager_EntreDeux,["<t color = '#77C3E0'> Upgrade storage to stage 2 [1500 Res]","Base\Lager.sqf", [4]]] remoteExec ["addAction",0,true];
				
				[_Mast,["<t color = '#FF9100'> Show Resources","Base\Resourcen.sqf"]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build Workshop [800 Res]","Base\upgrades.sqf",[0,Hilfe_EntreDeux_Werkstatt]]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build MASH [600 Res]","Base\upgrades.sqf",[1,Hilfe_EntreDeux_Lazarett]]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build Resupply-point [300 Res]","Base\upgrades.sqf",[2,Hilfe_EntreDeux_Versorgung]]] remoteExec ["addAction",0,true];
				
				[_Mast,_id] remoteExec ["removeAction",0,true];
				}
				else {hint "You already have a Base!";};
				},_Mast]] remoteExec ["addAction",0,true]; 
			//-----------------------------------------------------------------------------------------------------------------------------------------------------


			}
			else {hint format["There still %1 are enemies at Entre Deux",EntreDeux_FF]}					//wenn gravette nicht feindfrei ist gib die nachricht aus
		};
	case "Flagge_Gravette" : 
		{
		GravettePruef = true;
		sleep 1;
		if (Gravette_FF == 0) then														// wenn Gravette Feindfrei ist.....
			{
			KleineSiedlungen = KleineSiedlungen + 1;
			GravetteBefreit = true;
			publicVariable "GravetteBefreit";
			publicVariable "KleineSiedlungen";
			"marker_Gravette" setMarkerColor "ColorGUER";
			["DACGravette"] remoteExec ["DAC_fDeleteZone",0,true];			//... entferne dessen DAC zone
			[_Mast,"\A3\Data_F\Flags\Flag_FIA_CO.paa"]remoteExec ["setFlagTexture",0,true];			//... Hisse die Flagge der Revolution
			["erobern",["Gravette was captured","PLAIN DOWN",2]] remoteExec ["cutText"];												//... und gib eine nachricht aus
			[_Mast, _idcon] remoteExec ["removeAction",0,true]; 
			[_Mast,["<t color='#FF9100'>Establish Base",{
			//--------------------------------------------------------------------------------------------------------------------------------------------------			
				_id = _this select 2;
				_Mast = _this select 3;
				if (!Basealive) then 
				{
				Basealive = true;
				publicVariable "Basealive";
				Base = "Gravette";
				publicVariable "Base";
				[west, _Mast] call BIS_fnc_addRespawnPosition;
				LagerBasemaxres = 3000;
				publicVariable "LagerBasemaxres";
				LagerBasemaxmuni = 700;
				publicVariable "LagerBasemaxmuni";
				[Lager_Gravette,["<t color = '#EDCF24'> Store RESOURCES","Base\Lager.sqf", [0,Hilfe_Gravette]]] remoteExec ["addAction",0,true];
				[Lager_Gravette,["<t color = '#EDCF24'> Get RESOURCES","Base\Lager.sqf", [1,Hilfe_Gravette]]] remoteExec ["addAction",0,true];
				[Lager_Gravette,["<t color = '#EDCF24'> Store AMMO","Base\Lager.sqf", [2,Hilfe_Gravette]]] remoteExec ["addAction",0,true];
				[Lager_Gravette,["<t color = '#EDCF24'> Get AMMO","Base\Lager.sqf", [3,Hilfe_Gravette]]] remoteExec ["addAction",0,true];
				[Lager_Gravette,["<t color = '#EDCF24'> Build a storage box","Base\Lager.sqf", [10,Hilfe_Gravette]]] remoteExec ["addAction",0,true];
				[Lager_Gravette,["<t color = '#77C3E0'> Upgrade storage to stage 2 [1500 Res]","Base\Lager.sqf", [4]]] remoteExec ["addAction",0,true];
				
				[_Mast,["<t color = '#FF9100'> Show Resources","Base\Resourcen.sqf"]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build Workshop [800 Res]","Base\upgrades.sqf",[0,Hilfe_Gravette_Werkstatt]]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build MASH [600 Res]","Base\upgrades.sqf",[1,Hilfe_Gravette_Lazarett]]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build Resupply-point [300 Res]","Base\upgrades.sqf",[2,Hilfe_Gravette_Versorgung]]] remoteExec ["addAction",0,true];
				
				[_Mast,_id] remoteExec ["removeAction",0,true];
				}
				else {hint "You already have a Base!";};
				},_Mast]] remoteExec ["addAction",0,true]; 
			//-----------------------------------------------------------------------------------------------------------------------------------------------------


			}
			else {hint format["There still %1 are enemies at Gravette",Gravette_FF]}					//wenn gravette nicht feindfrei ist gib die nachricht aus
		};
	case "Flagge_Flughafen" : 
		{
		FlughafenPruef = true;
		sleep 1;
		if (Flughafen_FF == 0) then														// wenn Gravette Feindfrei ist.....
			{
			FlughafenBefreit = true;
			publicVariable "FlughafenBefreit";
			"marker_Flughafen" setMarkerColor "ColorGUER";
			["DACFlughafen"] remoteExec ["DAC_fDeleteZone",0,true];			//... entferne dessen DAC zone
			[_Mast,"\A3\Data_F\Flags\Flag_FIA_CO.paa"]remoteExec ["setFlagTexture",0,true];			//... Hisse die Flagge der Revolution
			["erobern",["The Airport was captured","PLAIN DOWN",2]] remoteExec ["cutText"];										//... und gib eine nachricht aus
			[_Mast, _idcon] remoteExec ["removeAction",0,true]; 
			}
			else {hint format["There still %1 are enemies at the Airport",Flughafen_FF]}					//wenn gravette nicht feindfrei ist gib die nachricht aus
		};
	case "Flagge_Figari" : 
		{
		FigariPruef = true;
		sleep 1;
		if (Figari_FF == 0) then														// wenn Gravette Feindfrei ist.....
			{
			KleineSiedlungen = KleineSiedlungen + 1;
			FigariBefreit = true;
			publicVariable "KleineSiedlungen";
			publicVariable "FigariBefreit";
			"marker_Figari" setMarkerColor "ColorGUER";
			["DACFigari"] remoteExec ["DAC_fDeleteZone",0,true];			//... entferne dessen DAC zone
			[_Mast,"\A3\Data_F\Flags\Flag_FIA_CO.paa"]remoteExec ["setFlagTexture",0,true];			//... Hisse die Flagge der Revolution
			["erobern",["Figari was captured","PLAIN DOWN",2]] remoteExec ["cutText"];											//... und gib eine nachricht aus
			[_Mast, _idcon] remoteExec ["removeAction",0,true]; 
			[_Mast,["<t color='#FF9100'>Establish Base",{
			//--------------------------------------------------------------------------------------------------------------------------------------------------			
				_id = _this select 2;
				_Mast = _this select 3;
				if (!Basealive) then 
				{
				Basealive = true;
				publicVariable "Basealive";
				Base = "Figari";
				publicVariable "Base";
				[west, _Mast] call BIS_fnc_addRespawnPosition;
				LagerBasemaxres = 3000;
				publicVariable "LagerBasemaxres";
				LagerBasemaxmuni = 700;
				publicVariable "LagerBasemaxmuni";
				[Lager_Figari,["<t color = '#EDCF24'> Store RESOURCES","Base\Lager.sqf", [0,Hilfe_Figari]]] remoteExec ["addAction",0,true];
				[Lager_Figari,["<t color = '#EDCF24'> Get RESOURCES","Base\Lager.sqf", [1,Hilfe_Figari]]] remoteExec ["addAction",0,true];
				[Lager_Figari,["<t color = '#EDCF24'> Store AMMO","Base\Lager.sqf", [2,Hilfe_Figari]]] remoteExec ["addAction",0,true];
				[Lager_Figari,["<t color = '#EDCF24'> Get AMMO","Base\Lager.sqf", [3,Hilfe_Figari]]] remoteExec ["addAction",0,true];
				[Lager_Figari,["<t color = '#EDCF24'> Build a storage box","Base\Lager.sqf", [10,Hilfe_Figari]]] remoteExec ["addAction",0,true];
				[Lager_Figari,["<t color = '#77C3E0'> Upgrade storage to stage 2 [1500 Res]","Base\Lager.sqf", [4]]] remoteExec ["addAction",0,true];
				
				[_Mast,["<t color = '#FF9100'> Show Resources","Base\Resourcen.sqf"]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build Workshop [800 Res]","Base\upgrades.sqf",[0,Hilfe_Figari_Werkstatt]]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build MASH [600 Res]","Base\upgrades.sqf",[1,Hilfe_Figari_Lazarett]]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build Resupply-point [300 Res]","Base\upgrades.sqf",[2,Hilfe_Figari_Versorgung]]] remoteExec ["addAction",0,true];
				
				[_Mast,_id] remoteExec ["removeAction",0,true];
				}
				else {hint "You already have a Base!";};
				},_Mast]] remoteExec ["addAction",0,true]; 
			//-----------------------------------------------------------------------------------------------------------------------------------------------------
			}
			else {hint format["There still %1 are enemies at Figari",Figari_FF]}					//wenn gravette nicht feindfrei ist gib die nachricht aus
		};
	case "Flagge_Lamentin" : 
		{
		LamentinPruef = true;
		sleep 1;
		if (Lamentin_FF == 0) then														// wenn Gravette Feindfrei ist.....
			{
			_idcon = _this select 2;
			GrosseSiedlungen = GrosseSiedlungen + 1;
			LamentinBefreit = true;
			publicVariable "GrosseSiedlungen";
			publicVariable "LamentinBefreit";
			"marker_Lamentin" setMarkerColor "ColorGUER";
			["DACLamentin"] remoteExec ["DAC_fDeleteZone",0,true];			//... entferne dessen DAC zone
			[_Mast,"\A3\Data_F\Flags\Flag_FIA_CO.paa"]remoteExec ["setFlagTexture",0,true];			//... Hisse die Flagge der Revolution
			["erobern",["Lamentin was captured","PLAIN DOWN",2]] remoteExec ["cutText"];											//... und gib eine nachricht aus
			[_Mast, _idcon] remoteExec ["removeAction",0,true]; 
			[_Mast,["<t color='#FF9100'>Establish Base",{
			//--------------------------------------------------------------------------------------------------------------------------------------------------			
				_id = _this select 2;
				_Mast = _this select 3;
				if (!Basealive) then 
				{
				Basealive = true;
				publicVariable "Basealive";
				Base = "Lamentin";
				publicVariable "Base";
				[west, _Mast] call BIS_fnc_addRespawnPosition;
				LagerBasemaxres = 3000;
				publicVariable "LagerBasemaxres";
				LagerBasemaxmuni = 700;
				publicVariable "LagerBasemaxmuni";
				[Lager_Lamentin,["<t color = '#EDCF24'> Store RESOURCES","Base\Lager.sqf", [0,Hilfe_Lamentin]]] remoteExec ["addAction",0,true];
				[Lager_Lamentin,["<t color = '#EDCF24'> Get RESOURCES","Base\Lager.sqf", [1,Hilfe_Lamentin]]] remoteExec ["addAction",0,true];
				[Lager_Lamentin,["<t color = '#EDCF24'> Store AMMO","Base\Lager.sqf", [2,Hilfe_Lamentin]]] remoteExec ["addAction",0,true];
				[Lager_Lamentin,["<t color = '#EDCF24'> Get AMMO","Base\Lager.sqf", [3,Hilfe_Lamentin]]] remoteExec ["addAction",0,true];
				[Lager_Lamentin,["<t color = '#EDCF24'> Build a storage box","Base\Lager.sqf", [10,Hilfe_Lamentin]]] remoteExec ["addAction",0,true];
				[Lager_Lamentin,["<t color = '#77C3E0'> Upgrade storage to stage 2 [1500 Res]","Base\Lager.sqf", [4]]] remoteExec ["addAction",0,true];
				
				[_Mast,["<t color = '#FF9100'> Show Resources","Base\Resourcen.sqf"]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Open Workshop","Base\upgrades.sqf",[3,Werkstatt_Lamentin]]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build MASH [600 Res]","Base\upgrades.sqf",[1,Hilfe_Lamentin_Lazarett]]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build Resupply-point [300 Res]","Base\upgrades.sqf",[2,Hilfe_Lamentin_Versorgung]]] remoteExec ["addAction",0,true];
				
				[_Mast,_id] remoteExec ["removeAction",0,true];
				}
				else {hint "You already have a Base!";};
				},_Mast]] remoteExec ["addAction",0,true]; 
				//-----------------------------------------------------------------------------------------------------------------------------------------------------
			}
			else {hint format["There still %1 are enemies at Lamentin",Lamentin_FF]}					//wenn gravette nicht feindfrei ist gib die nachricht aus
		};
	case "Flagge_Le_Moule" : 
		{
		LeMoulePruef = true;
		sleep 1;
		if (LeMoule_FF == 0) then														// wenn Gravette Feindfrei ist.....
			{
			KleineSiedlungen = KleineSiedlungen + 1;
			LeMouleBefreit = true;
			publicVariable "KleineSiedlungen";
			publicVariable "LeMouleBefreit";
			"marker_LeMoule" setMarkerColor "ColorGUER";
			["DACLe_Moule"] remoteExec ["DAC_fDeleteZone",0,true];			//... entferne dessen DAC zone
			[_Mast,"\A3\Data_F\Flags\Flag_FIA_CO.paa"]remoteExec ["setFlagTexture",0,true];			//... Hisse die Flagge der Revolution
			["erobern",["Le Moule was captured","PLAIN DOWN",2]] remoteExec ["cutText"];										//... und gib eine nachricht aus
			[_Mast, _idcon] remoteExec ["removeAction",0,true]; 
			[_Mast,["<t color='#FF9100'>Establish Base",{
			//--------------------------------------------------------------------------------------------------------------------------------------------------			
				_id = _this select 2;
				_Mast = _this select 3;
				if (!Basealive) then 
				{
				Basealive = true;
				publicVariable "Basealive";
				Base = "LeMoule";
				publicVariable "Base";
				[west, _Mast] call BIS_fnc_addRespawnPosition;
				LagerBasemaxres = 3000;
				publicVariable "LagerBasemaxres";
				LagerBasemaxmuni = 700;
				publicVariable "LagerBasemaxmuni";
				[Lager_LeMoule,["<t color = '#EDCF24'> Store RESOURCES","Base\Lager.sqf", [0,Hilfe_LeMoule]]] remoteExec ["addAction",0,true];
				[Lager_LeMoule,["<t color = '#EDCF24'> Get RESOURCES","Base\Lager.sqf", [1,Hilfe_LeMoule]]] remoteExec ["addAction",0,true];
				[Lager_LeMoule,["<t color = '#EDCF24'> Store AMMO","Base\Lager.sqf", [2,Hilfe_LeMoule]]] remoteExec ["addAction",0,true];
				[Lager_LeMoule,["<t color = '#EDCF24'> Get AMMO","Base\Lager.sqf", [3,Hilfe_LeMoule]]] remoteExec ["addAction",0,true];
				[Lager_LeMoule,["<t color = '#EDCF24'> Build a storage box","Base\Lager.sqf", [10,Hilfe_LeMoule]]] remoteExec ["addAction",0,true];
				[Lager_LeMoule,["<t color = '#77C3E0'> Upgrade storage to stage 2 [1500 Res]","Base\Lager.sqf", [4]]] remoteExec ["addAction",0,true];
				
				[_Mast,["<t color = '#FF9100'> Show Resources","Base\Resourcen.sqf"]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build Workshop [800 Res]","Base\upgrades.sqf",[0,Hilfe_LeMoule_Werkstatt]]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build MASH [600 Res]","Base\upgrades.sqf",[1,Hilfe_LeMoule_Lazarett]]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build Resupply-point [300 Res]","Base\upgrades.sqf",[2,Hilfe_LeMoule_Versorgung]]] remoteExec ["addAction",0,true];
				
				[_Mast,_id] remoteExec ["removeAction",0,true];
				}
				else {hint "You already have a Base!";};
				},_Mast]] remoteExec ["addAction",0,true]; 
			//-----------------------------------------------------------------------------------------------------------------------------------------------------


			}
			else {hint format["There still %1 are enemies at Le Moule",LeMoule_FF]}					//wenn gravette nicht feindfrei ist gib die nachricht aus
		};
	case "Flagge_Laruns" : 
		{
		LarunsPruef = true;
		sleep 1;
		if (Laruns_FF == 0) then														// wenn Gravette Feindfrei ist.....
			{
			KleineSiedlungen = KleineSiedlungen + 1;
			LarunsBefreit = true;
			publicVariable "KleineSiedlungen";
			publicVariable "LarunsBefreit";
			"marker_Laruns" setMarkerColor "ColorGUER";
			["DACLaruns"] remoteExec ["DAC_fDeleteZone",0,true];			//... entferne dessen DAC zone
			[_Mast,"\A3\Data_F\Flags\Flag_FIA_CO.paa"]remoteExec ["setFlagTexture",0,true];			//... Hisse die Flagge der Revolution
			["erobern",["Laruns was captured","PLAIN DOWN",2]] remoteExec ["cutText"];										//... und gib eine nachricht aus
			[_Mast, _idcon] remoteExec ["removeAction",0,true]; 
			[_Mast,["<t color='#FF9100'>Establish Base",{
			//--------------------------------------------------------------------------------------------------------------------------------------------------			
				_id = _this select 2;
				_Mast = _this select 3;
				if (!Basealive) then 
				{
				Basealive = true;
				publicVariable "Basealive";
				Base = "Laruns";
				publicVariable "Base";
				[west, _Mast] call BIS_fnc_addRespawnPosition;
				LagerBasemaxres = 3000;
				publicVariable "LagerBasemaxres";
				LagerBasemaxmuni = 700;
				publicVariable "LagerBasemaxmuni";
				[Lager_Laruns,["<t color = '#EDCF24'> Store RESOURCES","Base\Lager.sqf", [0,Hilfe_Laruns]]] remoteExec ["addAction",0,true];
				[Lager_Laruns,["<t color = '#EDCF24'> Get RESOURCES","Base\Lager.sqf", [1,Hilfe_Laruns]]] remoteExec ["addAction",0,true];
				[Lager_Laruns,["<t color = '#EDCF24'> Store AMMO","Base\Lager.sqf", [2,Hilfe_Laruns]]] remoteExec ["addAction",0,true];
				[Lager_Laruns,["<t color = '#EDCF24'> Get AMMO","Base\Lager.sqf", [3,Hilfe_Laruns]]] remoteExec ["addAction",0,true];
				[Lager_Laruns,["<t color = '#EDCF24'> Build a storage box","Base\Lager.sqf", [10,Hilfe_Laruns]]] remoteExec ["addAction",0,true];
				[Lager_Laruns,["<t color = '#77C3E0'> Upgrade storage to stage 2 [1500 Res]","Base\Lager.sqf", [4]]] remoteExec ["addAction",0,true];
				
				[_Mast,["<t color = '#FF9100'> Show Resources","Base\Resourcen.sqf"]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build Workshop [800 Res]","Base\upgrades.sqf",[0,Hilfe_Laruns_Werkstatt]]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build MASH [600 Res]","Base\upgrades.sqf",[1,Hilfe_Laruns_Lazarett]]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build Resupply-point [300 Res]","Base\upgrades.sqf",[2,Hilfe_Laruns_Versorgung]]] remoteExec ["addAction",0,true];
				
				[_Mast,_id] remoteExec ["removeAction",0,true];
				}
				else {hint "You already have a Base!";};
				},_Mast]] remoteExec ["addAction",0,true]; 
			//-----------------------------------------------------------------------------------------------------------------------------------------------------
			}
			else {hint format["There still %1 are enemies at Laruns",Laruns_FF]}					//wenn gravette nicht feindfrei ist gib die nachricht aus
		};
	case "Flagge_Levie" : 
		{
		LeviePruef = true;
		sleep 1;
		if (Levie_FF == 0) then														// wenn Gravette Feindfrei ist.....
			{
			KleineSiedlungen = KleineSiedlungen + 1;
			LevieBefreit = true;
			publicVariable "KleineSiedlungen";
			publicVariable "LevieBefreit";
			"marker_Levie" setMarkerColor "ColorGUER";
			["DACLevie"] remoteExec ["DAC_fDeleteZone",0,true];			//... entferne dessen DAC zone
			[_Mast,"\A3\Data_F\Flags\Flag_FIA_CO.paa"]remoteExec ["setFlagTexture",0,true];			//... Hisse die Flagge der Revolution
			["erobern",["Levie was captured","PLAIN DOWN",2]] remoteExec ["cutText"];											//... und gib eine nachricht aus
			[_Mast, _idcon] remoteExec ["removeAction",0,true]; 
			[_Mast,["<t color='#FF9100'>Establish Base",{
			//--------------------------------------------------------------------------------------------------------------------------------------------------			
				_id = _this select 2;
				_Mast = _this select 3;
				if (!Basealive) then 
				{
				Basealive = true;
				publicVariable "Basealive";
				Base = "Levie";
				publicVariable "Base";
				[west, _Mast] call BIS_fnc_addRespawnPosition;
				LagerBasemaxres = 3000;
				publicVariable "LagerBasemaxres";
				LagerBasemaxmuni = 700;
				publicVariable "LagerBasemaxmuni";
				[Lager_Levie,["<t color = '#EDCF24'> Store RESOURCES","Base\Lager.sqf", [0,Hilfe_Levie]]] remoteExec ["addAction",0,true];
				[Lager_Levie,["<t color = '#EDCF24'> Get RESOURCES","Base\Lager.sqf", [1,Hilfe_Levie]]] remoteExec ["addAction",0,true];
				[Lager_Levie,["<t color = '#EDCF24'> Store AMMO","Base\Lager.sqf", [2,Hilfe_Levie]]] remoteExec ["addAction",0,true];
				[Lager_Levie,["<t color = '#EDCF24'> Get AMMO","Base\Lager.sqf", [3,Hilfe_Levie]]] remoteExec ["addAction",0,true];
				[Lager_Levie,["<t color = '#EDCF24'> Build a storage box","Base\Lager.sqf", [10,Hilfe_Levie]]] remoteExec ["addAction",0,true];
				[Lager_Levie,["<t color = '#77C3E0'> Upgrade storage to stage 2 [1500 Res]","Base\Lager.sqf", [4]]] remoteExec ["addAction",0,true];
				
				[_Mast,["<t color = '#FF9100'> Show Resources","Base\Resourcen.sqf"]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build Workshop [800 Res]","Base\upgrades.sqf",[0,Hilfe_Levie_Werkstatt]]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build MASH [600 Res]","Base\upgrades.sqf",[1,Hilfe_Levie_Lazarett]]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build Resupply-point [300 Res]","Base\upgrades.sqf",[2,Hilfe_Levie_Versorgung]]] remoteExec ["addAction",0,true];
				
				[_Mast,_id] remoteExec ["removeAction",0,true];
				}
				else {hint "You already have a Base!";};
				},_Mast]] remoteExec ["addAction",0,true]; 
			//-----------------------------------------------------------------------------------------------------------------------------------------------------
			}
			else {hint format["There still %1 are enemies at Levie",Levie_FF]}					//wenn gravette nicht feindfrei ist gib die nachricht aus
		};
	case "Flagge_MBasis" : 
		{
		MBasisPruef = true;
		sleep 1;
		if (MBasis_FF == 0) then														// wenn Gravette Feindfrei ist.....
			{
			MBasisBefreit = true;
			publicVariable "MBasisBefreit";
			"marker_MBasis" setMarkerColor "ColorGUER";
			["DACMBasis"] remoteExec ["DAC_fDeleteZone",0,true];			//... entferne dessen DAC zone
			[_Mast,"\A3\Data_F\Flags\Flag_FIA_CO.paa"]remoteExec ["setFlagTexture",0,true];			//... Hisse die Flagge der Revolution
			["erobern",["A Military Base (south) was captured","PLAIN DOWN",2]] remoteExec ["cutText"];									//... und gib eine nachricht aus
			[_Mast, _idcon] remoteExec ["removeAction",0,true]; 
			}
			else {hint format["There still %1 are enemies at the southern Military base",MBasis_FF]}					//wenn gravette nicht feindfrei ist gib die nachricht aus
		};
	case "Flagge_MBasis2" : 
		{
		MBasis2Pruef = true;
		sleep 1;
		if (MBasis2_FF == 0) then														// wenn Gravette Feindfrei ist.....
			{
			MBasis2Befreit = true;
			publicVariable "MBasis2Befreit";
			"marker_MBasis2" setMarkerColor "ColorGUER";
			["DACMBasis2"] remoteExec ["DAC_fDeleteZone",0,true];			//... entferne dessen DAC zone
			[_Mast,"\A3\Data_F\Flags\Flag_FIA_CO.paa"]remoteExec ["setFlagTexture",0,true];			//... Hisse die Flagge der Revolution
			Munitionsproduktion = 50;
			publicVariable "Munitionsproduktion";
			["erobern",["A Military Base (east) was captured","PLAIN DOWN",2]] remoteExec ["cutText"];											//... und gib eine nachricht aus
			[_Mast, _idcon] remoteExec ["removeAction",0,true]; 
			}
			else {hint format["There still %1 are enemies at the eastern Military base",MBasis2_FF]}					//wenn gravette nicht feindfrei ist gib die nachricht aus
		};
	case "Flagge_Meaux" : 
		{
		MeauxPruef = true;
		sleep 1;
		if (Meaux_FF == 0) then														// wenn Gravette Feindfrei ist.....
			{
			GrosseSiedlungen = GrosseSiedlungen + 1;
			MeauxBefreit = true;
			publicVariable "GrosseSiedlungen";
			publicVariable "MeauxBefreit";
			"marker_Meaux" setMarkerColor "ColorGUER";
			["DACMeaux"] remoteExec ["DAC_fDeleteZone",0,true];			//... entferne dessen DAC zone
			[_Mast,"\A3\Data_F\Flags\Flag_FIA_CO.paa"]remoteExec ["setFlagTexture",0,true];			//... Hisse die Flagge der Revolution
			["erobern",["Meaux was captured","PLAIN DOWN",2]] remoteExec ["cutText"];											//... und gib eine nachricht aus
			[_Mast, _idcon] remoteExec ["removeAction",0,true]; 
			[_Mast,["<t color='#FF9100'>Establish Base",{
			//--------------------------------------------------------------------------------------------------------------------------------------------------			
				_id = _this select 2;
				_Mast = _this select 3;
				if (!Basealive) then 
				{
				Basealive = true;
				publicVariable "Basealive";
				Base = "Meaux";
				publicVariable "Base";
				[west, _Mast] call BIS_fnc_addRespawnPosition;
				LagerBasemaxres = 3000;
				publicVariable "LagerBasemaxres";
				LagerBasemaxmuni = 700;
				publicVariable "LagerBasemaxmuni";
				[Lager_Meaux,["<t color = '#EDCF24'> Store RESOURCES","Base\Lager.sqf", [0,Hilfe_Meaux]]] remoteExec ["addAction",0,true];
				[Lager_Meaux,["<t color = '#EDCF24'> Get RESOURCES","Base\Lager.sqf", [1,Hilfe_Meaux]]] remoteExec ["addAction",0,true];
				[Lager_Meaux,["<t color = '#EDCF24'> Store AMMO","Base\Lager.sqf", [2,Hilfe_Meaux]]] remoteExec ["addAction",0,true];
				[Lager_Meaux,["<t color = '#EDCF24'> Get AMMO","Base\Lager.sqf", [3,Hilfe_Meaux]]] remoteExec ["addAction",0,true];
				[Lager_Meaux,["<t color = '#EDCF24'> Build a storage box","Base\Lager.sqf", [10,Hilfe_Meaux]]] remoteExec ["addAction",0,true];
				[Lager_Meaux,["<t color = '#77C3E0'> Upgrade storage to stage 2 [1500 Res]","Base\Lager.sqf", [4]]] remoteExec ["addAction",0,true];
				
				[_Mast,["<t color = '#FF9100'> Show Resources","Base\Resourcen.sqf"]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build Workshop [800 Res]","Base\upgrades.sqf",[0,Hilfe_Meaux_Werkstatt]]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build MASH [600 Res]","Base\upgrades.sqf",[1,Hilfe_Meaux_Lazarett]]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build Resupply-point [300 Res]","Base\upgrades.sqf",[2,Hilfe_Meaux_Versorgung]]] remoteExec ["addAction",0,true];
				
				[_Mast,_id] remoteExec ["removeAction",0,true];
				}
				else {hint "You already have a Base!";};
				},_Mast]] remoteExec ["addAction",0,true]; 
			//-----------------------------------------------------------------------------------------------------------------------------------------------------
			}
			else {hint format["There still %1 are enemies at Meaux",Meaux_FF]}					//wenn gravette nicht feindfrei ist gib die nachricht aus
		};
	case "Flagge_Morton" : 
		{
		MortonPruef = true;
		sleep 1;
		if (Morton_FF == 0) then														// wenn Gravette Feindfrei ist.....
			{
			GrosseSiedlungen = GrosseSiedlungen + 1;
			MortonBefreit = true;
			publicVariable "GrosseSiedlungen";
			publicVariable "MortonBefreit";
			"marker_Morton" setMarkerColor "ColorGUER";
			["DACMorton"] remoteExec ["DAC_fDeleteZone",0,true];			//... entferne dessen DAC zone
			[_Mast,"\A3\Data_F\Flags\Flag_FIA_CO.paa"]remoteExec ["setFlagTexture",0,true];			//... Hisse die Flagge der Revolution
			["erobern",["Morton was captured","PLAIN DOWN",2]] remoteExec ["cutText"];											//... und gib eine nachricht aus
			[_Mast, _idcon] remoteExec ["removeAction",0,true]; 
			[_Mast,["<t color='#FF9100'>Establish Base",{
			//--------------------------------------------------------------------------------------------------------------------------------------------------			
				_id = _this select 2;
				_Mast = _this select 3;
				if (!Basealive) then 
				{
				Basealive = true;
				publicVariable "Basealive";
				Base = "Morton";
				publicVariable "Base";
				[west, _Mast] call BIS_fnc_addRespawnPosition;
				LagerBasemaxres = 3000;
				publicVariable "LagerBasemaxres";
				LagerBasemaxmuni = 700;
				publicVariable "LagerBasemaxmuni";
				[Lager_Morton,["<t color = '#EDCF24'> Store RESOURCES","Base\Lager.sqf", [0,Hilfe_Morton]]] remoteExec ["addAction",0,true];
				[Lager_Morton,["<t color = '#EDCF24'> Get RESOURCES","Base\Lager.sqf", [1,Hilfe_Morton]]] remoteExec ["addAction",0,true];
				[Lager_Morton,["<t color = '#EDCF24'> Store AMMO","Base\Lager.sqf", [2,Hilfe_Morton]]] remoteExec ["addAction",0,true];
				[Lager_Morton,["<t color = '#EDCF24'> Get AMMO","Base\Lager.sqf", [3,Hilfe_Morton]]] remoteExec ["addAction",0,true];
				[Lager_Morton,["<t color = '#EDCF24'> Build a storage box","Base\Lager.sqf", [10,Hilfe_Morton]]] remoteExec ["addAction",0,true];
				[Lager_Morton,["<t color = '#77C3E0'> Upgrade storage to stage 2 [1500 Res]","Base\Lager.sqf", [4]]] remoteExec ["addAction",0,true];
				
				[_Mast,["<t color = '#FF9100'> Show Resources","Base\Resourcen.sqf"]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Open Workshop","Base\upgrades.sqf",[3,Werkstatt_Morton]]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build MASH [600 Res]","Base\upgrades.sqf",[1,Hilfe_Morton_Lazarett]]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build Resupply-point [300 Res]","Base\upgrades.sqf",[2,Hilfe_Morton_Versorgung]]] remoteExec ["addAction",0,true];
				
				[_Mast,_id] remoteExec ["removeAction",0,true];
				}
				else {hint "You already have a Base!";};
				},_Mast]] remoteExec ["addAction",0,true]; 
			//-----------------------------------------------------------------------------------------------------------------------------------------------------
			}
			else {hint format["There still %1 are enemies at Morton",Morton_FF]}					//wenn gravette nicht feindfrei ist gib die nachricht aus
		};
	case "Flagge_Montignac" : 
		{
		MontignacPruef = true;
		sleep 1;
		if (Montignac_FF == 0) then														// wenn Gravette Feindfrei ist.....
			{
			GrosseSiedlungen = GrosseSiedlungen + 1;
			MontignacBefreit = true;
			publicVariable "GrosseSiedlungen";
			publicVariable "MontignacBefreit";
			"marker_Montignac" setMarkerColor "ColorGUER";
			["DACMontignac"] remoteExec ["DAC_fDeleteZone",0,true];			//... entferne dessen DAC zone
			[_Mast,"\A3\Data_F\Flags\Flag_FIA_CO.paa"]remoteExec ["setFlagTexture",0,true];			//... Hisse die Flagge der Revolution
			["erobern",["Montignac was captured","PLAIN DOWN",2]] remoteExec ["cutText"];											//... und gib eine nachricht aus
			[_Mast, _idcon] remoteExec ["removeAction",0,true]; 
			[_Mast,["<t color='#FF9100'>Establish Base",{
			//--------------------------------------------------------------------------------------------------------------------------------------------------			
				_id = _this select 2;
				_Mast = _this select 3;
				if (!Basealive) then 
				{
				Basealive = true;
				publicVariable "Basealive";
				Base = "Montignac";
				publicVariable "Base";
				[west, _Mast] call BIS_fnc_addRespawnPosition;
				LagerBasemaxres = 3000;
				publicVariable "LagerBasemaxres";
				LagerBasemaxmuni = 700;
				publicVariable "LagerBasemaxmuni";
				[Lager_Montignac,["<t color = '#EDCF24'> Store RESOURCES","Base\Lager.sqf", [0,Hilfe_Montignac]]] remoteExec ["addAction",0,true];
				[Lager_Montignac,["<t color = '#EDCF24'> Get RESOURCES","Base\Lager.sqf", [1,Hilfe_Montignac]]] remoteExec ["addAction",0,true];
				[Lager_Montignac,["<t color = '#EDCF24'> Store AMMO","Base\Lager.sqf", [2,Hilfe_Montignac]]] remoteExec ["addAction",0,true];
				[Lager_Montignac,["<t color = '#EDCF24'> Get AMMO","Base\Lager.sqf", [3,Hilfe_Montignac]]] remoteExec ["addAction",0,true];
				[Lager_Montignac,["<t color = '#EDCF24'> Build a storage box","Base\Lager.sqf", [10,Hilfe_Montignac]]] remoteExec ["addAction",0,true];
				[Lager_Montignac,["<t color = '#77C3E0'> Upgrade storage to stage 2 [1500 Res]","Base\Lager.sqf", [4]]] remoteExec ["addAction",0,true];
				
				[_Mast,["<t color = '#FF9100'> Show Resources","Base\Resourcen.sqf"]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Open Workshop","Base\upgrades.sqf",[3,Werkstatt_Montignac]]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build MASH [600 Res]","Base\upgrades.sqf",[1,Hilfe_Montignac_Lazarett]]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build Resupply-point [300 Res]","Base\upgrades.sqf",[2,Hilfe_Montignac_Versorgung]]] remoteExec ["addAction",0,true];
				
				[_Mast,_id] remoteExec ["removeAction",0,true];
				}
				else {hint "You already have a Base!";};
				},_Mast]] remoteExec ["addAction",0,true]; 
			//-----------------------------------------------------------------------------------------------------------------------------------------------------
			}
			else {hint format["There still %1 are enemies at Montignac",Montignac_FF]}					//wenn gravette nicht feindfrei ist gib die nachricht aus
		};
	case "Flagge_Provins" : 
		{
		ProvinsPruef = true;
		sleep 1;
		if (Provins_FF == 0) then														// wenn Gravette Feindfrei ist.....
			{
			KleineSiedlungen = KleineSiedlungen + 1;
			ProvinsBefreit = true;
			publicVariable "KleineSiedlungen";
			publicVariable "ProvinsBefreit";
			"marker_Provins" setMarkerColor "ColorGUER";
			["DACProvins"] remoteExec ["DAC_fDeleteZone",0,true];			//... entferne dessen DAC zone
			[_Mast,"\A3\Data_F\Flags\Flag_FIA_CO.paa"]remoteExec ["setFlagTexture",0,true];			//... Hisse die Flagge der Revolution
			["erobern",["Provins was captured","PLAIN DOWN",2]] remoteExec ["cutText"];												//... und gib eine nachricht aus
			[_Mast, _idcon] remoteExec ["removeAction",0,true]; 
			[_Mast,["<t color='#FF9100'>Establish Base",{
			//--------------------------------------------------------------------------------------------------------------------------------------------------			
				_id = _this select 2;
				_Mast = _this select 3;
				if (!Basealive) then 
				{
				Basealive = true;
				publicVariable "Basealive";
				Base = "Provins";
				publicVariable "Base";
				[west, _Mast] call BIS_fnc_addRespawnPosition;
				LagerBasemaxres = 3000;
				publicVariable "LagerBasemaxres";
				LagerBasemaxmuni = 700;
				publicVariable "LagerBasemaxmuni";
				[Lager_Provins,["<t color = '#EDCF24'> Store RESOURCES","Base\Lager.sqf", [0,Hilfe_Provins]]] remoteExec ["addAction",0,true];
				[Lager_Provins,["<t color = '#EDCF24'> Get RESOURCES","Base\Lager.sqf", [1,Hilfe_Provins]]] remoteExec ["addAction",0,true];
				[Lager_Provins,["<t color = '#EDCF24'> Store AMMO","Base\Lager.sqf", [2,Hilfe_Provins]]] remoteExec ["addAction",0,true];
				[Lager_Provins,["<t color = '#EDCF24'> Get AMMO","Base\Lager.sqf", [3,Hilfe_Provins]]] remoteExec ["addAction",0,true];
				[Lager_Provins,["<t color = '#EDCF24'> Build a storage box","Base\Lager.sqf", [10,Hilfe_Provins]]] remoteExec ["addAction",0,true];
				[Lager_Provins,["<t color = '#77C3E0'> Upgrade storage to stage 2 [1500 Res]","Base\Lager.sqf", [4]]] remoteExec ["addAction",0,true];
				
				[_Mast,["<t color = '#FF9100'> Show Resources","Base\Resourcen.sqf"]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build Workshop [800 Res]","Base\upgrades.sqf",[0,Hilfe_Provins_Werkstatt]]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build MASH [600 Res]","Base\upgrades.sqf",[1,Hilfe_Provins_Lazarett]]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build Resupply-point [300 Res]","Base\upgrades.sqf",[2,Hilfe_Provins_Versorgung]]] remoteExec ["addAction",0,true];
				
				[_Mast,_id] remoteExec ["removeAction",0,true];
				}
				else {hint "You already have a Base!";};
				},_Mast]] remoteExec ["addAction",0,true]; 
			//-----------------------------------------------------------------------------------------------------------------------------------------------------
			}
			else {hint format["There still %1 are enemies at Provins",Provins_FF]}					//wenn gravette nicht feindfrei ist gib die nachricht aus
		};
	case "Flagge_Regina" : 
		{
		ReginaPruef = true;
		sleep 1;
		if (Regina_FF == 0) then														// wenn Gravette Feindfrei ist.....
			{
			KleineSiedlungen = KleineSiedlungen + 1;
			ReginaBefreit = true;
			publicVariable "KleineSiedlungen";
			publicVariable "ReginaBefreit";
			"marker_Regina" setMarkerColor "ColorGUER";
			["DACRegina"] remoteExec ["DAC_fDeleteZone",0,true];			//... entferne dessen DAC zone
			[_Mast,"\A3\Data_F\Flags\Flag_FIA_CO.paa"]remoteExec ["setFlagTexture",0,true];			//... Hisse die Flagge der Revolution
			["erobern",["Regina was captured","PLAIN DOWN",2]] remoteExec ["cutText"];											//... und gib eine nachricht aus
			[_Mast, _idcon] remoteExec ["removeAction",0,true]; 
			[_Mast,["<t color='#FF9100'>Establish Base",{
			//--------------------------------------------------------------------------------------------------------------------------------------------------			
				_id = _this select 2;
				_Mast = _this select 3;
				if (!Basealive) then 
				{
				Basealive = true;
				publicVariable "Basealive";
				Base = "Regina";
				publicVariable "Base";
				[west, _Mast] call BIS_fnc_addRespawnPosition;
				LagerBasemaxres = 3000;
				publicVariable "LagerBasemaxres";
				LagerBasemaxmuni = 700;
				publicVariable "LagerBasemaxmuni";
				[Lager_Regina,["<t color = '#EDCF24'> Store RESOURCES","Base\Lager.sqf", [0,Hilfe_Regina]]] remoteExec ["addAction",0,true];
				[Lager_Regina,["<t color = '#EDCF24'> Get RESOURCES","Base\Lager.sqf", [1,Hilfe_Regina]]] remoteExec ["addAction",0,true];
				[Lager_Regina,["<t color = '#EDCF24'> Store AMMO","Base\Lager.sqf", [2,Hilfe_Regina]]] remoteExec ["addAction",0,true];
				[Lager_Regina,["<t color = '#EDCF24'> Get AMMO","Base\Lager.sqf", [3,Hilfe_Regina]]] remoteExec ["addAction",0,true];
				[Lager_Regina,["<t color = '#EDCF24'> Build a storage box","Base\Lager.sqf", [10,Hilfe_Regina]]] remoteExec ["addAction",0,true];
				[Lager_Regina,["<t color = '#77C3E0'> Upgrade storage to stage 2 [1500 Res]","Base\Lager.sqf", [4]]] remoteExec ["addAction",0,true];
				
				[_Mast,["<t color = '#FF9100'> Show Resources","Base\Resourcen.sqf"]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build Workshop [800 Res]","Base\upgrades.sqf",[0,Hilfe_Regina_Werkstatt]]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build MASH [600 Res]","Base\upgrades.sqf",[1,Hilfe_Regina_Lazarett]]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build Resupply-point [300 Res]","Base\upgrades.sqf",[2,Hilfe_Regina_Versorgung]]] remoteExec ["addAction",0,true];
				
				[_Mast,_id] remoteExec ["removeAction",0,true];
				}
				else {hint "You already have a Base!";};
				},_Mast]] remoteExec ["addAction",0,true]; 
			//-----------------------------------------------------------------------------------------------------------------------------------------------------
			}
			else {hint format["There still %1 are enemies at Regina",Regina_FF]}					//wenn gravette nicht feindfrei ist gib die nachricht aus
		};
	case "Flagge_SaintPhillipe" : 
		{
		SaintPhillipePruef = true;
		sleep 1;
		if (SaintPhillipe_FF == 0) then														// wenn Gravette Feindfrei ist.....
			{
			GrosseSiedlungen = GrosseSiedlungen + 1;
			SaintPhillipeBefreit = true;
			publicVariable "GrosseSiedlungen";
			publicVariable "SaintPhillipeBefreit";
			"marker_SaintPhillipe" setMarkerColor "ColorGUER";
			["DACSaint_Phillipe"] remoteExec ["DAC_fDeleteZone",0,true];			//... entferne dessen DAC zone
			[_Mast,"\A3\Data_F\Flags\Flag_FIA_CO.paa"]remoteExec ["setFlagTexture",0,true];			//... Hisse die Flagge der Revolution
			["erobern",["Saint Phillipe was captured","PLAIN DOWN",2]] remoteExec ["cutText"];										//... und gib eine nachricht aus
			[_Mast, _idcon] remoteExec ["removeAction",0,true]; 
			[_Mast,["<t color='#FF9100'>Establish Base",{
			//--------------------------------------------------------------------------------------------------------------------------------------------------			
				_id = _this select 2;
				_Mast = _this select 3;
				if (!Basealive) then 
				{
				Basealive = true;
				publicVariable "Basealive";
				Base = "SaintPhillipe";
				publicVariable "Base";
				[west, _Mast] call BIS_fnc_addRespawnPosition;
				LagerBasemaxres = 3000;
				publicVariable "LagerBasemaxres";
				LagerBasemaxmuni = 700;
				publicVariable "LagerBasemaxmuni";
				[Lager_SaintPhillipe,["<t color = '#EDCF24'> Store RESOURCES","Base\Lager.sqf", [0,Hilfe_SaintPhillipe]]] remoteExec ["addAction",0,true];
				[Lager_SaintPhillipe,["<t color = '#EDCF24'> Get RESOURCES","Base\Lager.sqf", [1,Hilfe_SaintPhillipe]]] remoteExec ["addAction",0,true];
				[Lager_SaintPhillipe,["<t color = '#EDCF24'> Store AMMO","Base\Lager.sqf", [2,Hilfe_SaintPhillipe]]] remoteExec ["addAction",0,true];
				[Lager_SaintPhillipe,["<t color = '#EDCF24'> Get AMMO","Base\Lager.sqf", [3,Hilfe_SaintPhillipe]]] remoteExec ["addAction",0,true];
				[Lager_SaintPhillipe,["<t color = '#EDCF24'> Build a storage box","Base\Lager.sqf", [10,Hilfe_SaintPhillipe]]] remoteExec ["addAction",0,true];
				[Lager_SaintPhillipe,["<t color = '#77C3E0'> Upgrade storage to stage 2 [1500 Res]","Base\Lager.sqf", [4]]] remoteExec ["addAction",0,true];
				
				[_Mast,["<t color = '#FF9100'> Show Resources","Base\Resourcen.sqf"]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build Workshop [800 Res]","Base\upgrades.sqf",[0,Hilfe_SaintPhillipe_Werkstatt]]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build MASH [600 Res]","Base\upgrades.sqf",[1,Hilfe_SaintPhillipe_Lazarett]]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build Resupply-point [300 Res]","Base\upgrades.sqf",[2,Hilfe_SaintPhillipe_Versorgung]]] remoteExec ["addAction",0,true];
				
				[_Mast,_id] remoteExec ["removeAction",0,true];
				}
				else {hint "You already have a Base!";};
				},_Mast]] remoteExec ["addAction",0,true]; 
			//-----------------------------------------------------------------------------------------------------------------------------------------------------
			}
			else {hint format["There still %1 are enemies at Saint Phillipe",SaintPhillipe_FF]}					//wenn gravette nicht feindfrei ist gib die nachricht aus
		};
	case "Flagge_SaintPierre" : 
		{
		SaintPierrePruef = true;
		sleep 1;
		if (SaintPierre_FF == 0) then														// wenn Gravette Feindfrei ist.....
			{
			GrosseSiedlungen = GrosseSiedlungen + 1;
			SaintPierreBefreit = true;
			publicVariable "GrosseSiedlungen";
			publicVariable "SaintPierreBefreit";
			"marker_SaintPierre" setMarkerColor "ColorGUER";
			["DACSaintPierre"] remoteExec ["DAC_fDeleteZone",0,true];			//... entferne dessen DAC zone
			[_Mast,"\A3\Data_F\Flags\Flag_FIA_CO.paa"]remoteExec ["setFlagTexture",0,true];			//... Hisse die Flagge der Revolution
			["erobern",["Saint Pierre was captured","PLAIN DOWN",2]] remoteExec ["cutText"];											//... und gib eine nachricht aus
			[_Mast, _idcon] remoteExec ["removeAction",0,true]; 
			[_Mast,["<t color='#FF9100'>Establish Base",{
			//--------------------------------------------------------------------------------------------------------------------------------------------------			
				_id = _this select 2;
				_Mast = _this select 3;
				if (!Basealive) then 
				{
				Basealive = true;
				publicVariable "Basealive";
				Base = "SaintPierre";
				publicVariable "Base";
				[west, _Mast] call BIS_fnc_addRespawnPosition;
				LagerBasemaxres = 3000;
				publicVariable "LagerBasemaxres";
				LagerBasemaxmuni = 700;
				publicVariable "LagerBasemaxmuni";
				[Lager_SaintPierre,["<t color = '#EDCF24'> Store RESOURCES","Base\Lager.sqf", [0,Hilfe_SaintPierre]]] remoteExec ["addAction",0,true];
				[Lager_SaintPierre,["<t color = '#EDCF24'> Get RESOURCES","Base\Lager.sqf", [1,Hilfe_SaintPierre]]] remoteExec ["addAction",0,true];
				[Lager_SaintPierre,["<t color = '#EDCF24'> Store AMMO","Base\Lager.sqf", [2,Hilfe_SaintPierre]]] remoteExec ["addAction",0,true];
				[Lager_SaintPierre,["<t color = '#EDCF24'> Get AMMO","Base\Lager.sqf", [3,Hilfe_SaintPierre]]] remoteExec ["addAction",0,true];
				[Lager_SaintPierre,["<t color = '#EDCF24'> Build a storage box","Base\Lager.sqf", [10,Hilfe_SaintPierre]]] remoteExec ["addAction",0,true];
				[Lager_SaintPierre,["<t color = '#77C3E0'> Upgrade storage to stage 2 [1500 Res]","Base\Lager.sqf", [4]]] remoteExec ["addAction",0,true];
				
				[_Mast,["<t color = '#FF9100'> Show Resources","Base\Resourcen.sqf"]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Open Workshop","Base\upgrades.sqf",[3,Werkstatt_SaintPierre]]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build MASH [600 Res]","Base\upgrades.sqf",[1,Hilfe_SaintPierre_Lazarett]]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build Resupply-point [300 Res]","Base\upgrades.sqf",[2,Hilfe_SaintPierre_Versorgung]]] remoteExec ["addAction",0,true];
				
				[_Mast,_id] remoteExec ["removeAction",0,true];
				}
				else {hint "You already have a Base!";};
				},_Mast]] remoteExec ["addAction",0,true]; 
			//-----------------------------------------------------------------------------------------------------------------------------------------------------
			}
			else {hint format["There still %1 are enemies at Saint Pierre",SaintPierre_FF]}					//wenn gravette nicht feindfrei ist gib die nachricht aus
		};
	case "Flagge_Vernon" : 
		{
		TyronePruef = true;
		sleep 1;
		if (Vernon_FF == 0) then														// wenn Gravette Feindfrei ist.....
			{
			KleineSiedlungen = KleineSiedlungen + 1;
			VernonBefreit = true;
			publicVariable "KleineSiedlungen";
			publicVariable "VernonBefreit";
			"marker_Vernon" setMarkerColor "ColorGUER";
			["DACVernon"] remoteExec ["DAC_fDeleteZone",0,true];			//... entferne dessen DAC zone
			[_Mast,"\A3\Data_F\Flags\Flag_FIA_CO.paa"]remoteExec ["setFlagTexture",0,true];			//... Hisse die Flagge der Revolution
			["erobern",["Vernon was captured","PLAIN DOWN",2]] remoteExec ["cutText"];											//... und gib eine nachricht aus
			[_Mast, _idcon] remoteExec ["removeAction",0,true]; 
			[_Mast,["<t color='#FF9100'>Establish Base",{
			//--------------------------------------------------------------------------------------------------------------------------------------------------			
				_id = _this select 2;
				_Mast = _this select 3;
				if (!Basealive) then 
				{
				Basealive = true;
				publicVariable "Basealive";
				Base = "Vernon";
				publicVariable "Base";
				[west, _Mast] call BIS_fnc_addRespawnPosition;
				LagerBasemaxres = 3000;
				publicVariable "LagerBasemaxres";
				LagerBasemaxmuni = 700;
				publicVariable "LagerBasemaxmuni";
				[Lager_Vernon,["<t color = '#EDCF24'> Store RESOURCES","Base\Lager.sqf", [0,Hilfe_Vernon]]] remoteExec ["addAction",0,true];
				[Lager_Vernon,["<t color = '#EDCF24'> Get RESOURCES","Base\Lager.sqf", [1,Hilfe_Vernon]]] remoteExec ["addAction",0,true];
				[Lager_Vernon,["<t color = '#EDCF24'> Store AMMO","Base\Lager.sqf", [2,Hilfe_Vernon]]] remoteExec ["addAction",0,true];
				[Lager_Vernon,["<t color = '#EDCF24'> Get AMMO","Base\Lager.sqf", [3,Hilfe_Vernon]]] remoteExec ["addAction",0,true];
				[Lager_Vernon,["<t color = '#EDCF24'> Build a storage box","Base\Lager.sqf", [10,Hilfe_Vernon]]] remoteExec ["addAction",0,true];
				[Lager_Vernon,["<t color = '#77C3E0'> Upgrade storage to stage 2 [1500 Res]","Base\Lager.sqf", [4]]] remoteExec ["addAction",0,true];
				
				[_Mast,["<t color = '#FF9100'> Show Resources","Base\Resourcen.sqf"]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build Workshop [800 Res]","Base\upgrades.sqf",[0,Hilfe_Vernon_Werkstatt]]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build MASH [600 Res]","Base\upgrades.sqf",[1,Hilfe_Vernon_Lazarett]]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build Resupply-point [300 Res]","Base\upgrades.sqf",[2,Hilfe_Vernon_Versorgung]]] remoteExec ["addAction",0,true];
				
				[_Mast,_id] remoteExec ["removeAction",0,true];
				}
				else {hint "You already have a Base!";};
				},_Mast]] remoteExec ["addAction",0,true]; 
			//-----------------------------------------------------------------------------------------------------------------------------------------------------
			}
			else {hint format["There still %1 are enemies at Vernon",Vernon_FF]}					//wenn gravette nicht feindfrei ist gib die nachricht aus      
		};
	case "Flagge_Tyrone" : 
		{
		TyronePruef = true;
		sleep 1;
		if (Tyrone_FF == 0) then														// wenn Gravette Feindfrei ist.....
			{
			KleineSiedlungen = KleineSiedlungen + 1;
			TyroneBefreit = true;
			publicVariable "KleineSiedlungen";
			publicVariable "TyroneBefreit";
			"marker_Tyrone" setMarkerColor "ColorGUER";
			["DACTyrone"] remoteExec ["DAC_fDeleteZone",0,true];			//... entferne dessen DAC zone
			[_Mast,"\A3\Data_F\Flags\Flag_FIA_CO.paa"]remoteExec ["setFlagTexture",0,true];			//... Hisse die Flagge der Revolution
			["erobern",["Tyrone was captured","PLAIN DOWN",2]] remoteExec ["cutText"];									//... und gib eine nachricht aus
			[_Mast, _idcon] remoteExec ["removeAction",0,true]; 
			[_Mast,["<t color='#FF9100'>Establish Base",{
			//--------------------------------------------------------------------------------------------------------------------------------------------------			
				_id = _this select 2;
				_Mast = _this select 3;
				if (!Basealive) then 
				{
				Basealive = true;
				publicVariable "Basealive";
				Base = "Tyrone";
				publicVariable "Base";
				[west, _Mast] call BIS_fnc_addRespawnPosition;
				LagerBasemaxres = 3000;
				publicVariable "LagerBasemaxres";
				LagerBasemaxmuni = 700;
				publicVariable "LagerBasemaxmuni";
				[Lager_Tyrone,["<t color = '#EDCF24'> Store RESOURCES","Base\Lager.sqf", [0,Hilfe_Tyrone]]] remoteExec ["addAction",0,true];
				[Lager_Tyrone,["<t color = '#EDCF24'> Get RESOURCES","Base\Lager.sqf", [1,Hilfe_Tyrone]]] remoteExec ["addAction",0,true];
				[Lager_Tyrone,["<t color = '#EDCF24'> Store AMMO","Base\Lager.sqf", [2,Hilfe_Tyrone]]] remoteExec ["addAction",0,true];
				[Lager_Tyrone,["<t color = '#EDCF24'> Get AMMO","Base\Lager.sqf", [3,Hilfe_Tyrone]]] remoteExec ["addAction",0,true];
				[Lager_Tyrone,["<t color = '#EDCF24'> Build a storage box","Base\Lager.sqf", [10,Hilfe_Tyrone]]] remoteExec ["addAction",0,true];
				[Lager_Tyrone,["<t color = '#77C3E0'> Upgrade storage to stage 2 [1500 Res]","Base\Lager.sqf", [4]]] remoteExec ["addAction",0,true];
				
				[_Mast,["<t color = '#FF9100'> Show Resources","Base\Resourcen.sqf"]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build Workshop [800 Res]","Base\upgrades.sqf",[0,Hilfe_Tyrone_Werkstatt]]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build MASH [600 Res]","Base\upgrades.sqf",[1,Hilfe_Tyrone_Lazarett]]] remoteExec ["addAction",0,true];
				[_Mast,["<t color = '#77C3E0'> Build Resupply-point [300 Res]","Base\upgrades.sqf",[2,Hilfe_Tyrone_Versorgung]]] remoteExec ["addAction",0,true];
				
				[_Mast,_id] remoteExec ["removeAction",0,true];
				}
				else {hint "You already have a Base!";};
				},_Mast]] remoteExec ["addAction",0,true]; 
			//-----------------------------------------------------------------------------------------------------------------------------------------------------


			}
			else {hint format["There still %1 are enemies at Tyrone",Tyrone_FF]}					//wenn gravette nicht feindfrei ist gib die nachricht aus
		};

	};
/*
