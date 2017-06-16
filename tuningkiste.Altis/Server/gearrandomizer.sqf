_box = _this select 0;
_kindparam = _this select 1;
_amountdifferent = _this select 2;
_amountperitem = _this select 3;
_amountrandom = _this select 4;
_magazines = _this select 5; //ammo per weapon
_randommagazines = _this select 6; //random additional ammoamount
if (isNil "_magazines") then {_magazines = 0};
if (isNil "_randommagazines") then {_randommagazines = 0};
if (!isServer) exitWith {};
_i=0;
_m=0;
_kind = [];


//-------Kinds---- !!!!!DEFINE OWN CLASSES HERE!!!!!----------------------
///////////////////////////////////////////////
///			DLC STUFF STANDS IN /*...*/		///
/// DELETE THOSE MARKINGS TO REENBALE THOSE ///
///////////////////////////////////////////////
_items = ["ItemWatch","ItemCompass","ItemGPS","ItemRadio","ItemMap","MineDetector","Binocular","FirstAidKit","Medikit","ToolKit"/*,"O_NVGoggles_hex_F","O_NVGoggles_urb_F","O_NVGoggles_ghex_F","NVGoggles_tna_F","NVGogglesB_blk_F","NVGogglesB_grn_F","NVGogglesB_gry_F","Laserdesignator_01_khk_F","Laserdesignator_02_ghex_F"*/];
_NATOitems = ["Rangefinder","NVGoggles","Laserdesignator","B_UavTerminal"];
_CSATitems = ["NVGoggles_OPFOR","NVGoggles_OPFOR","Laserdesignator_02",/*"O_UavTerminal"*/"B_UavTerminal"];
_AAFitems = ["NVGoggles_INDEP","NVGoggles_INDEP","Laserdesignator_03",/*"I_UavTerminal"*/"B_UavTerminal"];
_attachments = ["muzzle_snds_H","muzzle_snds_L","muzzle_snds_M","muzzle_snds_B","muzzle_snds_H_MG","muzzle_snds_H_SW","optic_Arco","optic_Hamr","optic_Aco","optic_ACO_grn","optic_Aco_smg","optic_ACO_grn_smg","optic_Holosight","optic_Holosight_smg","optic_SOS","acc_flashlight","acc_pointer_IR","optic_MRCO","muzzle_snds_acp","optic_NVS","optic_Nightstalker","optic_tws","optic_tws_mg","optic_DMS","optic_Yorris","optic_MRD","optic_LRPS"/*,"muzzle_snds_338_black","muzzle_snds_338_green","muzzle_snds_338_sand","muzzle_snds_93mmg","muzzle_snds_93mmg_tan","optic_AMS","optic_AMS_khk","optic_AMS_snd","optic_KHS_blk","optic_KHS_hex","optic_KHS_old","optic_KHS_tan","bipod_01_F_snd","bipod_01_F_blk","bipod_01_F_mtp","bipod_02_F_blk","bipod_02_F_tan","bipod_02_F_hex","bipod_03_F_blk","bipod_03_F_oli","muzzle_snds_H_khk_F","muzzle_snds_H_snd_F","muzzle_snds_m_khk_F","muzzle_snds_m_snd_F","muzzle_snds_58_blk_F","muzzle_snds_58_wdm_F","muzzle_snds_58_ghex_F","muzzle_snds_58_hex_F","muzzle_snds_B_khk_F","muzzle_snds_B_snd_F","muzzle_snds_65_TI_blk_F","muzzle_snds_65_TI_hex_F","muzzle_snds_65_TI_ghex_F","muzzle_snds_H_MG_blk_F","muzzle_snds_H_MG_khk_F","optic_Arco_blk_F","optic_Arco_ghex_F","optic_DMS_ghex_F","optic_Hamr_khk_F","optic_ERCO_blk_F","optic_ERCO_khk_F","optic_ERCO_snd_F","optic_SOS_khk_F","optic_LRPS_tna_F","optic_LRPS_ghex_F","optic_Holosight_blk_F","optic_Holosight_khk_F","optic_Holosight_smg_blk_F","bipod_01_F_khk"*/];

