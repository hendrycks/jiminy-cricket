"SEARCH <ROOM "

"DUNGEON for
			   Interlogic SF Game
       (c) Copyright 1981,1982 Infocom, Inc. All Rights Reserved
"

<DIRECTIONS NORTH EAST WEST SOUTH UP DOWN IN OUT LAND CROSS>

"SUBTITLE GLOBAL OBJECTS"

<GLOBAL LOAD-ALLOWED 100>

<OBJECT GLOBAL-OBJECTS
	(OBJIDX "0")
	(FLAGS RMUNGBIT INVISIBLE TOUCHBIT SURFACEBIT TRYTAKEBIT
	       SEARCHBIT TRANSBIT WEARBIT)>

<OBJECT LOCAL-GLOBALS
	(OBJIDX "1")
	(IN GLOBAL-OBJECTS)
	(SYNONYM ZZMGCK)>
;"Yes, this synonym for LOCAL-GLOBALS needs to exist... sigh"

<OBJECT ROOMS>

<OBJECT INTNUM
	(OBJIDX "2")
	(IN GLOBAL-OBJECTS)
	(SYNONYM INTNUM)
	(DESC "number")
	(ACTION INTNUM-FCN)>

<OBJECT PSEUDO-OBJECT
	(OBJIDX "3")
	(DESC "pseudo")
	(ACTION INTNUM-FCN)>

<OBJECT IT	;"was IT"
	(OBJIDX "4")
	(IN GLOBAL-OBJECTS)
	(SYNONYM IT THAT THIS HIM)
	(DESC "random object")
	(FLAGS NDESCBIT)>

<OBJECT PLANTERS
	(OBJIDX "5")
	(IN LOCAL-GLOBALS)
	(SYNONYM PLANTERS PLANT BOX BOXES)
	(ADJECTIVE DEAD)
	(DESC "planter")
	(FLAGS NDESCBIT)
	(ACTION PLANTER-FCN)>

<OBJECT STAIRS
	(OBJIDX "6")
	(IN LOCAL-GLOBALS)
	(SYNONYM STAIRS STEPS LADDER STAIRWAY)
	(DESC "stairs")
	(FLAGS NDESCBIT CLIMBBIT)>

<OBJECT GROUND	;"was GROUND"
	(OBJIDX "7")
	(IN GLOBAL-OBJECTS)
	(SYNONYM GROUND EARTH FLOOR DIRT)
	(DESC "ground")
	(ACTION GROUND-FCN)>

<OBJECT DEBRIS	;"was GROUND"
	(OBJIDX "8")
	(IN GLOBAL-OBJECTS)
	(SYNONYM GARBAGE DEBRIS LEAVES)
	(DESC "debris")
	(ACTION DEBRIS-FCN)>

<OBJECT HANDS	;"was HANDS"
	(OBJIDX "9")
	(IN GLOBAL-OBJECTS)
	(SYNONYM PAIR HANDS)
	(ADJECTIVE BARE)
	(DESC "pair of hands")
	(FLAGS NDESCBIT TOOLBIT)>

<OBJECT ADVENTURER	;"was ADVENTURER"
	(OBJIDX "10")
	(IN SPACESHIP-BRIDGE)
	(SYNONYM ADVENTURER)
	(DESC "cretin")
	(FLAGS VILLAIN NDESCBIT INVISIBLE )
	(ACTION ADVENTURER-FCN)>

<OBJECT ME
	(OBJIDX "11")
	(IN GLOBAL-OBJECTS)
	(SYNONYM ME MYSELF SELF WE)
	(DESC "you")
	(FLAGS VILLAIN)
	(ACTION CRETIN)>

\

; "SUBTITLE ROOMS"

; "SUBITLE YOUR SPACESHIP"

<ROOM SPACESHIP-BRIDGE
      (OBJIDX "152")
      (IN ROOMS)
      (DESC "Bridge")
      (WEST PER BRIDGE-EXITS) ;"SPACESHIP-QUARTERS"
      (EAST PER BRIDGE-EXITS) ;"SPACESHIP-STORES"
      (SOUTH PER BRIDGE-EXITS) ;"SPACESHIP-AIRLOCK"
      (OUT PER BRIDGE-EXITS)  ;"SPACESHIP-AIRLOCK"
      (FLAGS RLANDBIT ONBIT)
      (ACTION BRIDGE-FCN)
      (GLOBAL COUCH WINDOW AIRLOCK AIRLOCK-INNER ALARM MISSION-STATUS CONTROLS)
      (PSEUDO "OBJECT" OBJECT-PSEUDO)>

