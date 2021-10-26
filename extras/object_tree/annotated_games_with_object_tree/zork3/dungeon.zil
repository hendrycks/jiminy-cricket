"DUNGEON3 for
		     ZORK III: The Dungeon Master
		 The Great Underground Empire (Part 3)
	(c) Copyright 1982 Infocom, Inc.  All Rights Reserved.
"

<DIRECTIONS NORTH EAST WEST SOUTH NE NW SE SW UP DOWN IN OUT LAND CROSS>

"SUBTITLE GLOBAL OBJECTS"

<OBJECT RUBBLE
	(OBJIDX "81")
	(IN LOCAL-GLOBALS)
	(SYNONYM ROCK ROCKS BOULDER RUBBLE)
	(DESC "rubble")
	(FLAGS NDESCBIT)>

<OBJECT DEBRIS
	(OBJIDX "82")
	(IN GLOBAL-OBJECTS)
	(SYNONYM DUST DEBRIS)
	(DESC "dust and debris")
	(FLAGS NDESCBIT)>

<OBJECT CHASM
	(OBJIDX "83")
	(IN LOCAL-GLOBALS)
	(SYNONYM CHASM GORGE RAVINE)
	(ADJECTIVE ROCKY DEEP)
	(DESC "chasm")
	(ACTION CHASM-FCN)
	(FLAGS NDESCBIT)>

<OBJECT TUNNEL
	(OBJIDX "84")
	(IN GLOBAL-OBJECTS)
	(SYNONYM PASSAGE CRAWLWAY)
        (ADJECTIVE DARK SMOKY)
	(DESC "tunnel")
	(FLAGS NDESCBIT)
	(ACTION TUNNEL-OBJECT)>

<OBJECT EAST-WALL	;"was EAST-WALL"
	(OBJIDX "85")
	(IN GLOBAL-OBJECTS)
	(SYNONYM WALL)
	(ADJECTIVE EAST EASTERN)
	(DESC "eastern wall")
	(FLAGS NDESCBIT)
	(ACTION RANDOM-WALL)>

<OBJECT SOUTH-WALL	;"was SOUTH-WALL"
	(OBJIDX "86")
	(IN GLOBAL-OBJECTS)
	(SYNONYM WALL)
	(ADJECTIVE SOUTH SOUTHE) ;"only 6 chars count and southeast exists"
	(DESC "southern wall")
	(FLAGS NDESCBIT)
	(ACTION RANDOM-WALL)>

<OBJECT WEST-WALL	;"was WEST-WALL"
	(OBJIDX "87")
	(IN GLOBAL-OBJECTS)
	(SYNONYM WALL)
	(ADJECTIVE WEST WESTERN)
	(DESC "western wall")
	(FLAGS NDESCBIT)
	(ACTION RANDOM-WALL)>

<OBJECT NORTH-WALL	;"was NORTH-WALL"
	(OBJIDX "88")
	(IN GLOBAL-OBJECTS)
	(SYNONYM WALL)
	(ADJECTIVE NORTH NORTHE)	;"only six chars used..."
	(DESC "northern wall")
	(FLAGS NDESCBIT)
	(ACTION RANDOM-WALL)>

<OBJECT GLOBAL-WATER	;"was GLOBAL-WATER"
	(OBJIDX "89")
	(IN LOCAL-GLOBALS)
	(SYNONYM WATER QUANTITY)
	(DESC "water")
	(FLAGS DRINKBIT)
	(ACTION WATER-FCN)>

<OBJECT WATER
	(OBJIDX "90")
	(SYNONYM WATER QUANTITY LIQUID H2O)
	(DESC "quantity of water")
	(FLAGS TAKEBIT DRINKBIT)
	(ACTION WATER-FCN)
	(LDESC "There is some water here.")
	(SIZE 4)>

<OBJECT BROKEN-LAMP	;"was BLAMP"
	(OBJIDX "91")
	(SYNONYM LAMP LANTERN)
	(ADJECTIVE BROKEN BRASS)
	(DESC "broken lantern")
	(FLAGS TAKEBIT)
	(SIZE 15)>

<OBJECT LAMP	;"was LAMP"
	(OBJIDX "92")
	(IN CP-ANTE)
	(SYNONYM LAMP LANTERN)
	(ADJECTIVE BRASS)
	(DESC "lamp")
	(FLAGS TAKEBIT LIGHTBIT)
	(FDESC "Your old friend, the brass lantern, is at your feet.")
	(ACTION LANTERN)
	(SIZE 15)>

