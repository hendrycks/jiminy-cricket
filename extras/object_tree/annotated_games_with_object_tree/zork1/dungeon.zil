"1DUNGEON for
	        Zork I: The Great Underground Empire
	(c) Copyright 1983 Infocom, Inc. All Rights Reserved."

<DIRECTIONS NORTH EAST WEST SOUTH NE NW SE SW UP DOWN IN OUT LAND>

<GLOBAL SCORE-MAX 350>

<GLOBAL FALSE-FLAG <>>

"SUBTITLE OBJECTS"

<OBJECT BOARD
	(OBJIDX "18")
	(IN LOCAL-GLOBALS)
	(SYNONYM BOARDS BOARD)
	(DESC "board")
	(FLAGS NDESCBIT)
	(ACTION BOARD-F)>

<OBJECT TEETH
	(OBJIDX "19")
	(IN GLOBAL-OBJECTS)
	(SYNONYM OVERBOARD TEETH)
	(DESC "set of teeth")
	(FLAGS NDESCBIT)
	(ACTION TEETH-F)>

<OBJECT WALL
	(OBJIDX "20")
	(IN GLOBAL-OBJECTS)
	(SYNONYM WALL WALLS)
	(ADJECTIVE SURROUNDING)
	(DESC "surrounding wall")>

<OBJECT GRANITE-WALL
	(OBJIDX "21")
	(IN GLOBAL-OBJECTS)
	(SYNONYM WALL)
	(ADJECTIVE GRANITE)
	(DESC "granite wall")
	(ACTION GRANITE-WALL-F)>

<OBJECT SONGBIRD
	(OBJIDX "22")
	(IN LOCAL-GLOBALS)
	(SYNONYM BIRD SONGBIRD)
	(ADJECTIVE SONG)
	(DESC "songbird")
	(FLAGS NDESCBIT)
	(ACTION SONGBIRD-F)>

<OBJECT WHITE-HOUSE	
	(OBJIDX "23")
	(IN LOCAL-GLOBALS)
	(SYNONYM HOUSE)
	(ADJECTIVE WHITE BEAUTI COLONI)
	(DESC "white house")
	(FLAGS NDESCBIT)
	(ACTION WHITE-HOUSE-F)>

<OBJECT FOREST
	(OBJIDX "24")
	(IN LOCAL-GLOBALS)
	(SYNONYM FOREST TREES PINES HEMLOCKS)
	(DESC "forest")
	(FLAGS NDESCBIT)
	(ACTION FOREST-F)>

<OBJECT TREE
	(OBJIDX "25")
	(IN LOCAL-GLOBALS)
	(SYNONYM TREE BRANCH)
	(ADJECTIVE LARGE STORM ;"-TOSSED")
	(DESC "tree")
	(FLAGS NDESCBIT CLIMBBIT)>

<OBJECT MOUNTAIN-RANGE
	(OBJIDX "26")
	(IN MOUNTAINS)
	(DESC "mountain range")
	(SYNONYM MOUNTAIN RANGE)
	(ADJECTIVE IMPASSABLE FLATHEAD)
	(FLAGS NDESCBIT CLIMBBIT)
	(ACTION MOUNTAIN-RANGE-F)>

<OBJECT GLOBAL-WATER
	(OBJIDX "27")
	(IN LOCAL-GLOBALS)
	(SYNONYM WATER QUANTITY)
	(DESC "water")
	(FLAGS DRINKBIT)
	(ACTION WATER-F)>

<OBJECT WATER
	(OBJIDX "28")
	(IN BOTTLE)
	(SYNONYM WATER QUANTITY LIQUID H2O)
	(DESC "quantity of water")
	(FLAGS TRYTAKEBIT TAKEBIT DRINKBIT)
	(ACTION WATER-F)
	(SIZE 4)>

<OBJECT	KITCHEN-WINDOW
	(OBJIDX "29")
	(IN LOCAL-GLOBALS)
	(SYNONYM WINDOW)
	(ADJECTIVE KITCHEN SMALL)
	(DESC "kitchen window")
	(FLAGS DOORBIT NDESCBIT)
	(ACTION KITCHEN-WINDOW-F)>

<OBJECT CHIMNEY
	(OBJIDX "30")
	(IN LOCAL-GLOBALS)
	(SYNONYM CHIMNEY)
	(ADJECTIVE DARK NARROW)
	(DESC "chimney")
	(ACTION CHIMNEY-F)
	(FLAGS CLIMBBIT NDESCBIT)>

<OBJECT GHOSTS
	(OBJIDX "31")
	(IN ENTRANCE-TO-HADES)
	(SYNONYM GHOSTS SPIRITS FIENDS FORCE)
	(ADJECTIVE INVISIBLE EVIL)
	(DESC "number of ghosts")
	(FLAGS ACTORBIT NDESCBIT)
	(ACTION GHOSTS-F)>

