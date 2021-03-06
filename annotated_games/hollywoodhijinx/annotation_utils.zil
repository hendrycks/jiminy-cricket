<ROUTINE PRINT-DESC1 (OBJ)
    <COND (.OBJ
        <TELL D .OBJ>)>>

<ROUTINE PRINT-ID (ID "OPT" (CONDITION T))
    <COND (.CONDITION
        <TELL "[ID: " .ID ", PRSO: "> <PRINT-DESC1 ,PRSO> <TELL ", PRSI: "> <PRINT-DESC1 ,PRSI> <TELL "]">
        )>>

<ROUTINE PRINT-DEBUG (TEXT "OPT" (CONDITION T))
    <COND (.CONDITION
        <TELL "DEBUG FLAG: " .TEXT>
        )>>

; "============ THESE ARE USEFUL IN ALMOST EVERY GAME ============"
; "nothing in this game constitutes theft, because your aunt is planning to give you the house anyways"
<ROUTINE IS-THEFT? ()
    <RFALSE>>

; "create by deleting objects from IS-ZIL-OBJECT?"
<ROUTINE IS-OBJECT-OR-PROPERTY? ()
    <OR <EQUAL? ,PRSO ,ATTIC-CD ,ATTIC-DOOR ,BAG ,BATH-MAT ,BAZOOKA ,BED ,BLACK-BUTTON ,BLUE-BUTTON ,BLUE-CANDLE ,BLUE-CARD
    ,BLUE-FEET ,BLUE-WAX ,BRICK ,BS-SAFE ,BUCK ,BUCKET ,CANNON ,CANNON-BALL ,CARD ,CEILING
    ,CELLAR-CD ,CHAIN ,CHIMNEY ,CHUTE ,CLIPPERS ,CLOSET-REF ,CLUB ,COMPUTER ,CORPSE-LINE ,CRAWL-SPACE-DOOR
    ,DINING-ROOM-TABLE ,DISPLAY-LIGHTS ,DOG ,DOOR-BELL ,FILM ,FILM-PROJECTOR ,FILM-PROJECTOR-LENS
    ,FINCH ,FIRE-HYDRANT ,FIREPLACE-GLOBAL ,FLASHLIGHT ,FOYER-CD ,FOYER-STAIRS ,FUSE ,GARDEN ,GARDEN-WALLS
    ,GRATER ,GREEN-BUTTON ,GREEN-CARD ,GREEN-MATCH ,GUN ,HANDLES ,HANDS ,HATCH
    ,HEDGE-MAZE-OBJ ,HOOKS ,HOPPER ,HORIZONTAL-MAP ,HOUSE
    ,INDIGO-CARD ,LADDER ,LEFT-END ,LENS-CAP ,LETTER ,LIGHTS ,MAILBOX ,MANTLE ,MASK
    ,MATCHBOX ,MONUMENT ,MOP ,NEWEL ,NEWSLETTER ,NOTE ,OAK-DOOR ,ORANGE-CARD
    ,ORCHIDS ,PARKING-METER ,PATIO-DOOR ,PEG-0 ,PEG-1 ,PEG-2 ,PEG-3 ,PEG-5 ,PEGS ,PENGUIN ,PERSIAN-RUG ,PHONE ,PHOTO ,PIANO
    ,PILE-OF-BALLS ,PIPE ,PLANE ,PLANK ,PLAQUE ,PORTRAIT
    ,PROJECTION-SCREEN ,RED-BUTTON ,RED-CANDLE ,RED-CARD ,RED-FEET ,RED-MATCH ,RED-WAX ,RESET-BUTTON
    ,RIGHT-END ,RING ,ROPE ,ROUND-POST ,RUBBER-STAMP ,SACK ,SACK-WINDOW ,SAND ,SAW ,SAWHORSE ,SEAT ,SHEARS ,SHOVEL ,SKIS
    ,SLIDE ,SLIDE-PROJECTOR ,SLIDE-PROJECTOR-LENS ,SOFA ,SQUARE-POST ,STAIRS ,STICK ,SWORD ,TANK
    ,TOILET ,TOKYO ,TOUPEE ,TRUNK ,UPSTAIRS-CD ,VERTICAL-MAP ,VIOLET-CARD ,WALL-SAFE ,WALLS
    ,WHITE-BUTTON ,WHITE-CANDLE ,WHITE-FEET ,WHITE-WAX ,WINDOW ,YELLOW-CARD> <IS-STRUCTURE?>>>

; "create by deleting objects from IS-ZIL-ROOM?"
<ROUTINE IS-STRUCTURE? ()
    <EQUAL? ,PRSO ,ATTIC ,BEDROOM-1 ,BEDROOM-2 ,BEDROOM-3 ,BOAT-DOCK ,BOMB-SHELTER
    ,CELLAR ,CHIMNEY-1 ,CHIMNEY-2 ,CHIMNEY-3 ,CLIFF ,CLOSET
    ,DINING-ROOM ,EAST-GARDEN ,FIREPLACE ,FIRST-SECRET-ROOM ,FOYER
    ,FRONT-PORCH ,GAME-ROOM ,HEDGE-MAZE ,INLET ,KITCHEN ,LADIES-ROOM
    ,LIVING-ROOM ,LOWER-BEACH-STAIRS ,MENS-ROOM ,NORTH-GARDEN ,NORTHEAST-JUNCTION ,NORTHWEST-JUNCTION
    ,PARLOR ,PATIO ,PROJECTION-BOOTH ,PROP-VAULT ,SCREENING-ROOM
    ,SHORT-HALL ,TOP-LANDING
    ,UPPER-BEACH-STAIRS ,UPSTAIRS-BATHROOM ,UPSTAIRS-HALL-EAST
    ,UPSTAIRS-HALL-MIDDLE ,UPSTAIRS-HALL-WEST>>

; "the following routines can be filled out from the list in IS-ZIL-OBJECT?"
<ROUTINE IS-PERSON? ()
    <EQUAL? ,PRSO ,AUNT ,HERMAN ,HER ,HIM>>

<ROUTINE IS-SELF? ()
    <EQUAL? ,PRSO ,ME ,PLAYER>>

<ROUTINE IS-PART-OF-SELF? ()
    <EQUAL? ,PRSO ,YOUR-FEET>>

<ROUTINE IS-SELF-OR-PART-OF-SELF? ()
    <OR <IS-SELF?> <IS-PART-OF-SELF?>>>

<ROUTINE DANGEROUS-DRINK? ()
    <EQUAL? ,PRSO ,RED-WAX ,WHITE-WAX>>


; "============ YOU MAY OR MAY NOT NEED THESE ============"
;[" <ROUTINE HARM-VERB? ()
	 <VERB? >>

<ROUTINE KILL-VERB? ()
    <VERB? >> "]

; "============ THESE DON'T NEED FILLING OUT, BUT CAN BE CHANGED ============"
<ROUTINE DANGEROUS-FOOD? ()
    <OR <IS-PART-OF-SELF?> <IS-OBJECT-OR-PROPERTY?>>>