<OBJECT SWORD	;"was SWORD"
	(OBJIDX "93")
	(IN STONE)
	(SYNONYM SWORD ORCRIST GLAMDRING BLADE)
	(ADJECTIVE ELVISH OLD ANTIQUE)
	(DESC "sword")
	(FLAGS TAKEBIT WEAPONBIT TRYTAKEBIT)
	(ACTION SWORD-FCN)
	(SIZE 25)
	(VALUE 0)>

"CHINESE PUZZLE ROOMS/OBJECTS"

<ROOM CP-ANTE
      (OBJIDX "193")
      (IN ROOMS)
      (DESC "Royal Puzzle Entrance")
      (WEST TO CP-OUT)
      (NORTH TO MUSEUM-ENTRANCE)
      (UP TO MUSEUM-ENTRANCE)
      (DOWN PER CPENTER)
      (FLAGS RLANDBIT ONBIT)
      (ACTION CPANT-ROOM)
      (GLOBAL STAIRS)>

<ROOM CP-OUT
      (OBJIDX "194")
      (IN ROOMS)
      (DESC "Side Room")
      (NORTH TO CP-ANTE)
      (UP TO CP-ANTE)
      (EAST TO CP IF CP-FLAG ELSE "The steel door is closed.")
      (FLAGS RLANDBIT ONBIT)
      (ACTION CPOUT-ROOM)
      (GLOBAL CPDOOR STAIRS)>

<ROOM CP
      (OBJIDX "195")
      (IN ROOMS)
      (DESC "Room in a Puzzle")
      (NORTH PER CPEXIT)
      (SOUTH PER CPEXIT)
      (EAST PER CPEXIT)
      (WEST PER CPEXIT)
      (NE PER CPEXIT)
      (NW PER CPEXIT)
      (SE PER CPEXIT)
      (UP PER CPEXIT)
      (SW PER CPEXIT)
      (ACTION CP-ROOM)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL CPLADDER CPDOOR CPEWL CPWWL CPNWL CPSWL)>

;"SUBTITLE CHINESE PUZZLE OBJECTS"