_throw = ["HandGrenade","MiniGrenade","SmokeShell","SmokeShellRed","SmokeShellGreen","SmokeShellYellow","SmokeShellPurple","SmokeShellBlue","SmokeShellOrange","Chemlight_green","Chemlight_red","Chemlight_yellow","Chemlight_blue","B_IR_Grenade","O_IR_Grenade","I_IR_Grenade"];
_explosives = ["ATMine_Range_Mag","APERSMine_Range_Mag","APERSBoundingMine_Range_Mag","SLAMDirectionalMine_Wire_Mag","APERSTripMine_Wire_Mag","ClaymoreDirectionalMine_Remote_Mag","SatchelCharge_Remote_Mag","DemoCharge_Remote_Mag","IEDUrbanBig_Remote_Mag","IEDLandBig_Remote_Mag","IEDUrbanSmall_Remote_Mag","IEDLandSmall_Remote_Mag"];
_grenadelauncherammo = ["1Rnd_HE_Grenade_shell","UGL_FlareWhite_F","UGL_FlareGreen_F","UGL_FlareRed_F","UGL_FlareYellow_F","UGL_FlareCIR_F","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeRed_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeYellow_Grenade_shell","1Rnd_SmokePurple_Grenade_shell","1Rnd_SmokeBlue_Grenade_shell","1Rnd_SmokeOrange_Grenade_shell"];

_huntingrifles = [["arifle_AKM_F",["30Rnd_762x39_Mag_F"]],["srifle_DMR_06_camo_khs_F",["20Rnd_762x51_Mag"]]];
_CSATlaunscher = [["launch_RPG32_F",["RPG32_F","RPG32_HE_F"]],["launch_O_Titan_F",["Titan_AA"]],["launch_O_Titan_short_F",["Titan_AT","Titan_AP"]]];
_CSATweapoms = [["srifle_DMR_01_F",["10Rnd_762x54_Mag"]],["srifle_GM6_camo_F",["5Rnd_127x108_Mag","5Rnd_127x108_APDS_Mag"]],["LMG_Zafir_F",["150Rnd_762x54_Box","150Rnd_762x54_Box_Tracer"]],["hgun_Rook40_F",["16Rnd_9x21_Mag","30Rnd_9x21_Mag"]],["hgun_Pistol_heavy_02_F",["6Rnd_45ACP_Cylinder"]],["arifle_Katiba_F",["30Rnd_65x39_caseless_green_mag_Tracer","30Rnd_65x39_caseless_green"]],["arifle_Katiba_C_F",["30Rnd_65x39_caseless_green_mag_Tracer","30Rnd_65x39_caseless_green"]],["arifle_Katiba_GL_F",["arifle_Katiba_GL_F","30Rnd_65x39_caseless_green_mag_Tracer"]],["SMG_02_F",["30Rnd_9x21_Mag_SMG_02"]],["srifle_DMR_04_NS_LP_F",["10Rnd_127x54_Mag"]],["srifle_DMR_05_KHS_LP_F",["10Rnd_93x64_DMR_05_Mag"]],["MMG_01_tan_F",["150Rnd_93x64_Mag"]],["srifle_DMR_07_hex_F",["20Rnd_650x39_Cased_Mag_F"]],["arifle_CTAR_GL_hex_F",["30Rnd_580x42_Mag_Tracer_F","30Rnd_580x42_Mag_F"]],["arifle_CTAR_hex_F",["30Rnd_580x42_Mag_Tracer_F","30Rnd_580x42_Mag_F"]],["arifle_CTARS_hex_F",["100Rnd_580x42_Mag_F","100Rnd_580x42_Mag_Tracer_F"]],["arifle_ARX_hex_F",["30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green_mag_Tracer","10Rnd_50BW_Mag_F"]],["arifle_SDAR_F",["20Rnd_556x45_UW_mag","30Rnd_556x45_Stanag"]]];
_AAFlaunscher = [["launch_NLAW_F",["NLAW_F"]],["launch_I_Titan_F",["Titan_AA"]],["launch_I_Titan_short_F",["Titan_AP","Titan_AT"]]];
_AAFw = [["srifle_GM6_F",["5Rnd_127x108_Mag","5Rnd_127x108_APDS_Mag"]],["srifle_EBR_F",["20Rnd_762x51_Mag"]],["LMG_Mk200_F",["200Rnd_65x39_cased_Box","200Rnd_65x39_cased_Box_Tracer"]],["hgun_ACPC2_F",["9Rnd_45ACP_Mag"]],["arifle_Mk20_F",["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Green"]],["arifle_Mk20C_F",["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Green"]],["arifle_Mk20_GL_F",["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Green"]],["arifle_SDAR_F",["20Rnd_556x45_UW_mag","30Rnd_556x45_Stanag"]],["hgun_PDW2000_F",["30Rnd_9x21_Mag"]],["srifle_DMR_03_khaki_F",["20Rnd_762x51_Mag"]]];

