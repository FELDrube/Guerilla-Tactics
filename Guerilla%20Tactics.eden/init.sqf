Fahr_geupgr = [];
_upgrinit = execVM "Server\upgrinit.sqf";
waitUntil {scriptDone _upgrinit};
if (isServer) then {[anfangsmhq] execVM "vehicles\Tbox\mhq.sqf";};
sleep 80;
_spawns = [Start_1,Start_2,Start_3,Start_4,Start_5,Start_6,Start_7,Start_8,Start_9];
_spawn = selectRandom _spawns;
if (isServer) then {
	starttruck setPos [(getPos _spawn) select 0, (getPos _spawn) select 1, ((getPos _spawn) select 2) + 3];
	starttruck setVehicleLock "UNLOCKED";
	starttruck setFuel 1;
	anfangsmhq setPos [((getPos starttruck) select 0) + 10, (getPos starttruck) select 1, (getPos starttruck) select 2];
	anfangsmhq setVehicleLock "UNLOCKED";
	anfangsmhq setFuel 1;
};

Basealive = false;

ChotainBefreit = false;
DurrasBefreit = false;
EntreDeuxBefreit = false;
GravetteBefreit = false;
FlughafenBefreit = false;
FigariBefreit = false;
LamentinBefreit = false;
LeMouleBefreit = false;
LarunsBefreit = false;
LevieBefreit = false;
MBasisBefreit = false;
MBasis2Befreit = false;
MeauxBefreit = false;
MortonBefreit = false;
MontignacBefreit = false;
ProvinsBefreit = false;
ReginaBefreit = false;
SaintPhillipeBefreit = false;
SaintPierreBefreit = false;
VernonBefreit = false;
TyroneBefreit = false;

Chotain_FF = 0;
Durras_FF = 0;
EntreDeux_FF = 0;
Gravette_FF = 0;
Flughafen_FF = 0;
Figari_FF = 0;
Lamentin_FF = 0;
LeMoule_FF = 0;
Laruns_FF = 0;
Levie_FF = 0;
MBasis_FF = 0;
MBasis2_FF = 0;
Meaux_FF = 0;
Morton_FF = 0;
Montignac_FF = 0;
Provins_FF = 0;
Regina_FF = 0;
SaintPhillipe_FF = 0;
SaintPierre_FF = 0;
Vernon_FF = 0;
Tyrone_FF = 0;


DurrasPruef = false;
EntreDeuxPruef = false;
GravettePruef = false;
FlughafenPruef = false;
FigariPruef = false;
LamentinPruef = false;
LeMoulePruef = false;
LarunsPruef = false;
LeviePruef = false;
MBasisPruef = false;
MBasis2Pruef = false;
MeauxPruef = false;
MortonPruef = false;
MontignacPruef = false;
ProvinsPruef = false;
ReginaPruef = false;
SaintPhillipePruef = false;
SaintPierrePruef = false;
VernonPruef = false;
TyronePruef = false;


GrosseSiedlungen = 0;
KleineSiedlungen = 0;
LagerBasemaxres = 0;
LagerBasemaxmuni = 0;

MHQ1alive = false;
MHQ2alive = false;
MHQ3alive = false;

AmTruck1alive = false;
AmTruck2alive = false;

Kaempfer = 0;
Fahrzeuge = 0;

ResVert = [0,0,0,0,0,0]; //[Hauptbasis,MHQ1,MHQ2,MHQ3, ,]
MuniVert = [0,0,0]; //[Hauptbasis, Transporter 1, Transporter 2]

_igiload = execVM "IgiLoad\IgiLoadInit.sqf";