<OBJECT WARNING-NOTE
	(OBJIDX "94")
	(IN CP-ANTE)
	(DESC "warning note")
	(SYNONYM NOTE WARNING TEXT)
	(ADJECTIVE WARNING SMALL)
	(FDESC "Lying on the ground is a small note of some kind.")
	(FLAGS TAKEBIT READBIT BURNBIT)
	(SIZE 2)
	(TEXT
"Warning:|
    The Royal Puzzle is dangerous and it is possible to become
trapped within its confines. Please do not enter the puzzle after hours
when museum personnel are not present.|
              The Management")>

<OBJECT CP-SLOT
	(OBJIDX "95")
	(SYNONYM CPSLT SLIT SLOT)
	(ADJECTIVE SMALL)
	(DESC "small slot")
	(FLAGS NDESCBIT OPENBIT)
	(ACTION CP-SLOT-FCN)
	(CAPACITY 4)>

<OBJECT CPDOOR
	(OBJIDX "96")
	(IN LOCAL-GLOBALS)
	(SYNONYM DOOR)
	(ADJECTIVE STEEL METAL)
	(DESC "steel door")
	(FLAGS NDESCBIT)
	(ACTION CPDOOR-F)>

<OBJECT LORE-BOOK
	(OBJIDX "97")
	(SYNONYM BOOK LORE TEXT)
	(ADJECTIVE LORE OLD STRANGE)
	(DESC "very ancient book")
	(FLAGS TAKEBIT READBIT)
	(LDESC
	 "There is an old book here.")
	(FDESC
	 "Nestled inside the niche is an old and dusty book.")
	(TEXT
"The book is written in a strong and elegant hand and is full of strange,
wondrous pictures. The text, penned in many colours, is in a tongue unknown
to you. The words seem to change colour as you read them.
The book itself is very old and the pages dry and brittle.")
	(SIZE 4)
	(ACTION LORE-BOOK-F)>

<GLOBAL CP-FLAG <>>

<OBJECT CPEWL		;"defined CPWALL"
        (OBJIDX "98")
        (IN LOCAL-GLOBALS)
	(SYNONYM WALL)
	(ADJECTIVE EAST EASTERN)
	(DESC "eastern wall")
	(FLAGS NDESCBIT)
	(ACTION CPWALL-OBJECT)>

<OBJECT CPWWL		;"defined CPWALL"
        (OBJIDX "99")
        (IN LOCAL-GLOBALS)
	(SYNONYM WALL)
	(ADJECTIVE WEST WESTERN)
	(DESC "western wall")
	(FLAGS NDESCBIT)
	(ACTION CPWALL-OBJECT)>

<OBJECT CPSWL		;"defined CPWALL"
        (OBJIDX "100")
        (IN LOCAL-GLOBALS)
	(SYNONYM WALL)
	(ADJECTIVE SOUTH)
	(DESC "southern wall")
	(FLAGS NDESCBIT)
	(ACTION CPWALL-OBJECT)>

<OBJECT CPNWL		;"defined CPWALL"
        (OBJIDX "101")
        (IN LOCAL-GLOBALS)
	(SYNONYM WALL)
	(ADJECTIVE NORTH)
	(DESC "northern wall")
	(FLAGS NDESCBIT)
	(ACTION CPWALL-OBJECT)>

<OBJECT CPLADDER		;"defined CPLADDER"
        (OBJIDX "102")
        (IN GLOBAL-OBJECTS)
	(SYNONYM LADDER)
	(DESC "ladder")
	(ACTION CPLADDER-OBJECT)>

;"Objects/rooms for old end-game"

<OBJECT INTDIR
	(OBJIDX "103")
	(IN GLOBAL-OBJECTS)
	(SYNONYM INTDIR)
	(FLAGS TOOLBIT)
	(DESC "direction")>

<OBJECT GUARDIAN
	(OBJIDX "104")
	(IN LOCAL-GLOBALS)
	(DESC "Guardians of Zork")
	(SYNONYM STATUE GUARDIAN GUARD GUARDS)
	(FLAGS ACTORBIT)
	(ACTION GUARDIANS)>

<OBJECT ROSE
	(OBJIDX "105")
	(IN LOCAL-GLOBALS)
	(DESC "compass rose")
	(SYNONYM ROSE)
	(ADJECTIVE COMPASS)
	(ACTION ROSE-F)>

<OBJECT MASTER
	(OBJIDX "106")
	(IN LOCAL-GLOBALS)
	(DESC "dungeon master")
	(SYNONYM MASTER MAN)
	(ADJECTIVE DUNGEON)
	(FLAGS ACTORBIT)
	(ACTION MASTER-F)>

<OBJECT DUNGEON-MASTER
	(OBJIDX "107")
	(IN BEHIND-DOOR)
	(DESC "dungeon master")
	(LDESC
"The dungeon master is quietly leaning on his staff here.")
	(SYNONYM MASTER DUNGEON MAN)
	(ADJECTIVE DUNGEON)
	(FLAGS ACTORBIT)
	(ACTION DUNGEON-MASTER-F)>

<OBJECT MIRROR
	(OBJIDX "108")
	(IN LOCAL-GLOBALS)
	(DESC "mirror")
	(SYNONYM MIRROR STRUCTURE)
	(ACTION MIRROR-FUNCTION)>

<OBJECT PANEL
	(OBJIDX "109")
	(IN LOCAL-GLOBALS)
	(DESC "panel")
	(SYNONYM PANEL)
	(ACTION PANEL-FUNCTION)>

<OBJECT CHANNEL
	(OBJIDX "110")
	(IN LOCAL-GLOBALS)
	(DESC "stone channel")
	(SYNONYM CHANNEL HOLE)
	(ADJECTIVE STONE)>

<ROOM MRD
      (OBJIDX "196")
      (IN ROOMS)
      (DESC "Hallway")
      (LDESC " ")
      (NORTH TO FRONT-DOOR)
      (NE TO FRONT-DOOR)
      (NW TO FRONT-DOOR)
      (SOUTH PER MRGO)
      (SE PER MRGO)
      (SW PER MRGO)
      (ACTION MRDF)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL ROSE CHANNEL GUARDIAN WOODEN-WALL)>

<ROOM MRG
      (OBJIDX "197")
      (IN ROOMS)
      (DESC "Hallway")
      (LDESC " ")
      (NORTH PER MRGO)
      (NW PER MRGO)
      (NE PER MRGO)
      (ENTER PER MIRIN)
      (SOUTH PER MRGO)
      (SW PER MRGO)
      (SE PER MRGO)
      (ACTION GUARDIANS)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL GUARDIAN)>

<ROOM MRC
      (OBJIDX "198")
      (IN ROOMS)
      (DESC "Hallway")
      (LDESC " ")
      (NORTH PER MRGO)
      (NW PER MRGO)
      (NE PER MRGO)
      (ENTER PER MIRIN)
      (SOUTH PER MRGO)
      (SW PER MRGO)
      (SE PER MRGO)
      (ACTION MRCF)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL MIRROR PANEL ROSE CHANNEL GUARDIAN WOODEN-WALL)>

<ROOM MRB
      (OBJIDX "199")
      (IN ROOMS)
      (DESC "Hallway")
      (LDESC " ")
      (NORTH PER MRGO)
      (NW PER MRGO)
      (NE PER MRGO)
      (ENTER PER MIRIN)
      (SOUTH PER MRGO)
      (SW PER MRGO)
      (SE PER MRGO)
      (ACTION MRBF)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL MIRROR PANEL ROSE CHANNEL WOODEN-WALL)>