_AAFclothing = ["U_I_CombatUniform","U_I_CombatUniform_tshirt","U_I_CombatUniform_shortsleeve","U_I_pilotCoveralls","U_I_HeliPilotCoveralls","U_I_GhillieSuit","U_I_OfficerUniform","U_I_Wetsuit","V_BandollierB_oli","V_Chestrig_oli","V_PlateCarrierIA1_dgtl","V_PlateCarrierIA2_dgtl","V_PlateCarrierIAGL_dgtl","V_RebreatherIA","H_HelmetIA","H_HelmetIA_camo","H_MilCap_dgtl","H_HelmetCrew_I","H_PilotHelmetHeli_I"];
_GUERclothing = ["U_IG_Guerilla1_1","U_IG_Guerilla2_1","U_IG_Guerilla2_2","U_IG_Guerilla2_3","U_IG_Guerilla3_1","U_IG_Guerilla3_2","U_IG_leader","U_C_HunterBody_grn","U_C_HunterBody_brn","U_I_G_Story_Protagonist_F","U_I_G_resistanceLeader_F","H_Booniehat_dirty","H_Cap_blk_CMMG","H_Cap_grn_BI","H_Bandanna_camo","H_Shemag_olive"];
_CSATclothing = ["U_O_CombatUniform_ocamo","U_O_GhillieSuit","U_O_PilotCoveralls","U_O_Wetsuit","U_O_CombatUniform_oucamo","U_O_SpecopsUniform_ocamo","U_O_SpecopsUniform_blk","U_O_OfficerUniform_ocamo","V_BandollierB_khk","V_Chestrig_khk","V_TacVest_khk","V_HarnessO_brn","V_HarnessOGL_brn","V_HarnessOSpec_brn","V_RebreatherIR","H_HelmetCrew_O","H_PilotHelmetHeli_O","H_HelmetO_ocamo","H_HelmetLeaderO_ocamo","H_MilCap_ocamo","H_HelmetSpecO_ocamo","H_HelmetO_ViperSP_hex_F","U_O_V_Soldier_Viper_hex_F"];

_CSATstaticweapons = ["O_Mortar_01_weapon_F","O_HMG_01_weapon_F","O_GMG_01_weapon_F","O_AA_01_weapon_F","O_AT_01_weapon_F"];
_CSATtpods = ["O_Mortar_01_support_F","O_HMG_01_support_F","O_HMG_01_support_high_F"];

_NATOstaticweapons = ["B_Mortar_01_weapon_F","B_HMG_01_weapon_F","B_GMG_01_weapon_F","B_AA_01_weapon_F","B_AT_01_weapon_F"];
_NATOtpods = ["B_Mortar_01_support_F","B_HMG_01_support_F","B_HMG_01_support_high_F"];

_AAFtpods = ["I_Mortar_01_support_F","I_HMG_01_support_F","I_HMG_01_support_high_F"];
_AAFstaticweapons = ["I_Mortar_01_weapon_F""I_HMG_01_weapon_F","I_GMG_01_weapon_F","I_AA_01_weapon_F","I_AT_01_weapon_F"];

