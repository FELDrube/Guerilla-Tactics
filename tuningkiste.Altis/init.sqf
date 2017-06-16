Fahr_geupgr = [];
_upgrinit = execVM "Server\upgrinit.sqf";
waitUntil {scriptDone _upgrinit};
//_igiload = execVM "IgiLoad\IgiLoadInit.sqf";
 

//-------------zu testzwecken----------------
Lamentin_FF = true;
Basealive = false;

GrosseSiedlungen = 0;
KleineSiedlungen = 0;
LagerBasemaxres = 0;
LagerBasemaxmuni = 0;

MHQ1alive = false;
MHQ2alive = false;
MHQ3alive = false;

AmTruck1alive = false;
AmTruck2alive = false;

Kaempfer = 3 ;
Fahrzeuge = 0;

ResVert = [200000,0,0,0,0,0]; //[Hauptbasis,MHQ1,MHQ2,MHQ3, ,]
MuniVert = [200000,0,0]; //[Hauptbasis, Transporter 1, Transporter 2]