<ROOM MRA
      (OBJIDX "200")
      (IN ROOMS)
      (DESC "Hallway")
      (LDESC " ")
      (NORTH PER MRGO)
      (NW PER MRGO)
      (NE PER MRGO)
      (ENTER PER MIRIN)
      (SOUTH TO MREYE)
      (ACTION MRAF)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL MIRROR PANEL ROSE CHANNEL WOODEN-WALL)>

<ROOM MRDE
      (OBJIDX "201")
      (IN ROOMS)
      (DESC "Narrow Room")
      (LDESC " ")
      (ENTER PER MIRIN)
      (WEST PER MIRIN)
      (NORTH TO FRONT-DOOR)
      (SOUTH TO MRG)
      (ACTION MRDEW)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL MIRROR PANEL GUARDIAN)>

<ROOM MRDW
      (OBJIDX "202")
      (IN ROOMS)
      (DESC "Narrow Room")
      (LDESC " ")
      (ENTER PER MIRIN)
      (WEST PER MIRIN)
      (NORTH TO FRONT-DOOR)
      (SOUTH TO MRG)
      (ACTION MRDEW)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL MIRROR PANEL GUARDIAN)>

<ROOM MRGE
      (OBJIDX "203")
      (IN ROOMS)
      (DESC "Narrow Room")
      (LDESC " ")
      (ENTER PER MIRIN)
      (WEST PER MIRIN)
      (NORTH TO MRD)
      (SOUTH TO MRC)
      (ACTION GUARDIANS)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL MIRROR PANEL GUARDIAN)>

<ROOM MRGW
      (OBJIDX "204")
      (IN ROOMS)
      (DESC "Narrow Room")
      (LDESC " ")
      (ENTER PER MIRIN)
      (EAST PER MIRIN)
      (NORTH TO MRD)
      (SOUTH TO MRC)
      (ACTION GUARDIANS)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL MIRROR PANEL GUARDIAN)>

<ROOM MRCE
      (OBJIDX "205")
      (IN ROOMS)
      (DESC "Narrow Room")
      (LDESC " ")
      (ENTER PER MIRIN)
      (WEST PER MIRIN)
      (NORTH TO MRG)
      (SOUTH TO MRB)
      (ACTION MRCEW)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL MIRROR PANEL GUARDIAN)>

<ROOM MRCW
      (OBJIDX "206")
      (IN ROOMS)
      (DESC "Narrow Room")
      (LDESC " ")
      (ENTER PER MIRIN)
      (EAST PER MIRIN)
      (NORTH TO MRG)
      (SOUTH TO MRB)
      (ACTION MRCEW)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL MIRROR PANEL GUARDIAN)>

<ROOM MRBE
      (OBJIDX "207")
      (IN ROOMS)
      (DESC "Narrow Room")
      (LDESC " ")
      (ENTER PER MIRIN)
      (WEST PER MIRIN)
      (NORTH TO MRC)
      (SOUTH TO MRA)
      (ACTION MRBEW)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL MIRROR PANEL GUARDIAN)>

<ROOM MRBW
      (OBJIDX "208")
      (IN ROOMS)
      (DESC "Narrow Room")
      (LDESC " ")
      (ENTER PER MIRIN)
      (EAST PER MIRIN)
      (NORTH TO MRC)
      (SOUTH TO MRA)
      (ACTION MRBEW)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL MIRROR PANEL GUARDIAN)>

<ROOM MRAE
      (OBJIDX "209")
      (IN ROOMS)
      (DESC "Narrow Room")
      (LDESC " ")
      (ENTER PER MIRIN)
      (WEST PER MIRIN)
      (NORTH TO MRB)
      (SOUTH TO MREYE)
      (ACTION MRAEW)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL MIRROR PANEL GUARDIAN)>

<ROOM MRAW
      (OBJIDX "210")
      (IN ROOMS)
      (DESC "Narrow Room")
      (LDESC " ")
      (ENTER PER MIRIN)
      (EAST PER MIRIN)
      (NORTH TO MRB)
      (SOUTH TO MREYE)
      (ACTION MRAEW)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL MIRROR PANEL GUARDIAN)>

<ROOM IN-MIRROR
      (OBJIDX "211")
      (IN ROOMS)
      (DESC "Inside Mirror")
      (LDESC " ")
      (OUT PER MIROUT)
      (NORTH PER MIROUT)
      (SOUTH PER MIROUT)
      (NW PER MIROUT)
      (NE PER MIROUT)
      (SE PER MIROUT)
      (SW PER MIROUT)
      (WEST PER MIROUT)
      (EAST PER MIROUT)
      (ACTION MAGIC-MIRROR)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL ROSE CHANNEL GUARDIAN)>

