/*cliS_actionNitro.sqf
By: Hellop 2008
Copyright: Released to the Public Domain.  It would be cool if you gave me credit in your mission if you use it.
Purpose: Simulate Nitrous Oxide speed-boost for vehicles.  Sets global variable on client computer, cli_nitroLock 
so that the nitro can't be engaged more than once at at time.

Pre: 1. Global var: cli_nitroLock = true;
2. Player's vehicle has an action menu item enabled that runs this script. e.g. in the initline of a car/tank:
this addEventHandler ["getin", {
if ((_this select 1) == "driver") then {
actionIDNitro = _this select 0 addAction ["Nitro", "client\action\cliS_actionNitro.sqf"];  
}; 
}]; 
this addEventHandler ["getout", {_this select 0 removeAction actionIDNitro;}]; 

Post: cli_nitroLock is set to true;

Testing: 5 min. reverse doesn't work.  Would be nice if it worked dynamically from vehicle weight/maxspeed.
Air Vehicles not tested.
*/

private ["_obj", "_vel", "_tmrInterval", "_dir", "_maxSpeed"];

_actionID = _this select 2; 
_obj = vehicle player;
//Tanks and stuff get less nitro.
_tmrInterval = .02;
_maxSpeed = 300;
_speedMultiplier = 1.000000000000000000000000000000000001; //2 is good for cars, too much for tanks
_nitroDuration = 1;


//Initialize vars;
_vel = 0;
_velX = 0;
_velY = 0;
_velZ =0;
_dir = 0;
_sinDir = 0;
_cosDir = 0;
_previousVel = velocity _obj;
_previousSpeed = speed _obj;
_curSpeed = 0;
cli_nitroLock = true;
if ((speed _obj) <= 3) then {
player sideChat format ["You must be moving to activate Nitro."];
}
else {    
if (cli_nitroLock) then { 
cli_nitroLock = false;
player sideChat format ["Nitro Engaged."];
//player globalchat format["Time: %1, Vehicle Type: %2, MaxSpeed: %3", time, typeOf _obj, _maxSpeed]; 
_startTime = time;
_tmpSpeedMultiplier = _speedMultiplier;
while {(time - _startTime) < _nitroDuration} do { 
sleep _tmrInterval;
_vel = velocity _obj;
_curSpeed = (speed _obj);
if (((abs _curSpeed) - (abs _previousSpeed)) > 30) then {_vel = _previousVel};  //To prevent getting thrown far in collisions
_velX = _vel select 0;
_velY = _vel select 1;
_velZ = _vel select 2;
_dir = getdir _obj;
//player globalChat format ["Speed: %1", speed _obj];
if ((speed _obj) > _maxSpeed) then {_tmpSpeedMultiplier = 0} else {_tmpSpeedMultiplier = _speedMultiplier}; 
_sinDir = _tmpSpeedMultiplier*(sin _dir);
_cosDir = _tmpSpeedMultiplier*(cos _dir);
_obj setvelocity [_velX + _sinDir, _velY + _cosDir, _velZ -.1]; //Keep Z vector moving with gravity
_previousSpeed = _curSpeed;
_previousVel = _vel; 
};
cli_nitroLock = true;
player sideChat format ["Nitro test Done! Ending Vel: %1. Dir: %2, Speed: %3", velocity _obj, direction _obj, speed _obj];
_obj removeAction _actionID;
sleep 30;
_obj addAction ["BOOST!","vehicles\limo\cliS_actionNitro.sqf"];
};
};