_specialbags = ["B_Respawn_TentDome_F","B_Respawn_TentA_F","B_Respawn_Sleeping_bag_F","B_Respawn_Sleeping_bag_blue_F","B_Respawn_Sleeping_bag_brown_F"];
_UAV = [/*//just disabled for that mission : "B_UAV_01_backpack_F","I_UAV_01_backpack_F",*/"O_UAV_01_backpack_F"];
_NATObackpacks = ["B_AssaultPack_mcamo","B_Bergen_mcamo_F","B_Carryall_mcamo","B_Kitbag_mcamo","B_TacticalPack_mcamo","B_AssaultPack_Kerry"];
_CSATbackpacks = ["B_AssaultPack_ocamo","B_Bergen_hex_F","B_FieldPack_ocamo","B_FieldPack_oucamo","B_Carryall_oucamo","B_Carryall_ocamo","B_TacticalPack_ocamo"];
_AAFbackpacks = ["B_AssaultPack_dgtl","B_Kitbag_sgg"];
_backpacks = ["B_AssaultPack_cbr","B_FieldPack_cbr","B_Carryall_cbr","B_Kitbag_cbr","B_AssaultPack_blk","B_FieldPack_blk","B_TacticalPack_blk","B_AssaultPack_khk","B_FieldPack_khk","B_Carryall_khk","B_AssaultPack_sgg","B_FieldPack_oli","B_Carryall_oli","B_TacticalPack_oli","B_AssaultPack_rgr","B_Kitbag_rgr","B_TacticalPack_rgr"/*,"B_AssaultPack_tna_F","B_Bergen_dgtl_F","B_Bergen_hex_F","B_Bergen_mcamo_F","B_Bergen_tna_F","B_Carryall_ghex_F","B_FieldPack_ghex_F","B_ViperHarness_ghex_F","B_ViperHarness_khk_F","B_ViperHarness_oli_F","B_ViperHarness_blk_F","B_ViperHarness_hex_F","B_ViperLightHarness_ghex_F","B_ViperLightHarness_khk_F","B_ViperLightHarness_oli_F","B_ViperLightHarness_blk_F","B_ViperLightHarness_hex_F"*/];

//------------------------------------------------------------------------
//--------CUSTOM CLASSES 2nd PART------------------------------------------
switch (_kindparam) do
{
	case "items" : {_kind = _items};
	case "NATOitems" : {_kind = _NATOitems};
	case "CSATitems" : {_kind = _CSATitems};
	case "AAFitems" : {_kind = _AAFitems};
	case "attachments" : {_kind = _attachments};
	case "throw" : {_kind = _throw};
	case "explosives" : {_kind = _explosives};
	case "GLammo" : {_kind = _grenadelauncherammo};
	case "HuntRifles" : {_kind = _huntingrifles};
	case "CSATl" : {_kind = _CSATlaunscher};
	case "CSATw" : {_kind = _CSATweapoms};
	case "AAFl" : {_kind = _AAFlaunscher};
	case "AAFw" : {_kind = _AAFw};
	case "AAFc" : {_kind = _AAFclothing};
	case "GUERc" : {_kind = _GUERclothing};
	case "CSATc" : {_kind = _CSATclothing};
	case "sbags" : {_kind = _specialbags};
	case "UAV" : {_kind = _UAV};
	case "CSATsweapons" : {_kind = _CSATstaticweapons};
	case "CSATtpods" : {_kind = _CSATtpods};
	case "NATOsweapons" : {_kind = _NATOstaticweapons};
	case "NATOtpods" : {_kind = _NATOtpods};
	case "AAFtpods" : {_kind = _AAFtpods};
	case "AAFsweapons" : {_kind = _AAFstaticweapons};
	case "backpacks" : {_kind = _backpacks};
	case "NATObackpacks" : {_kind = _NATObackpacks};
	case "CSATbackpacks" : {_kind = _CSATbackpacks};
	case "AAFbackpacks" : {_kind = _AAFbackpacks};
};