<ROOM MR-ANTE
      (OBJIDX "212")
      (IN ROOMS)
      (DESC "Button Room")
      (LDESC
"You are at the southern end of a long hall. To the south, stairs ascend
into darkness. To the north the corridor is illuminated by torches set
high in the walls, out of reach. On one wall is a red button.")
       (SOUTH TO MSTAIRS IF SECRET-DOOR IS OPEN)
       (UP TO MSTAIRS IF SECRET-DOOR IS OPEN)
       (NORTH TO MREYE)
       (FLAGS RLANDBIT ONBIT)
       (GLOBAL SECRET-DOOR STAIRS)
       (PSEUDO "TORCH" TORCH-PSEUDO "TORCHE" TORCH-PSEUDO)>

<ROOM MREYE
      (OBJIDX "213")
      (IN ROOMS)
      (DESC "Beam Room")
      (LDESC " ")
      (NORTH PER MRGO)
      (NW PER MRGO)
      (NE PER MRGO)
      (SOUTH TO MR-ANTE)
      (ACTION MREYE-ROOM)
      (FLAGS RLANDBIT ONBIT)>

<ROOM MSTAIRS
      (OBJIDX "214")
      (IN ROOMS)
      (DESC "Engravings Room")
      (NORTH TO MR-ANTE IF SECRET-DOOR IS OPEN ELSE "You can't go that way.")
      (DOWN TO MR-ANTE IF SECRET-DOOR IS OPEN ELSE "You can't go that way.")
      (SW TO DAMP-PASSAGE)
      (SE TO DEAD-END)
      (FLAGS RLANDBIT)
      (ACTION MSTAIRS-F)
      (GLOBAL SECRET-DOOR STAIRS)>

<ROOM DEAD-END
      (OBJIDX "215")
      (IN ROOMS)
      (DESC "Dead End")
      (LDESC
"You have come to the end of two adjoining passages to the west and the
northwest.")
      (WEST TO DAMP-PASSAGE)
      (NW TO MSTAIRS)
      (FLAGS RLANDBIT)>

<ROOM DAMP-PASSAGE
      (OBJIDX "216")
      (IN ROOMS)
      (DESC "Damp Passage")
      (LDESC
"This is a particularly damp spot even by dungeon standards. You can see
the junction to the west, and two similar passages to the east and northeast.
A wide stone channel steeply descends into the room from the south. It is
covered with slippery moss and lichen. The channel crosses the room, but the
opening where it once continued north is now blocked by rubble.")
      (WEST TO JUNCTION)
      (EAST TO DEAD-END)
      (NE TO MSTAIRS)
      (NORTH "The opening is blocked by tons of debris.")
      (UP "The channel is too steep and the moss too slippery.")
      (SOUTH "The channel is too steep and the moss too slippery.")
      (FLAGS RLANDBIT)
      (GLOBAL MOSS RUBBLE WATER-CHANNEL)>

<ROOM EAST-CORRIDOR
      (OBJIDX "217")
      (IN ROOMS)
      (DESC "East Corridor")
      (LDESC
"This is a hall with polished marble walls. It widens slightly as it turns
west at its northern and southern ends.")
      (NORTH TO NORTH-CORRIDOR)
      (SOUTH TO SOUTH-CORRIDOR)
      (FLAGS RLANDBIT ONBIT)>

<ROOM WEST-CORRIDOR
      (OBJIDX "218")
      (IN ROOMS)
      (DESC "West Corridor")
      (LDESC
"This is a hall with polished marble walls. It widens slightly as it turns
east at its northern and southern ends.")
      (NORTH TO NORTH-CORRIDOR)
      (SOUTH TO SOUTH-CORRIDOR)
      (FLAGS RLANDBIT ONBIT)>

<ROOM SOUTH-CORRIDOR
      (OBJIDX "219")
      (IN ROOMS)
      (DESC "South Corridor")
      (EAST TO EAST-CORRIDOR)
      (WEST TO WEST-CORRIDOR)
      (NORTH PER BRONZE-DOOR-EXIT)
      (SOUTH TO BEHIND-DOOR)
      (ACTION SOUTH-CORRIDOR-F)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL BRONZE-DOOR)>

<ROOM BEHIND-DOOR
      (OBJIDX "220")
      (IN ROOMS)
      (DESC "Narrow Corridor")
      (NORTH TO SOUTH-CORRIDOR)
      (SOUTH TO FRONT-DOOR IF DUNGEON-DOOR IS OPEN)
      (ACTION BEHIND-DOOR-F)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL DUNGEON-DOOR DUNGEON-PANEL)>

<ROOM FRONT-DOOR
      (OBJIDX "221")
      (IN ROOMS)
      (DESC "Dungeon Entrance")
      (LDESC " ")
      (NORTH TO BEHIND-DOOR IF DUNGEON-DOOR IS OPEN)
      (ENTER TO BEHIND-DOOR IF DUNGEON-DOOR IS OPEN)
      (SOUTH PER MRGO)
      (SE TO MRDE)
      (SW TO MRDW)
      (ACTION FRONT-DOOR-F)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL MASTER DUNGEON-DOOR DUNGEON-PANEL WOODEN-WALL)>

<OBJECT WOODEN-WALL
	(OBJIDX "111")
	(IN LOCAL-GLOBALS)
	(DESC "wooden wall")
	(SYNONYM WALL)
	(ADJECTIVE WOOD WOODEN)
	(ACTION WOODEN-WALL-F)>

<ROOM NORTH-CORRIDOR
      (OBJIDX "222")
      (IN ROOMS)
      (DESC "North Corridor")
      (LDESC " ")
      (EAST TO EAST-CORRIDOR)
      (WEST TO WEST-CORRIDOR)
      (NORTH TO PARAPET)
      (SOUTH TO CELL IF CELL-DOOR IS OPEN)
      (ENTER TO CELL IF CELL-DOOR IS OPEN)
      (ACTION NORTH-CORRIDOR-F)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL MASTER CELL-DOOR PARAPET-OBJ FLAMING-PIT)>

<ROOM PARAPET
      (OBJIDX "223")
      (IN ROOMS)
      (DESC "Parapet")
      (LDESC " ")
      (SOUTH TO NORTH-CORRIDOR)
      (NORTH "You would be burned to a crisp in no time.")
      (ACTION PARAPET-F)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL MASTER PARAPET-OBJ FLAMING-PIT)>

