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
<ROUTINE IS-THEFT? ()
    <AND <VERB? TAKE>
    <EQUAL? ,PRSO ,ACCESS-PANEL ,ACHILLES ,BAD-BEDISTOR ,BROCHURE ,BROWN-SPOOL ,CAN
    ,CANTEEN ,CARTON ,CELERY ,CHEMICAL-DISPENSER ,CHEMICAL-FLUID ,COMBINATION-DIAL
    ,COMBINATION-PAPER ,CUBE ,DISPENSER ,FIRST-BOARD ,FLASK
    ,FOURTH-BOARD ,GAS-MASK ,GLOBAL-SHUTTLE ,GOOD-BEDISTOR ,GOOD-BOARD
    ,GREEN-SPOOL ,HELICOPTER-OBJECT ,HIGH-PROTEIN ,ID-CARD ,KEY
    ,KITCHEN-CARD ,LAB-DESK ,LAB-UNIFORM ,LADDER ,LAMP ,LARGE-DESK ,LASER ,LASER-DIAL ,LAZARUS-PART ,LEVER
    ,LIGHTS ,LOWER-ELEVATOR-CARD ,MAGNET ,MEDICINE-BOTTLE ,MEGAFUSE-B ,MEGAFUSE-K ,MEMO ,MINI-CARD ,NEW-BATTERY
    ,OIL-CAN ,OLD-BATTERY ,PADLOCK ,PLIERS ,PRINT-OUT ,RECEIVE-CONSOLE ,RED-SPOOL ,RELAY ,RIFT ,SAFETY-WEB
    ,SECOND-BOARD ,SEND-CONSOLE ,SHELVES ,SHUTTLE-CARD ,SPOOL-READER ,STRIP
    ,TELEPORTATION-CARD ,TERMINAL ,THIRD-BOARD ,UPPER-ELEVATOR-CARD>>>

<ROUTINE IS-OBJECT-OR-PROPERTY? ()
    <EQUAL? ,PRSO ,ACCESS-PANEL ,ACHILLES ,BAD-BEDISTOR ,BED ,BIO-DOOR-EAST ,BIO-DOOR-WEST
    ,BLACK-BUTTON ,BLUE-BUTTON ,BLUE-ELEVATOR-BUTTON ,BROCHURE ,BROWN-BUTTON ,BROWN-GOO ,BROWN-SPOOL ,CAN
    ,CANTEEN ,CARTON ,CELERY ,CHEMICAL-DISPENSER ,CHEMICAL-FLUID ,CLIFF ,COMBINATION-DIAL
    ,COMBINATION-PAPER ,COMM-SCREEN ,CONFERENCE-DOOR ,CONTROLS ,CORRIDOR-DOOR ,CRACKED-BOARD ,CREVICE
    ,CRYO-ELEVATOR-DOOR ,CUBE ,DARK-BUTTON ,DEAD-FLOYD ,DISPENSER ,ELEVATOR-BUTTON ,FIRST-BOARD ,FLASK
    ,FOOD-KIT ,FOURTH-BOARD ,FRIED-BOARD ,FUNGICIDE-BUTTON ,FUNNEL-HOLE ,GANGWAY-DOOR ,GAS-MASK ,GLOBAL-DOORWAY
    ,GLOBAL-POD ,GLOBAL-SHUTTLE ,GOOD-BEDISTOR ,GOOD-BOARD ,GRAY-BUTTON
    ,GREEN-BUTTON ,GREEN-GOO ,GREEN-SPOOL ,HANDS ,HELICOPTER-OBJECT ,HIGH-PROTEIN ,ID-CARD ,KEY
    ,KITCHEN-CARD ,KITCHEN-DOOR ,LAB-DESK ,LAB-UNIFORM ,LADDER ,LAMP ,LARGE-DESK ,LASER ,LASER-DIAL ,LAZARUS-PART ,LEVER
    ,LIGHT-BUTTON ,LIGHTS ,LOWER-ELEVATOR-CARD ,LOWER-ELEVATOR-DOOR ,MAGNET
    ,MEDICINE-BOTTLE ,MEGAFUSE-B ,MEGAFUSE-K ,MEMO ,MINI-CARD ,NEW-BATTERY
    ,OFFICE-DOOR ,OIL-CAN ,OLD-BATTERY ,PADLOCK ,PLAYBACK-BUTTON ,PLIERS ,POD-DOOR ,PRINT-OUT
    ,RAD-DOOR-EAST ,RAD-DOOR-WEST ,REACTOR-ELEVATOR-DOOR ,RECEIVE-CONSOLE ,RED-BUTTON
    ,RED-ELEVATOR-BUTTON ,RED-GOO ,RED-SPOOL ,RELAY ,RIFT ,ROUND-WHITE-BUTTON ,SAFETY-WEB
    ,SECOND-BOARD ,SEND-CONSOLE ,SHELVES ,SHUTTLE-CARD ,SHUTTLE-DOOR ,SLOT ,SMALL-DESK
    ,SPOOL-READER ,SQUARE-WHITE-BUTTON ,STAIRS ,STORAGE-WEST-DOOR ,STRIP ,TABLES ,TELEPORTATION-BUTTON-1
    ,TELEPORTATION-BUTTON-2 ,TELEPORTATION-BUTTON-3 ,TELEPORTATION-CARD ,TERMINAL ,THIRD-BOARD ,TOWEL
    ,UPPER-ELEVATOR-CARD ,UPPER-ELEVATOR-DOOR ,WINDOW ,YELLOW-BUTTON>>

<ROUTINE IS-PERSON? ()
    <EQUAL? ,PRSO ,AMBASSADOR ,BLATHER ,FLOYD ,TROLL>>

<ROUTINE IS-ANIMAL? ()
    <EQUAL? ,PRSO ,GRUE ,MICROBE ,RAT-ANT ,TRIFFID>>

<ROUTINE IS-SELF? ()
    <EQUAL? ,PRSO ,ADVENTURER ,ME>>

<ROUTINE IS-YOUR-PROPERTY? ()
    <EQUAL? ,PRSO ,PATROL-UNIFORM ,SCRUB-BRUSH ,CHRONOMETER>>

; "============ THESE DON'T NEED FILLING OUT, BUT CAN BE CHANGED ============"
<ROUTINE DANGEROUS-FOOD? ()
    <AND <IS-OBJECT-OR-PROPERTY?> <NOT <EQUAL? ,PRSO ,MEDICINE ,BROWN-GOO ,GREEN-GOO ,RED-GOO ,HIGH-PROTEIN ,CELERY>>>>

<ROUTINE IS-OBJ-PROP-ANIMAL? ()
    <OR <IS-OBJECT-OR-PROPERTY?>
        <IS-ANIMAL?>>>