switch (_kindparam) do
{
	case "HuntRifles" :
		{
		for [{_i=_amountdifferent}, {_i > 0}, {_i = _i - 1}] do   
			{
				_AMOUNT = _amountperitem + (random _amountrandom);
				_weaponarray = (selectRandom _kind);
				_weapon = (_weaponarray) select 0;
				_box addWeaponCargoGlobal [(_weapon),(_AMOUNT)];
				_weaponmagazinearray = (_weaponarray select 1); 
				_box addMagazineCargoGlobal [(selectRandom _weaponmagazinearray),(_AMOUNT * (_magazines + (random _randommagazines)))];
			};
		};
	case "CSATl" :
		{
		for [{_i=_amountdifferent}, {_i > 0}, {_i = _i - 1}] do   
			{
				_AMOUNT = _amountperitem + (random _amountrandom);
				_weaponarray = (selectRandom _kind);
				_weapon = (_weaponarray) select 0;
				_box addWeaponCargoGlobal [(_weapon),(_AMOUNT)];
				_weaponmagazinearray = (_weaponarray select 1); 
				_box addMagazineCargoGlobal [(selectRandom _weaponmagazinearray),(_AMOUNT * (_magazines + (random _randommagazines)))];
			};
		};	
	case "CSATw" :
		{
		for [{_i=_amountdifferent}, {_i > 0}, {_i = _i - 1}] do   
			{
				_AMOUNT = _amountperitem + (random _amountrandom);
				_weaponarray = (selectRandom _kind);
				_weapon = (_weaponarray) select 0;
				_box addWeaponCargoGlobal [(_weapon),(_AMOUNT)];
				_weaponmagazinearray = (_weaponarray select 1); 
				_box addMagazineCargoGlobal [(selectRandom _weaponmagazinearray),(_AMOUNT * (_magazines + (random _randommagazines)))];
			};
		};
	case "AAFl" :
		{
		for [{_i=_amountdifferent}, {_i > 0}, {_i = _i - 1}] do   
			{
				_AMOUNT = _amountperitem + (random _amountrandom);
				_weaponarray = (selectRandom _kind);
				_weapon = (_weaponarray) select 0;
				_box addWeaponCargoGlobal [(_weapon),(_AMOUNT)];
				_weaponmagazinearray = (_weaponarray select 1); 
				_box addMagazineCargoGlobal [(selectRandom _weaponmagazinearray),(_AMOUNT * (_magazines + (random _randommagazines)))];
			};
		};
	case "AAFw" :
		{
		for [{_i=_amountdifferent}, {_i > 0}, {_i = _i - 1}] do   
			{
				_AMOUNT = _amountperitem + (random _amountrandom);
				_weaponarray = (selectRandom _kind);
				_weapon = (_weaponarray) select 0;
				_box addWeaponCargoGlobal [(_weapon),(_AMOUNT)];
				_weaponmagazinearray = (_weaponarray select 1); 
				_box addMagazineCargoGlobal [(selectRandom _weaponmagazinearray),(_AMOUNT * (_magazines + (random _randommagazines)))];
			};
		};
	case "sbags" :
		{
		if (_amountrandom == 0) then 
			{for [{_i=_amountdifferent}, {_i > 0}, {_i = _i - 1}] do   
				{
					_box addBackpackCargoGlobal [(selectRandom _kind),(_amountperitem)];
				};
			}
		else
			{for [{_i=_amountdifferent}, {_i > 0}, {_i = _i - 1}] do 
				{
				_box addBackpackCargoGlobal [(selectRandom _kind),(_amountperitem + (random _amountrandom) + 1)];
				};
			};
		};
	case "UAV" :
		{
		if (_amountrandom == 0) then 
			{for [{_i=_amountdifferent}, {_i > 0}, {_i = _i - 1}] do   
				{
					_box addBackpackCargoGlobal [(selectRandom _kind),(_amountperitem)];
				};
			}
		else
			{for [{_i=_amountdifferent}, {_i > 0}, {_i = _i - 1}] do 
				{
				_box addBackpackCargoGlobal [(selectRandom _kind),(_amountperitem + (random _amountrandom) + 1)];
				};
			};
		};
	case "CSATsweapons" :
		{
		if (_amountrandom == 0) then 
			{for [{_i=_amountdifferent}, {_i > 0}, {_i = _i - 1}] do   
				{
					_box addBackpackCargoGlobal [(selectRandom _kind),(_amountperitem)];
				};
			}
		else
			{for [{_i=_amountdifferent}, {_i > 0}, {_i = _i - 1}] do 
				{
				_box addBackpackCargoGlobal [(selectRandom _kind),(_amountperitem + (random _amountrandom) + 1)];
				};
			};
		};
	case "CSATtpods" :
		{
		if (_amountrandom == 0) then 
			{for [{_i=_amountdifferent}, {_i > 0}, {_i = _i - 1}] do   
				{
					_box addBackpackCargoGlobal [(selectRandom _kind),(_amountperitem)];
				};
			}
		else
			{for [{_i=_amountdifferent}, {_i > 0}, {_i = _i - 1}] do 
				{
				_box addBackpackCargoGlobal [(selectRandom _kind),(_amountperitem + (random _amountrandom) + 1)];
				};
			};
		};
	case "AAFsweapons" :
		{
		if (_amountrandom == 0) then 
			{for [{_i=_amountdifferent}, {_i > 0}, {_i = _i - 1}] do   
				{
					_box addBackpackCargoGlobal [(selectRandom _kind),(_amountperitem)];
				};
			}
		else
			{for [{_i=_amountdifferent}, {_i > 0}, {_i = _i - 1}] do 
				{
				_box addBackpackCargoGlobal [(selectRandom _kind),(_amountperitem + (random _amountrandom) + 1)];
				};
			};
		};
	case "AAFtpods" :
		{
		if (_amountrandom == 0) then 
			{for [{_i=_amountdifferent}, {_i > 0}, {_i = _i - 1}] do   
				{
					_box addBackpackCargoGlobal [(selectRandom _kind),(_amountperitem)];
				};
			}
		else
			{for [{_i=_amountdifferent}, {_i > 0}, {_i = _i - 1}] do 
				{
				_box addBackpackCargoGlobal [(selectRandom _kind),(_amountperitem + (random _amountrandom) + 1)];
				};
			};
		};
	case "NATOsweapons" :
		{
		if (_amountrandom == 0) then 
			{for [{_i=_amountdifferent}, {_i > 0}, {_i = _i - 1}] do   
				{
					_box addBackpackCargoGlobal [(selectRandom _kind),(_amountperitem)];
				};
			}
		else
			{for [{_i=_amountdifferent}, {_i > 0}, {_i = _i - 1}] do 
				{
				_box addBackpackCargoGlobal [(selectRandom _kind),(_amountperitem + (random _amountrandom) + 1)];
				};
			};
		};
	case "NATOtpods" :
		{
		if (_amountrandom == 0) then 
			{for [{_i=_amountdifferent}, {_i > 0}, {_i = _i - 1}] do   
				{
					_box addBackpackCargoGlobal [(selectRandom _kind),(_amountperitem)];
				};
			}
		else
			{for [{_i=_amountdifferent}, {_i > 0}, {_i = _i - 1}] do 
				{
				_box addBackpackCargoGlobal [(selectRandom _kind),(_amountperitem + (random _amountrandom) + 1)];
				};
			};
		};
	case "backpacks" :
		{
		if (_amountrandom == 0) then 
			{for [{_i=_amountdifferent}, {_i > 0}, {_i = _i - 1}] do   
				{
					_box addBackpackCargoGlobal [(selectRandom _kind),(_amountperitem)];
				};
			}
		else
			{for [{_i=_amountdifferent}, {_i > 0}, {_i = _i - 1}] do 
				{
				_box addBackpackCargoGlobal [(selectRandom _kind),(_amountperitem + (random _amountrandom) + 1)];
				};
			};
		};
	case "NATObackpacks" :
		{
		if (_amountrandom == 0) then 
			{for [{_i=_amountdifferent}, {_i > 0}, {_i = _i - 1}] do   
				{
					_box addBackpackCargoGlobal [(selectRandom _kind),(_amountperitem)];
				};
			}
		else
			{for [{_i=_amountdifferent}, {_i > 0}, {_i = _i - 1}] do 
				{
				_box addBackpackCargoGlobal [(selectRandom _kind),(_amountperitem + (random _amountrandom) + 1)];
				};
			};
		};
	case "CSATbackpacks" :
		{
		if (_amountrandom == 0) then 
			{for [{_i=_amountdifferent}, {_i > 0}, {_i = _i - 1}] do   
				{
					_box addBackpackCargoGlobal [(selectRandom _kind),(_amountperitem)];
				};
			}
		else
			{for [{_i=_amountdifferent}, {_i > 0}, {_i = _i - 1}] do 
				{
				_box addBackpackCargoGlobal [(selectRandom _kind),(_amountperitem + (random _amountrandom) + 1)];
				};
			};
		};
	case "AAFbackpacks" :
		{
		if (_amountrandom == 0) then 
			{for [{_i=_amountdifferent}, {_i > 0}, {_i = _i - 1}] do   
				{
					_box addBackpackCargoGlobal [(selectRandom _kind),(_amountperitem)];
				};
			}
		else
			{for [{_i=_amountdifferent}, {_i > 0}, {_i = _i - 1}] do 
				{
				_box addBackpackCargoGlobal [(selectRandom _kind),(_amountperitem + (random _amountrandom) + 1)];
				};
			};
		};
	default 
		{
		if (_amountrandom == 0) then 
			{for [{_i=_amountdifferent}, {_i > 0}, {_i = _i - 1}] do   
				{
					_box addItemCargoGlobal [(selectRandom _kind),(_amountperitem)];
				};
			}
		else
			{for [{_i=_amountdifferent}, {_i > 0}, {_i = _i - 1}] do 
				{
				_box addItemCargoGlobal [(selectRandom _kind),(_amountperitem + (random _amountrandom) + 1)];
				};
			};
		};
};
//Waffenarrays