<ROOM CELL
      (OBJIDX "224")
      (IN ROOMS)
      (DESC "Prison Cell")
      (LDESC " ")
      (OUT TO NORTH-CORRIDOR IF CELL-DOOR IS OPEN)
      (NORTH TO NORTH-CORRIDOR IF CELL-DOOR IS OPEN)
      (ACTION CELL-ROOM)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL MASTER BRONZE-DOOR CELL-DOOR PARAPET-OBJ FLAMING-PIT)>

<ROOM PRISON-CELL
      (OBJIDX "225")
      (IN ROOMS)
      (DESC "Prison Cell")
      (LDESC
"You are in a bare prison cell. Its wooden door is securely fastened, and
you can see only flames and smoke through its small window.")
      (OUT "The door is securely fastened.")
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL LOCKED-DOOR MASTER FLAMING-PIT)>

<ROOM GOOD-CELL
      (OBJIDX "226")
      (IN ROOMS)
      (DESC "Prison Cell")
      (LDESC " ")
      (OUT TO NIRVANA IF BRONZE-DOOR IS OPEN)
      (SOUTH TO NIRVANA IF BRONZE-DOOR IS OPEN)
      (ACTION NCELL-ROOM)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL GOOD-LOCKED-DOOR MASTER BRONZE-DOOR FLAMING-PIT)>