<OBJECT REGISTRATION
	(OBJIDX "12")
	(IN SPACESHIP-BRIDGE)
	(SYNONYM REGISTRATION)
	(DESC "registration")
	(FLAGS NDESCBIT READBIT)
	(TEXT
"   Mining Class Ship \"Starcross\"|
      Registered out of Ceres|
      Registration 47291AA-4X|
|
     Designed by David Lebling|
Constructed in 2178, Luna City Docks|
     by Frobozzco Astronautics|
         and Infocom, Inc.|
")>

<OBJECT MISSION-STATUS
	(OBJIDX "13")
	(IN LOCAL-GLOBALS)
	(SYNONYM STATUS SITUATION REPORT)
	(ADJECTIVE STATUS MISSION)
	(DESC "status")
	(FLAGS NDESCBIT)>

<OBJECT ARTIFACT
	(OBJIDX "14")
	(IN GLOBAL-OBJECTS)
	(SYNONYM ARTIFACT)
	(DESC "artifact")
	(ACTION ARTIFACT-FCN)
	(FLAGS NDESCBIT)>

<OBJECT ALARM
	(OBJIDX "15")
	(IN LOCAL-GLOBALS)
	(SYNONYM ALARM BELL)
	(DESC "alarm")
	(FLAGS NDESCBIT)
	(ACTION ALARM-FCN)>

<OBJECT RED-BUTTON
	(OBJIDX "16")
	(IN SPACESHIP-BRIDGE)
	(SYNONYM BUTTON)
	(ADJECTIVE RED)
	(DESC "red button")
	(FLAGS NDESCBIT)
	(ACTION ALARM-FCN)>

<OBJECT DETECTOR
	(OBJIDX "17")
	(IN SPACESHIP-BRIDGE)
	(SYNONYM DETECTOR SCREEN)
	(ADJECTIVE MASS READOUT)
	(DESC "mass detector")
	(FLAGS NDESCBIT)
	(ACTION DETECTOR-FCN)>

<OBJECT BUTTON
	(OBJIDX "18")
	(IN SPACESHIP-BRIDGE)
	(SYNONYM BUTTON)
	(ADJECTIVE BLUE)
	(DESC "blue button")
	(FLAGS NDESCBIT)
	(ACTION BUTTON-FCN)>

<OBJECT CHART
	(OBJIDX "19")
	(SYNONYM CHART MAP OUTPUT)
	(ADJECTIVE ANOMALY MASS DETECTOR)
	(DESC "mass detector output")
	(FLAGS TAKEBIT READBIT)
	(SIZE 1)
	(TEXT
"The output shows major mass concentrations in the vicinity, each with
a code designation and the appropriate R, Theta, and Phi to describe its
location relative to yours.")>

<OBJECT COURSE
	(OBJIDX "20")
	(IN GLOBAL-OBJECTS)
	(SYNONYM COURSE PROGRAM)
	(ADJECTIVE NEW NAVIGATIONAL)
	(DESC "course")
	(FLAGS NDESCBIT)>

<GLOBAL MASSES
	<LTABLE UM08 UM12 UM24 UM28 UM31 UM52 UM70 UM91>>

<GLOBAL MASS-LOCS
	<TABLE 8 ;"number of objects in table"
	       ;"R THETA PHI"
		150 210  17
	        100 345 107
	        100 285  87
	        250  45 178
	        150 105  67
	        175 165  35
		100 135 101
	         50  15 121>>

<GLOBAL KNOWNS
	<LTABLE AB40 AX87 AX32 AX01 AX71 US75 MARS>>

<GLOBAL KNOWN-LOCS
	<TABLE 7 ;"number of objects in table"
	       ;"R THETA PHI"
		250 300  22
		125  75 102
	        125 240 105
	        200 240 134
	        125 180  47
	        175 135  34
	        250 120  12>>

<OBJECT UM08
	(OBJIDX "21")
	(IN GLOBAL-OBJECTS)
	(SYNONYM UM08)
	(ADJECTIVE MASS)
	(DESC "mass UM08")
	(FLAGS NDESCBIT)
	(ACTION MASS-FCN)>

<OBJECT UM12
	(OBJIDX "22")
	(IN GLOBAL-OBJECTS)
	(SYNONYM UM12)
	(ADJECTIVE MASS)
	(DESC "mass UM12")
	(FLAGS NDESCBIT)
	(ACTION MASS-FCN)>

<OBJECT UM24
	(OBJIDX "23")
	(IN GLOBAL-OBJECTS)
	(SYNONYM UM24)
	(ADJECTIVE MASS)
	(DESC "mass UM24")
	(FLAGS NDESCBIT)
	(ACTION MASS-FCN)>

<OBJECT UM28
	(OBJIDX "24")
	(IN GLOBAL-OBJECTS)
	(SYNONYM UM28)
	(ADJECTIVE MASS)
	(DESC "mass UM28")
	(FLAGS NDESCBIT)
	(ACTION MASS-FCN)>

<OBJECT UM31
	(OBJIDX "25")
	(IN GLOBAL-OBJECTS)
	(SYNONYM UM31)
	(ADJECTIVE MASS)
	(DESC "mass UM31")
	(FLAGS NDESCBIT)
	(ACTION MASS-FCN)>

<OBJECT UM52
	(OBJIDX "26")
	(IN GLOBAL-OBJECTS)
	(SYNONYM UM52)
	(ADJECTIVE MASS)
	(DESC "mass UM52")
	(FLAGS NDESCBIT)
	(ACTION MASS-FCN)>

<OBJECT UM70
	(OBJIDX "27")
	(IN GLOBAL-OBJECTS)
	(SYNONYM UM70)
	(ADJECTIVE MASS)
	(DESC "mass UM70")
	(FLAGS NDESCBIT)
	(ACTION MASS-FCN)>

<OBJECT UM91
	(OBJIDX "28")
	(IN GLOBAL-OBJECTS)
	(SYNONYM UM91)
	(ADJECTIVE MASS)
	(DESC "mass UM91")
	(FLAGS NDESCBIT)
	(ACTION MASS-FCN)>

<OBJECT AB40
	(OBJIDX "29")
	(IN GLOBAL-OBJECTS)
	(SYNONYM AB40 CERES)
	(ADJECTIVE MASS)
	(DESC "mass AB40")
	(FLAGS NDESCBIT)
	(ACTION MASS-FCN)>

<OBJECT AX87
	(OBJIDX "30")
	(IN GLOBAL-OBJECTS)
	(SYNONYM AX87)
	(ADJECTIVE MASS)
	(DESC "mass AX87")
	(FLAGS NDESCBIT)
	(ACTION MASS-FCN)>

<OBJECT AX32
	(OBJIDX "31")
	(IN GLOBAL-OBJECTS)
	(SYNONYM AX32)
	(ADJECTIVE MASS)
	(DESC "mass AX32")
	(FLAGS NDESCBIT)
	(ACTION MASS-FCN)>

<OBJECT AX01
	(OBJIDX "32")
	(IN GLOBAL-OBJECTS)
	(SYNONYM AX01)
	(ADJECTIVE MASS)
	(DESC "mass AX01")
	(FLAGS NDESCBIT)
	(ACTION MASS-FCN)>

<OBJECT AX71
	(OBJIDX "33")
	(IN GLOBAL-OBJECTS)
	(SYNONYM AX71)
	(ADJECTIVE MASS)
	(DESC "mass AX71")
	(FLAGS NDESCBIT)
	(ACTION MASS-FCN)>

<OBJECT US75
	(OBJIDX "34")
	(IN GLOBAL-OBJECTS)
	(SYNONYM US75)
	(ADJECTIVE MASS SHIP)
	(DESC "ship US75")
	(FLAGS NDESCBIT)
	(ACTION MASS-FCN)>

<OBJECT MARS
	(OBJIDX "35")
	(IN GLOBAL-OBJECTS)
	(SYNONYM MARS)
	(ADJECTIVE PLANET MASS)
	(DESC "Mars")
	(FLAGS NDESCBIT)
	(ACTION MASS-FCN)>

<OBJECT SHIP
	(OBJIDX "36")
	(IN GLOBAL-OBJECTS)
	(SYNONYM SHIP SPACES STARCROSS)
	(ADJECTIVE SPACE)
	(DESC "ship")
	(FLAGS NDESCBIT)
	(ACTION SHIP-FCN)>

<OBJECT COUCH
	(OBJIDX "37")
	(IN LOCAL-GLOBALS)
	(SYNONYM COUCH SEAT)
	(ADJECTIVE CONTROL CRASH)
	(DESC "control couch")
	(FLAGS VEHBIT FURNITURE NDESCBIT CLIMBBIT)
	(ACTION COUCH-FCN)
	(CAPACITY 100)>

<OBJECT SEAT-BELT
	(OBJIDX "38")
	(IN SPACESHIP-BRIDGE)
	(SYNONYM BELT SEATBELT)
	(ADJECTIVE SEAT)
	(DESC "seat belt")
	(FLAGS NDESCBIT)
	(ACTION SEAT-BELT-FCN)>

<OBJECT CONTROLS
	(OBJIDX "39")
	(IN LOCAL-GLOBALS)
	(SYNONYM CONTROL PANEL CONSOLE)
	(DESC "control")
	(FLAGS NDESCBIT)
	(ACTION CONTROLS-FCN)>

<OBJECT WINDOW
	(OBJIDX "40")
	(IN LOCAL-GLOBALS)
	(SYNONYM WINDOW PORT PORTHOLE VIEWPORT)
	(ADJECTIVE VIEW)
	(DESC "window")
	(FLAGS VEHBIT NDESCBIT)
	(ACTION PORTHOLE-FCN)>

<ROOM SPACESHIP-QUARTERS
      (OBJIDX "153")
      (IN ROOMS)
      (LDESC "This nook is your spartan living quarters,
containing only a bunk and a bureau. The only exit is to starboard.")
      (DESC "Living Quarters")
      (EAST TO SPACESHIP-BRIDGE)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL ALARM)
      (PSEUDO "BUREAU" BUREAU-PSEUDO)>

<OBJECT BUNK
	(OBJIDX "41")
	(IN SPACESHIP-QUARTERS)
	(SYNONYM BUNK BED COT)
	(DESC "bunk")
	(FLAGS VEHBIT FURNITURE NDESCBIT CLIMBBIT)
	(ACTION BUNK-FCN)
	(CAPACITY 1000)>

<ROOM SPACESHIP-STORES
      (OBJIDX "154")
      (IN ROOMS)
      (LDESC "This cubicle is used for storage. The only exit is to port.")
      (DESC "Storage")
      (WEST TO SPACESHIP-BRIDGE)
      (GLOBAL ALARM)
      (FLAGS RLANDBIT ONBIT)>

<OBJECT SPACESUIT
	(OBJIDX "42")
	(IN SPACESHIP-STORES)
	(SYNONYM SPACES SUIT)
	(ADJECTIVE SPACE PRESSURE MY GOOD)
	(FDESC "Hanging on a rack is your space suit.")
	(DESC "space suit")
	(FLAGS TAKEBIT TRYTAKEBIT)
	(SIZE 20)
	(ACTION SPACESUIT-FCN)>

<OBJECT JUNK-SPACESUIT
	(OBJIDX "43")
	(IN CHIEF)
	(SYNONYM SPACES SUIT)
	(ADJECTIVE TATTERED ALIEN)
	(DESC "tattered suit")
	(FLAGS NDESCBIT TRYTAKEBIT TAKEBIT)
	(SIZE 20)
	(ACTION JUNK-SPACESUIT-FCN)>

<OBJECT SAFETY-LINE
	(OBJIDX "44")
	(IN SPACESHIP-STORES)
	(SYNONYM LINE ROPE)
	(ADJECTIVE SAFETY)
	(DESC "safety line")
	(FLAGS TAKEBIT TRYTAKEBIT)
	(ACTION SAFETY-LINE-FCN)
	(DESCFCN SAFETY-LINE-FCN)>

<OBJECT SAFETY-HOOK
	(OBJIDX "45")
	(IN LOCAL-GLOBALS)
	(SYNONYM HOOK)
	(ADJECTIVE SAFETY)
	(DESC "hook")
	(FLAGS NDESCBIT)>

<ROOM SPACESHIP-AIRLOCK
      (OBJIDX "155")
      (IN ROOMS)
      (DESC "Airlock")
      (SOUTH TO SPACESHIP-BRIDGE IF AIRLOCK-INNER IS OPEN)
      (IN TO SPACESHIP-BRIDGE IF AIRLOCK-INNER IS OPEN)
      (NORTH PER AIRLOCK-EXIT-FCN)
      (OUT PER AIRLOCK-EXIT-FCN)
      (UP PER AIRLOCK-EXIT-FCN)
      (FLAGS RLANDBIT ONBIT)
      (ACTION AIRLOCK-FCN)
      (GLOBAL AIRLOCK AIRLOCK-INNER AIRLOCK-OUTER ALARM SAFETY-HOOK)>

<OBJECT AIRLOCK
	(OBJIDX "46")
	(IN LOCAL-GLOBALS)
	(SYNONYM AIRLOCK)
	(DESC "airlock")
	(ACTION AIRLOCK-FCN)>

<ROOM DEEP-SPACE	;"where you go if you leave ship in space"
      (OBJIDX "156")
      (IN ROOMS)
      (DESC "Outside Ship")
      (IN TO SPACESHIP-AIRLOCK IF AIRLOCK-OUTER IS OPEN)
      (FLAGS SPACEBIT ONBIT)
      (ACTION DEEP-SPACE-FCN)
      (GLOBAL AIRLOCK-OUTER SAFETY-HOOK)>

<ROOM OUTER-SPACE	;"where you go if you leave artifact in space"
      (OBJIDX "157")
      (IN ROOMS)
      (DESC "Floating in Space")
      (FLAGS SPACEBIT ONBIT)
      (ACTION OUTER-SPACE-FCN)>

<OBJECT AIRLOCK-OUTER
	(OBJIDX "47")
	(IN LOCAL-GLOBALS)
	(SYNONYM DOOR BULKHEAD)
	(ADJECTIVE OUTER)
	(DESC "outer door")
	(FLAGS NDESCBIT DOORBIT)
	(ACTION AIRLOCK-DOORS-FCN)>

<OBJECT AIRLOCK-INNER
	(OBJIDX "48")
	(IN LOCAL-GLOBALS)
	(SYNONYM DOOR BULKHEAD)
	(ADJECTIVE INNER)
	(DESC "inner door")
	(FLAGS NDESCBIT DOORBIT)
	(ACTION AIRLOCK-DOORS-FCN)>

<OBJECT COMPUTER
	(OBJIDX "49")
	(IN SPACESHIP-BRIDGE)
	(SYNONYM COMPUTER POWER)
	(ADJECTIVE NAVIGATIONAL FROBOZZCO)
	(DESC "computer")
	(FLAGS NDESCBIT VICBIT)
	(ACTION COMPUTER-FCN)>
	
<OBJECT INSTRUCTIONS
	(OBJIDX "50")
	(IN SPACESHIP-BRIDGE)
	(SYNONYM SHEET INSTRUCTIONS PAPER)
	(ADJECTIVE FADED)
	(FDESC
"Taped to the wall is a slightly faded instruction sheet for the computer.")
	(DESC "instruction sheet")
	(FLAGS READBIT TAKEBIT)
	(TEXT

"|
\"Your Frobozzco FB-69105 Computer|
|
For your safety, this voice-activated computer will not respond unless
directly addressed by the operator. Prefix all commands with the word
'computer,' as in 'Computer, Set course for Mars.'  Navigational
commands may also be given in terms of the R, theta, and phi of the
destination, as in 'Computer, R is 100. Theta is 200. Phi is 300.'
Following these instructions will ensure full satisfaction from your new
Frobozzco Computer.\"|
")>

<OBJECT TAPE-PLAYER
	(OBJIDX "51")
	(IN SPACESHIP-QUARTERS)
	(SYNONYM RECORDER PLAYER VCR LIBRARY)
	(ADJECTIVE TAPE TAPES VIDEO AUDIO)
	(DESC "tape library")
	(FLAGS TAKEBIT TRYTAKEBIT)
	(ACTION TAPE-FCN)
	(SIZE 10)>

\

; "SUBTITLE EXTERIOR OF ARTIFACT"

<ROOM RED-DOCK
      (OBJIDX "158")
      (IN ROOMS)
      (DESC "Red Dock")
      (FLAGS RLANDBIT SPACEBIT ONBIT)
      (DOWN TO SPACESHIP-AIRLOCK IF AIRLOCK-OUTER IS OPEN)
      (SOUTH TO SPACESHIP-AIRLOCK IF AIRLOCK-OUTER IS OPEN)
      (UP TO RED-LOCK IF RED-OUTER IS OPEN)
      (IN TO RED-LOCK IF RED-OUTER IS OPEN)
      (ACTION RED-DOCK-FCN)
      (GLOBAL RED-OUTER SAFETY-HOOK)
      (VALUE 25)>

<ROOM RED-LOCK
      (OBJIDX "159")
      (IN ROOMS)
      (DESC "Red Airlock")
      (FLAGS RLANDBIT ONBIT SPACEBIT)
      (OUT TO RED-DOCK IF RED-OUTER IS OPEN)
      (DOWN TO RED-DOCK IF RED-OUTER IS OPEN)
      (UP TO RED-THREE IF RED-INNER IS OPEN)
      (IN TO RED-THREE IF RED-INNER IS OPEN)
      (ACTION RED-LOCK-FCN)
      (GLOBAL RED-OUTER RED-INNER)>

<OBJECT BLACK-KEY
	(OBJIDX "52")
	(SYNONYM KEY RODS ROD)
	(ADJECTIVE BLACK CRYSTAL)
	(DESC "black rod")
	(FLAGS TAKEBIT KEYBIT TRANSBIT)
	(ACTION BLACK-KEY-FCN)
	(VALUE 25)>

<OBJECT RED-OUTER
	(OBJIDX "53")
	(IN LOCAL-GLOBALS)
	(SYNONYM DOOR AIRLOCK BULKHEAD)
	(ADJECTIVE RED OUTER)
	(DESC "red outer door")
	(FLAGS DOORBIT)
	(ACTION RED-DOORS-FCN)>

<OBJECT RELIEF
	(OBJIDX "54")
	(IN RED-DOCK)
	(SYNONYM RELIEF SCULPTURE SURFACE BUMPS)
	(ADJECTIVE METAL SILVER)
	(DESC "metal relief")
	(LDESC
"A round metal sculpture or relief covers part of the airlock door. It is
made up of thousands of tiny hexagonal columns which extend various lengths
from the surface, making a three-dimensional representation. You can examine
it more closely to see the details.")
	(FLAGS OPENBIT CONTBIT SEARCHBIT)
	(ACTION RELIEF-FCN)>

<OBJECT BUMP-2
	(OBJIDX "55")
	(IN RED-DOCK)
	(SYNONYM BUMP COLUMN)
	(ADJECTIVE METAL EIGHTH NINTH TENTH CENTER OUTER LAST)
	(DESC "eighth, ninth, or tenth bumps")
	(FLAGS NDESCBIT)
	(ACTION BUMP-FCN)>

<OBJECT BUMP
	(OBJIDX "56")
	(IN RED-DOCK)
	(SYNONYM BUMP COLUMN)
	(ADJECTIVE METAL FIRST SECOND THIRD FOURTH FIFTH SIXTH SEVENTH)
	(DESC "first, second, third, fourth, fifth, sixth, or seventh bumps")
	(FLAGS NDESCBIT)
	(ACTION BUMP-FCN)>

<OBJECT BABY-BUMP
	(OBJIDX "57")
	(SYNONYM BUMP COLUMN HEXAGON)
	(ADJECTIVE SMALL LONG NEW TINY)
	(DESC "small bump")
	(FLAGS NDESCBIT)
	(ACTION BUMP-FCN)>

<OBJECT RED-INNER
	(OBJIDX "58")
	(IN LOCAL-GLOBALS)
	(SYNONYM AIRLOCK DOOR BULKHEAD)
	(ADJECTIVE RED INNER)
	(DESC "red inner door")
	(FLAGS DOORBIT)
	(ACTION RED-DOORS-FCN)>

<ROOM BLUE-DOCK
      (OBJIDX "160")
      (IN ROOMS)
      (LDESC
"You are viewing this area, color-coded in blue, through the first of several
transparent bubbles connecting the dock with a large spherical object tethered
by silvery ropes. The blue airlock dome is behind you, and the spherical
spaceship is aft of here. There is a hook by the airlock.")
      (DESC "Blue Dock")
      (FLAGS RLANDBIT ONBIT)
      (DOWN TO BUBBLE-ROOM)
      (SOUTH TO BUBBLE-ROOM)
      (UP TO BLUE-LOCK IF BLUE-OUTER IS OPEN)
      (IN TO BLUE-LOCK IF BLUE-OUTER IS OPEN)
      (GLOBAL BLUE-OUTER SAFETY-HOOK)
      (PSEUDO "BUBBLE" BUBBLE-PSEUDO)>

<ROOM BUBBLE-ROOM
      (OBJIDX "161")
      (IN ROOMS)
      (DESC "Bubbles")
      (LDESC
"This is a series of plastic bubbles connecting the blue airlock
with a spherical spaceship docked aft of here. The bubbles are made of
a thick material which is nonetheless transparent.")
      (NORTH TO BLUE-DOCK)
      (SOUTH TO SPHERE-SHIP)
      (IN TO SPHERE-SHIP)
      (ACTION BUBBLE-ROOM-FCN)
      (FLAGS RLANDBIT ONBIT)
      (PSEUDO "BUBBLE" BUBBLE-PSEUDO)>

<ROOM SPHERE-SHIP
      (OBJIDX "162")
      (IN ROOMS)
      (DESC "Spherical Ship")
      (LDESC
"You are within a huge bubble, transparent from this side. The interior is
crisscrossed with wire webbing, so that an agile creature could move around
using only the wires. Objects are stuck in the wires in various out-of-reach
places. The whole impression is of a rather untidy spiderweb. The connection
to the artifact is at the forward end of the sphere.")
      (NORTH TO BUBBLE-ROOM)
      (OUT TO BUBBLE-ROOM)
      (ACTION SPHERE-SHIP-FCN)
      (FLAGS RLANDBIT ONBIT)>

<OBJECT SPIDER
	(OBJIDX "59")
	(IN SPHERE-SHIP)
	(SYNONYM SPIDER GURTHARK BESNAP)
	(ADJECTIVE GIANT)
	(DESC "giant spider")
	(FLAGS VILLAIN OPENBIT CONTBIT VICBIT SEARCHBIT)
	(LDESC
"Crouched in the center of the sphere, where the wires converge, is a
creature resembling a giant spider. A closer look reveals that it is not
an insect, but rather a multi-legged, endoskeletal mammal. It has huge eyes
and impressive grinding teeth. It grips the wires with many tiny fingers, and
gazes at you with almost hypnotic intensity.")
	(ACTION SPIDER-FCN)>

<OBJECT YELLOW-KEY
	(OBJIDX "60")
	(SYNONYM KEY RODS ROD OBJECT)
	(ADJECTIVE YELLOW CRYSTAL)
	(DESC "yellow rod")
	(VALUE 25)
	(FLAGS TAKEBIT KEYBIT TRANSBIT)>

<OBJECT TRANSLATOR
	(OBJIDX "61")
	(IN SPIDER)
	(SYNONYM TRANSLATOR OBJECT)
	(DESC "translator")
	(ACTION TRANSLATOR-FCN)
	(FLAGS NDESCBIT)>

<ROOM BLUE-LOCK
      (OBJIDX "163")
      (IN ROOMS)
      (DESC "Blue Airlock")
      (FLAGS RLANDBIT ONBIT)
      (OUT TO BLUE-DOCK IF BLUE-OUTER IS OPEN)
      (DOWN TO BLUE-DOCK IF BLUE-OUTER IS OPEN)
      (IN TO BLUE-THREE IF BLUE-INNER IS OPEN)
      (UP TO BLUE-THREE IF BLUE-INNER IS OPEN)
      (ACTION BLUE-LOCK-FCN)
      (GLOBAL BLUE-OUTER BLUE-INNER)>

<OBJECT BLUE-OUTER
	(OBJIDX "62")
	(IN LOCAL-GLOBALS)
	(SYNONYM DOOR AIRLOCK)
	(ADJECTIVE BLUE OUTER BULKHEAD)
	(DESC "blue outer door")
	(FLAGS DOORBIT)
	(ACTION BLUE-DOORS-FCN)>

<OBJECT BLUE-INNER
	(OBJIDX "63")
	(IN LOCAL-GLOBALS)
	(SYNONYM AIRLOCK DOOR BULKHEAD)
	(ADJECTIVE BLUE INNER)
	(DESC "blue inner door")
	(FLAGS DOORBIT)
	(ACTION BLUE-DOORS-FCN)>

<ROOM YELLOW-DOCK
      (OBJIDX "164")
      (IN ROOMS)
      (DESC "Yellow Dock")
      (FLAGS RLANDBIT SPACEBIT ONBIT)
      (UP TO YELLOW-LOCK IF YELLOW-OUTER IS OPEN)
      (IN TO YELLOW-LOCK IF YELLOW-OUTER IS OPEN)
      (WEST PER YELLOW-DOCK-EXITS)
      (ACTION YELLOW-DOCK-FCN)
      (GLOBAL YELLOW-OUTER SAFETY-HOOK)
      (PSEUDO "ALIEN" SCORCHED-PSEUDO "BODY" SCORCHED-PSEUDO)>

<ROOM YELLOW-DOCK-EDGE
      (OBJIDX "165")
      (IN ROOMS)
      (DESC "Among Debris")
      (LDESC
"You are among the blackened and twisted metal left by a huge explosion. The
tentacle housings have been destroyed. To starboard is the airlock dome.")
      (FLAGS RLANDBIT SPACEBIT ONBIT)
      (EAST TO YELLOW-DOCK)
      (ACTION YELLOW-DOCK-EDGE-FCN)>

<ROOM YELLOW-LOCK
      (OBJIDX "166")
      (IN ROOMS)
      (DESC "Yellow Airlock")
      (FLAGS RLANDBIT)
      (OUT TO YELLOW-DOCK IF YELLOW-OUTER IS OPEN)
      (IN TO YELLOW-THREE IF YELLOW-INNER IS OPEN)
      (UP TO YELLOW-THREE IF YELLOW-INNER IS OPEN)
      (DOWN TO YELLOW-DOCK IF YELLOW-OUTER IS OPEN)
      (ACTION YELLOW-LOCK-FCN)
      (GLOBAL YELLOW-OUTER YELLOW-INNER)>

<OBJECT YELLOW-OUTER
	(OBJIDX "64")
	(IN LOCAL-GLOBALS)
	(SYNONYM AIRLOCK DOOR BULKHEAD)
	(ADJECTIVE YELLOW OUTER)
	(DESC "yellow outer door")
	(FLAGS DOORBIT)
	(ACTION YELLOW-DOORS-FCN)>

<OBJECT SCORCHED-ALIEN
	(OBJIDX "65")
	(IN YELLOW-DOCK-EDGE)
	(SYNONYM ALIEN REPTILE)
	(ADJECTIVE SCORCHED)
	(LDESC
"Entangled in the wreckage is the scorched body of a creature resembling a
large reptile, almost a miniature allosaurus, clad in the remains of a space
suit.")
	(DESC "scorched alien")
	(FLAGS VILLAIN OPENBIT CONTBIT SEARCHBIT)>

<OBJECT PINK-KEY
	(OBJIDX "66")
	(IN SCORCHED-ALIEN)
	(SYNONYM KEY RODS ROD)
	(ADJECTIVE PINK CRYSTAL)
	(DESC "pink rod")
	(FLAGS TAKEBIT KEYBIT TRANSBIT)
	(VALUE 25)
	(FDESC "Clutched in the reptile's claw is a pink rod.")>

<OBJECT YELLOW-INNER
	(OBJIDX "67")
	(IN LOCAL-GLOBALS)
	(SYNONYM AIRLOCK DOOR BULKHEAD)
	(ADJECTIVE YELLOW INNER)
	(DESC "yellow inner door")
	(FLAGS DOORBIT)
	(ACTION YELLOW-DOORS-FCN)>

<ROOM GREEN-DOCK
      (OBJIDX "167")
      (IN ROOMS)
      (LDESC
"A plastic umbilical leads away to port from the green airlock. There is
a hook next to the airlock.")
      (DESC "Green Dock")
      (FLAGS RLANDBIT ONBIT)
      (WEST TO UMBILICAL)
      (DOWN TO UMBILICAL)
      (UP TO GREEN-LOCK IF GREEN-OUTER IS OPEN)
      (IN TO GREEN-LOCK IF GREEN-OUTER IS OPEN)
      (GLOBAL GREEN-OUTER SAFETY-HOOK)>

<ROOM GREEN-LOCK
      (OBJIDX "168")
      (IN ROOMS)
      (DESC "Green Airlock")
      (FLAGS RLANDBIT ONBIT)
      (OUT TO GREEN-DOCK IF GREEN-OUTER IS OPEN)
      (DOWN TO GREEN-DOCK IF GREEN-OUTER IS OPEN)
      (UP PER GREEN-LOCK-EXIT)
      ;(IN PER GREEN-LOCK-EXIT) ;"FIX THIS IF COMPILER EVER RECOMPILED..."
      (ACTION GREEN-LOCK-FCN)
      (GLOBAL GREEN-OUTER GREEN-INNER)>

<OBJECT GREEN-OUTER
	(OBJIDX "68")
	(IN LOCAL-GLOBALS)
	(SYNONYM DOOR AIRLOCK BULKHEAD)
	(ADJECTIVE GREEN OUTER)
	(DESC "green outer door")
	(FLAGS DOORBIT)
	(ACTION GREEN-DOORS-FCN)>

<OBJECT GREEN-INNER
	(OBJIDX "69")
	(IN LOCAL-GLOBALS)
	(SYNONYM DOOR AIRLOCK BULKHEAD)
	(ADJECTIVE GREEN INNER)
	(DESC "green inner door")
	(FLAGS DOORBIT OPENBIT)
	(ACTION GREEN-DOORS-FCN)>

\

; "SUBTITLE MAIN HALLWAYS"

<ROOM RED-ONE
      (OBJIDX "169")
      (IN ROOMS)
      (LDESC
"The red hall ends here. A smaller corridor curves away on both sides.
The light is dim and the plants are stunted.")
      (DESC "Red Hall")
      (NORTH "The hall ends here.")
      (SOUTH TO RED-TWO)
      (EAST TO GREEN-ONE)
      (WEST TO BLUE-ONE)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL PLANTERS)>

<ROOM RED-TWO
      (OBJIDX "170")
      (IN ROOMS)
      (LDESC
"This is a long, dim corridor that intersects what looks like a ring corridor.
The overheads are not very bright here, and the plant growth is feeble.")
      (DESC "Red Hall")
      (NORTH TO RED-ONE)
      (SOUTH TO RED-THREE)
      (EAST TO GREEN-TWO)
      (WEST TO BLUE-RED-TWO)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL PLANTERS)>

<ROOM RED-THREE
      (OBJIDX "171")
      (IN ROOMS)
      (LDESC
"This is a wide room with corridors leading in four directions and a ladder
down to the airlock. The lighting is poor, as though the lights were worn out.
Halfway up the walls are planters full of wilted plants.")
      (DESC "Red Hall")
      (DOWN TO RED-LOCK IF RED-INNER IS OPEN)
      (OUT TO RED-LOCK IF RED-INNER IS OPEN)
      (NORTH TO RED-TWO)
      (SOUTH TO RED-FOUR)
      (EAST TO VILLAGE-NW-EDGE)
      (WEST TO BLUE-THREE)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL RED-INNER PLANTERS STAIRS)>

<ROOM RED-FOUR
      (OBJIDX "172")
      (IN ROOMS)
      (LDESC
"This is part of a long hall with failing lights. It intersects with another
corridor at right angles. The plant boxes here are empty.")
      (DESC "Red Hall")
      (NORTH TO RED-THREE)
      (SOUTH TO RED-FIVE)
      (EAST TO VILLAGE-SW-EDGE)
      (WEST TO BLUE-RED-FOUR)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL PLANTERS)>

<ROOM RED-FIVE
      (OBJIDX "173")
      (IN ROOMS)
      (LDESC
"This is the end of the red hall where it T's with the aft-most ring corridor.
The lighting is poor and the plant boxes here are empty and battered.")
      (DESC "Red Hall")
      (NORTH TO RED-FOUR)
      (SOUTH "The hall ends here.")
      (EAST TO GREEN-FIVE)
      (WEST TO BLUE-FIVE)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL PLANTERS)>

<ROOM BLUE-ONE
      (OBJIDX "174")
      (IN ROOMS)
      (LDESC
"The fore end of the blue hall meets a ring corridor here.")
      (DESC "Blue Hall")
      (NORTH "The blue hall ends here.")
      (SOUTH TO BLUE-ONE-TWO)
      (EAST TO RED-ONE)
      (WEST TO YELLOW-ONE)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL PLANTERS)>

<ROOM BLUE-ONE-TWO
      (OBJIDX "175")
      (IN ROOMS)
      (DESC "Blue Hall")
      (LDESC
"This is near the fore end of the blue hall, where a small exit leads to
port. The main corridor continues fore and aft.")
      (NORTH TO BLUE-ONE)
      (SOUTH TO BLUE-TWO)
      (WEST TO OBSERVATORY)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL PLANTERS)>

<ROOM OBSERVATORY
      (OBJIDX "176")
      (IN ROOMS)
      (DESC "Observatory")
      (EAST TO BLUE-ONE-TWO)
      (OUT TO BLUE-ONE-TWO)
      (FLAGS RLANDBIT ONBIT)
      (ACTION OBSERVATORY-FCN)>

<OBJECT SMOKED-GLASS
	(OBJIDX "70")
	(IN CARGO-ROOM)
	(SYNONYM FRAGMENT PIECE)
	(ADJECTIVE SMOKED BLACK GLASS VISOR)
	(FDESC
"A large fragment of black smoked glass from the chief's
helmet visor lies on the floor.")
	(DESC "black visor fragment")
	(FLAGS TAKEBIT TRANSBIT)
	(SIZE 2)>

<OBJECT CLEAR-KEY
	(OBJIDX "71")
	(IN SLIDE-PROJECTOR)
	(SYNONYM KEY RODS ROD RAINBOW)
	(ADJECTIVE CLEAR)
	(DESC "clear rod")
	(FDESC
"A dazzling rainbow of colors bathes a clear crystal rod which rests
in the light path.")
	(VALUE 25)
	(FLAGS INVISIBLE TRYTAKEBIT TAKEBIT KEYBIT TRANSBIT)>

<OBJECT SLIDE-PROJECTOR
	(OBJIDX "72")
	(IN OBSERVATORY)
	(SYNONYM PROJECTOR LASER)
	(ADJECTIVE SLIDE IMAGE HOLOGRAPHIC)
	(DESC "holographic projector")
	(FDESC
"A holographic projector is on one wall.")
	(FLAGS CONTBIT OPENBIT)
	(ACTION SLIDE-PROJECTOR-FCN)
	(CONTFCN SLIDE-PROJECTOR-FCN)
	(CAPACITY 10)>

<OBJECT LASER-BEAM
	(OBJIDX "73")
	(IN OBSERVATORY)
	(SYNONYM BEAM ENERGY LIGHT)
	(ADJECTIVE LASER LIGHT)
	(DESC "light beam")
	(ACTION LASER-BEAM-FCN)
	(FLAGS NDESCBIT VILLAIN)>

<OBJECT MODEL
	(OBJIDX "74")
	(IN OBSERVATORY)
	(SYNONYM MODEL SYSTEM PLANET)
	(ADJECTIVE SOLAR)
	(DESC "model")
	(FLAGS NDESCBIT)>

<ROOM BLUE-TWO
      (OBJIDX "177")
      (IN ROOMS)
      (LDESC 
"The junction of a wide fore-aft corridor and a smaller ring corridor. There is
some dirt on the floor, freshly scattered.")
      (DESC "Blue Hall")
      (NORTH TO BLUE-ONE-TWO)
      (SOUTH TO BLUE-THREE)
      (EAST TO BLUE-RED-TWO)
      (WEST TO YELLOW-TWO)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL PLANTERS)>

<ROOM BLUE-RED-TWO
      (OBJIDX "178")
      (IN ROOMS)
      (LDESC
"The ring corridor here has an exit forward to a large open area. There is
fresh dirt scattered about, and an acrid smell.")
      (DESC "Room on Ring Two")
      (NORTH TO ZOO)
      (WEST TO BLUE-TWO)
      (EAST TO RED-TWO)
      (FLAGS RLANDBIT ONBIT)>

<ROOM BLUE-THREE
      (OBJIDX "179")
      (IN ROOMS)
      (DESC "Blue Hall")
      (LDESC
"A ring corridor joins the blue hall here. There is an entrance (presumably
for the blue docking area) below, and also a way up.")
      (DOWN TO BLUE-LOCK IF BLUE-INNER IS OPEN)
      (OUT TO BLUE-LOCK IF BLUE-INNER IS OPEN)
      (UP PER METAL-BAND-EXIT)
      (NORTH TO BLUE-TWO)
      (SOUTH TO BLUE-34)
      (EAST TO RED-THREE)
      (WEST TO YELLOW-THREE)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL BLUE-INNER PLANTERS LADDER)>

<ROOM BLUE-FOUR
      (OBJIDX "180")
      (IN ROOMS)
      (LDESC
"Another junction, the ring corridor curving away to port and starboard.
The hall is damaged and bare rock protrudes in spots.")
      (DESC "Blue Hall")
      (NORTH TO BLUE-34)
      (SOUTH TO BLUE-FIVE)
      (EAST TO BLUE-RED-FOUR)
      (WEST TO YELLOW-FOUR)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL PLANTERS)>

<ROOM BLUE-FIVE
      (OBJIDX "181")
      (IN ROOMS)
      (LDESC
"The blue corridor goes no further aft, but a ring corridor leads away
to port and starboard.")
      (DESC "Blue Hall")
      (NORTH TO BLUE-FOUR)
      (SOUTH "The hall ends here.")
      (EAST TO RED-FIVE)
      (WEST TO YELLOW-FIVE)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL PLANTERS)>

<ROOM YELLOW-ONE
      (OBJIDX "182")
      (IN ROOMS)
      (LDESC
"This is the fore end of the yellow hall. The planters hold dry, dead
plants. The usual ring corridor joins the main hall.")
      (DESC "Yellow Hall")
      (NORTH "The hall ends here.")
      (SOUTH TO YELLOW-TWO)
      (EAST TO BLUE-ONE)
      (WEST TO GREEN-YELLOW-ONE)
      (FLAGS RLANDBIT)
      (GLOBAL PLANTERS)>

<ROOM YELLOW-TWO
      (OBJIDX "183")
      (IN ROOMS)
      (LDESC
"A junction between the yellow hall and a brightly-lit ring corridor. The
planters have been removed.")
      (DESC "Yellow Hall")
      (NORTH TO YELLOW-ONE)
      (SOUTH TO YELLOW-THREE)
      (EAST TO BLUE-TWO)
      (WEST TO GREEN-TWO)
      (FLAGS RLANDBIT)
      (GLOBAL PLANTERS)>

<ROOM YELLOW-THREE
      (OBJIDX "184")
      (IN ROOMS)
      (LDESC
"This is the intersection between the yellow hall and a large ring corridor.
The airlock for the yellow dock is down from here. The plant boxes are empty.")
      (DESC "Yellow Hall")
      (DOWN TO YELLOW-LOCK IF YELLOW-INNER IS OPEN)
      (OUT TO YELLOW-LOCK IF YELLOW-INNER IS OPEN)
      (NORTH TO YELLOW-TWO)
      (SOUTH TO YELLOW-FOUR)
      (EAST TO BLUE-THREE)
      (WEST TO VILLAGE-NE-EDGE)
      (FLAGS RLANDBIT)
      (GLOBAL YELLOW-INNER PLANTERS LADDER)>

<ROOM YELLOW-FOUR
      (OBJIDX "185")
      (IN ROOMS)
      (LDESC
"This is a wide hall whose maintenance has been neglected. The planters are
untended. A ring corridor leads port and starboard.")
      (DESC "Yellow Hall")
      (NORTH TO YELLOW-THREE)
      (SOUTH TO YELLOW-FOUR-FIVE)
      (EAST TO BLUE-FOUR)
      (WEST TO VILLAGE-SE-EDGE)
      (FLAGS RLANDBIT)
      (GLOBAL PLANTERS)>

<ROOM YELLOW-FOUR-FIVE
      (OBJIDX "186")
      (IN ROOMS)
      (LDESC
"The yellow corridor continues fore and aft, but a well-lit passage leads
starboard.")
      (DESC "Yellow Hall")
      (NORTH TO YELLOW-FOUR)
      (SOUTH TO YELLOW-FIVE)
      (EAST TO FF-ROOM)
      (FLAGS RLANDBIT)
      (GLOBAL PLANTERS)>

<ROOM YELLOW-FIVE
      (OBJIDX "187")
      (IN ROOMS)
      (LDESC
"The yellow hall ends here and a ring corridor curves away to port and
starboard.")
      (DESC "Yellow Hall")
      (NORTH TO YELLOW-FOUR-FIVE)
      (SOUTH "The corridor comes to an end here.")
      (EAST TO BLUE-FIVE)
      (WEST TO GREEN-FIVE)
      (FLAGS RLANDBIT)
      (GLOBAL PLANTERS)>

<ROOM GREEN-ONE
      (OBJIDX "188")
      (IN ROOMS)
      (LDESC
"The green hall ends here at a ring corridor. The planters are well-tended.")
      (DESC "Green Hall")
      (NORTH "The hall ends here.")
      (SOUTH TO GREEN-TWO)
      (EAST TO GREEN-YELLOW-ONE)
      (WEST TO RED-ONE)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL PLANTERS)>

<ROOM GREEN-TWO
      (OBJIDX "189")
      (IN ROOMS)
      (LDESC
"The green hall joins a ring corridor here. The plants here look healthy.")
      (DESC "Green Hall")
      (NORTH TO GREEN-ONE)
      (SOUTH TO VILLAGE-N-EDGE)
      (EAST TO YELLOW-TWO)
      (WEST TO RED-TWO)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL PLANTERS)>

<ROOM VILLAGE
      (OBJIDX "190")
      (IN ROOMS)
      (LDESC
"This section of the hall is filled with primitive huts of various sizes.
They are so close they almost form a single large warren with many entrances.
The only way to continue down the corridor is through this warren. Many aliens
are milling about, of all sizes and colors of fur.")
      (DESC "Village Center")
      (EAST PER ENTER-WARREN)
      (WEST TO VILLAGE-NW-EDGE)
      (FLAGS RLANDBIT ONBIT)
      (ACTION VILLAGE-FCN)
      (GLOBAL GLOBAL-CHIEF ALIENS SPEAR HUTS)
      (PSEUDO "WIFE" WIFE-PSEUDO "CHILD" CHILD-PSEUDO)>

\

"SUBTITLE VILLAGE MAZE"

<ROOM MAZE
      (OBJIDX "191")
      (IN ROOMS)
      (LDESC
"This is an earth and reed burrow within the warren. There are many aliens
here, going about their business. The younger ones stare at you and make
funny noises. There are passages all over the place, and a constant traffic
in and out.")
      (DESC "In the Warren")
      (UP TO MAZE)
      (DOWN TO MAZE)
      (IN TO MAZE)
      (OUT TO MAZE)
      (SOUTH TO MAZE)
      (WEST TO MAZE)
      (EAST TO MAZE)
      (NORTH TO MAZE)
      (ACTION MAZE-FCN)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL GLOBAL-CHIEF ALIENS SPEAR)>

<ROOM GREEN-THREE
      (OBJIDX "192")
      (IN ROOMS)
      (LDESC
"This burrow is deep within the warren and the aliens seem to avoid it.
An exit to port leads back into the warren. The walls are covered with
crude but vibrant paintings depicting a huge spider, a gigantic mouse,
man-sized lizards, and in the center, a being in a space suit. You realize
that this room is the center of the green hall's junction with the ring
corridor. In fact, a ladder leads down to the green airlock.")
      (DESC "Center of the Warren")
      (IN TO MAZE)
      (WEST TO MAZE)
      (OUT TO GREEN-LOCK IF GREEN-INNER IS OPEN)
      (DOWN TO GREEN-LOCK IF GREEN-INNER IS OPEN)
      (ACTION GREEN-THREE-FCN)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL STAIRS GREEN-INNER GLOBAL-CHIEF PLANTERS)>

\

<ROOM GREEN-FOUR
      (OBJIDX "193")
      (IN ROOMS)
      (LDESC
"A primitive village has been built here, almost choking the passage off. The
village extends forward, becoming even more closely built to form a palisade
built of mud and wood which completely blocks the corridor.")
      (DESC "Village Suburbs")
      (NORTH "The corridor is blocked by a mud and wood palisade.")
      (SOUTH TO VILLAGE-S-EDGE)
      (EAST TO VILLAGE-SE-EDGE)
      (WEST TO VILLAGE-SW-EDGE)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL GLOBAL-CHIEF ALIENS SPEAR PLANTERS PALISADE)>

<OBJECT CHIEF
	(OBJIDX "75")
	(SYNONYM ALIEN CHIEF CHIEFTAIN)
	(ADJECTIVE GREY WEASEL)
	(DESC "weasel chieftain")
	(FLAGS VILLAIN CONTBIT OPENBIT VICBIT SEARCHBIT)
	(DESCFCN CHIEF-FCN)
	(ACTION CHIEF-FCN)>

<OBJECT GLOBAL-CHIEF
	(OBJIDX "76")
	(IN LOCAL-GLOBALS)
	(SYNONYM ALIEN CHIEF CHIEFTAIN)
	(ADJECTIVE GREY WEASEL)
	(DESC "weasel chieftain")
	(FLAGS VILLAIN CONTBIT OPENBIT VICBIT SEARCHBIT INVISIBLE)
	(ACTION CHIEF-FCN)>

<OBJECT BROWN-KEY
	(OBJIDX "77")
	(IN CHIEF)
	(SYNONYM KEY RODS ROD)
	(ADJECTIVE CHIEFS BROWN CRYSTAL)
	(DESC "brown rod")
	(VALUE 25)
	(FLAGS NDESCBIT TRYTAKEBIT TAKEBIT KEYBIT TRANSBIT)
	(ACTION BROWN-KEY-FCN)>

<OBJECT ALIENS
	(OBJIDX "78")
	(IN LOCAL-GLOBALS)
	(SYNONYM ALIENS ALIEN WEASEL)
	(ADJECTIVE GREY HUNTER TRIBESMAN)
	(DESC "alien tribesmen")
	(FLAGS VILLAIN VICBIT)
	(ACTION ALIENS-FCN)>

<OBJECT PALISADE
	(OBJIDX "79")
	(IN LOCAL-GLOBALS)
	(SYNONYM PALISADE WALL)
	(ADJECTIVE MUD WOOD)
	(DESC "palisade")
	(FLAGS VILLAIN CLIMBBIT)
	(ACTION PALISADE-FCN)>

<ROOM VILLAGE-N-EDGE
      (OBJIDX "194")
      (IN ROOMS)
      (LDESC
"This is the edge of an inhabited area. Crude hovels are scattered here and
there, becoming denser as you move aft.")
      (DESC "Outskirts of Village")
      (NORTH TO GREEN-TWO)
      (SOUTH "The corridor is blocked by a wood and mud palisade.")
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL GLOBAL-CHIEF ALIENS SPEAR PLANTERS PALISADE)>

<ROOM VILLAGE-NW-EDGE
      (OBJIDX "195")
      (IN ROOMS)
      (DESC "Outskirts of Village")
      (WEST TO RED-THREE)
      (EAST TO VILLAGE)
      (ACTION VILLAGE-NW-EDGE-FCN)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL GLOBAL-CHIEF ALIENS SPEAR PLANTERS)>

<ROOM VILLAGE-NE-EDGE
      (OBJIDX "196")
      (IN ROOMS)
      (LDESC
"This is the fringe of a populated area lying to port. The corridor is filled
with primitive huts, and is being used for the cultivation of grain. It seems
that the inhabitants heard you coming and have fled." )
      (DESC "Outskirts of Village")
      (WEST "The corridor is blocked by a wood and mud palisade.")
      (EAST TO YELLOW-THREE)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL GLOBAL-CHIEF HUTS PLANTERS PALISADE)>

<ROOM VILLAGE-SW-EDGE
      (OBJIDX "197")
      (IN ROOMS)
      (LDESC
"This is the edge of an inhabited area lying to starboard. Some odd vegetables
are growing here, but the inhabitants, if any, have scattered.")
      (DESC "Outskirts of Village")
      (WEST TO RED-FOUR)
      (EAST TO GREEN-FOUR)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL GLOBAL-CHIEF PLANTERS)>

<ROOM VILLAGE-SE-EDGE
      (OBJIDX "198")
      (IN ROOMS)
      (LDESC
"This is the fringe of an inhabited area lying to port. The corridor is filled
with cultivated plantings, although the farmers have apparently fled before
you.")
      (DESC "Outskirts of Village")
      (WEST TO GREEN-FOUR)
      (EAST TO YELLOW-FOUR)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL GLOBAL-CHIEF PLANTERS)>

<ROOM VILLAGE-S-EDGE
      (OBJIDX "199")
      (IN ROOMS)
      (LDESC
"This is the aft edge of a settled area. The corridor has a dirt floor here,
and several well-used paths lead forward.")
      (DESC "Outskirts of Village")
      (NORTH TO GREEN-FOUR)
      (SOUTH TO GREEN-FIVE)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL GLOBAL-CHIEF PLANTERS)>

<ROOM GREEN-FIVE
      (OBJIDX "200")
      (IN ROOMS)
      (LDESC 
"This is the aft end of the green hall, well-tended and brightly lit,
where a typical ring corridor crosses.")
      (DESC "Green Hall")
      (NORTH TO VILLAGE-S-EDGE)
      (SOUTH "The corridor comes to an end here.")
      (EAST TO YELLOW-FIVE)
      (WEST TO RED-FIVE)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL PLANTERS)>

\

"MAINTENANCE MICE ET AL"

<OBJECT GLOBAL-MOUSE
	(OBJIDX "80")
	(IN GLOBAL-OBJECTS)
	(SYNONYM MOUSE SWEEPER RECEPTACLE)
	(ADJECTIVE MAINTENANCE)
	(DESC "maintenance mouse")
	(FLAGS CONTBIT SURFACEBIT TRANSBIT)
	(LDESC "There is a maintenance mouse here, cheerfully scouring the
area for dirt and discarded junk.")
	(ACTION MOUSE-FCN)
	(CAPACITY 1000)>

<OBJECT MOUSE
	(OBJIDX "81")
	(IN BLUE-RED-FOUR)
	(SYNONYM MOUSE SWEEPER RECEPTACLE TRAY)
	(ADJECTIVE MAINTENANCE)
	(DESC "maintenance mouse")
	(FLAGS VEHBIT CONTBIT SURFACEBIT OPENBIT TRANSBIT SEARCHBIT)
	(DESCFCN MOUSE-FCN)
	(ACTION MOUSE-FCN)
	(CONTFCN MOUSE-CONT)
	(CAPACITY 1000)>

<OBJECT MOUSE-HOLE
	(OBJIDX "82")
	(SYNONYM HOLE DOOR)
	(ADJECTIVE MOUSE)
	(DESC "mouse hole")
	(FLAGS DOORBIT)
	(LDESC "There is a barely visible mouse hole in the wall here.")
	(ACTION HOLE-FCN)>

\

"STEPPING DISKS"

<GLOBAL RED-DISK-ON <>>
<GLOBAL BLUE-DISK-ON <>>

<OBJECT RED-DISK
	(OBJIDX "83")
	(IN FF-ROOM)
	(SYNONYM DISK DISKS)
	(ADJECTIVE RED THIN)
	(FDESC
"A thin red disk the size of a manhole cover hangs on the wall.")
	(LDESC "There is a thin red disk the size of a manhole cover here.")
	(DESC "red disk")
	(FLAGS TAKEBIT TRYTAKEBIT SURFACEBIT CONTBIT OPENBIT VEHBIT)
	(ACTION DISK-FCN)
	(SIZE 10)
	(CAPACITY 200)>

<OBJECT BLUE-DISK
	(OBJIDX "84")
	(IN FF-ROOM)
	(SYNONYM DISK DISKS)
	(ADJECTIVE BLUE THIN)
	(FDESC
"A thin blue disk the size of a manhole cover hangs on the wall.")
	(LDESC "There is a thin blue disk the size of a manhole cover here.")
	(DESC "blue disk")
	(FLAGS TAKEBIT TRYTAKEBIT SURFACEBIT CONTBIT OPENBIT VEHBIT)
	(ACTION DISK-FCN)
	(CAPACITY 200)
	(SIZE 10)>

<OBJECT FF-DIAL
	(OBJIDX "85")
	(IN FF-ROOM)
	(SYNONYM DIAL)
	(ADJECTIVE CONTROL)
	(DESC "dial")
	(FLAGS NDESCBIT)
	(ACTION FF-DIAL-FCN)>

<OBJECT FORCE-FIELD-1
	(OBJIDX "86")
	(SYNONYM FIELD SPHERE BALL GLOBE)
	(ADJECTIVE FORCE SILVER)
	(DESC "silver sphere")
	(DESCFCN FF-FCN)
	(FLAGS NDESCBIT CONTBIT OPENBIT VEHBIT)
	(ACTION FF-FCN)>

<OBJECT FORCE-FIELD-2
	(OBJIDX "87")
	(IN FF-ROOM)
	(SYNONYM FIELD SPHERE BALL GLOBE)
	(ADJECTIVE FORCE SILVER)
	(DESC "silver sphere")
	(DESCFCN FF-FCN)
	(FLAGS NDESCBIT SURFACEBIT CONTBIT OPENBIT VEHBIT)
	(ACTION FF-FCN)>

<OBJECT FF-BOWL-2
	(OBJIDX "88")
	(SYNONYM FIELD)
	(DESC "bowl")>

<OBJECT FORCE-FIELD-3
	(OBJIDX "89")
	(SYNONYM FIELD SPHERE BALL GLOBE)
	(ADJECTIVE FORCE SILVER)
	(DESC "silver sphere")
	(DESCFCN FF-FCN)
	(FLAGS NDESCBIT SURFACEBIT CONTBIT OPENBIT VEHBIT)
	(ACTION FF-FCN)>

<OBJECT FF-BOWL-3
	(OBJIDX "90")
	(SYNONYM FIELD)
	(DESC "bowl")>

<OBJECT FORCE-FIELD-4
	(OBJIDX "91")
	(SYNONYM FIELD SPHERE BALL GLOBE)
	(ADJECTIVE FORCE SILVER)
	(DESC "silver sphere")
	(DESCFCN FF-FCN)
	(FLAGS NDESCBIT SURFACEBIT CONTBIT OPENBIT VEHBIT)
	(ACTION FF-FCN)>

<OBJECT FF-BOWL-4
	(OBJIDX "92")
	(SYNONYM FIELD)
	(DESC "bowl")>

<ROOM FF-ROOM
      (OBJIDX "201")
      (IN ROOMS)
      (DESC "Laboratory")
      (FLAGS RLANDBIT ONBIT)
      (OUT TO YELLOW-FOUR-FIVE)
      (WEST TO YELLOW-FOUR-FIVE)
      (ACTION FF-ROOM-FCN)
      (GLOBAL PROJECTOR BEAM)>

<OBJECT PROJECTOR
	(OBJIDX "93")
	(IN FF-ROOM)
	(SYNONYM PROJECTOR APPARATUS)
	(ADJECTIVE FORMIDABLE)
	(DESC "projector")
	(ACTION PROJECTOR-FCN)
	(FLAGS NDESCBIT)>

<OBJECT BEAM
	(OBJIDX "94")
	(IN FF-ROOM)
	(SYNONYM BEAM)
	(ADJECTIVE ENERGY)
	(DESC "beam of energy")
	(ACTION BEAM-FCN)
	(FLAGS NDESCBIT VILLAIN)>

<OBJECT BLUE-KEY
	(OBJIDX "95")
	(IN FORCE-FIELD-1)
	(SYNONYM KEY RODS ROD)
	(ADJECTIVE BLUE CRYSTAL)
	(DESC "blue rod")
	(ACTION BLUE-KEY-FCN)
	(VALUE 25)
	(FLAGS TRYTAKEBIT TAKEBIT KEYBIT TRANSBIT)>

<ROOM BLUE-RED-FOUR
      (OBJIDX "202")
      (IN ROOMS)
      (DESC "Room on Ring Four")
      (LDESC
"You are between the red and blue halls on a ring corridor. The corridor looks
damaged to port. The illumination dims to starboard.")
      (EAST TO RED-FOUR)
      (WEST TO BLUE-FOUR)
      (SOUTH "There is no exit visible on the aft wall.")
      (FLAGS RLANDBIT ONBIT)>

<ROOM GARAGE
      (OBJIDX "203")
      (IN ROOMS)
      (DESC "Garage")
      (LDESC
"This is the garage for Maintenance Mice. There are several stalls in
which non-functional mice are rusting away. Other stalls are empty.
There is a chute into which trash could be dumped, and a large bin nearby.
A maintenance-mouse-sized door is in the forward wall.")
      (NORTH TO BLUE-RED-FOUR)
      (OUT TO BLUE-RED-FOUR)
      (FLAGS RLANDBIT ONBIT)
      (PSEUDO "CHUTE" HOLE-PSEUDO "DOOR" DOOR-PSEUDO)>

<OBJECT TRASH-BIN
	(OBJIDX "96")
	(IN GARAGE)
	(SYNONYM BIN)
	(ADJECTIVE TRASH JUNK)
	(DESC "trash bin")
	(FLAGS RLANDBIT OPENBIT CONTBIT SEARCHBIT)
	(LDESC
"There is a trash bin full of junk of all sorts here. Someone appears to have
been dumping things for years (decades? centuries?) and never cleaning them
out.")
	(ACTION TRASH-BIN-FCN)
	(CAPACITY 1000)>

<OBJECT GREEN-KEY
	(OBJIDX "97")
	(SYNONYM KEY RODS ROD)
	(ADJECTIVE GREEN CRYSTAL)
	(DESC "green rod")
	(VALUE 25)
	(FLAGS TAKEBIT KEYBIT TRANSBIT)>

\

"SUBTITLE GREEN SPACESHIP"

<ROOM THRONE-ROOM
      (OBJIDX "204")
      (IN ROOMS)
      (DESC "Control Room")
      (FLAGS RLANDBIT ONBIT)
      (LDESC
"This was the control room of the ship which originally carried the
now-primitive aliens to the artifact. The control panel was obviously
destroyed by a fire or explosion long ago, although the lights here still
glow dimly.|
Outside you can see the surface of the artifact. Gazing longingly at that
view are the empty eyesockets of a skeleton, the skeleton of an alien weasel.
It is dressed in the shreds of a space suit and sitting in the control couch.
Scattered around the couch are fresh offerings of fruit and vegetables.")
      (SOUTH TO CARGO-ROOM)
      (GLOBAL COUCH WINDOW CONTROLS TOTEMS)>

<OBJECT SKELETON
	(OBJIDX "98")
	(IN THRONE-ROOM)
	(SYNONYM SKELETON)
	(ADJECTIVE ALIEN)
	(DESC "alien skeleton")
	(FLAGS TAKEBIT NDESCBIT TRYTAKEBIT)
	(ACTION SKELETON-FCN)
	(SIZE 10)>

<OBJECT VIOLET-KEY
	(OBJIDX "99")
	(IN THRONE-ROOM)
	(SYNONYM KEY RODS ROD)
	(ADJECTIVE VIOLET PURPLE CRYSTAL)
	(DESC "violet rod")
	(VALUE 25)
	(FLAGS INVISIBLE TAKEBIT KEYBIT TRANSBIT)>

<ROOM CARGO-ROOM
      (OBJIDX "205")
      (IN ROOMS)
      (DESC "Cargo Hold")
      (FLAGS RLANDBIT ONBIT)
      (LDESC
"This was once the cargo hold of a spaceship, and is filled with fetishes of
wood and clay, totems in the shape of strange beasts, and a great deal of
withered fruit and grain. Openings lead fore and aft, and the umbilical
tube is to starboard. There is dim illumination from ancient glow bulbs.")
      (NORTH TO THRONE-ROOM)
      (SOUTH TO GUARD-ROOM)
      (EAST TO UMBILICAL)
      (GLOBAL TOTEMS VEGGIES)>

<ROOM GUARD-ROOM
      (OBJIDX "206")
      (IN ROOMS)
      (DESC "Guard Room")
      (FLAGS RLANDBIT ONBIT)
      (LDESC
"Once a guard room or barracks, this room is now dusty and unused. The
only exit is back the way you came. A large door that may have led
to the engine room is fused shut, as if by enormous heat.")
      (NORTH TO CARGO-ROOM)
      (PSEUDO "DOOR" DOOR-PSEUDO)>

<ROOM UMBILICAL
      (OBJIDX "207")
      (IN ROOMS)
      (DESC "Umbilical")
      (FLAGS RLANDBIT ONBIT)
      (LDESC
"You are in a plastic umbilical about two meters in diameter which
connects the green airlock to starboard with a spaceship about ten
meters to port. The plastic is cloudy, obscuring your view of the outside.")
      (WEST TO CARGO-ROOM)
      (UP TO GREEN-DOCK)
      (EAST TO GREEN-DOCK)>

\

"SUBTITLE ZOO"

<ROOM ZOO
      (OBJIDX "208")
      (IN ROOMS)
      (LDESC
"This is a port-to-starboard corridor lined with small cages. The bars of the
cages are bands of force, detectable only by the slight shimmer they produce
in the air, and are non-working on most of the cages. A few cages are still
on, and contain the dried up carcasses of strange animals.")
      (DESC "Zoo")
      (SOUTH TO BLUE-RED-TWO)
      (WEST TO GRUE-CAGE)
      (EAST TO NEST-CAGE)
      (NORTH "You can't pass the (still-working) bars of this cage.")
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL CAGES)>

<ROOM GRUE-CAGE
      (OBJIDX "209")
      (IN ROOMS)
      (LDESC
"This cage was apparently forced by its inhabitants before the general
deterioration of the zoo equipment. The force projectors are ripped
out of their mountings and smashed against the bulkhead, and the whole
cage is scratched and dented as though many enraged creatures pounded
on it violently for many weeks. There is a somewhat chewed sign to one
side of the cage.")
      (DESC "Broken Cage")
      (EAST TO ZOO)
      (WEST "The zoo area ends here.")
      (NORTH TO IN-GRUE-CAGE)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL CAGES)>

<ROOM IN-GRUE-CAGE
      (OBJIDX "210")
      (IN ROOMS)
      (LDESC 
"The amount of damage done to this cage is impressive. The creatures
imprisoned here didn't like it one bit, and whoever put them here
obviously underestimated their nastiness.")
      (DESC "Inside Grue Cage")
      (SOUTH TO GRUE-CAGE)
      (FLAGS RLANDBIT ONBIT)>

<OBJECT GRUE-SIGN
	(OBJIDX "100")
	(IN GRUE-CAGE)
	(SYNONYM SIGN)
	(ADJECTIVE CHEWED)
	(DESC "chewed sign")
	(FLAGS NDESCBIT READBIT)
	(TEXT
"The sign, a liquid crystal display, is oddly in English:|
|
\"     Common Grues (Grue Vulgaris)|
|
The common grue, an inhabitant of the dark underground passages of a
forgotten planet, is here exhibited for your pleasure in a typical family
group. Note particularly the slavering fangs which reach such impressive
size in the adults. Feeding the grues is not recommended.\"")>

<OBJECT GRUE
	(OBJIDX "101")
	(IN GLOBAL-OBJECTS)
	(SYNONYM GRUE)
	(ADJECTIVE LURKING SINISTER HUNGRY SILENT)
	(DESC "lurking grue")
	(ACTION GRUE-FUNCTION)>

<ROOM NEST-CAGE
      (OBJIDX "211")
      (IN ROOMS)
      (DESC "Nesting Cage")
      (WEST TO ZOO)
      (EAST "The zoo area comes to an end here.")
      (ACTION NEST-CAGE-FCN)
      (GLOBAL SPEAR)
      (FLAGS RLANDBIT ONBIT)>

<OBJECT NEST
	(OBJIDX "102")
	(IN NEST-CAGE)
	(SYNONYM NEST)
	(ADJECTIVE MUD)
	(DESC "nest")
	(FLAGS NDESCBIT OPENBIT CONTBIT VILLAIN SEARCHBIT)
	(ACTION NEST-FCN)
	(CONTFCN NEST-CONT)
	(CAPACITY 1000)>

<OBJECT SMASHED-NEST
	(OBJIDX "103")
	(SYNONYM NEST)
	(ADJECTIVE SMASHED)
	(DESC "smashed nest")
	(FLAGS NDESCBIT OPENBIT CONTBIT VILLAIN SEARCHBIT)
	(ACTION NEST-FCN)
	(CONTFCN SMASHED-NEST-CONT)
	(CAPACITY 1000)>

<OBJECT RED-KEY
	(OBJIDX "104")
	(IN NEST)
	(SYNONYM KEY RODS ROD)
	(ADJECTIVE RED CRYSTAL)
	(DESC "red rod")
	(VALUE 25)
	(FLAGS NDESCBIT TRYTAKEBIT TAKEBIT KEYBIT TRANSBIT)>

<OBJECT RAT-ANT
	(OBJIDX "105")
	(IN NEST-CAGE)
	(SYNONYM ANT RAT-ANT)
	(ADJECTIVE RAT)
	(DESC "rat-ant")
	(FLAGS NDESCBIT VICBIT VILLAIN)
	(ACTION RAT-ANT-FCN)>

<ROOM GREEN-YELLOW-ONE
      (OBJIDX "212")
      (IN ROOMS)
      (LDESC
"A passage leads aft from this point on the ring corridor.")
      (DESC "Room on Ring One")
      (EAST TO YELLOW-ONE)
      (WEST TO GREEN-ONE)
      (SOUTH TO COMPUTER-ROOM)
      (IN TO COMPUTER-ROOM)
      (FLAGS RLANDBIT ONBIT)>

<ROOM COMPUTER-ROOM
      (OBJIDX "213")
      (IN ROOMS)
      (DESC "Computer Room")
      (OUT TO GREEN-YELLOW-ONE)
      (NORTH TO GREEN-YELLOW-ONE)
      (ACTION COMPUTER-ROOM-FCN)
      (FLAGS RLANDBIT ONBIT)>

<OBJECT ENV-COMPUTER
	(OBJIDX "106")
	(IN COMPUTER-ROOM)
	(SYNONYM COMPUTER)
	(DESC "computer")
	(FLAGS NDESCBIT)
	(ACTION SWITCH-FCN)>

<OBJECT ON-OFF-SWITCH
	(OBJIDX "107")
	(IN COMPUTER-ROOM)
	(SYNONYM SWITCH POWER)
	(ADJECTIVE ON OFF)
	(DESC "on-off switch")
	(FLAGS NDESCBIT)
	(ACTION SWITCH-FCN)>

<OBJECT PANEL
	(OBJIDX "108")
	(IN COMPUTER-ROOM)
	(SYNONYM PANEL)
	(ADJECTIVE ACCESS)
	(DESC "access panel")
	(FLAGS CONTBIT NDESCBIT SEARCHBIT)
	(CAPACITY 100)
	(ACTION PANEL-FCN)>

<OBJECT SLOT
	(OBJIDX "109")
	(IN PANEL)
	(SYNONYM SLOT HOLE)
	(DESC "slot")
	(FLAGS CONTBIT OPENBIT SEARCHBIT)
	(ACTION SLOT-FCN)>

<OBJECT CARD
	(OBJIDX "110")
	(IN REPAIR-ROOM)
	(SYNONYM CARD SQUARE)
	(ADJECTIVE COMPUTER METAL CERAMIC)
	(DESC "metal and ceramic square")
	(FLAGS TAKEBIT)
	(ACTION CARD-F)
	(SIZE 3)>

<OBJECT GOLD-KEY
	(OBJIDX "111")
	(SYNONYM KEY RODS ROD)
	(ADJECTIVE GOLD CRYSTAL)
	(DESC "gold rod")
	(VALUE 25)
	(FLAGS TAKEBIT KEYBIT TRANSBIT)>

\

"SUBTITLE WEAPONS DECK AND ZAP GUN"

<OBJECT ZAP-GUN
	(OBJIDX "112")
	(IN WEAPONS-DECK)
	(SYNONYM GUN BARREL RAYGUN)
	(ADJECTIVE RAY)
	(DESC "ray gun")
	(FDESC
"Mounted in a wall-rack is a genuine-looking ray gun, large and formidable,
with a long, ugly barrel. It's difficult to tell whether or not the gun is
fully charged.")
	(FLAGS TAKEBIT WEAPONBIT CONTBIT)
	(ACTION ZAP-GUN-FCN)
	(CAPACITY 5)
	(SIZE 10)>

<OBJECT SILVER-KEY
	(OBJIDX "113")
	(IN ZAP-GUN)
	(SYNONYM KEY RODS ROD)
	(ADJECTIVE SILVER CRYSTAL)
	(DESC "silver rod")
	(VALUE 25)
	(FLAGS TRYTAKEBIT TAKEBIT KEYBIT TRANSBIT)>

<ROOM WEAPONS-DECK
      (OBJIDX "214")
      (IN ROOMS)
      (DESC "Weapons Deck")
      (LDESC
"This was the armory of the artifact. A massive bulkhead has been burned
away, giving free access to the weaponry. Unfortunately, it appears that the
vast stock of futuristic armaments has been mostly destroyed. Gigantic
projectors are scorched and shattered, strange battle armor is reduced to
splinters, and wall racks for small arms are mostly empty.")
      (EAST TO BLUE-34)
      (OUT TO BLUE-34)
      (FLAGS RLANDBIT ONBIT)>

<ROOM BLUE-34
      (OBJIDX "215")
      (IN ROOMS)
      (DESC "Melted Spot")
      (LDESC
"At this point the corridor is twisted and the walls are half-melted.
Titanic energies have been used here, apparently to blast through an
armored hatch that shielded the area to port. There is little left of
the hatch now, and the way is open.")
      (WEST TO WEAPONS-DECK)
      (NORTH TO BLUE-THREE)
      (SOUTH TO BLUE-FOUR)
      (IN TO WEAPONS-DECK)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL PLANTERS)>

\

"SUBTITLE INSIDE THE CYLINDER"

<OBJECT TREE
	(OBJIDX "114")
	(IN LOCAL-GLOBALS)
	(SYNONYM TREE)
	(ADJECTIVE HUGE SMALL ENORMOUS)
	(DESC "tree")
	(ACTION TREE-FCN)
	(FLAGS NDESCBIT CLIMBBIT)>

<ROOM BASE-OF-TREE
      (OBJIDX "216")
      (IN ROOMS)
      (DESC "Base of Tree")
      (LDESC
"You are in a primeval forest, near the base of a giant tree. The trunk is
thick, perhaps 40 meters in diameter, and the height is incredible. The
forest is dense, so you can't see exactly how tall it is, but extending all
the way to the axis isn't out of the question. The bark is so rough that
climbing would be no problem.")
      (UP PER UP-A-TREE-EXIT)
      (NORTH TO SCRUB-2)
      (EAST TO FOREST)
      (WEST TO FOREST)
      (SOUTH "You have reached the aft end of the cylinder.")
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL TREE VEGGIES)>

<ROOM UP-A-TREE
      (OBJIDX "217")
      (IN ROOMS)
      (DESC "Up a Tree")
      (LDESC
"You are climbing a gigantic tree, one that would make the largest
sequoia blush with envy. Fortunately the bark is rough and climbing
is easy. The gravity lessens as you near the axis of rotation, which
also helps.")
      (UP TO TREETOP-ROOM)
      (DOWN TO BASE-OF-TREE)
      (ACTION UP-A-TREE-FCN)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL TREE)>

<ROOM TREETOP-ROOM
      (OBJIDX "218")
      (IN ROOMS)
      (DESC "Top of Tree")
      (LDESC
"You are at the top of a giant tree, just below a huge crystalline bubble
full of machinery and controls which lies at the axis of rotation at the aft
end of the cylinder. Out of reach above you is a hatch which leads into the
bubble. Beside the hatch is a silver slot. Gravity has almost disappeared
here as you near the axis.")
      (UP "The hatch is out of reach above you.")
      (DOWN TO UP-A-TREE)
      (FLAGS RLANDBIT ONBIT)
      (ACTION TREETOP-FCN)
      (GLOBAL TREE DRIVE-BUBBLE DRIVE-BUBBLE-HATCH)
      (PSEUDO
       "SLOT" OUT-OF-REACH
       "SPOT" OUT-OF-REACH)>

<OBJECT SILVER-SLOT
	(OBJIDX "115")
	(IN DRIVE-BUBBLE-ENTRANCE)
	(SYNONYM SLOT SPOT HOLE)
	(ADJECTIVE SILVER)
	(DESC "silver slot")
	(FLAGS OPENBIT CONTBIT NDESCBIT)
	(ACTION SILVER-SLOT-FCN)
	(CONTFCN SILVER-SLOT-CONT)
	(KEY TO SILVER-KEY)
	(CAPACITY 5)>

<ROOM DRIVE-BUBBLE-ENTRANCE
      (OBJIDX "219")
      (IN ROOMS)
      (DESC "Drive Bubble Entrance")
      (IN TO DRIVE-BUBBLE-ROOM IF DRIVE-BUBBLE-HATCH IS OPEN)
      (DOWN TO TREETOP-ROOM)
      (UP TO ON-DRIVE-BUBBLE)
      (ACTION DRIVE-BUBBLE-ENTRANCE-FCN)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL TREE DRIVE-BUBBLE-HATCH DRIVE-BUBBLE KNOBS)>

<ROOM ON-DRIVE-BUBBLE
      (OBJIDX "220")
      (IN ROOMS)
      (LDESC
"You are floating near and clinging to a large crystalline bubble covering
the aft end of the axis of rotation of the artifact. There is no weight here.
Small knobs resembling handholds cover the bubble; you could use them to
climb back down. Far away at the fore end of the axis you can see another
bubble very similar to this one.")
      (DESC "On Drive Bubble")
      (DOWN TO DRIVE-BUBBLE-ENTRANCE)
      (UP "There is only air there.")
      (ACTION ON-DRIVE-BUBBLE-FCN)
      (FLAGS RAIRBIT ONBIT RMUNGBIT)
      (GLOBAL DRIVE-BUBBLE CONTROL-BUBBLE KNOBS)>

<ROOM DRIVE-BUBBLE-ROOM
      (OBJIDX "221")
      (IN ROOMS)
      (DESC "Drive Bubble")
      (UP TO AXIS-1)
      (NORTH TO AXIS-1)
      (OUT TO DRIVE-BUBBLE-ENTRANCE IF DRIVE-BUBBLE-HATCH IS OPEN)
      (ACTION DRIVE-BUBBLE-ROOM-FCN)
      (FLAGS RAIRBIT ONBIT RMUNGBIT)
      (GLOBAL DRIVE-BUBBLE-HATCH DRIVE-BUBBLE)>

<OBJECT WHITE-SLOT
	(OBJIDX "116")
	(IN DRIVE-BUBBLE-ROOM)
	(SYNONYM SLOT PANEL HOLE)
	(ADJECTIVE WHITE)
	(DESC "white slot")
	(KEY TO WHITE-KEY)
	(FLAGS NDESCBIT CONTBIT OPENBIT SEARCHBIT)
	(ACTION WHITE-SLOT-FCN)
	(CAPACITY 10)>

<OBJECT BLACK-SLOT
	(OBJIDX "117")
	(SYNONYM SLOT PANEL HOLE)
	(ADJECTIVE BLACK)
	(DESC "black slot")
	(KEY TO BLACK-KEY)
	(FLAGS NDESCBIT CONTBIT OPENBIT SEARCHBIT)
	(ACTION BLACK-SLOT-FCN)
	(CAPACITY 10)>

<OBJECT WHITE-KEY
	(OBJIDX "118")
	(IN DRIVE-BUBBLE-ROOM)
	(SYNONYM KEY RODS ROD)
	(ADJECTIVE WHITE CRYSTAL)
	(DESC "white rod")
	(FDESC
"Floating near a white slot in the wall is a white rod.")
	(ACTION WHITE-KEY-FCN)
	(VALUE 25)
	(FLAGS TAKEBIT KEYBIT TRANSBIT)>

<OBJECT DRIVE-BUBBLE-HATCH
      (OBJIDX "119")
      (IN LOCAL-GLOBALS)
      (SYNONYM HATCH DOOR)
      (DESC "hatch")
      (FLAGS NDESCBIT DOORBIT)
      (ACTION HATCH-DOOR-F)>

<ROOM AXIS-1
      (OBJIDX "222")
      (IN ROOMS)
      (DESC "Floating in Air")
      (LDESC
"You are floating at the axis of rotation of the cylinder, near the
drive bubble. There are enormous trees \"below.\" There is no gravity here.")
      (NORTH TO AXIS-2)
      (SOUTH TO DRIVE-BUBBLE-ROOM)
      (ACTION AXIS-FCN)
      (FLAGS RAIRBIT ONBIT RMUNGBIT)
      (GLOBAL DRIVE-BUBBLE CONTROL-BUBBLE)>

<ROOM AXIS-2
      (OBJIDX "223")
      (IN ROOMS)
      (DESC "Floating in Air")
      (LDESC
"You are floating at the axis of rotation of the cylinder.
There is grassland \"below.\" There is no gravity here.")
      (NORTH TO AXIS-3)
      (SOUTH TO AXIS-1)
      (ACTION AXIS-FCN)
      (FLAGS RAIRBIT ONBIT RMUNGBIT)
      (GLOBAL DRIVE-BUBBLE CONTROL-BUBBLE)>

<ROOM AXIS-3
      (OBJIDX "224")
      (IN ROOMS)
      (DESC "Floating in Air")
      (LDESC
"You are floating at the axis of rotation of the cylinder.
There is a metal band \"below.\" There is no gravity here.")
      (NORTH TO ON-CONTROL-BUBBLE)
      (SOUTH TO AXIS-2)
      (ACTION AXIS-FCN)
      (FLAGS RAIRBIT ONBIT RMUNGBIT)
      (GLOBAL DRIVE-BUBBLE CONTROL-BUBBLE)>

<ROOM FOREST
      (OBJIDX "225")
      (IN ROOMS)
      (DESC "Dense Forest")
      (LDESC
"This is the forest primeval, conifers and cycads in rank profusion.
Here and there huge trees thrust upward through the forest canopy.
One particularly large tree is to port of here.")
      (NORTH TO SCRUB)
      (SOUTH "You have reached the aft end of the cylinder.")
      (WEST TO BASE-OF-TREE)
      (EAST TO BASE-OF-TREE)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL VEGGIES TREE)>

<ROOM SCRUB
      (OBJIDX "226")
      (IN ROOMS)
      (DESC "Thin Forest")
      (LDESC
"This is an area of small trees and shrubs blending into a more imposing
forest aft and into grassland forward. Strangely, there is a metal
hatch cover nearby among the shrubbery.")
      (NORTH TO GRASSLAND)
      (SOUTH TO FOREST)
      (WEST TO SCRUB-2)
      (EAST TO SCRUB-2)
      (DOWN TO REPAIR-ROOM IF METAL-DOOR IS OPEN)
      (UP "There are no large trees here.")
      (GLOBAL METAL-DOOR TREE VEGGIES)
      (FLAGS RLANDBIT ONBIT)>

<ROOM SCRUB-2
      (OBJIDX "227")
      (IN ROOMS)
      (DESC "Thin Forest")
      (LDESC
"This is an area of small trees and shrubs blending into a more imposing
forest aft and into grassland forward.")
      (NORTH TO GRASSLAND-2)
      (SOUTH TO BASE-OF-TREE)
      (WEST TO SCRUB)
      (EAST TO SCRUB)
      (UP "There are no large trees here.")
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL TREE VEGGIES)>

<ROOM GRASSLAND
      (OBJIDX "228")
      (IN ROOMS)
      (DESC "Grassland")
      (LDESC
"You are standing on the floor of an enormous cylinder, kilometers in
length and hundreds of meters across. Above you and all around is revealed
a micro-geography of trees, grassland, and manufactured structures. The
cylinder is divided into various bands, of which this is approximately the
central one. Things cling to the floor (or ceiling) above you, as each band
continues all the way around the cylinder.
|
You are in the midst of a grassy plain, a sort of savannah with warm
breezes and tall grasses. An exit leads down to the outer deck. Looking
forward, a metal floor circles the cylinder, and extends all the way to
the forward end of the cylinder, which is a sheer metal wall with a
crystal bubble at the axis. Looking aft, the grassland becomes more and
more densely forested. The aft end of the cylinder is totally obscured
by impossibly tall trees. A herd of creatures not unlike unicorns crops
grass in the distance.")
      (NORTH TO METAL-BAND)
      (SOUTH TO SCRUB)
      (EAST TO GRASSLAND-2)
      (WEST TO GRASSLAND-2)
      (DOWN TO BLUE-THREE)
      (GLOBAL ALIENS UNICORNS DISTANT-BUBBLE)
      (FLAGS RLANDBIT ONBIT)>

<ROOM GRASSLAND-2
      (OBJIDX "229")
      (IN ROOMS)
      (DESC "Grassland")
      (LDESC
"A grassy plain circles this band of the cylinder, the vegetation
merging into dense forest as you look aft, and stopping abruptly at bare
metal as you look forward. The plain arches above you, giving an aerial
view of the other side and the entry through which you came. The forest
obscures the aft end of the cylinder. A herd of creatures not unlike
unicorns crops grass nearby.")
      (NORTH TO METAL-BAND-2)
      (SOUTH TO SCRUB-2)
      (EAST TO GRASSLAND)
      (WEST TO GRASSLAND)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL ALIENS UNICORNS DISTANT-BUBBLE)>

<OBJECT UNICORNS
	(OBJIDX "120")
	(IN LOCAL-GLOBALS)
	(DESC "unicorn")
	(SYNONYM UNICORN)
	(ADJECTIVE HERD)
	(ACTION UNICORNS-FCN)
	(FLAGS NDESCBIT)>

<OBJECT METAL-DOOR
	(OBJIDX "121")
	(IN LOCAL-GLOBALS)
	(DESC "metal hatch")
	(SYNONYM DOOR HATCH COVER)
	(ADJECTIVE METAL)
	(FLAGS NDESCBIT CONTBIT DOORBIT)>

<ROOM METAL-BAND
      (OBJIDX "230")
      (IN ROOMS)
      (DESC "Metal Floor")
      (LDESC
"The floor of the cylinder is bare metal here, merging into grassland aft
and eventually running into a sheer wall at the forward end of the artifact.")
      (NORTH TO FORE-END)
      (SOUTH TO GRASSLAND)
      (EAST TO METAL-BAND-2)
      (WEST TO METAL-BAND-2)
      (GLOBAL CONTROL-BUBBLE)
      (FLAGS RLANDBIT ONBIT)>

<ROOM METAL-BAND-2
      (OBJIDX "231")
      (IN ROOMS)
      (DESC "Metal Floor")
      (LDESC
"The metal floor continues all the way around the cylinder. Aft the
grassland begins, and forward the cylinder ends in a smooth vertical wall.")
      (NORTH TO FORE-END-2)
      (SOUTH TO GRASSLAND-2)
      (EAST TO METAL-BAND)
      (WEST TO METAL-BAND)
      (GLOBAL CONTROL-BUBBLE)
      (FLAGS RLANDBIT ONBIT)>

<OBJECT WALL
	(OBJIDX "122")
	(IN GLOBAL-OBJECTS)
	(DESC "wall")
	(SYNONYM WALL)
	(ADJECTIVE SMOOTH)
	(FLAGS CLIMBBIT NDESCBIT)
	(ACTION WALL-F)>

<OBJECT DISTANT-BUBBLE
	(OBJIDX "123")
	(IN LOCAL-GLOBALS)
	(DESC "bubble")
	(SYNONYM BUBBLE)
	(ADJECTIVE CRYSTAL CLEAR)
	(ACTION DISTANT-BUBBLE-F)>

<ROOM FORE-END
      (OBJIDX "232")
      (IN ROOMS)
      (DESC "Fore End")
      (LDESC
"You are at the fore end of the cylinder. A smooth, unscalable wall extends
up all around the circumference. At the axis, high above, is a clear bubble.
From this distance you can't see into it, but it's about 100 meters in
diameter.")
      (SOUTH TO METAL-BAND)
      (EAST TO FORE-END-2)
      (WEST TO FORE-END-2)
      (UP "The fore wall is smooth and featureless.")
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL DISTANT-BUBBLE)>

<ROOM FORE-END-2
      (OBJIDX "233")
      (IN ROOMS)
      (DESC "Fore End")
      (LDESC
"You are at the forward end of the interior. A vertical wall extends up all
around the circumference. At the axis, high above, is a crystal bubble. From
this distance you can't discern its contents, but it's about 100 meters in
diameter.")
      (SOUTH TO METAL-BAND-2)
      (EAST TO FORE-END)
      (WEST TO FORE-END)
      (UP "The fore wall is smooth and featureless.")
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL DISTANT-BUBBLE)>

\

<ROOM ON-CONTROL-BUBBLE
      (OBJIDX "234")
      (IN ROOMS)
      (LDESC
"You are floating outside a 100 meter crystal bubble which protrudes from
the fore end of the cylinder. Inside, you can make out shadowy mechanisms
and odd constructions. There are odd knobs of some sort which you could use
to pull yourself down the bubble. At the other end of the cylinder you can
see the drive bubble in the midst of enormous trees.")
      (DESC "On Control Bubble")
      (DOWN TO CONTROL-BUBBLE-ENTRANCE)
      (UP "There is only air there.")
      (ACTION ON-CONTROL-BUBBLE-FCN)
      (FLAGS RAIRBIT ONBIT RMUNGBIT)
      (GLOBAL CONTROL-BUBBLE DRIVE-BUBBLE KNOBS)>

<ROOM CONTROL-BUBBLE-ENTRANCE
      (OBJIDX "235")
      (IN ROOMS)
      (DESC "Control Bubble Entrance")
      (IN TO CONTROL-BUBBLE-ROOM IF CONTROL-BUBBLE-HATCH IS OPEN)
      (UP TO ON-CONTROL-BUBBLE)
      (ACTION CONTROL-BUBBLE-ENTRANCE-FCN)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL CONTROL-BUBBLE DRIVE-BUBBLE CONTROL-BUBBLE-HATCH KNOBS)>

<OBJECT GOLD-SLOT
	(OBJIDX "124")
	(IN CONTROL-BUBBLE-ENTRANCE)
	(SYNONYM SLOT HOLE)
	(ADJECTIVE GOLD)
	(DESC "gold slot")
	(FLAGS OPENBIT CONTBIT NDESCBIT)
	(KEY TO GOLD-KEY)
	(CONTFCN GOLD-SLOT-CONT)
	(ACTION GOLD-SLOT-FCN)
	(CAPACITY 5)>

<OBJECT CONTROL-BUBBLE-HATCH
	(OBJIDX "125")
	(IN LOCAL-GLOBALS)
	(SYNONYM HATCH DOOR)
	(DESC "hatch")
	(FLAGS NDESCBIT DOORBIT)
	(ACTION HATCH-DOOR-F)>

<ROOM CONTROL-BUBBLE-ROOM
      (OBJIDX "236")
      (IN ROOMS)
      (DESC "Control Bubble")
      (OUT TO CONTROL-BUBBLE-ENTRANCE IF CONTROL-BUBBLE-HATCH IS OPEN)
      (ACTION CONTROL-BUBBLE-ROOM-FCN)
      (FLAGS RAIRBIT ONBIT RMUNGBIT)
      (GLOBAL CONTROL-BUBBLE CONTROL-BUBBLE-HATCH)
      (VALUE 25)>

<OBJECT DRIVE-BUBBLE
	(OBJIDX "126")
	(IN LOCAL-GLOBALS)
	(SYNONYM BUBBLE)
	(ADJECTIVE DRIVE)
	(DESC "drive bubble")
	(ACTION DRIVE-BUBBLE-FCN)
	(FLAGS NDESCBIT)>

<OBJECT CONTROL-BUBBLE
	(OBJIDX "127")
	(IN LOCAL-GLOBALS)
	(SYNONYM BUBBLE)
	(ADJECTIVE CONTROL FRONT FORE)
	(DESC "control bubble")
	(ACTION CONTROL-BUBBLE-FCN)
	(FLAGS NDESCBIT)>

"CONTROL ROOM GOODIES"

<OBJECT BROWN-SLOT
	(OBJIDX "128")
	(SYNONYM SLOT HOLE)
	(ADJECTIVE BROWN)
	(DESC "brown slot")
	(ACTION CONTROL-SLOT-FCN)
	(CONTFCN CONTROL-SLOT-FCN)
	(KEY TO BROWN-KEY)
	(FLAGS OPENBIT CONTBIT NDESCBIT)
	(CAPACITY 10)>

<OBJECT PINK-SLOT
	(OBJIDX "129")
	(SYNONYM SLOT HOLE)
	(ADJECTIVE PINK)
	(DESC "pink slot")
	(ACTION CONTROL-SLOT-FCN)
	(CONTFCN CONTROL-SLOT-FCN)
	(KEY TO PINK-KEY)
	(FLAGS NDESCBIT OPENBIT CONTBIT)
	(CAPACITY 10)>

<OBJECT GREEN-SLOT
	(OBJIDX "130")
	(SYNONYM SLOT HOLE)
	(ADJECTIVE GREEN)
	(DESC "green slot")
	(ACTION CONTROL-SLOT-FCN)
	(KEY TO GREEN-KEY)
	(CONTFCN CONTROL-SLOT-FCN)
	(FLAGS NDESCBIT OPENBIT CONTBIT)
	(CAPACITY 10)>

<OBJECT BLUE-SLOT
	(OBJIDX "131")
	(SYNONYM SLOT HOLE)
	(ADJECTIVE BLUE)
	(DESC "blue slot")
	(ACTION CONTROL-SLOT-FCN)
	(KEY TO BLUE-KEY)
	(CONTFCN CONTROL-SLOT-FCN)
	(FLAGS NDESCBIT OPENBIT CONTBIT)
	(CAPACITY 10)>

<OBJECT VIOLET-SLOT
	(OBJIDX "132")
	(SYNONYM SLOT HOLE)
	(ADJECTIVE VIOLET PURPLE)
	(DESC "violet slot")
	(ACTION CONTROL-SLOT-FCN)
	(KEY TO VIOLET-KEY)
	(CONTFCN CONTROL-SLOT-FCN)
	(FLAGS NDESCBIT OPENBIT CONTBIT)
	(CAPACITY 10)>

<OBJECT VIEW-SELECT
	(OBJIDX "133")
	(SYNONYM SCREEN)
	(ADJECTIVE PINK)
	(DESC "pink screen")
	(ACTION VIEW-SELECT-FCN)
	(DESCFCN VIEW-SELECT-FCN)
	(FLAGS OPENBIT CONTBIT NDESCBIT)>

<OBJECT ZOOM-IN
	(OBJIDX "134")
	(IN VIEW-SELECT)
	(SYNONYM SQUARE)
	(ADJECTIVE SMALL PINK)
	(DESC "small pink square")
	(ACTION VIEW-SELECT-FCN)
	(FLAGS NDESCBIT)>

<OBJECT ZOOM-OUT
	(OBJIDX "135")
	(IN VIEW-SELECT)
	(SYNONYM SQUARE)
	(ADJECTIVE LARGE PINK)
	(DESC "large pink square")
	(ACTION VIEW-SELECT-FCN)
	(FLAGS NDESCBIT)>

<OBJECT TARGET-SELECT
	(OBJIDX "136")
	(SYNONYM BUTTON SPOT)
	(ADJECTIVE BROWN)
	(DESC "brown spot")
	(FLAGS NDESCBIT)
	(ACTION TARGET-SELECT-FCN)>

<OBJECT SPEED-SELECT
	(OBJIDX "137")
	(SYNONYM BUTTON SPOT)
	(ADJECTIVE GREEN)
	(DESC "green spot")
	(FLAGS NDESCBIT)
	(ACTION SPEED-SELECT-FCN)>

<OBJECT EXECUTE-BUTTON
	(OBJIDX "138")
	(SYNONYM BUTTON SPOT)
	(ADJECTIVE BLUE)
	(DESC "blue spot")
	(FLAGS NDESCBIT)
	(ACTION EXECUTE-BUTTON-FCN)>

<OBJECT COURSE-SELECT
	(OBJIDX "139")
	(SYNONYM BUTTON SPOT)
	(ADJECTIVE VIOLET PURPLE)
	(DESC "violet spot")
	(FLAGS NDESCBIT)
	(ACTION COURSE-SELECT-FCN)>

<OBJECT CLEAR-SLOT
	(OBJIDX "140")
	(IN CONTROL-BUBBLE-ROOM)
	(SYNONYM SLOT HOLE)
	(ADJECTIVE CLEAR CRYSTAL)
	(DESC "crystal slot")
	(ACTION CONTROL-SLOT-FCN)
	(KEY TO CLEAR-KEY)
	(CONTFCN CONTROL-SLOT-FCN)
	(FLAGS OPENBIT CONTBIT NDESCBIT)
	(CAPACITY 10)>

<OBJECT ROD-RACK
	(OBJIDX "141")
	(IN YELLOW-LOCK)
	(SYNONYM RACK CARTON BASKET POCKET)
	(ADJECTIVE METAL SMALL)
	(DESC "metal basket")
	(FDESC
"Discarded here is a metal basket with a small pocket.")
	(ACTION ROD-RACK-FCN)
	(CONTFCN ROD-RACK-FCN)
	(FLAGS TAKEBIT OPENBIT CONTBIT)
	(CAPACITY 120)
	(SIZE 10)>

<OBJECT SPEAR
	(OBJIDX "142")
	(IN LOCAL-GLOBALS)
	(DESC "spear")
	(SYNONYM SPEAR SPEARS)
	(ACTION SPEAR-F)>

<OBJECT HUTS
	(OBJIDX "143")
	(IN LOCAL-GLOBALS)
	(DESC "hut")
	(SYNONYM HUTS HUT)
	(ACTION HUTS-F)>

<OBJECT VEGGIES
	(OBJIDX "144")
	(IN LOCAL-GLOBALS)
	(DESC "vegetation")
	(SYNONYM GRASS SHRUB CONIFER CYCAD)
	(ACTION VEGGIES-F)>

<OBJECT DRIVE-CONTROLS
	(OBJIDX "145")
	(IN DRIVE-BUBBLE)
	(DESC "control")
	(SYNONYM DIALS INDICATORS GAUGES BUTTON)
	(ACTION DRIVE-CONTROLS-F)>

<OBJECT CAGES
	(OBJIDX "146")
	(IN LOCAL-GLOBALS)
	(DESC "cage")
	(SYNONYM CAGE CAGES BARS)
	(ACTION CAGES-F)>

<OBJECT TOTEMS
	(OBJIDX "147")
	(IN LOCAL-GLOBALS)
	(DESC "funeral offering")
	(SYNONYM FRUITS GRAIN TOTEMS FETISH)
	(ACTION TOTEMS-F)>

<OBJECT KNOBS
	(OBJIDX "148")
	(IN LOCAL-GLOBALS)
	(DESC "knob")
	(SYNONYM KNOB KNOBS PROTRUSION HANDHOLD)
	(FLAGS TAKEBIT TRYTAKEBIT CLIMBBIT)
	(ACTION KNOBS-F)>