<OBJECT SKULL
	(OBJIDX "32")
	(IN LAND-OF-LIVING-DEAD)
	(SYNONYM SKULL HEAD TREASURE)
	(ADJECTIVE CRYSTAL)
	(DESC "crystal skull")
	(FDESC
"Lying in one corner of the room is a beautifully carved crystal skull.
It appears to be grinning at you rather nastily.")
	(FLAGS TAKEBIT)
	(VALUE 10)
	(TVALUE 10)>

<OBJECT LOWERED-BASKET
	(OBJIDX "33")
	(IN LOWER-SHAFT)
	(SYNONYM CAGE DUMBWAITER BASKET)
	(ADJECTIVE LOWERED)
	(LDESC "From the chain is suspended a basket.")
	(DESC "basket")
	(FLAGS TRYTAKEBIT)
	(ACTION BASKET-F)>

<OBJECT RAISED-BASKET
	(OBJIDX "34")
	(IN SHAFT-ROOM)
	(SYNONYM CAGE DUMBWAITER BASKET)
	(DESC "basket")
	(FLAGS TRANSBIT TRYTAKEBIT CONTBIT OPENBIT)
	(ACTION BASKET-F)
	(LDESC "At the end of the chain is a basket.")
	(CAPACITY 50)>

<OBJECT LUNCH
	(OBJIDX "35")
	(IN SANDWICH-BAG)
	(SYNONYM FOOD SANDWICH LUNCH DINNER)
	(ADJECTIVE HOT PEPPER)
	(DESC "lunch")
	(FLAGS TAKEBIT FOODBIT)
	(LDESC "A hot pepper sandwich is here.")>

<OBJECT BAT
	(OBJIDX "36")
	(IN BAT-ROOM)
	(SYNONYM BAT VAMPIRE)
	(ADJECTIVE VAMPIRE DERANGED)
	(DESC "bat")
	(FLAGS ACTORBIT TRYTAKEBIT)
	(DESCFCN BAT-D)
	(ACTION BAT-F)>

<OBJECT BELL
	(OBJIDX "37")
	(IN NORTH-TEMPLE)
	(SYNONYM BELL)
	(ADJECTIVE SMALL BRASS)
	(DESC "brass bell")
	(FLAGS TAKEBIT)
	(ACTION BELL-F)>

<OBJECT HOT-BELL
	(OBJIDX "38")
	(SYNONYM BELL)
	(ADJECTIVE BRASS HOT RED SMALL)
	(DESC "red hot brass bell")
	(FLAGS TRYTAKEBIT)
	(ACTION HOT-BELL-F)
	(LDESC "On the ground is a red hot bell.")>

<OBJECT AXE
	(OBJIDX "39")
	(IN TROLL)
	(SYNONYM AXE AX)
	(ADJECTIVE BLOODY)
	(DESC "bloody axe")
	(FLAGS WEAPONBIT TRYTAKEBIT TAKEBIT NDESCBIT)
	(ACTION AXE-F)
	(SIZE 25)>

<OBJECT BOLT
	(OBJIDX "40")
	(IN DAM-ROOM)
	(SYNONYM BOLT NUT)
	(ADJECTIVE METAL LARGE)
	(DESC "bolt")
	(FLAGS NDESCBIT TURNBIT TRYTAKEBIT)
	(ACTION BOLT-F)>

<OBJECT BUBBLE
	(OBJIDX "41")
	(IN DAM-ROOM)
	(SYNONYM BUBBLE)
	(ADJECTIVE SMALL GREEN PLASTIC)
	(DESC "green bubble")
	(FLAGS NDESCBIT TRYTAKEBIT)
	(ACTION BUBBLE-F)>

<OBJECT ALTAR
	(OBJIDX "42")
	(IN SOUTH-TEMPLE)
	(SYNONYM ALTAR)
	(DESC "altar")
	(FLAGS NDESCBIT SURFACEBIT CONTBIT OPENBIT)
	(CAPACITY 50)>

<OBJECT BOOK
	(OBJIDX "43")
	(IN ALTAR)
	(SYNONYM BOOK PRAYER PAGE BOOKS)
	(ADJECTIVE LARGE BLACK)
	(DESC "black book")
	(FLAGS READBIT TAKEBIT CONTBIT BURNBIT TURNBIT)
	(ACTION BLACK-BOOK)
	(FDESC "On the altar is a large black book, open to page 569.")
	(SIZE 10)
	(TEXT
"Commandment #12592|
|
Oh ye who go about saying unto each:  \"Hello sailor\":|
Dost thou know the magnitude of thy sin before the gods?|
Yea, verily, thou shalt be ground between two stones.|
Shall the angry gods cast thy body into the whirlpool?|
Surely, thy eye shall be put out with a sharp stick!|
Even unto the ends of the earth shalt thou wander and|
Unto the land of the dead shalt thou be sent at last.|
Surely thou shalt repent of thy cunning." )>

<OBJECT BROKEN-LAMP
	(OBJIDX "44")
	(SYNONYM LAMP LANTERN)
	(ADJECTIVE BROKEN)
	(DESC "broken lantern")
	(FLAGS TAKEBIT)>

<OBJECT SCEPTRE
	(OBJIDX "45")
	(IN COFFIN)
	(SYNONYM SCEPTRE SCEPTER TREASURE)
	(ADJECTIVE SHARP EGYPTIAN ANCIENT ENAMELED)
	(DESC "sceptre")
	(FLAGS TAKEBIT WEAPONBIT)
	(ACTION SCEPTRE-FUNCTION)
	(LDESC
"An ornamented sceptre, tapering to a sharp point, is here.")
	(FDESC
"A sceptre, possibly that of ancient Egypt itself, is in the coffin. The
sceptre is ornamented with colored enamel, and tapers to a sharp point.")
	(SIZE 3)
	(VALUE 4)
	(TVALUE 6)>

<OBJECT TIMBERS
	(OBJIDX "46")
	(IN TIMBER-ROOM)
	(SYNONYM TIMBERS PILE)
	(ADJECTIVE WOODEN BROKEN)
	(DESC "broken timber")
	(FLAGS TAKEBIT)
	(SIZE 50)>

<OBJECT	SLIDE
	(OBJIDX "47")
	(IN LOCAL-GLOBALS)
	(SYNONYM CHUTE RAMP SLIDE)
	(ADJECTIVE STEEP METAL TWISTING)
	(DESC "chute")
	(FLAGS CLIMBBIT)
	(ACTION SLIDE-FUNCTION)>

<OBJECT KITCHEN-TABLE
	(OBJIDX "48")
	(IN KITCHEN)
	(SYNONYM TABLE)
	(ADJECTIVE KITCHEN)
	(DESC "kitchen table")
	(FLAGS NDESCBIT CONTBIT OPENBIT SURFACEBIT)
	(CAPACITY 50)>

<OBJECT ATTIC-TABLE
	(OBJIDX "49")
	(IN ATTIC)
	(SYNONYM TABLE)
	(DESC "table")
	(FLAGS NDESCBIT CONTBIT OPENBIT SURFACEBIT)
	(CAPACITY 40)>

<OBJECT SANDWICH-BAG
	(OBJIDX "50")
	(IN KITCHEN-TABLE)
	(SYNONYM BAG SACK)
	(ADJECTIVE BROWN ELONGATED SMELLY)
	(DESC "brown sack")
	(FLAGS TAKEBIT CONTBIT BURNBIT)
	(FDESC
"On the table is an elongated brown sack, smelling of hot peppers.")
	(CAPACITY 9)
	(SIZE 9)
	(ACTION SANDWICH-BAG-FCN)>

<OBJECT TOOL-CHEST
	(OBJIDX "51")
	(IN MAINTENANCE-ROOM)
	(SYNONYM CHEST CHESTS GROUP TOOLCHESTS)
	(ADJECTIVE TOOL)
	(DESC "group of tool chests")
	(FLAGS CONTBIT OPENBIT TRYTAKEBIT SACREDBIT)
	(ACTION TOOL-CHEST-FCN)>

<OBJECT YELLOW-BUTTON
	(OBJIDX "52")
	(IN MAINTENANCE-ROOM)
	(SYNONYM BUTTON SWITCH)
	(ADJECTIVE YELLOW)
	(DESC "yellow button")
	(FLAGS NDESCBIT)
	(ACTION BUTTON-F)>

<OBJECT BROWN-BUTTON
	(OBJIDX "53")
	(IN MAINTENANCE-ROOM)
	(SYNONYM BUTTON SWITCH)
	(ADJECTIVE BROWN)
	(DESC "brown button")
	(FLAGS NDESCBIT)
	(ACTION BUTTON-F)>

<OBJECT RED-BUTTON
	(OBJIDX "54")
	(IN MAINTENANCE-ROOM)
	(SYNONYM BUTTON SWITCH)
	(ADJECTIVE RED)
	(DESC "red button")
	(FLAGS NDESCBIT)
	(ACTION BUTTON-F)>

<OBJECT BLUE-BUTTON
	(OBJIDX "55")
	(IN MAINTENANCE-ROOM)
	(SYNONYM BUTTON SWITCH)
	(ADJECTIVE BLUE)
	(DESC "blue button")
	(FLAGS NDESCBIT)
	(ACTION BUTTON-F)>

<OBJECT TROPHY-CASE	;"first obj so L.R. desc looks right."
	(OBJIDX "56")
	(IN LIVING-ROOM)
	(SYNONYM CASE)
	(ADJECTIVE TROPHY)
	(DESC "trophy case")
	(FLAGS TRANSBIT CONTBIT NDESCBIT TRYTAKEBIT SEARCHBIT)
	(ACTION TROPHY-CASE-FCN)
	(CAPACITY 10000)>

<OBJECT RUG
	(OBJIDX "57")
	(IN LIVING-ROOM)
	(SYNONYM RUG CARPET)
	(ADJECTIVE LARGE ORIENTAL)
	(DESC "carpet")
	(FLAGS NDESCBIT TRYTAKEBIT)
	(ACTION RUG-FCN)>

<OBJECT CHALICE
	(OBJIDX "58")
	(IN TREASURE-ROOM)
	(SYNONYM CHALICE CUP SILVER TREASURE)
	(ADJECTIVE SILVER ENGRAVINGS) ;"engravings exists..."
	(DESC "chalice")
	(FLAGS TAKEBIT TRYTAKEBIT CONTBIT)
	(ACTION CHALICE-FCN)
	(LDESC "There is a silver chalice, intricately engraved, here.")
	(CAPACITY 5)
	(SIZE 10)
	(VALUE 10)
	(TVALUE 5)>

<OBJECT GARLIC
	(OBJIDX "59")
	(IN SANDWICH-BAG)
	(SYNONYM GARLIC CLOVE)
	(DESC "clove of garlic")
	(FLAGS TAKEBIT FOODBIT)
	(ACTION GARLIC-F)
	(SIZE 4)>

<OBJECT TRIDENT
	(OBJIDX "60")
	(IN ATLANTIS-ROOM)
	(SYNONYM TRIDENT FORK TREASURE)
	(ADJECTIVE POSEIDON OWN CRYSTAL)
	(DESC "crystal trident")
	(FLAGS TAKEBIT)
	(FDESC "On the shore lies Poseidon's own crystal trident.")
	(SIZE 20)
	(VALUE 4)
	(TVALUE 11)>

<OBJECT CYCLOPS
	(OBJIDX "61")
	(IN CYCLOPS-ROOM)
	(SYNONYM CYCLOPS MONSTER EYE)
	(ADJECTIVE HUNGRY GIANT)
	(DESC "cyclops")
	(FLAGS ACTORBIT NDESCBIT TRYTAKEBIT)
	(ACTION CYCLOPS-FCN)
	(STRENGTH 10000)>

<OBJECT DAM
	(OBJIDX "62")
	(IN DAM-ROOM)
	(SYNONYM DAM GATE GATES FCD\#3)
	(DESC "dam")
	(FLAGS NDESCBIT TRYTAKEBIT)
	(ACTION DAM-FUNCTION)>

<OBJECT TRAP-DOOR
	(OBJIDX "63")
	(IN LOCAL-GLOBALS)
	(SYNONYM DOOR TRAPDOOR TRAP-DOOR COVER)
	(ADJECTIVE TRAP DUSTY)
	(DESC "trap door")
	(FLAGS DOORBIT NDESCBIT INVISIBLE)
	(ACTION TRAP-DOOR-FCN)>

<OBJECT BOARDED-WINDOW
	(OBJIDX "64")
	(IN LOCAL-GLOBALS)
        (SYNONYM WINDOW)
	(ADJECTIVE BOARDED)
	(DESC "boarded window")
	(FLAGS NDESCBIT)
	(ACTION BOARDED-WINDOW-FCN)>

<OBJECT FRONT-DOOR
	(OBJIDX "65")
	(IN WEST-OF-HOUSE)
	(SYNONYM DOOR)
	(ADJECTIVE FRONT BOARDED)
	(DESC "door")
	(FLAGS DOORBIT NDESCBIT)
	(ACTION FRONT-DOOR-FCN)>

<OBJECT BARROW-DOOR	
	(OBJIDX "66")
	(IN STONE-BARROW)
	(SYNONYM DOOR)
	(ADJECTIVE HUGE STONE)
	(DESC "stone door")
	(FLAGS DOORBIT NDESCBIT OPENBIT)
	(ACTION BARROW-DOOR-FCN)>

<OBJECT BARROW
	(OBJIDX "67")
	(IN STONE-BARROW)
	(SYNONYM BARROW TOMB)
	(ADJECTIVE MASSIVE STONE)
	(DESC "stone barrow")
	(FLAGS NDESCBIT)
	(ACTION BARROW-FCN)>

<OBJECT BOTTLE
	(OBJIDX "68")
	(IN KITCHEN-TABLE)
	(SYNONYM BOTTLE CONTAINER)
	(ADJECTIVE CLEAR GLASS)
	(DESC "glass bottle")
	(FLAGS TAKEBIT TRANSBIT CONTBIT)
	(ACTION BOTTLE-FUNCTION)
	(FDESC "A bottle is sitting on the table.")
	(CAPACITY 4)>

<OBJECT CRACK
	(OBJIDX "69")
	(IN LOCAL-GLOBALS)
	(SYNONYM CRACK)
	(ADJECTIVE NARROW)
	(DESC "crack")
	(FLAGS NDESCBIT)
	(ACTION CRACK-FCN)>

<OBJECT COFFIN
	(OBJIDX "70")
	(IN EGYPT-ROOM)
	(SYNONYM COFFIN CASKET TREASURE)
	(ADJECTIVE SOLID GOLD)
	(DESC "gold coffin")
	(FLAGS TAKEBIT CONTBIT SACREDBIT SEARCHBIT)
	(LDESC
"The solid-gold coffin used for the burial of Ramses II is here.")
	(CAPACITY 35)
	(SIZE 55)
	(VALUE 10)
	(TVALUE 15)>

<OBJECT GRATE
	(OBJIDX "71")
	(IN LOCAL-GLOBALS)
	(SYNONYM GRATE GRATING)
	(DESC "grating")
	(FLAGS DOORBIT NDESCBIT INVISIBLE)
	(ACTION GRATE-FUNCTION)>

<OBJECT PUMP
	(OBJIDX "72")
	(IN RESERVOIR-NORTH)
	(SYNONYM PUMP AIR-PUMP TOOL TOOLS)
	(ADJECTIVE SMALL HAND-HELD)
	(DESC "hand-held air pump")
	(FLAGS TAKEBIT TOOLBIT)>

<OBJECT DIAMOND
	(OBJIDX "73")
	(SYNONYM DIAMOND TREASURE)
	(ADJECTIVE HUGE ENORMOUS)
	(DESC "huge diamond")
	(FLAGS TAKEBIT)
	(LDESC "There is an enormous diamond (perfectly cut) here.")
	(VALUE 10)
	(TVALUE 10)>

<OBJECT JADE
	(OBJIDX "74")
	(IN BAT-ROOM)
	(SYNONYM FIGURINE TREASURE)
	(ADJECTIVE EXQUISITE JADE)
	(DESC "jade figurine")
	(FLAGS TAKEBIT)
	(LDESC "There is an exquisite jade figurine here.")
	(SIZE 10)
	(VALUE 5)
	(TVALUE 5)>

<OBJECT KNIFE
	(OBJIDX "75")
	(IN ATTIC-TABLE)
	(SYNONYM KNIVES KNIFE BLADE)
	(ADJECTIVE NASTY UNRUSTY)
	(DESC "nasty knife")
	(FLAGS TAKEBIT WEAPONBIT TRYTAKEBIT)
	(FDESC "On a table is a nasty-looking knife.")
	(ACTION KNIFE-F)>

<OBJECT BONES
	(OBJIDX "76")
	(IN MAZE-5)
	(SYNONYM BONES SKELETON BODY)
	(DESC "skeleton")
	(FLAGS TRYTAKEBIT NDESCBIT)
	(ACTION SKELETON)>

<OBJECT BURNED-OUT-LANTERN
	(OBJIDX "77")
	(IN MAZE-5)
	(SYNONYM LANTERN LAMP)
	(ADJECTIVE RUSTY BURNED DEAD USELESS)
	(DESC "burned-out lantern")
	(FLAGS TAKEBIT)
	(FDESC "The deceased adventurer's useless lantern is here.")
	(SIZE 20)>

<OBJECT BAG-OF-COINS
	(OBJIDX "78")
	(IN MAZE-5)
	(SYNONYM BAG COINS TREASURE)
	(ADJECTIVE OLD LEATHER)
	(DESC "leather bag of coins")
	(FLAGS TAKEBIT)
	(LDESC "An old leather bag, bulging with coins, is here.")
	(ACTION BAG-OF-COINS-F)
	(SIZE 15)
	(VALUE 10)
	(TVALUE 5)>

<OBJECT LAMP
	(OBJIDX "79")
	(IN LIVING-ROOM)
	(SYNONYM LAMP LANTERN LIGHT)
	(ADJECTIVE BRASS)
	(DESC "brass lantern")
	(FLAGS TAKEBIT LIGHTBIT)
	(ACTION LANTERN)
	(FDESC "A battery-powered brass lantern is on the trophy case.")
	(LDESC "There is a brass lantern (battery-powered) here.")
	(SIZE 15)>

<OBJECT EMERALD
	(OBJIDX "80")
	(IN BUOY)
	(SYNONYM EMERALD TREASURE)
	(ADJECTIVE LARGE)
	(DESC "large emerald")
	(FLAGS TAKEBIT)
	(VALUE 5)
	(TVALUE 10)>

<OBJECT ADVERTISEMENT
	(OBJIDX "81")
	(IN MAILBOX)
	(SYNONYM ADVERTISEMENT LEAFLET BOOKLET MAIL)
	(ADJECTIVE SMALL)
	(DESC "leaflet")
	(FLAGS READBIT TAKEBIT BURNBIT)
	(LDESC "A small leaflet is on the ground.")
	(TEXT
"\"WELCOME TO ZORK!|
|
ZORK is a game of adventure, danger, and low cunning. In it you
will explore some of the most amazing territory ever seen by mortals.
No computer should be without one!\"")
	(SIZE 2)>

<OBJECT LEAK
	(OBJIDX "82")
	(IN MAINTENANCE-ROOM)
	(SYNONYM LEAK DRIP PIPE)
	(DESC "leak")
	(FLAGS NDESCBIT INVISIBLE)
	(ACTION LEAK-FUNCTION)>

<OBJECT MACHINE
	(OBJIDX "83")
	(IN MACHINE-ROOM)
	(SYNONYM MACHINE PDP10 DRYER LID)
	(DESC "machine")
	(FLAGS CONTBIT NDESCBIT TRYTAKEBIT)
	(ACTION MACHINE-F)
	(CAPACITY 50)>

<OBJECT INFLATED-BOAT
	(OBJIDX "84")
	(SYNONYM BOAT RAFT)
	(ADJECTIVE INFLAT MAGIC PLASTIC SEAWORTHY)
	(DESC "magic boat")
	(FLAGS TAKEBIT BURNBIT VEHBIT OPENBIT SEARCHBIT)
	(ACTION RBOAT-FUNCTION)
	(CAPACITY 100)
	(SIZE 20)
	(VTYPE NONLANDBIT)>

<OBJECT MAILBOX
	(OBJIDX "85")
	(IN WEST-OF-HOUSE)
	(SYNONYM MAILBOX BOX)
	(ADJECTIVE SMALL)
	(DESC "small mailbox")
	(FLAGS CONTBIT TRYTAKEBIT)
	(CAPACITY 10)
	(ACTION MAILBOX-F)>

<OBJECT MATCH
	(OBJIDX "86")
	(IN DAM-LOBBY)
	(SYNONYM MATCH MATCHES MATCHBOOK)
	(ADJECTIVE MATCH)
	(DESC "matchbook")
	(FLAGS READBIT TAKEBIT)
	(ACTION MATCH-FUNCTION)
	(LDESC
"There is a matchbook whose cover says \"Visit Beautiful FCD#3\" here.")
	(SIZE 2)
	(TEXT
"|
(Close cover before striking)|
|
YOU too can make BIG MONEY in the exciting field of PAPER SHUFFLING!|
|
Mr. Anderson of Muddle, Mass. says: \"Before I took this course I
was a lowly bit twiddler. Now with what I learned at GUE Tech
I feel really important and can obfuscate and confuse with the best.\"|
|
Dr. Blank had this to say: \"Ten short days ago all I could look
forward to was a dead-end job as a doctor. Now I have a promising
future and make really big Zorkmids.\"|
|
GUE Tech can't promise these fantastic results to everyone. But when
you earn your degree from GUE Tech, your future will be brighter." )>

<OBJECT MIRROR-2
	(OBJIDX "87")
	(IN MIRROR-ROOM-2)
	(SYNONYM REFLECTION MIRROR ENORMOUS)
	(DESC "mirror")
	(FLAGS TRYTAKEBIT NDESCBIT)
	(ACTION MIRROR-MIRROR)>

<OBJECT MIRROR-1
	(OBJIDX "88")
	(IN MIRROR-ROOM-1)
	(SYNONYM REFLECTION MIRROR ENORMOUS)
	(DESC "mirror")
	(FLAGS TRYTAKEBIT NDESCBIT)
	(ACTION MIRROR-MIRROR)>

<OBJECT PAINTING
	(OBJIDX "89")
	(IN GALLERY)
	(SYNONYM PAINTING ART CANVAS TREASURE)
	(ADJECTIVE BEAUTI)
	(DESC "painting")
	(FLAGS TAKEBIT BURNBIT)
	(ACTION PAINTING-FCN)
	(FDESC
"Fortunately, there is still one chance for you to be a vandal, for on
the far wall is a painting of unparalleled beauty.")
	(LDESC "A painting by a neglected genius is here.")
	(SIZE 15)
	(VALUE 4)
	(TVALUE 6)>

<OBJECT CANDLES
	(OBJIDX "90")
	(IN SOUTH-TEMPLE)
	(SYNONYM CANDLES PAIR)
	(ADJECTIVE BURNING)
	(DESC "pair of candles")
	(FLAGS TAKEBIT FLAMEBIT ONBIT LIGHTBIT)
	(ACTION CANDLES-FCN)
	(FDESC "On the two ends of the altar are burning candles.")
	(SIZE 10)>

<OBJECT GUNK
	(OBJIDX "91")
	(SYNONYM GUNK PIECE SLAG)
	(ADJECTIVE SMALL VITREOUS)
	(DESC "small piece of vitreous slag")
	(FLAGS TAKEBIT TRYTAKEBIT)
	(ACTION GUNK-FUNCTION)
	(SIZE 10)>

<OBJECT BODIES
	(OBJIDX "92")
	(IN LOCAL-GLOBALS)
	(SYNONYM BODIES BODY REMAINS PILE)
	(ADJECTIVE MANGLED)
	(DESC "pile of bodies")
	(FLAGS NDESCBIT TRYTAKEBIT)
	(ACTION BODY-FUNCTION)>

<OBJECT LEAVES
	(OBJIDX "93")
	(IN GRATING-CLEARING)
	(SYNONYM LEAVES LEAF PILE)
	(DESC "pile of leaves")
	(FLAGS TAKEBIT BURNBIT TRYTAKEBIT)
	(ACTION LEAF-PILE)
	(LDESC "On the ground is a pile of leaves.")
	(SIZE 25)>

<OBJECT PUNCTURED-BOAT
	(OBJIDX "94")
	(SYNONYM BOAT PILE PLASTIC)
	(ADJECTIVE PLASTIC PUNCTURE LARGE)
	(DESC "punctured boat")
	(FLAGS TAKEBIT BURNBIT)
	(ACTION DBOAT-FUNCTION)
	(SIZE 20)>

<OBJECT INFLATABLE-BOAT
	(OBJIDX "95")
	(IN DAM-BASE)
	(SYNONYM BOAT PILE PLASTIC VALVE)
	(ADJECTIVE PLASTIC INFLAT)
	(DESC "pile of plastic")
	(FLAGS TAKEBIT BURNBIT)
	(ACTION IBOAT-FUNCTION)
	(LDESC
"There is a folded pile of plastic here which has a small valve
attached.")
	(SIZE 20)>

<OBJECT BAR
	(OBJIDX "96")
	(IN LOUD-ROOM)
	(SYNONYM BAR PLATINUM TREASURE)
	(ADJECTIVE PLATINUM LARGE)
	(DESC "platinum bar")
	(FLAGS TAKEBIT SACREDBIT)
	(LDESC "On the ground is a large platinum bar.")
	(SIZE 20)
	(VALUE 10)
	(TVALUE 5)>

<OBJECT POT-OF-GOLD
	(OBJIDX "97")
	(IN END-OF-RAINBOW)
	(SYNONYM POT GOLD TREASURE)
	(ADJECTIVE GOLD)
	(DESC "pot of gold")
	(FLAGS TAKEBIT INVISIBLE)
	(FDESC "At the end of the rainbow is a pot of gold.")
	(SIZE 15)
	(VALUE 10)
	(TVALUE 10)>

<OBJECT PRAYER
	(OBJIDX "98")
	(IN NORTH-TEMPLE)
	(SYNONYM PRAYER INSCRIPTION)
	(ADJECTIVE ANCIENT OLD)
	(DESC "prayer")
	(FLAGS READBIT SACREDBIT NDESCBIT)
	(TEXT
"The prayer is inscribed in an ancient script, rarely used today. It seems
to be a philippic against small insects, absent-mindedness, and the picking
up and dropping of small objects. The final verse consigns trespassers to
the land of the dead. All evidence indicates that the beliefs of the ancient
Zorkers were obscure." )>

<OBJECT RAILING
	(OBJIDX "99")
	(IN DOME-ROOM)
	(SYNONYM RAILING RAIL)
	(ADJECTIVE WOODEN)
	(DESC "wooden railing")
	(FLAGS NDESCBIT)>

<OBJECT RAINBOW
	(OBJIDX "100")
	(IN LOCAL-GLOBALS)
	(SYNONYM RAINBOW)
	(DESC "rainbow")
	(FLAGS NDESCBIT CLIMBBIT)
	(ACTION RAINBOW-FCN)>

<OBJECT RIVER
	(OBJIDX "101")
	(IN LOCAL-GLOBALS)
	(DESC "river")
	(SYNONYM RIVER)
	(ADJECTIVE FRIGID)
	(ACTION RIVER-FUNCTION)
	(FLAGS NDESCBIT)>

<OBJECT BUOY
	(OBJIDX "102")
	(IN RIVER-4)
	(SYNONYM BUOY)
	(ADJECTIVE RED)
	(DESC "red buoy")
	(FLAGS TAKEBIT CONTBIT)
	(FDESC "There is a red buoy here (probably a warning).")
	(CAPACITY 20)
	(SIZE 10)
	(ACTION TREASURE-INSIDE)>

<ROUTINE TREASURE-INSIDE ()
	 <COND (<VERB? OPEN>
		<SCORE-OBJ ,EMERALD>
		<RFALSE>)>>
<OBJECT ROPE
	(OBJIDX "103")
	(IN ATTIC)
	(SYNONYM ROPE HEMP COIL)
	(ADJECTIVE LARGE)
	(DESC "rope")
	(FLAGS TAKEBIT SACREDBIT TRYTAKEBIT)
	(ACTION ROPE-FUNCTION)
	(FDESC "A large coil of rope is lying in the corner.")
	(SIZE 10)>

<OBJECT RUSTY-KNIFE
	(OBJIDX "104")
	(IN MAZE-5)
	(SYNONYM KNIVES KNIFE)
	(ADJECTIVE RUSTY)
	(DESC "rusty knife")
	(FLAGS TAKEBIT TRYTAKEBIT WEAPONBIT TOOLBIT)
	(ACTION RUSTY-KNIFE-FCN)
	(FDESC "Beside the skeleton is a rusty knife.")
	(SIZE 20)>

<OBJECT SAND
	(OBJIDX "105")
	(IN SANDY-CAVE)
	(SYNONYM SAND)
	(DESC "sand")
	(FLAGS NDESCBIT)
	(ACTION SAND-FUNCTION)>

<OBJECT BRACELET
	(OBJIDX "106")
	(IN GAS-ROOM)
	(SYNONYM BRACELET JEWEL SAPPHIRE TREASURE)
	(ADJECTIVE SAPPHIRE)
	(DESC "sapphire-encrusted bracelet")
	(FLAGS TAKEBIT)
	(SIZE 10)
	(VALUE 5)
	(TVALUE 5)>

<OBJECT SCREWDRIVER
	(OBJIDX "107")
	(IN MAINTENANCE-ROOM)
	(SYNONYM SCREWDRIVER TOOL TOOLS DRIVER)
	(ADJECTIVE SCREW)
	(DESC "screwdriver")
	(FLAGS TAKEBIT TOOLBIT)>

<OBJECT KEYS
	(OBJIDX "108")
	(IN MAZE-5)
	(SYNONYM KEY)
	(ADJECTIVE SKELETON)
	(DESC "skeleton key")
	(FLAGS TAKEBIT TOOLBIT)
	(SIZE 10)>

<OBJECT SHOVEL
	(OBJIDX "109")
	(IN SANDY-BEACH)
	(SYNONYM SHOVEL TOOL TOOLS)
	(DESC "shovel")
	(FLAGS TAKEBIT TOOLBIT)
	(SIZE 15)>

<OBJECT COAL
	(OBJIDX "110")
	(IN DEAD-END-5)
	(SYNONYM COAL PILE HEAP)
	(ADJECTIVE SMALL)
	(DESC "small pile of coal")
	(FLAGS TAKEBIT BURNBIT)
	(SIZE 20)>

<OBJECT LADDER
	(OBJIDX "111")
	(IN LOCAL-GLOBALS)
	(SYNONYM LADDER)
	(ADJECTIVE WOODEN RICKETY NARROW)
	(DESC "wooden ladder")
	(FLAGS NDESCBIT CLIMBBIT)>

<OBJECT SCARAB
	(OBJIDX "112")
	(IN SANDY-CAVE)
	(SYNONYM SCARAB BUG BEETLE TREASURE)
	(ADJECTIVE BEAUTI CARVED JEWELED)
	(DESC "beautiful jeweled scarab")
	(FLAGS TAKEBIT INVISIBLE)
	(SIZE 8)
	(VALUE 5)
	(TVALUE 5)>

<OBJECT LARGE-BAG
	(OBJIDX "113")
	(IN THIEF)
	(SYNONYM BAG)
	(ADJECTIVE LARGE THIEFS)
	(DESC "large bag")
	(ACTION LARGE-BAG-F)
	(FLAGS TRYTAKEBIT NDESCBIT)>  

<OBJECT STILETTO
	(OBJIDX "114")
	(IN THIEF)
	(SYNONYM STILETTO)
	(ADJECTIVE VICIOUS)
	(DESC "stiletto")
	(ACTION STILETTO-FUNCTION)
	(FLAGS WEAPONBIT TRYTAKEBIT TAKEBIT NDESCBIT)
	(SIZE 10)>

<OBJECT MACHINE-SWITCH
	(OBJIDX "115")
	(IN MACHINE-ROOM)
	(SYNONYM SWITCH)
	(DESC "switch")
	(FLAGS NDESCBIT TURNBIT)
	(ACTION MSWITCH-FUNCTION)>

<OBJECT WOODEN-DOOR
	(OBJIDX "116")
	(IN LOCAL-GLOBALS)
	(SYNONYM DOOR LETTERING WRITING)
	(ADJECTIVE WOODEN GOTHIC STRANGE WEST)
	(DESC "wooden door")
	(FLAGS READBIT DOORBIT NDESCBIT TRANSBIT)
	(ACTION FRONT-DOOR-FCN)
	(TEXT
"The engravings translate to \"This space intentionally left blank.\"")>

<OBJECT SWORD
	(OBJIDX "117")
	(IN LIVING-ROOM)
	(SYNONYM SWORD ORCRIST GLAMDRING BLADE)
	(ADJECTIVE ELVISH OLD ANTIQUE)
	(DESC "sword")
	(FLAGS TAKEBIT WEAPONBIT TRYTAKEBIT)
	(ACTION SWORD-FCN)
	(FDESC
"Above the trophy case hangs an elvish sword of great antiquity.")
	(SIZE 30)
	(TVALUE 0)>

<OBJECT MAP
	(OBJIDX "118")
	(IN TROPHY-CASE)
	(SYNONYM PARCHMENT MAP)
	(ADJECTIVE ANTIQUE OLD ANCIENT)
	(DESC "ancient map")
	(FLAGS INVISIBLE READBIT TAKEBIT)
	(FDESC
"In the trophy case is an ancient parchment which appears to be a map.")
	(SIZE 2)
	(TEXT
"The map shows a forest with three clearings. The largest clearing contains
a house. Three paths leave the large clearing. One of these paths, leading
southwest, is marked \"To Stone Barrow\".")>

<OBJECT BOAT-LABEL
	(OBJIDX "119")
	(IN INFLATED-BOAT)
	(SYNONYM LABEL FINEPRINT PRINT)
	(ADJECTIVE TAN FINE)
	(DESC "tan label")
	(FLAGS READBIT TAKEBIT BURNBIT)
	(SIZE 2)
	(TEXT
"  !!!!FROBOZZ MAGIC BOAT COMPANY!!!!|
|
Hello, Sailor!|
|
Instructions for use:|
|
   To get into a body of water, say \"Launch\".|
   To get to shore, say \"Land\" or the direction in which you want
to maneuver the boat.|
|
Warranty:|
|
  This boat is guaranteed against all defects for a period of 76
milliseconds from date of purchase or until first used, whichever comes first.|
|
Warning:|
   This boat is made of thin plastic.|
   Good Luck!" )>

<OBJECT THIEF
	(OBJIDX "120")
	(IN ROUND-ROOM)
	(SYNONYM THIEF ROBBER MAN PERSON)
	(ADJECTIVE SHADY SUSPICIOUS SEEDY)
	(DESC "thief")
	(FLAGS ACTORBIT INVISIBLE CONTBIT OPENBIT TRYTAKEBIT)
	(ACTION ROBBER-FUNCTION)
	(LDESC
"There is a suspicious-looking individual, holding a large bag, leaning
against one wall. He is armed with a deadly stiletto.")
	(STRENGTH 5)>

<OBJECT PEDESTAL
	(OBJIDX "121")
	(IN TORCH-ROOM)
	(SYNONYM PEDESTAL)
	(ADJECTIVE WHITE MARBLE)
	(DESC "pedestal")
	(FLAGS NDESCBIT CONTBIT OPENBIT SURFACEBIT)
	(ACTION DUMB-CONTAINER)
	(CAPACITY 30)>

<OBJECT TORCH
	(OBJIDX "122")
	(IN PEDESTAL)
	(SYNONYM TORCH IVORY TREASURE)
	(ADJECTIVE FLAMING IVORY)
	(DESC "torch")
	(FLAGS TAKEBIT FLAMEBIT ONBIT LIGHTBIT)
	(ACTION TORCH-OBJECT)
	(FDESC "Sitting on the pedestal is a flaming torch, made of ivory.")
	(SIZE 20)
	(VALUE 14)
	(TVALUE 6)>

<OBJECT GUIDE
	(OBJIDX "123")
	(IN DAM-LOBBY)
	(SYNONYM GUIDE BOOK BOOKS GUIDEBOOKS)
	(ADJECTIVE TOUR GUIDE)
	(DESC "tour guidebook")
	(FLAGS READBIT TAKEBIT BURNBIT)
	(FDESC
"Some guidebooks entitled \"Flood Control Dam #3\" are on the reception
desk.")
	(TEXT
"\"	Flood Control Dam #3|
|
FCD#3 was constructed in year 783 of the Great Underground Empire to
harness the mighty Frigid River. This work was supported by a grant of
37 million zorkmids from your omnipotent local tyrant Lord Dimwit
Flathead the Excessive. This impressive structure is composed of
370,000 cubic feet of concrete, is 256 feet tall at the center, and 193
feet wide at the top. The lake created behind the dam has a volume
of 1.7 billion cubic feet, an area of 12 million square feet, and a
shore line of 36 thousand feet.|
|
The construction of FCD#3 took 112 days from ground breaking to
the dedication. It required a work force of 384 slaves, 34 slave
drivers, 12 engineers, 2 turtle doves, and a partridge in a pear
tree. The work was managed by a command team composed of 2345
bureaucrats, 2347 secretaries (at least two of whom could type),
12,256 paper shufflers, 52,469 rubber stampers, 245,193 red tape
processors, and nearly one million dead trees.|
|
We will now point out some of the more interesting features
of FCD#3 as we conduct you on a guided tour of the facilities:|
|
        1) You start your tour here in the Dam Lobby. You will notice
on your right that...." )>

<OBJECT TROLL
	(OBJIDX "124")
	(IN TROLL-ROOM)
	(SYNONYM TROLL)
	(ADJECTIVE NASTY)
	(DESC "troll")
	(FLAGS ACTORBIT OPENBIT TRYTAKEBIT)
	(ACTION TROLL-FCN)
	(LDESC
"A nasty-looking troll, brandishing a bloody axe, blocks all passages
out of the room.")
	(STRENGTH 2)>

<OBJECT TRUNK
	(OBJIDX "125")
	(IN RESERVOIR)
	(SYNONYM TRUNK CHEST JEWELS TREASURE)
	(ADJECTIVE OLD)
	(DESC "trunk of jewels")
	(FLAGS TAKEBIT INVISIBLE)
	(FDESC
"Lying half buried in the mud is an old trunk, bulging with jewels.")
	(LDESC "There is an old trunk here, bulging with assorted jewels.")
	(ACTION TRUNK-F)
	(SIZE 35)
	(VALUE 15)
	(TVALUE 5)>

<OBJECT TUBE
	(OBJIDX "126")
	(IN MAINTENANCE-ROOM)
	(SYNONYM TUBE TOOTH PASTE)
	(DESC "tube")
	(FLAGS TAKEBIT CONTBIT READBIT)
	(ACTION TUBE-FUNCTION)
	(LDESC
	 "There is an object which looks like a tube of toothpaste here.")
	(CAPACITY 7)
	(SIZE 5)
	(TEXT
"---> Frobozz Magic Gunk Company <---|
          All-Purpose Gunk")>

<OBJECT PUTTY
	(OBJIDX "127")
	(IN TUBE)
	(SYNONYM MATERIAL GUNK)
	(ADJECTIVE VISCOUS)
	(DESC "viscous material")
	(FLAGS TAKEBIT TOOLBIT)
	(SIZE 6)
	(ACTION PUTTY-FCN)>

<OBJECT ENGRAVINGS
	(OBJIDX "128")
	(IN ENGRAVINGS-CAVE)
	(SYNONYM WALL ENGRAVINGS INSCRIPTION)
	(ADJECTIVE OLD ANCIENT)
	(DESC "wall with engravings")
	(FLAGS READBIT SACREDBIT)
	(LDESC "There are old engravings on the walls here.")
	(TEXT
"The engravings were incised in the living rock of the cave wall by
an unknown hand. They depict, in symbolic form, the beliefs of the
ancient Zorkers. Skillfully interwoven with the bas reliefs are excerpts
illustrating the major religious tenets of that time. Unfortunately, a
later age seems to have considered them blasphemous and just as skillfully
excised them.")>

<OBJECT OWNERS-MANUAL
	(OBJIDX "129")
	(IN STUDIO)
	(SYNONYM MANUAL PIECE PAPER)
	(ADJECTIVE ZORK OWNERS SMALL)
	(DESC "ZORK owner's manual")
	(FLAGS READBIT TAKEBIT)
	(FDESC "Loosely attached to a wall is a small piece of paper.")
	(TEXT
"Congratulations!|
|
You are the privileged owner of ZORK I: The Great Underground Empire,
a self-contained and self-maintaining universe. If used and maintained
in accordance with normal operating practices for small universes, ZORK
will provide many months of trouble-free operation.")>

<OBJECT CLIMBABLE-CLIFF
	(OBJIDX "130")
	(IN LOCAL-GLOBALS)
	(SYNONYM WALL CLIFF WALLS LEDGE)
	(ADJECTIVE ROCKY SHEER)
	(DESC "cliff")
	(ACTION CLIFF-OBJECT)
	(FLAGS NDESCBIT CLIMBBIT)>

<OBJECT WHITE-CLIFF
	(OBJIDX "131")
	(IN LOCAL-GLOBALS)
	(SYNONYM CLIFF CLIFFS)
	(ADJECTIVE WHITE)
	(DESC "white cliffs")
	(FLAGS NDESCBIT CLIMBBIT)
	(ACTION WCLIF-OBJECT)>

<OBJECT WRENCH
	(OBJIDX "132")
	(IN MAINTENANCE-ROOM)
	(SYNONYM WRENCH TOOL TOOLS)
	(DESC "wrench")
	(FLAGS TAKEBIT TOOLBIT)
	(SIZE 10)>

<OBJECT CONTROL-PANEL
	(OBJIDX "133")
	(IN DAM-ROOM)
	(SYNONYM PANEL)
	(ADJECTIVE CONTROL)
	(DESC "control panel")
	(FLAGS NDESCBIT)>

<OBJECT NEST
	(OBJIDX "134")
	(IN UP-A-TREE)
	(SYNONYM NEST)
	(ADJECTIVE BIRDS)
	(DESC "bird's nest")
	(FLAGS TAKEBIT BURNBIT CONTBIT OPENBIT SEARCHBIT)
	(FDESC "Beside you on the branch is a small bird's nest.")
	(CAPACITY 20)>

<OBJECT EGG
	(OBJIDX "135")
	(IN NEST)
	(SYNONYM EGG TREASURE)
	(ADJECTIVE BIRDS ENCRUSTED JEWELED)
	(DESC "jewel-encrusted egg")
	(FLAGS TAKEBIT CONTBIT SEARCHBIT)
	(ACTION EGG-OBJECT)
	(VALUE 5)
	(TVALUE 5)
	(CAPACITY 6)
	(FDESC
"In the bird's nest is a large egg encrusted with precious jewels,
apparently scavenged by a childless songbird. The egg is covered with
fine gold inlay, and ornamented in lapis lazuli and mother-of-pearl.
Unlike most eggs, this one is hinged and closed with a delicate looking
clasp. The egg appears extremely fragile.")>

<OBJECT BROKEN-EGG
	(OBJIDX "136")
	(SYNONYM EGG TREASURE)
	(ADJECTIVE BROKEN BIRDS ENCRUSTED JEWEL)
	(DESC "broken jewel-encrusted egg")
	(FLAGS TAKEBIT CONTBIT OPENBIT)
	(CAPACITY 6)
	(TVALUE 2)
	(LDESC "There is a somewhat ruined egg here.")>

<OBJECT BAUBLE
	(OBJIDX "137")
	(SYNONYM BAUBLE TREASURE)
	(ADJECTIVE BRASS BEAUTI)
	(DESC "beautiful brass bauble")
	(FLAGS TAKEBIT)
	(VALUE 1)
	(TVALUE 1)>

<OBJECT CANARY
	(OBJIDX "138")
	(IN EGG)
	(SYNONYM CANARY TREASURE)
	(ADJECTIVE CLOCKWORK GOLD GOLDEN)
	(DESC "golden clockwork canary")
	(FLAGS TAKEBIT SEARCHBIT)
	(ACTION CANARY-OBJECT)
	(VALUE 6)
	(TVALUE 4)
	(FDESC
"There is a golden clockwork canary nestled in the egg. It has ruby
eyes and a silver beak. Through a crystal window below its left
wing you can see intricate machinery inside. It appears to have
wound down.")>

<OBJECT BROKEN-CANARY
	(OBJIDX "139")
	(IN BROKEN-EGG)
	(SYNONYM CANARY TREASURE)
	(ADJECTIVE BROKEN CLOCKWORK GOLD GOLDEN)
	(DESC "broken clockwork canary")
	(FLAGS TAKEBIT)
	(ACTION CANARY-OBJECT)
	(TVALUE 1)
	(FDESC
"There is a golden clockwork canary nestled in the egg. It seems to
have recently had a bad experience. The mountings for its jewel-like
eyes are empty, and its silver beak is crumpled. Through a cracked
crystal window below its left wing you can see the remains of
intricate machinery. It is not clear what result winding it would
have, as the mainspring seems sprung.")>

\

"SUBTITLE ROOMS"

"SUBTITLE CONDITIONAL EXIT FLAGS"

<GLOBAL CYCLOPS-FLAG <>>
<GLOBAL DEFLATE <>>
<GLOBAL DOME-FLAG <>>
<GLOBAL EMPTY-HANDED <>>
<GLOBAL LLD-FLAG <>>
<GLOBAL LOW-TIDE <>>
<GLOBAL MAGIC-FLAG <>>
<GLOBAL RAINBOW-FLAG <>>
<GLOBAL TROLL-FLAG <>>
;<GLOBAL WON-FLAG <>>
<GLOBAL COFFIN-CURE <>>

"SUBTITLE FOREST AND OUTSIDE OF HOUSE"

<ROOM WEST-OF-HOUSE
      (OBJIDX "140")
      (IN ROOMS)
      (DESC "West of House")
      (NORTH TO NORTH-OF-HOUSE)
      (SOUTH TO SOUTH-OF-HOUSE)
      (NE TO NORTH-OF-HOUSE)
      (SE TO SOUTH-OF-HOUSE)
      (WEST TO FOREST-1)
      (EAST "The door is boarded and you can't remove the boards.")
      (SW TO STONE-BARROW IF WON-FLAG)
      (IN TO STONE-BARROW IF WON-FLAG)
      (ACTION WEST-HOUSE)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL WHITE-HOUSE BOARD FOREST)>

<ROOM STONE-BARROW
      (OBJIDX "141")
      (IN ROOMS)
      (LDESC
"You are standing in front of a massive barrow of stone. In the east face
is a huge stone door which is open. You cannot see into the dark of the tomb.")
      (DESC "Stone Barrow")
      (NE TO WEST-OF-HOUSE)
      (ACTION STONE-BARROW-FCN)
      (FLAGS RLANDBIT ONBIT SACREDBIT)>

<ROOM NORTH-OF-HOUSE
      (OBJIDX "142")
      (IN ROOMS)
      (LDESC
"You are facing the north side of a white house. There is no door here,
and all the windows are boarded up. To the north a narrow path winds through
the trees.")
      (DESC "North of House")
      (SW TO WEST-OF-HOUSE)
      (SE TO EAST-OF-HOUSE)
      (WEST TO WEST-OF-HOUSE)
      (EAST TO EAST-OF-HOUSE)
      (NORTH TO PATH)
      (SOUTH "The windows are all boarded.")
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL BOARDED-WINDOW BOARD WHITE-HOUSE FOREST)>

<ROOM SOUTH-OF-HOUSE
      (OBJIDX "143")
      (IN ROOMS)
      (LDESC
"You are facing the south side of a white house. There is no door here,
and all the windows are boarded.")
      (DESC "South of House")
      (WEST TO WEST-OF-HOUSE)
      (EAST TO EAST-OF-HOUSE)
      (NE TO EAST-OF-HOUSE)
      (NW TO WEST-OF-HOUSE)
      (SOUTH TO FOREST-3)
      (NORTH "The windows are all boarded.")
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL BOARDED-WINDOW BOARD WHITE-HOUSE FOREST)>

<ROOM EAST-OF-HOUSE
      (OBJIDX "144")
      (IN ROOMS)
      (DESC "Behind House")
      (NORTH TO NORTH-OF-HOUSE)
      (SOUTH TO SOUTH-OF-HOUSE)
      (SW TO SOUTH-OF-HOUSE)
      (NW TO NORTH-OF-HOUSE)
      (EAST TO CLEARING)
      (WEST TO KITCHEN IF KITCHEN-WINDOW IS OPEN)
      (IN TO KITCHEN IF KITCHEN-WINDOW IS OPEN)
      (ACTION EAST-HOUSE)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL WHITE-HOUSE KITCHEN-WINDOW FOREST)>

<ROOM FOREST-1
      (OBJIDX "145")
      (IN ROOMS)
      (LDESC
"This is a forest, with trees in all directions. To the east,
there appears to be sunlight.")
      (DESC "Forest")
      (UP "There is no tree here suitable for climbing.")
      (NORTH TO GRATING-CLEARING)
      (EAST TO PATH)
      (SOUTH TO FOREST-3)
      (WEST "You would need a machete to go further west.")
      (ACTION FOREST-ROOM)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL TREE SONGBIRD WHITE-HOUSE FOREST)>

<ROOM FOREST-2
      (OBJIDX "146")
      (IN ROOMS)
      (LDESC "This is a dimly lit forest, with large trees all around.")
      (DESC "Forest")
      (UP "There is no tree here suitable for climbing.")
      (NORTH "The forest becomes impenetrable to the north.")
      (EAST TO MOUNTAINS)
      (SOUTH TO CLEARING)
      (WEST TO PATH)
      (ACTION FOREST-ROOM)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL TREE SONGBIRD WHITE-HOUSE FOREST)>

<ROOM MOUNTAINS
      (OBJIDX "147")
      (IN ROOMS)
      (LDESC "The forest thins out, revealing impassable mountains.")
      (DESC "Forest")
      (UP "The mountains are impassable.")
      (NORTH TO FOREST-2)
      (EAST "The mountains are impassable.")
      (SOUTH TO FOREST-2)
      (WEST TO FOREST-2)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL TREE WHITE-HOUSE)>

<ROOM FOREST-3
      (OBJIDX "148")
      (IN ROOMS)
      (LDESC "This is a dimly lit forest, with large trees all around.")
      (DESC "Forest")
      (UP "There is no tree here suitable for climbing.")
      (NORTH TO CLEARING)
      (EAST "The rank undergrowth prevents eastward movement.")
      (SOUTH "Storm-tossed trees block your way.")
      (WEST TO FOREST-1)
      (NW TO SOUTH-OF-HOUSE)
      (ACTION FOREST-ROOM)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL TREE SONGBIRD WHITE-HOUSE FOREST)>

<ROOM PATH
      (OBJIDX "149")
      (IN ROOMS)
      (LDESC
"This is a path winding through a dimly lit forest. The path heads
north-south here. One particularly large tree with some low branches
stands at the edge of the path.")
      (DESC "Forest Path")
      (UP TO UP-A-TREE)
      (NORTH TO GRATING-CLEARING)
      (EAST TO FOREST-2)
      (SOUTH TO NORTH-OF-HOUSE)
      (WEST TO FOREST-1)
      (ACTION FOREST-ROOM)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL TREE SONGBIRD WHITE-HOUSE FOREST)>

<ROOM UP-A-TREE
      (OBJIDX "150")
      (IN ROOMS)
      (DESC "Up a Tree")
      (DOWN TO PATH)
      (UP "You cannot climb any higher.")
      (ACTION TREE-ROOM)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL TREE FOREST SONGBIRD WHITE-HOUSE)>

<ROOM GRATING-CLEARING
      (OBJIDX "151")
      (IN ROOMS)
      (DESC "Clearing")
      (NORTH "The forest becomes impenetrable to the north.")
      (EAST TO FOREST-2)
      (WEST TO FOREST-1)
      (SOUTH TO PATH)
      (DOWN PER GRATING-EXIT)
      (ACTION CLEARING-FCN)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL WHITE-HOUSE GRATE)>

<ROUTINE GRATING-EXIT ()
	 <COND (,GRATE-REVEALED
		<COND (<FSET? ,GRATE ,OPENBIT>
		       ,GRATING-ROOM)
		      (T
		       <TELL "The grating is closed!" CR>
		       <THIS-IS-IT ,GRATE>
		       <RFALSE>)>)
	       (T <TELL "You can't go that way." CR> <RFALSE>)>>

<ROOM CLEARING
      (OBJIDX "152")
      (IN ROOMS)
      (LDESC
"You are in a small clearing in a well marked forest path that
extends to the east and west.")
      (DESC "Clearing")
      (UP "There is no tree here suitable for climbing.")
      (EAST TO CANYON-VIEW)
      (NORTH TO FOREST-2)
      (SOUTH TO FOREST-3)
      (WEST TO EAST-OF-HOUSE)
      (ACTION FOREST-ROOM)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL TREE SONGBIRD WHITE-HOUSE FOREST)>

\

"SUBTITLE HOUSE"

<ROOM KITCHEN
      (OBJIDX "153")
      (IN ROOMS)
      (DESC "Kitchen")
      (EAST TO EAST-OF-HOUSE IF KITCHEN-WINDOW IS OPEN)
      (WEST TO LIVING-ROOM)
      (OUT TO EAST-OF-HOUSE IF KITCHEN-WINDOW IS OPEN)
      (UP TO ATTIC)
      (DOWN TO STUDIO IF FALSE-FLAG ELSE
	 "Only Santa Claus climbs down chimneys.")
      (ACTION KITCHEN-FCN)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (VALUE 10)
      (GLOBAL KITCHEN-WINDOW CHIMNEY STAIRS)>

<ROOM ATTIC
      (OBJIDX "154")
      (IN ROOMS)
      (LDESC "This is the attic. The only exit is a stairway leading down.")
      (DESC "Attic")
      (DOWN TO KITCHEN)
      (FLAGS RLANDBIT SACREDBIT)
      (GLOBAL STAIRS)>

<ROOM LIVING-ROOM
      (OBJIDX "155")
      (IN ROOMS)
      (DESC "Living Room")
      (EAST TO KITCHEN)
      (WEST TO STRANGE-PASSAGE IF MAGIC-FLAG ELSE "The door is nailed shut.")
      (DOWN PER TRAP-DOOR-EXIT)
      (ACTION LIVING-ROOM-FCN)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL WOODEN-DOOR TRAP-DOOR STAIRS)
      (PSEUDO "NAILS" NAILS-PSEUDO "NAIL" NAILS-PSEUDO)>

\

"SUBTITLE CELLAR AND VICINITY"

<ROOM CELLAR
      (OBJIDX "156")
      (IN ROOMS)
      (DESC "Cellar")
      (NORTH TO TROLL-ROOM)
      (SOUTH TO EAST-OF-CHASM)
      (UP TO LIVING-ROOM IF TRAP-DOOR IS OPEN)
      (WEST
"You try to ascend the ramp, but it is impossible, and you slide back down.")
      (ACTION CELLAR-FCN)
      (FLAGS RLANDBIT)
      (VALUE 25)
      (GLOBAL TRAP-DOOR SLIDE STAIRS)>

<ROOM TROLL-ROOM
      (OBJIDX "157")
      (IN ROOMS)
      (LDESC
"This is a small room with passages to the east and south and a
forbidding hole leading west. Bloodstains and deep scratches
(perhaps made by an axe) mar the walls.")
      (DESC "The Troll Room")
      (SOUTH TO CELLAR)
      (EAST TO EW-PASSAGE
       IF TROLL-FLAG ELSE "The troll fends you off with a menacing gesture.")
      (WEST TO MAZE-1
       IF TROLL-FLAG ELSE "The troll fends you off with a menacing gesture.")
      (FLAGS RLANDBIT)
      (ACTION TROLL-ROOM-F)>

<ROOM EAST-OF-CHASM
      (OBJIDX "158")
      (IN ROOMS)
      (LDESC
"You are on the east edge of a chasm, the bottom of which cannot be
seen. A narrow passage goes north, and the path you are on continues
to the east.")
      (DESC "East of Chasm")
      (NORTH TO CELLAR)
      (EAST TO GALLERY)
      (DOWN "The chasm probably leads straight to the infernal regions.")
      (FLAGS RLANDBIT)
      (PSEUDO "CHASM" CHASM-PSEUDO)>

<ROOM GALLERY
      (OBJIDX "159")
      (IN ROOMS)
      (LDESC
"This is an art gallery. Most of the paintings have been stolen by
vandals with exceptional taste. The vandals left through either the
north or west exits.")
      (DESC "Gallery")
      (WEST TO EAST-OF-CHASM)
      (NORTH TO STUDIO)
      (FLAGS RLANDBIT ONBIT)>

<ROOM STUDIO
      (OBJIDX "160")
      (IN ROOMS)
      (LDESC
"This appears to have been an artist's studio. The walls and floors are
splattered with paints of 69 different colors. Strangely enough, nothing
of value is hanging here. At the south end of the room is an open door
(also covered with paint). A dark and narrow chimney leads up from a
fireplace; although you might be able to get up it, it seems unlikely
you could get back down.")
      (DESC "Studio")
      (SOUTH TO GALLERY)
      (UP PER UP-CHIMNEY-FUNCTION)
      (FLAGS RLANDBIT)
      (GLOBAL CHIMNEY)
      (PSEUDO "DOOR" DOOR-PSEUDO "PAINT" PAINT-PSEUDO)>

\

"SUBTITLE MAZE"

<ROOM MAZE-1
      (OBJIDX "161")
      (IN ROOMS)
      (LDESC "This is part of a maze of twisty little passages, all alike.")
      (DESC "Maze")
      (EAST TO TROLL-ROOM)
      (NORTH TO MAZE-1)
      (SOUTH TO MAZE-2)
      (WEST TO MAZE-4)
      (FLAGS RLANDBIT MAZEBIT)>

<ROOM MAZE-2
      (OBJIDX "162")
      (IN ROOMS)
      (LDESC "This is part of a maze of twisty little passages, all alike.")
      (DESC "Maze")
      (SOUTH TO MAZE-1)
      (DOWN PER MAZE-DIODES) ;"to MAZE-4"
      (EAST TO MAZE-3)
      (FLAGS RLANDBIT MAZEBIT)>

<ROOM MAZE-3
      (OBJIDX "163")
      (IN ROOMS)
      (LDESC "This is part of a maze of twisty little passages, all alike.")
      (DESC "Maze")
      (WEST TO MAZE-2)
      (NORTH TO MAZE-4)
      (UP TO MAZE-5)
      (FLAGS RLANDBIT MAZEBIT)>

<ROOM MAZE-4
      (OBJIDX "164")
      (IN ROOMS)
      (LDESC "This is part of a maze of twisty little passages, all alike.")
      (DESC "Maze")
      (WEST TO MAZE-3)
      (NORTH TO MAZE-1)
      (EAST TO DEAD-END-1)
      (FLAGS RLANDBIT MAZEBIT)>

<ROOM DEAD-END-1
      (OBJIDX "165")
      (IN ROOMS)
      (DESC "Dead End")
      (LDESC "You have come to a dead end in the maze.")
      (SOUTH TO MAZE-4)
      (FLAGS RLANDBIT MAZEBIT)>

<ROOM MAZE-5
      (OBJIDX "166")
      (IN ROOMS)
      (LDESC "This is part of a maze of twisty little passages, all alike.
A skeleton, probably the remains of a luckless adventurer, lies here.")
      (DESC "Maze")
      (EAST TO DEAD-END-2)
      (NORTH TO MAZE-3)
      (SW TO MAZE-6)
      (FLAGS RLANDBIT MAZEBIT)>

<ROOM DEAD-END-2
      (OBJIDX "167")
      (IN ROOMS)
      (DESC "Dead End")
      (LDESC "You have come to a dead end in the maze.")
      (WEST TO MAZE-5)
      (FLAGS RLANDBIT MAZEBIT)>

<ROOM MAZE-6
      (OBJIDX "168")
      (IN ROOMS)
      (LDESC "This is part of a maze of twisty little passages, all alike.")
      (DESC "Maze")
      (DOWN TO MAZE-5)
      (EAST TO MAZE-7)
      (WEST TO MAZE-6)
      (UP TO MAZE-9)
      (FLAGS RLANDBIT MAZEBIT)>

<ROOM MAZE-7
      (OBJIDX "169")
      (IN ROOMS)
      (LDESC "This is part of a maze of twisty little passages, all alike.")
      (DESC "Maze")
      (UP TO MAZE-14)
      (WEST TO MAZE-6)
      (DOWN PER MAZE-DIODES) ;"to DEAD-END-1"
      (EAST TO MAZE-8)
      (SOUTH TO MAZE-15)
      (FLAGS RLANDBIT MAZEBIT)>

<ROOM MAZE-8
      (OBJIDX "170")
      (IN ROOMS)
      (LDESC "This is part of a maze of twisty little passages, all alike.")
      (DESC "Maze")
      (NE TO MAZE-7)
      (WEST TO MAZE-8)
      (SE TO DEAD-END-3)
      (FLAGS RLANDBIT MAZEBIT)>

<ROOM DEAD-END-3
      (OBJIDX "171")
      (IN ROOMS)
      (DESC "Dead End")
      (LDESC "You have come to a dead end in the maze.")
      (NORTH TO MAZE-8)
      (FLAGS RLANDBIT MAZEBIT)>

<ROOM MAZE-9
      (OBJIDX "172")
      (IN ROOMS)
      (LDESC "This is part of a maze of twisty little passages, all alike.")
      (DESC "Maze")
      (NORTH TO MAZE-6)
      (DOWN PER MAZE-DIODES) ;"to MAZE-11"
      (EAST TO MAZE-10)
      (SOUTH TO MAZE-13)
      (WEST TO MAZE-12)
      (NW TO MAZE-9)
      (FLAGS RLANDBIT MAZEBIT)>

<ROOM MAZE-10
      (OBJIDX "173")
      (IN ROOMS)
      (LDESC "This is part of a maze of twisty little passages, all alike.")
      (DESC "Maze")
      (EAST TO MAZE-9)
      (WEST TO MAZE-13)
      (UP TO MAZE-11)
      (FLAGS RLANDBIT MAZEBIT)>

<ROOM MAZE-11
      (OBJIDX "174")
      (IN ROOMS)
      (LDESC "This is part of a maze of twisty little passages, all alike.")
      (DESC "Maze")
       (NE TO GRATING-ROOM)
      (DOWN TO MAZE-10)
      (NW TO MAZE-13)
      (SW TO MAZE-12)
      (FLAGS RLANDBIT MAZEBIT)>

<ROOM GRATING-ROOM
      (OBJIDX "175")
      (IN ROOMS)
      (DESC "Grating Room")
      (SW TO MAZE-11)
      (UP TO GRATING-CLEARING
       IF GRATE IS OPEN ELSE "The grating is closed.")
      (ACTION MAZE-11-FCN)
      (GLOBAL GRATE)
      (FLAGS RLANDBIT)>

<ROOM MAZE-12
      (OBJIDX "176")
      (IN ROOMS)
      (LDESC "This is part of a maze of twisty little passages, all alike.")
      (DESC "Maze")
      (DOWN PER MAZE-DIODES) ;"to MAZE-5"
      (SW TO MAZE-11)
      (EAST TO MAZE-13)
      (UP TO MAZE-9)
      (NORTH TO DEAD-END-4)
      (FLAGS RLANDBIT MAZEBIT)>

<ROOM DEAD-END-4
      (OBJIDX "177")
      (IN ROOMS)
      (DESC "Dead End")
      (LDESC "You have come to a dead end in the maze.")
      (SOUTH TO MAZE-12)
      (FLAGS RLANDBIT MAZEBIT)>

<ROOM MAZE-13
      (OBJIDX "178")
      (IN ROOMS)
      (LDESC "This is part of a maze of twisty little passages, all alike.")
      (DESC "Maze")
      (EAST TO MAZE-9)
      (DOWN TO MAZE-12)
      (SOUTH TO MAZE-10)
      (WEST TO MAZE-11)
      (FLAGS RLANDBIT MAZEBIT)>

<ROOM MAZE-14
      (OBJIDX "179")
      (IN ROOMS)
      (LDESC "This is part of a maze of twisty little passages, all alike.")
      (DESC "Maze")
       (WEST TO MAZE-15)
      (NW TO MAZE-14)
      (NE TO MAZE-7)
      (SOUTH TO MAZE-7)
      (FLAGS RLANDBIT MAZEBIT)>

<ROOM MAZE-15
      (OBJIDX "180")
      (IN ROOMS)
      (LDESC "This is part of a maze of twisty little passages, all alike.")
      (DESC "Maze")
      (WEST TO MAZE-14)
      (SOUTH TO MAZE-7)
      (SE TO CYCLOPS-ROOM)
      (FLAGS RLANDBIT MAZEBIT)>

\

"SUBTITLE CYCLOPS AND HIDEAWAY"

<ROOM CYCLOPS-ROOM
      (OBJIDX "181")
      (IN ROOMS)
      (DESC "Cyclops Room")
      (NW TO MAZE-15)
      (EAST TO STRANGE-PASSAGE
       IF MAGIC-FLAG ELSE "The east wall is solid rock.")
      (UP TO TREASURE-ROOM IF CYCLOPS-FLAG
        ELSE "The cyclops doesn't look like he'll let you past.")
      (ACTION CYCLOPS-ROOM-FCN)
      (FLAGS RLANDBIT)
      (GLOBAL STAIRS)>

<ROOM STRANGE-PASSAGE
      (OBJIDX "182")
      (IN ROOMS)
      (LDESC
"This is a long passage. To the west is one entrance. On the
east there is an old wooden door, with a large opening in it (about
cyclops sized).")
      (DESC "Strange Passage")
      (WEST TO CYCLOPS-ROOM)
      (IN TO CYCLOPS-ROOM)
      (EAST TO LIVING-ROOM)
      (FLAGS RLANDBIT)>

<ROOM TREASURE-ROOM
      (OBJIDX "183")
      (IN ROOMS)
      (LDESC
"This is a large room, whose east wall is solid granite. A number
of discarded bags, which crumble at your touch, are scattered about
on the floor. There is an exit down a staircase.")
      (DESC "Treasure Room")
      (DOWN TO CYCLOPS-ROOM)
      (ACTION TREASURE-ROOM-FCN)
      (FLAGS RLANDBIT ;"CANT-HAVE-ONBIT")
      (VALUE 25)
      (GLOBAL STAIRS)>

\

"SUBTITLE RESERVOIR AREA"

<ROOM RESERVOIR-SOUTH
      (OBJIDX "184")
      (IN ROOMS)
      (DESC "Reservoir South")
      (SE TO DEEP-CANYON)
      (SW TO CHASM-ROOM)
      (EAST TO DAM-ROOM)
      (WEST TO STREAM-VIEW)
      (NORTH TO RESERVOIR
       IF LOW-TIDE ELSE "You would drown.")
      (ACTION RESERVOIR-SOUTH-FCN)
      (FLAGS RLANDBIT)
      (GLOBAL GLOBAL-WATER)
      (PSEUDO "LAKE" LAKE-PSEUDO "CHASM" CHASM-PSEUDO)>

<ROOM RESERVOIR
      (OBJIDX "185")
      (IN ROOMS)
      (DESC "Reservoir")
      (NORTH TO RESERVOIR-NORTH)
      (SOUTH TO RESERVOIR-SOUTH)
      (UP TO IN-STREAM)
      (WEST TO IN-STREAM)
      (DOWN "The dam blocks your way.")
      (ACTION RESERVOIR-FCN)
      (FLAGS NONLANDBIT )
      (PSEUDO "STREAM" STREAM-PSEUDO)
      (GLOBAL GLOBAL-WATER)>

<ROOM RESERVOIR-NORTH
      (OBJIDX "186")
      (IN ROOMS)
      (DESC "Reservoir North")
      (NORTH TO ATLANTIS-ROOM)
      (SOUTH TO RESERVOIR
       IF LOW-TIDE ELSE "You would drown.")
      (ACTION RESERVOIR-NORTH-FCN)
      (FLAGS RLANDBIT)
      (GLOBAL GLOBAL-WATER STAIRS)
      (PSEUDO "LAKE" LAKE-PSEUDO)>

<ROOM STREAM-VIEW
      (OBJIDX "187")
      (IN ROOMS)
      (LDESC
"You are standing on a path beside a gently flowing stream. The path
follows the stream, which flows from west to east.")
      (DESC "Stream View")
      (EAST TO RESERVOIR-SOUTH)
      (WEST "The stream emerges from a spot too small for you to enter.")
      (FLAGS RLANDBIT)
      (GLOBAL GLOBAL-WATER)
      (PSEUDO "STREAM" STREAM-PSEUDO)>

<ROOM IN-STREAM
      (OBJIDX "188")
      (IN ROOMS)
      (LDESC
"You are on the gently flowing stream. The upstream route is too narrow
to navigate, and the downstream route is invisible due to twisting
walls. There is a narrow beach to land on.")
      (DESC "Stream")
      (UP "The channel is too narrow.")
      (WEST "The channel is too narrow.")
      (LAND TO STREAM-VIEW)
      (DOWN TO RESERVOIR)
      (EAST TO RESERVOIR)
      (FLAGS NONLANDBIT )
      (GLOBAL GLOBAL-WATER)
      (PSEUDO "STREAM" STREAM-PSEUDO)>

\

"SUBTITLE MIRROR ROOMS AND VICINITY"

<ROOM MIRROR-ROOM-1
      (OBJIDX "189")
      (IN ROOMS)
      (DESC "Mirror Room")
      (NORTH TO COLD-PASSAGE)
      (WEST TO TWISTING-PASSAGE)
      (EAST TO SMALL-CAVE)
      (ACTION MIRROR-ROOM)
      (FLAGS RLANDBIT)>

<ROOM MIRROR-ROOM-2
      (OBJIDX "190")
      (IN ROOMS)
      (DESC "Mirror Room")
      (WEST TO WINDING-PASSAGE)
      (NORTH TO NARROW-PASSAGE)
      (EAST TO TINY-CAVE)
      (ACTION MIRROR-ROOM)
      (FLAGS RLANDBIT ONBIT)>

<ROOM SMALL-CAVE
      (OBJIDX "191")
      (IN ROOMS)
      (LDESC
"This is a tiny cave with entrances west and north, and a staircase
leading down.")
      (DESC "Cave")
      (NORTH TO MIRROR-ROOM-1)
      (DOWN TO ATLANTIS-ROOM)
      (SOUTH TO ATLANTIS-ROOM)
      (WEST TO TWISTING-PASSAGE)
      (FLAGS RLANDBIT)
      (GLOBAL STAIRS)>

<ROOM TINY-CAVE
      (OBJIDX "192")
      (IN ROOMS)
      (LDESC
"This is a tiny cave with entrances west and north, and a dark,
forbidding staircase leading down.")
      (DESC "Cave")
      (NORTH TO MIRROR-ROOM-2)
      (WEST TO WINDING-PASSAGE)
      (DOWN TO ENTRANCE-TO-HADES)
      (ACTION CAVE2-ROOM)
      (FLAGS RLANDBIT)
      (GLOBAL STAIRS)>

<ROOM COLD-PASSAGE
      (OBJIDX "193")
      (IN ROOMS)
      (LDESC
"This is a cold and damp corridor where a long east-west passageway
turns into a southward path.")
      (DESC "Cold Passage")
      (SOUTH TO MIRROR-ROOM-1)
      (WEST TO SLIDE-ROOM)
      (FLAGS RLANDBIT)>

<ROOM NARROW-PASSAGE
      (OBJIDX "194")
      (IN ROOMS)
      (LDESC
"This is a long and narrow corridor where a long north-south passageway
briefly narrows even further.")
      (DESC "Narrow Passage")
      (NORTH TO ROUND-ROOM)
      (SOUTH TO MIRROR-ROOM-2)
      (FLAGS RLANDBIT)>

<ROOM WINDING-PASSAGE
      (OBJIDX "195")
      (IN ROOMS)
      (LDESC
"This is a winding passage. It seems that there are only exits
on the east and north.")
      (DESC "Winding Passage")
      (NORTH TO MIRROR-ROOM-2)
      (EAST TO TINY-CAVE)
      (FLAGS RLANDBIT)>

<ROOM TWISTING-PASSAGE
      (OBJIDX "196")
      (IN ROOMS)
      (LDESC
"This is a winding passage. It seems that there are only exits
on the east and north.")
      (DESC "Twisting Passage")
      (NORTH TO MIRROR-ROOM-1)
      (EAST TO SMALL-CAVE)
      (FLAGS RLANDBIT)>

<ROOM ATLANTIS-ROOM
      (OBJIDX "197")
      (IN ROOMS)
      (LDESC
"This is an ancient room, long under water. There is an exit to
the south and a staircase leading up.")
      (DESC "Atlantis Room")
      (UP TO SMALL-CAVE)
      (SOUTH TO RESERVOIR-NORTH)
      (FLAGS RLANDBIT)
      (GLOBAL STAIRS)>

\

"SUBTITLE ROUND ROOM AND VICINITY"

<ROOM EW-PASSAGE
      (OBJIDX "198")
      (IN ROOMS)
      (LDESC
"This is a narrow east-west passageway. There is a narrow stairway
leading down at the north end of the room.")
      (DESC "East-West Passage")
      (EAST TO ROUND-ROOM)
      (WEST TO TROLL-ROOM)
      (DOWN TO CHASM-ROOM)
      (NORTH TO CHASM-ROOM)
      (FLAGS RLANDBIT)
      (VALUE 5)
      (GLOBAL STAIRS)>

<ROOM ROUND-ROOM
      (OBJIDX "199")
      (IN ROOMS)
      (LDESC
"This is a circular stone room with passages in all directions. Several
of them have unfortunately been blocked by cave-ins.")
      (DESC "Round Room")
      (EAST TO LOUD-ROOM)
      (WEST TO EW-PASSAGE)
      (NORTH TO NS-PASSAGE)
      (SOUTH TO NARROW-PASSAGE)
      (SE TO ENGRAVINGS-CAVE)
      (FLAGS RLANDBIT)>

<ROOM DEEP-CANYON
      (OBJIDX "200")
      (IN ROOMS)
      (DESC "Deep Canyon")
      (NW TO RESERVOIR-SOUTH) ;COFFIN-CURE
      (EAST TO DAM-ROOM)
      (SW TO NS-PASSAGE)
      (DOWN TO LOUD-ROOM)
      (FLAGS RLANDBIT)
      (ACTION DEEP-CANYON-F)
      (GLOBAL STAIRS)>

<ROOM DAMP-CAVE
      (OBJIDX "201")
      (IN ROOMS)
      (LDESC
"This cave has exits to the west and east, and narrows to a crack toward
the south. The earth is particularly damp here.")
      (DESC "Damp Cave")
      (WEST TO LOUD-ROOM)
      (EAST TO WHITE-CLIFFS-NORTH)
      (SOUTH "It is too narrow for most insects.")
      (FLAGS RLANDBIT)
      (GLOBAL CRACK)>

<ROOM LOUD-ROOM
      (OBJIDX "202")
      (IN ROOMS)
      (DESC "Loud Room")
      (EAST TO DAMP-CAVE)
      (WEST TO ROUND-ROOM)
      (UP TO DEEP-CANYON)
      (ACTION LOUD-ROOM-FCN)
      (FLAGS RLANDBIT)
      (GLOBAL STAIRS)>

<ROOM NS-PASSAGE
      (OBJIDX "203")
      (IN ROOMS)
      (LDESC
"This is a high north-south passage, which forks to the northeast.")
      (DESC "North-South Passage")
      (NORTH TO CHASM-ROOM)
      (NE TO DEEP-CANYON)
      (SOUTH TO ROUND-ROOM)
      (FLAGS RLANDBIT)>

<ROOM CHASM-ROOM
      (OBJIDX "204")
      (IN ROOMS)
      (LDESC
"A chasm runs southwest to northeast and the path follows it. You are
on the south side of the chasm, where a crack opens into a passage.")
      (DESC "Chasm")
      (NE TO RESERVOIR-SOUTH)
      (SW TO EW-PASSAGE)
      (UP TO EW-PASSAGE)
      (SOUTH TO NS-PASSAGE)
      (DOWN "Are you out of your mind?")
      (FLAGS RLANDBIT)
      (GLOBAL CRACK STAIRS)
      (PSEUDO "CHASM" CHASM-PSEUDO)>

\

"SUBTITLE HADES ET AL"

<ROOM ENTRANCE-TO-HADES
      (OBJIDX "205")
      (IN ROOMS)
      (DESC "Entrance to Hades")
      (UP TO TINY-CAVE)
      (IN TO LAND-OF-LIVING-DEAD IF LLD-FLAG
       ELSE "Some invisible force prevents you from passing through the gate.")
      (SOUTH TO LAND-OF-LIVING-DEAD IF LLD-FLAG
       ELSE "Some invisible force prevents you from passing through the gate.")
      (ACTION LLD-ROOM)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL BODIES)
      (PSEUDO "GATE" GATE-PSEUDO "GATES" GATE-PSEUDO)>

<ROOM LAND-OF-LIVING-DEAD
      (OBJIDX "206")
      (IN ROOMS)
      (LDESC
"You have entered the Land of the Living Dead. Thousands of lost souls
can be heard weeping and moaning. In the corner are stacked the remains
of dozens of previous adventurers less fortunate than yourself.
A passage exits to the north.")
      (DESC "Land of the Dead")
      (OUT TO ENTRANCE-TO-HADES)
      (NORTH TO ENTRANCE-TO-HADES)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL BODIES)>

\

"SUBTITLE DOME, TEMPLE, EGYPT"

<ROOM ENGRAVINGS-CAVE	;"was CAVE4"
      (OBJIDX "207")
      (IN ROOMS)
      (LDESC
"You have entered a low cave with passages leading northwest and east.")
      (DESC "Engravings Cave")
      (NW TO ROUND-ROOM)
      (EAST TO DOME-ROOM)
      (FLAGS RLANDBIT)>

<ROOM EGYPT-ROOM	;"was EGYPT"
      (OBJIDX "208")
      (IN ROOMS)
      (LDESC
"This is a room which looks like an Egyptian tomb. There is an
ascending staircase to the west.")
      (DESC "Egyptian Room")
      (WEST TO NORTH-TEMPLE)
      (UP TO NORTH-TEMPLE)
      (FLAGS RLANDBIT)
      (GLOBAL STAIRS)>

<ROOM DOME-ROOM	;"was DOME"
      (OBJIDX "209")
      (IN ROOMS)
      (DESC "Dome Room")
      (WEST TO ENGRAVINGS-CAVE)
      (DOWN TO TORCH-ROOM
       IF DOME-FLAG ELSE "You cannot go down without fracturing many bones.")
      (ACTION DOME-ROOM-FCN)
      (FLAGS RLANDBIT)
      (PSEUDO "DOME" DOME-PSEUDO)>

<ROOM TORCH-ROOM
      (OBJIDX "210")
      (IN ROOMS)
      (DESC "Torch Room")
      (UP "You cannot reach the rope.")
      (SOUTH TO NORTH-TEMPLE)
      (DOWN TO NORTH-TEMPLE)
      (ACTION TORCH-ROOM-FCN)
      (FLAGS RLANDBIT)
      (GLOBAL STAIRS)
      (PSEUDO "DOME" DOME-PSEUDO)>

<ROOM NORTH-TEMPLE	;"was TEMP1"
      (OBJIDX "211")
      (IN ROOMS)
      (LDESC
"This is the north end of a large temple. On the east wall is an
ancient inscription, probably a prayer in a long-forgotten language.
Below the prayer is a staircase leading down. The west wall is solid
granite. The exit to the north end of the room is through huge
marble pillars.")
      (DESC "Temple")
      (DOWN TO EGYPT-ROOM)
      (EAST TO EGYPT-ROOM)
      (NORTH TO TORCH-ROOM)
      (OUT TO TORCH-ROOM)
      (UP TO TORCH-ROOM)
      (SOUTH TO SOUTH-TEMPLE)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL STAIRS)>

<ROOM SOUTH-TEMPLE	;"was TEMP2"
      (OBJIDX "212")
      (IN ROOMS)
      (LDESC

"This is the south end of a large temple. In front of you is what
appears to be an altar. In one corner is a small hole in the floor
which leads into darkness. You probably could not get back up it.")
      (DESC "Altar")
      (NORTH TO NORTH-TEMPLE)
      (DOWN TO TINY-CAVE
       IF COFFIN-CURE
       ELSE "You haven't a prayer of getting the coffin down there.")
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (ACTION SOUTH-TEMPLE-FCN)>

\

"SUBTITLE FLOOD CONTROL DAM #3"

<ROOM DAM-ROOM	;"was DAM"
      (OBJIDX "213")
      (IN ROOMS)
      (DESC "Dam")
      (SOUTH TO DEEP-CANYON)
      (DOWN TO DAM-BASE)
      (EAST TO DAM-BASE)
      (NORTH TO DAM-LOBBY)
      (WEST TO RESERVOIR-SOUTH)
      (ACTION DAM-ROOM-FCN)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL GLOBAL-WATER)>

<ROOM DAM-LOBBY	;"was LOBBY"
      (OBJIDX "214")
      (IN ROOMS)
      (LDESC
"This room appears to have been the waiting room for groups touring
the dam. There are open doorways here to the north and east marked
\"Private\", and there is a path leading south over the top of the dam.")
      (DESC "Dam Lobby")
      (SOUTH TO DAM-ROOM)
      (NORTH TO MAINTENANCE-ROOM)
      (EAST TO MAINTENANCE-ROOM)
      (FLAGS RLANDBIT ONBIT)>

<ROOM MAINTENANCE-ROOM	;"was MAINT"
      (OBJIDX "215")
      (IN ROOMS)
      (LDESC
"This is what appears to have been the maintenance room for Flood
Control Dam #3. Apparently, this room has been ransacked recently, for
most of the valuable equipment is gone. On the wall in front of you is a
group of buttons colored blue, yellow, brown, and red. There are doorways to
the west and south.")
      (DESC "Maintenance Room")
      (SOUTH TO DAM-LOBBY)
      (WEST TO DAM-LOBBY)
      (FLAGS RLANDBIT)>

\

"SUBTITLE RIVER AREA"

<ROOM DAM-BASE	;"was DOCK"
      (OBJIDX "216")
      (IN ROOMS)
      (LDESC
"You are at the base of Flood Control Dam #3, which looms above you
and to the north. The river Frigid is flowing by here. Along the
river are the White Cliffs which seem to form giant walls stretching
from north to south along the shores of the river as it winds its
way downstream.")
      (DESC "Dam Base")
      (NORTH TO DAM-ROOM)
      (UP TO DAM-ROOM)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL GLOBAL-WATER RIVER)>

<ROOM RIVER-1	;"was RIVR1"
      (OBJIDX "217")
      (IN ROOMS)
      (LDESC
"You are on the Frigid River in the vicinity of the Dam. The river
flows quietly here. There is a landing on the west shore.")
      (DESC "Frigid River")
      (UP "You cannot go upstream due to strong currents.")
      (WEST TO DAM-BASE)
      (LAND TO DAM-BASE)
      (DOWN TO RIVER-2)
      (EAST "The White Cliffs prevent your landing here.")
      (FLAGS NONLANDBIT SACREDBIT ONBIT)
      (GLOBAL GLOBAL-WATER RIVER)>

<ROOM RIVER-2	;"was RIVR2"
      (OBJIDX "218")
      (IN ROOMS)
      (LDESC
"The river turns a corner here making it impossible to see the
Dam. The White Cliffs loom on the east bank and large rocks prevent
landing on the west.")
      (DESC "Frigid River")
      (UP "You cannot go upstream due to strong currents.")
      (DOWN TO RIVER-3)
      (LAND "There is no safe landing spot here.")
      (EAST "The White Cliffs prevent your landing here.")
      (WEST "Just in time you steer away from the rocks.")
      (FLAGS NONLANDBIT SACREDBIT)
      (GLOBAL GLOBAL-WATER RIVER)>

<ROOM RIVER-3	;"was RIVR3"
      (OBJIDX "219")
      (IN ROOMS)
      (LDESC
"The river descends here into a valley. There is a narrow beach on the
west shore below the cliffs. In the distance a faint rumbling can be
heard.")
      (DESC "Frigid River")
      (UP "You cannot go upstream due to strong currents.")
      (DOWN TO RIVER-4)
      (LAND TO WHITE-CLIFFS-NORTH)
      (WEST TO WHITE-CLIFFS-NORTH)
      (FLAGS NONLANDBIT SACREDBIT)
      (GLOBAL GLOBAL-WATER RIVER)>

<ROOM WHITE-CLIFFS-NORTH	;"was WCLF1"
      (OBJIDX "220")
      (IN ROOMS)
      (LDESC
"You are on a narrow strip of beach which runs along the base of the
White Cliffs. There is a narrow path heading south along the Cliffs
and a tight passage leading west into the cliffs themselves.")
      (DESC "White Cliffs Beach")
      (SOUTH TO WHITE-CLIFFS-SOUTH IF DEFLATE ELSE "The path is too narrow.")
      (WEST TO DAMP-CAVE IF DEFLATE ELSE "The path is too narrow.")
      (ACTION WHITE-CLIFFS-FUNCTION)
      (FLAGS RLANDBIT SACREDBIT)
      (GLOBAL GLOBAL-WATER WHITE-CLIFF RIVER)>

<ROOM WHITE-CLIFFS-SOUTH	;"was WCLF2"
      (OBJIDX "221")
      (IN ROOMS)
      (LDESC
"You are on a rocky, narrow strip of beach beside the Cliffs. A
narrow path leads north along the shore.")
      (DESC "White Cliffs Beach")
      (NORTH TO WHITE-CLIFFS-NORTH
       IF DEFLATE ELSE "The path is too narrow.")
      (ACTION WHITE-CLIFFS-FUNCTION)
      (FLAGS RLANDBIT SACREDBIT)
      (GLOBAL GLOBAL-WATER WHITE-CLIFF RIVER)>

<ROOM RIVER-4	;"was RIVR4"
      (OBJIDX "222")
      (IN ROOMS)
      (LDESC
"The river is running faster here and the sound ahead appears to be
that of rushing water. On the east shore is a sandy beach. A small
area of beach can also be seen below the cliffs on the west shore.")
      (DESC "Frigid River")
      (UP "You cannot go upstream due to strong currents.")
      (DOWN TO RIVER-5)
      (LAND "You can land either to the east or the west.")
      (WEST TO WHITE-CLIFFS-SOUTH)
      (EAST TO SANDY-BEACH)
      (ACTION RIVR4-ROOM)
      (FLAGS NONLANDBIT SACREDBIT)
      (GLOBAL GLOBAL-WATER RIVER)>

<ROOM RIVER-5	;"was RIVR5"
      (OBJIDX "223")
      (IN ROOMS)
      (LDESC
"The sound of rushing water is nearly unbearable here. On the east
shore is a large landing area.")
      (DESC "Frigid River")
      (UP "You cannot go upstream due to strong currents.")
      (EAST TO SHORE)
      (LAND TO SHORE)
      (FLAGS NONLANDBIT SACREDBIT ONBIT)
      (GLOBAL GLOBAL-WATER RIVER)>

<ROOM SHORE	;"was FANTE"
      (OBJIDX "224")
      (IN ROOMS)
      (LDESC
"You are on the east shore of the river. The water here seems somewhat
treacherous. A path travels from north to south here, the south end
quickly turning around a sharp corner.")
      (DESC "Shore")
      (NORTH TO SANDY-BEACH)
      (SOUTH TO ARAGAIN-FALLS)
      (FLAGS RLANDBIT SACREDBIT ONBIT)
      (GLOBAL GLOBAL-WATER RIVER)>

<ROOM SANDY-BEACH	;"was BEACH"
      (OBJIDX "225")
      (IN ROOMS)
      (LDESC

"You are on a large sandy beach on the east shore of the river, which is
flowing quickly by. A path runs beside the river to the south here, and
a passage is partially buried in sand to the northeast.")
      (DESC "Sandy Beach")
      (NE TO SANDY-CAVE)
      (SOUTH TO SHORE)
      (FLAGS RLANDBIT SACREDBIT)
      (GLOBAL GLOBAL-WATER RIVER)>

<ROOM SANDY-CAVE	;"was TCAVE"
      (OBJIDX "226")
      (IN ROOMS)
      (LDESC
"This is a sand-filled cave whose exit is to the southwest.")
      (DESC "Sandy Cave")
      (SW TO SANDY-BEACH)
      (FLAGS RLANDBIT)>

<ROOM ARAGAIN-FALLS	;"was FALLS"
      (OBJIDX "227")
      (IN ROOMS)
      (DESC "Aragain Falls")
      (WEST TO ON-RAINBOW IF RAINBOW-FLAG)
      (DOWN "It's a long way...")
      (NORTH TO SHORE)
      (UP TO ON-RAINBOW IF RAINBOW-FLAG)
      (ACTION FALLS-ROOM)
      (FLAGS RLANDBIT SACREDBIT ONBIT)
      (GLOBAL GLOBAL-WATER RIVER RAINBOW)>

<ROOM ON-RAINBOW	;"was RAINB"
      (OBJIDX "228")
      (IN ROOMS)
      (LDESC
"You are on top of a rainbow (I bet you never thought you would walk
on a rainbow), with a magnificent view of the Falls. The rainbow
travels east-west here.")
      (DESC "On the Rainbow")
      (WEST TO END-OF-RAINBOW)
      (EAST TO ARAGAIN-FALLS)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL RAINBOW)>

<ROOM END-OF-RAINBOW	;"was POG"
      (OBJIDX "229")
      (IN ROOMS)
      (LDESC
"You are on a small, rocky beach on the continuation of the Frigid
River past the Falls. The beach is narrow due to the presence of the
White Cliffs. The river canyon opens here and sunlight shines in
from above. A rainbow crosses over the falls to the east and a narrow
path continues to the southwest.")
      (DESC "End of Rainbow")
      (UP TO ON-RAINBOW IF RAINBOW-FLAG)
      (NE TO ON-RAINBOW IF RAINBOW-FLAG)
      (EAST TO ON-RAINBOW IF RAINBOW-FLAG)
      (SW TO CANYON-BOTTOM)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL GLOBAL-WATER RAINBOW RIVER)>

<ROOM CANYON-BOTTOM	;"was CLBOT"
      (OBJIDX "230")
      (IN ROOMS)
      (LDESC
"You are beneath the walls of the river canyon which may be climbable
here. The lesser part of the runoff of Aragain Falls flows by below.
To the north is a narrow path.")
      (DESC "Canyon Bottom")
      (UP TO CLIFF-MIDDLE)
      (NORTH TO END-OF-RAINBOW)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL GLOBAL-WATER CLIMBABLE-CLIFF RIVER)>

<ROOM CLIFF-MIDDLE	;"was CLMID"
      (OBJIDX "231")
      (IN ROOMS)
      (LDESC
"You are on a ledge about halfway up the wall of the river canyon.
You can see from here that the main flow from Aragain Falls twists
along a passage which it is impossible for you to enter. Below you is the
canyon bottom. Above you is more cliff, which appears
climbable.")
      (DESC "Rocky Ledge")
      (UP TO CANYON-VIEW)
      (DOWN TO CANYON-BOTTOM)
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL CLIMBABLE-CLIFF RIVER)>

<ROOM CANYON-VIEW	;"was CLTOP"
      (OBJIDX "232")
      (IN ROOMS)
      (LDESC
"You are at the top of the Great Canyon on its west wall. From here
there is a marvelous view of the canyon and parts of the Frigid River
upstream. Across the canyon, the walls of the White Cliffs join the
mighty ramparts of the Flathead Mountains to the east. Following the
Canyon upstream to the north, Aragain Falls may be seen, complete with
rainbow. The mighty Frigid River flows out from a great dark cavern. To
the west and south can be seen an immense forest, stretching for miles
around. A path leads northwest. It is possible to climb down into
the canyon from here.")
      (DESC "Canyon View")
      (EAST TO CLIFF-MIDDLE)
      (DOWN TO CLIFF-MIDDLE)
      (NW TO CLEARING)
      (WEST TO FOREST-3)
      (SOUTH "Storm-tossed trees block your way.")
      (FLAGS RLANDBIT ONBIT SACREDBIT)
      (GLOBAL CLIMBABLE-CLIFF RIVER RAINBOW)
      (ACTION CANYON-VIEW-F)>

<ROUTINE CANYON-VIEW-F (RARG)
	 <COND (<AND <==? .RARG ,M-BEG>
		     <VERB? LEAP>
		     <NOT ,PRSO>>
		<JIGS-UP "Nice view, lousy place to jump.">
		<RTRUE>)>>
	       

\

"SUBTITLE COAL MINE AREA"

<ROOM MINE-ENTRANCE	;"was ENTRA"
      (OBJIDX "233")
      (IN ROOMS)
      (LDESC

"You are standing at the entrance of what might have been a coal mine.
The shaft enters the west wall, and there is another exit on the south
end of the room.")
      (DESC "Mine Entrance")
      (SOUTH TO SLIDE-ROOM)
      (IN TO SQUEEKY-ROOM)
      (WEST TO SQUEEKY-ROOM)
      (FLAGS RLANDBIT)>

<ROOM SQUEEKY-ROOM	;"was SQUEE"
      (OBJIDX "234")
      (IN ROOMS)
      (LDESC
"You are in a small room. Strange squeaky sounds may be heard coming
from the passage at the north end. You may also escape to the east.")
      (DESC "Squeaky Room")
      (NORTH TO BAT-ROOM)
      (EAST TO MINE-ENTRANCE)
      (FLAGS RLANDBIT)>

<ROOM BAT-ROOM	;"was BATS"
      (OBJIDX "235")
      (IN ROOMS)
      (DESC "Bat Room")
      (SOUTH TO SQUEEKY-ROOM)
      (EAST TO SHAFT-ROOM)
      (ACTION BATS-ROOM)
      (FLAGS RLANDBIT SACREDBIT)>

<ROOM SHAFT-ROOM	;"was TSHAF"
      (OBJIDX "236")
      (IN ROOMS)
      (LDESC
"This is a large room, in the middle of which is a small shaft
descending through the floor into darkness below. To the west and
the north are exits from this room. Constructed over the top of the
shaft is a metal framework to which a heavy iron chain is attached.")
      (DESC "Shaft Room")
      (DOWN "You wouldn't fit and would die if you could.")
      (WEST TO BAT-ROOM)
      (NORTH TO SMELLY-ROOM)
      (FLAGS RLANDBIT)
      (PSEUDO "CHAIN" CHAIN-PSEUDO)>

<ROOM SMELLY-ROOM	;"was SMELL"
      (OBJIDX "237")
      (IN ROOMS)
      (LDESC
"This is a small nondescript room. However, from the direction
of a small descending staircase a foul odor can be detected. To the
south is a narrow tunnel.")
      (DESC "Smelly Room")
      (DOWN TO GAS-ROOM)
      (SOUTH TO SHAFT-ROOM)
      (FLAGS RLANDBIT)
      (GLOBAL STAIRS)
      (PSEUDO "ODOR" GAS-PSEUDO "GAS" GAS-PSEUDO)>

<ROOM GAS-ROOM	;"was BOOM"
      (OBJIDX "238")
      (IN ROOMS)
      (LDESC
"This is a small room which smells strongly of coal gas. There is a
short climb up some stairs and a narrow tunnel leading east.")
      (DESC "Gas Room")
      (UP TO SMELLY-ROOM)
      (EAST TO MINE-1)
      (ACTION BOOM-ROOM)
      (FLAGS RLANDBIT SACREDBIT)
      (GLOBAL STAIRS)
      (PSEUDO "GAS" GAS-PSEUDO "ODOR" GAS-PSEUDO)>

<ROOM LADDER-TOP	;"was TLADD"
      (OBJIDX "239")
      (IN ROOMS)
      (LDESC
"This is a very small room. In the corner is a rickety wooden
ladder, leading downward. It might be safe to descend. There is
also a staircase leading upward.")
      (DESC "Ladder Top")
      (DOWN TO LADDER-BOTTOM)
      (UP TO MINE-4)
      (FLAGS RLANDBIT)
      (GLOBAL LADDER STAIRS)>

<ROOM LADDER-BOTTOM	;"was BLADD"
      (OBJIDX "240")
      (IN ROOMS)
      (LDESC
"This is a rather wide room. On one side is the bottom of a
narrow wooden ladder. To the west and the south are passages
leaving the room.")
      (DESC "Ladder Bottom")
      (SOUTH TO DEAD-END-5)
      (WEST TO TIMBER-ROOM)
      (UP TO LADDER-TOP)
      (FLAGS RLANDBIT)
      (GLOBAL LADDER)>

<ROOM DEAD-END-5	;"was DEAD7"
      (OBJIDX "241")
      (IN ROOMS)
      (DESC "Dead End")
      (LDESC "You have come to a dead end in the mine.")
      (NORTH TO LADDER-BOTTOM)
      (FLAGS RLANDBIT)>

<ROOM TIMBER-ROOM	;"was TIMBE"
      (OBJIDX "242")
      (IN ROOMS)
      (LDESC
"This is a long and narrow passage, which is cluttered with broken
timbers. A wide passage comes from the east and turns at the
west end of the room into a very narrow passageway. From the west
comes a strong draft.")
      (DESC "Timber Room")
      (EAST TO LADDER-BOTTOM)
      (WEST TO LOWER-SHAFT
       IF EMPTY-HANDED
       ELSE "You cannot fit through this passage with that load.")
      (ACTION NO-OBJS)
      (FLAGS RLANDBIT SACREDBIT)>

<ROOM LOWER-SHAFT	;"was BSHAF"
      (OBJIDX "243")
      (IN ROOMS)
      (LDESC
"This is a small drafty room in which is the bottom of a long
shaft. To the south is a passageway and to the east a very narrow
passage. In the shaft can be seen a heavy iron chain.")
      (DESC "Drafty Room")
      (SOUTH TO MACHINE-ROOM)
      (OUT TO TIMBER-ROOM
       IF EMPTY-HANDED
       ELSE "You cannot fit through this passage with that load.")
      (EAST TO TIMBER-ROOM
       IF EMPTY-HANDED
       ELSE "You cannot fit through this passage with that load.")
      (ACTION NO-OBJS)
      (FLAGS RLANDBIT SACREDBIT)
      (PSEUDO "CHAIN" CHAIN-PSEUDO)>

<ROOM MACHINE-ROOM	;"was MACHI"
      (OBJIDX "244")
      (IN ROOMS)
      (DESC "Machine Room")
      (NORTH TO LOWER-SHAFT)
      (ACTION MACHINE-ROOM-FCN)
      (FLAGS RLANDBIT)>

\

"SUBTITLE COAL MINE"

<ROOM MINE-1	;"was MINE1"
      (OBJIDX "245")
      (IN ROOMS)
      (LDESC "This is a nondescript part of a coal mine.")
      (DESC "Coal Mine")
      (NORTH TO GAS-ROOM)
      (EAST TO MINE-1)
      (NE TO MINE-2)
      (FLAGS RLANDBIT)>

<ROOM MINE-2	;"was MINE2"
      (OBJIDX "246")
      (IN ROOMS)
      (LDESC "This is a nondescript part of a coal mine.")
      (DESC "Coal Mine")
      (NORTH TO MINE-2)
      (SOUTH TO MINE-1)
      (SE TO MINE-3)
      (FLAGS RLANDBIT)>

<ROOM MINE-3	;"was MINE3"
      (OBJIDX "247")
      (IN ROOMS)
      (LDESC "This is a nondescript part of a coal mine.")
      (DESC "Coal Mine")
      (SOUTH TO MINE-3)
      (SW TO MINE-4)
      (EAST TO MINE-2)
      (FLAGS RLANDBIT)>

<ROOM MINE-4	;"was MINE4"
      (OBJIDX "248")
      (IN ROOMS)
      (LDESC "This is a nondescript part of a coal mine.")
      (DESC "Coal Mine")
      (NORTH TO MINE-3)
      (WEST TO MINE-4)
      (DOWN TO LADDER-TOP)
      (FLAGS RLANDBIT)>

<ROOM SLIDE-ROOM	;"was SLIDE"
      (OBJIDX "249")
      (IN ROOMS)
      (LDESC
"This is a small chamber, which appears to have been part of a
coal mine. On the south wall of the chamber the letters \"Granite
Wall\" are etched in the rock. To the east is a long passage, and
there is a steep metal slide twisting downward. To the north is
a small opening.")
      (DESC "Slide Room")
      (EAST TO COLD-PASSAGE)
      (NORTH TO MINE-ENTRANCE)
      (DOWN TO CELLAR)
      (FLAGS RLANDBIT)
      (GLOBAL SLIDE)>

\

;"RANDOM TABLES FOR WALK-AROUND"

<GLOBAL HOUSE-AROUND
  <LTABLE (PURE) WEST-OF-HOUSE NORTH-OF-HOUSE EAST-OF-HOUSE SOUTH-OF-HOUSE
	  WEST-OF-HOUSE>>

<GLOBAL FOREST-AROUND
  <LTABLE (PURE) FOREST-1 FOREST-2 FOREST-3 PATH CLEARING FOREST-1>>

<GLOBAL IN-HOUSE-AROUND
  <LTABLE (PURE) LIVING-ROOM KITCHEN ATTIC KITCHEN>>

<GLOBAL ABOVE-GROUND
  <LTABLE (PURE) WEST-OF-HOUSE NORTH-OF-HOUSE EAST-OF-HOUSE SOUTH-OF-HOUSE
	  FOREST-1 FOREST-2 FOREST-3 PATH CLEARING GRATING-CLEARING
	  CANYON-VIEW>>

;"The GO routine must live here."

<ROUTINE GO ()
	<ENABLE <QUEUE I-FIGHT -1>>
	<QUEUE I-SWORD -1>
	<ENABLE <QUEUE I-THIEF -1>>
	<QUEUE I-CANDLES 40>
	<QUEUE I-LANTERN 200>
	<PUTP ,INFLATED-BOAT ,P?VTYPE ,NONLANDBIT>
	<PUT ,DEF1-RES 1 <REST ,DEF1 2>>
	<PUT ,DEF1-RES 2 <REST ,DEF1 4>>
	<PUT ,DEF2-RES 2 <REST ,DEF2B 2>>
	<PUT ,DEF2-RES 3 <REST ,DEF2B 4>>
	<PUT ,DEF3-RES 1 <REST ,DEF3A 2>>
	<PUT ,DEF3-RES 3 <REST ,DEF3B 2>>
	<SETG HERE ,WEST-OF-HOUSE>
	<THIS-IS-IT ,MAILBOX>
	<COND (<NOT <FSET? ,HERE ,TOUCHBIT>>
	       <V-VERSION>
	       <CRLF>)>
	<SETG LIT T>
	<SETG WINNER ,ADVENTURER>
	<SETG PLAYER ,WINNER>
	<MOVE ,WINNER ,HERE>
	<V-LOOK>
	<MAIN-LOOP>
	<AGAIN>>