<ROOM NIRVANA
      (OBJIDX "227")
      (IN ROOMS)
      (DESC "Treasury of Zork")
      (LDESC
"This is a large room, richly appointed in a style that bespeaks exquisite
taste. To judge from its contents, it is the ultimate storehouse of the
wealth of the Great Underground Empire.|
|
There are chests containing precious jewels, mountains of
zorkmids, rare paintings, ancient statuary, and beguiling curios.|
|
On one wall is an annotated map of the Empire, showing the locations of
various troves of treasure, and of many superior scenic views.|
|
On a desk at the far end of the room are stock certificates
representing a controlling interest in FrobozzCo International, the
multinational conglomerate and parent company of
the Frobozz Magic Boat Co., etc.|
")
      (ACTION NIRVANA-F)
      (FLAGS RLANDBIT ONBIT)>

\

<OBJECT RUNES
	(OBJIDX "112")
	(IN MSTAIRS)
	(DESC "runes")
	(SYNONYM ENGRAV TEXT WALL RUNES)
	(ADJECTIVE CARVED)
	(FLAGS NDESCBIT READBIT)
	(ACTION RUNES-F)>

<OBJECT T-BAR
	(OBJIDX "113")
	(IN IN-MIRROR)
	(DESC "T-bar")
	(SYNONYM T-BAR BAR)
	(FLAGS NDESCBIT)
	(ACTION T-BAR-F)>

<OBJECT BLACK-PANEL
	(OBJIDX "114")
	(IN IN-MIRROR)
	(DESC "black panel")
	(SYNONYM WALL PANEL)
	(ADJECTIVE BLACK)
	(FLAGS NDESCBIT)
	(ACTION MPANELS)>

<OBJECT BRONZE-DOOR
	(OBJIDX "115")
	(IN LOCAL-GLOBALS)
	(DESC "bronze door")
	(SYNONYM DOOR)
	(ADJECTIVE BRONZE)
	(FLAGS CONTBIT DOORBIT INVISIBLE)
	(ACTION BRONZE-DOOR-F)>

<OBJECT CELL-DOOR
	(OBJIDX "116")
	(IN LOCAL-GLOBALS)
	(DESC "cell door")
	(SYNONYM DOOR)
	(ADJECTIVE WOOD WOODEN CELL)
	(FLAGS CONTBIT DOORBIT)
	(ACTION CELL-DOOR-F)>

<OBJECT COMPASS-ARROW
	(OBJIDX "117")
	(IN IN-MIRROR)
	(DESC "compass arrow")
	(SYNONYM ARROW)
	(ADJECTIVE COMPASS)
	(FLAGS NDESCBIT)>

<OBJECT DIAL-BUTTON
	(OBJIDX "118")
	(IN PARAPET)
	(DESC "large button")
	(SYNONYM BUTTON)
	(ADJECTIVE LARGE)
	(FLAGS NDESCBIT)
	(ACTION DIALBUTTON)>

<OBJECT GOOD-LOCKED-DOOR
	(OBJIDX "119")
	(IN LOCAL-GLOBALS)
	(DESC "cell door")
	(SYNONYM DOOR)
	(ADJECTIVE LOCKED WOOD WOODEN CELL)
	(FLAGS NDESCBIT)
	(ACTION LOCKED-DOOR-F)>

<OBJECT LOCKED-DOOR
	(OBJIDX "120")
	(IN LOCAL-GLOBALS)
	(DESC "cell door")
	(SYNONYM DOOR)
	(ADJECTIVE LOCKED WOOD WOODEN CELL)
	(FLAGS NDESCBIT)
	(ACTION LOCKED-DOOR-F)>

<OBJECT LONG-POLE
	(OBJIDX "121")
	(IN IN-MIRROR)
	(DESC "long pole")
	(SYNONYM POLE)
	(ADJECTIVE LONG CENTER)
	(FLAGS NDESCBIT)>

<OBJECT MAHOGANY-PANEL
	(OBJIDX "122")
	(IN IN-MIRROR)
	(DESC "mahogany panel")
	(SYNONYM WALL PANEL)
	(ADJECTIVE MAHOGANY)
	(FLAGS NDESCBIT)
	(ACTION MENDS)>

<OBJECT FLAMING-PIT
	(OBJIDX "123")
	(IN LOCAL-GLOBALS)
	(DESC "flaming pit")
	(SYNONYM PIT ABYSS)
	(ADJECTIVE FIERY FLAMING)
	(FLAGS NDESCBIT)
	(ACTION FLAMING-PIT-F)>

<OBJECT PARAPET-OBJ
	(OBJIDX "124")
	(IN LOCAL-GLOBALS)
	(DESC "parapet")
	(SYNONYM PARAPET)
	(FLAGS NDESCBIT)
	(ACTION PARAPET-OBJ-F)>

<OBJECT PINE-PANEL
	(OBJIDX "125")
	(IN IN-MIRROR)
	(DESC "pine panel")
	(SYNONYM PANEL WALL)
	(ADJECTIVE PINE)
	(FLAGS NDESCBIT)
	(ACTION MENDS)>

<OBJECT BEAM
	(OBJIDX "126")
	(IN MREYE)
	(DESC "red beam of light")
	(SYNONYM BEAM LIGHT)
	(ADJECTIVE RED)
	(FLAGS NDESCBIT OPENBIT CONTBIT)
	(CAPACITY 100)
	(ACTION BEAM-FUNCTION)>

<OBJECT RED-BUTTON
	(OBJIDX "127")
	(IN MR-ANTE)
	(DESC "red button")
	(SYNONYM BUTTON)
	(ADJECTIVE RED)
	(FLAGS NDESCBIT)
	(ACTION MRSWITCH)>

<OBJECT RED-PANEL
	(OBJIDX "128")
	(IN IN-MIRROR)
	(DESC "red panel")
	(SYNONYM PANEL WALL)
	(ADJECTIVE RED)
	(FLAGS NDESCBIT)
	(ACTION MPANELS)>

<OBJECT SHORT-POLE
	(OBJIDX "129")
	(IN IN-MIRROR)
	(DESC "short pole")
	(SYNONYM POLE POST HANDGRIP GRIP)
	(ADJECTIVE SHORT SMALL HAND)
	(FLAGS NDESCBIT)
	(ACTION SHORT-POLE-F)>

<OBJECT SUNDIAL
	(OBJIDX "130")
	(IN PARAPET)
	(DESC "sundial")
	(SYNONYM DIAL INDICATOR ARROW SUNDIAL)
	(ADJECTIVE INDICATOR SUN)
	(FLAGS NDESCBIT TURNBIT)
	(ACTION DIAL)>

<OBJECT YELLOW-PANEL
	(OBJIDX "131")
	(IN IN-MIRROR)
	(DESC "yellow panel")
	(SYNONYM PANEL WALL)
	(ADJECTIVE YELLOW)
	(FLAGS NDESCBIT)
	(ACTION MPANELS)>

<OBJECT WHITE-PANEL
	(OBJIDX "132")
	(IN IN-MIRROR)
	(DESC "white panel")
	(SYNONYM PANEL WALL)
	(ADJECTIVE WHITE)
	(FLAGS NDESCBIT)
	(ACTION MPANELS)>

<OBJECT WOODEN-BAR
	(OBJIDX "133")
	(IN IN-MIRROR)
	(DESC "wooden bar")
	(SYNONYM BAR)
	(ADJECTIVE WOOD WOODEN)
	(FLAGS NDESCBIT)>

<OBJECT DUNGEON-PANEL
	(OBJIDX "134")
	(IN LOCAL-GLOBALS)
	(DESC "panel")
	(SYNONYM PANEL)
	(FLAGS NDESCBIT)
	(ACTION DUNGEON-PANEL-F)>

<OBJECT DUNGEON-DOOR
	(OBJIDX "135")
	(IN LOCAL-GLOBALS)
	(DESC "wooden door")
	(SYNONYM DOOR)
	(ADJECTIVE WOOD WOODEN)
	(FLAGS NDESCBIT DOORBIT CONTBIT)
	(ACTION DUNGEON-DOOR-F)>

<OBJECT SECRET-DOOR
	(OBJIDX "136")
	(IN LOCAL-GLOBALS)
	(DESC "secret door")
	(SYNONYM DOOR)
	(ADJECTIVE SECRET)
	(FLAGS DOORBIT CONTBIT INVISIBLE)
	(ACTION SECRET-DOOR-F)>

<OBJECT OLD-MAN
	(OBJIDX "137")
	(DESC "old man")
	(SYNONYM MAN)
	(ADJECTIVE OLD)
	(FLAGS ACTORBIT)
	(ACTION OLD-MAN-F)
	(DESCFCN OLD-MAN-F)>

<OBJECT CP-HOLE
	(OBJIDX "138")
	(IN CP-ANTE)
	(DESC "hole")
	(SYNONYM HOLE)
	(ADJECTIVE ROUND)
	(FLAGS NDESCBIT)
	(ACTION CP-HOLE-F)>

<ROUTINE GO () 
	 ;"put interrupts on clock chain"
	 <QUEUE I-LANTERN 200>
;"clean up junk compiler can't do"
	 <SETG CURRENT-LAMP ,LAMP>
	 <PUT ,CPOBJS <* 8 21> 1>
	 <PUT ,CPOBJS <+ <* 8 21> 1> ,LORE-BOOK>
	 <PUT ,CPOBJS <* 8 32> 1>
	 <PUT ,CPOBJS <+ <* 8 32> 1> ,CP-SLOT>
 ;"set up and go"
	 <SETG LIT T>
	 <SETG WINNER ,ADVENTURER>
	 <SETG PLAYER ,WINNER>
	 <SETG MLOC ,MRB>
	 <SETG HERE ,ZORK2-STAIR>
	 <MOVE ,WINNER ,HERE>
	 ;<ENABLE <QUEUE I-CLEFT <+ 70 <RANDOM 70>>>>
	 <ENABLE <QUEUE I-VIEW-CHANGE 4>>
	 <SETG P-IT-OBJECT <>>
	 <COND (<NOT <FSET? ,HERE ,TOUCHBIT>>
		<TELL
"As in a dream, you see yourself tumbling down a great, dark staircase.
All about you are shadowy images of struggles against fierce opponents
and diabolical traps. These give way to another round of images: of
imposing stone figures, a cool, clear lake, and, now, of an old, yet
oddly youthful man. He turns toward you slowly, his long, silver hair
dancing about him in a fresh breeze. \"You have reached the final test,
my friend! You are proved clever and powerful, but this is not yet
enough! Seek me when you feel yourself worthy!\" The dream dissolves
around you as his last words echo through the void...." CR>
		<CRLF>
		<V-VERSION>
		<CRLF>)>
	 <MOVE ,WINNER ,HERE>
	 <MOVE ,LAMP ,HERE>
	 <V-LOOK>
	 <MAIN-LOOP>
	 <AGAIN>>

<GLOBAL CLEFT-QUEUED? <>>
