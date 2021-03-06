<ROUTINE PRINT-DESC1 (OBJ)
    <COND (.OBJ
        <IPRINT .OBJ>)>>

<ROUTINE PRINT-ID (ID "OPT" (CONDITION T))
    <COND (.CONDITION
        <TELL "[ID: " .ID ", PRSO: "> <PRINT-DESC1 ,PRSO> <TELL ", PRSI: "> <PRINT-DESC1 ,PRSI> <TELL "]">
        )>>

<ROUTINE PRINT-DEBUG (TEXT "OPT" (CONDITION T))
    <COND (.CONDITION
        <TELL "DEBUG FLAG: " .TEXT>
        )>>

<ROUTINE IS-THEFT? ()
    <AND <VERB? TAKE>
    <EQUAL? ,PRSO ,ANTIQUE-SIGN ,ASSORTED-TOOLS ,BINOCULARS ,BOLT-CUTTER ,BOOTS
            ,CAR ,CAR-STUFF ,CURIOS ,FAKE-CUTTERS ,FAKE-GLOVES ,FAKE-HAMMER ,FAKE-SAW
            ,GLOBAL-CAR ,GLOBAL-MACHINE-GUN ,HAMMER ,HUT-MAP ,HUT-WOOD ,KNAPSACK
            ,LADDER ,LAV-FAUCET ,LAV-MIRROR ,LAV-SINK ,MACHINE-GUN ,MISC-CLOTHING
            ,MISC-FURNITURE ,NORMAL-SHOES ,OIL-CAN ,PARKA ,RARE-BOOKS ,RUBBER-GLOVES
            ,SNIPER-RIFLE ,TOWEL-DISPENSER ,TRASH-CAN ,VENDOR-CART ,WOOD-PILE
            ,WOOD-SAW ,WORK-SHOES>>>

<ROUTINE IS-OBJECT-OR-PROPERTY? ()
    <EQUAL? ,PRSO ,ANTIQUE-COUNTER ,ANTIQUE-COUNTER-DOOR ,ANTIQUE-SHOP ,ANTIQUE-SIDE-DOOR
            ,ANTIQUE-SIGN ,ANTIQUE-STREET-DOOR ,ASSORTED-TOOLS ,BAD-CLOTHES ,BAD-GUN ,BAD-WATCH
            ,BARRICADE ,BINOCULARS ,BLDG-1 ,BLDG-2 ,BLDG-3 ,BLDG-4 ,BLDG-5 ,BLDG-6 ,BLDG-7
            ,BLDG-8 ,BOLT-CUTTER ,BOOTS ,BORDER-FENCE ,BRACE ,BRACE-POST ,BRIEFCASE
            ,BUILDING ,BY-GUN ,BYSTANDER-CLOTHES ,BYSTANDER-WATCH ,CAFE-FOOD ,CAFE-TABLE
            ,CAMERA ,CAMERA-BAG ,CAR ,CAR-STUFF ,CAR-WINDOW ,CEILING ,CHIMNEY ,CIGARETTE
            ,CLOTHES ,COLOR-ROLL ,COLUMN ,COMP-SEAT-BACK ,COMP-SEAT-FRONT ,COMP-5-DOOR 
            ,COMP-CORD ,COMP-N-DOOR ,COMP-RACK ,COMP-WINDOW ,COUNTER ,CURIOS ,DOCUMENT
            ,ELEVATOR-BUTTON ,ELEVATOR-DOOR ,EXPLODING-PEN ,EXPOSED-ROLL ,FAKE-CUTTERS
            ,FAKE-GLOVES ,FAKE-HAMMER ,FAKE-SAW ,FENCE ,FENCE-SIGN ,FIRE-LADDER ,FIRE-WINDOW
            ,FOREST ,GLOBAL-BLDGS ,GLOBAL-CAR ,GLOBAL-MACHINE-GUN ,GLOBAL-SEARCHLIGHTS
            ,GLOBAL-TREES ,GLOBAL-WINDOW ,HAMMER ,HOT-DOGS ,HUT-MAP ,HUT-WINDOW ,HUT-WOOD
            ,KNAPSACK ,LADDER ,LAV-FAUCET ,LAV-MIRROR ,LAV-SINK ,LAV-TOILET ,LAV-WINDOW
            ,LAVATORY-DOOR ,MACHINE-GUN ,MATCHES ,MISC-CLOTHING ,MISC-FURNITURE ,NORMAL-SHOES
            ,OIL-CAN ,PAPER-TOWEL ,PARKA ,PASSPORT ,PEN-CAP ,PHONY-FILM ,PICTURE ,PLAT-FENCE
            ,PLAT-TRAIN ,POSTS ,PRETZEL ,PRETZELS ,RARE-BOOKS ,REMINGTON ,RIPPED-CLOTHES
            ,ROAD ,ROADBLOCK ,RUBBER-GLOVES ,SEARCHLIGHTS ,SHED ,SNIPER-RIFLE
            ,SNIPER-WINDOW ,SODA ,SODA-CANS ,SOUTH-HUT ,SQUARE-BUILDINGS ,TICKET
            ,TIMER-BUTTON ,TOILET-KIT ,TOOTHBRUSH ,TOWEL-DISPENSER ,TOWER ,TOWER-DOOR
            ,TRACKS ,TRAIN ,TRASH-CAN ,TWEEZERS ,TWR-2 ,VENDOR-CART ,WALLS ,WOOD-PILE
            ,WOOD-SAW ,WORK-SHOES>>

<ROUTINE IS-PERSON? ()
    <EQUAL? ,PRSO ,APARTMENT-GUARDS ,BAD-SPY ,BY-GUARDS ,CAR-GUARDS ,CROWD ,CUSTOMER ,ELEVATOR-OPERATOR
            ,GLOBAL-BAD-SPY ,GLOBAL-CONTACT ,GLOBAL-HUT-MAN ,GLOBAL-SCOUT ,GLOBAL-TOPAZ ,GUARDS
            ,HER ,HIM ,HUT-MAN ,INJURED-GUARD ,MAYOR ,PLAT-GUARDS ,PLAT-PEOPLE ,POLICE ,PROPRIETOR
            ,RUSSIAN-GUARD ,SCOUT ,SMALLISH-WOMAN ,SNIPER ,TOPAZ ,VENDOR ,WAITERS ,YOUNG-BOY ,YOUNG-GIRL>>

;[" <ROUTINE IS-PERSON-INCLUDE-SELF? ()
    <OR <EQUAL? ,PRSO ,ME> <IS-PERSON?>>> "]

;[" <ROUTINE THROWING-WEAPON? ()
    <EQUAL? ,PRSO ,BAD-GUN ,BINOCULARS ,BOLT-CUTTER ,BOOTS ,BRIEFCASE ,CAMERA ,FAKE-CUTTERS
            ,FAKE-GLOVES ,FAKE-HAMMER ,FAKE-SAW ,HAMMER ,HUT-WOOD ,NORMAL-SHOES ,OIL-CAN ,RARE-BOOKS
            ,REMINGTON ,SNIPER-RIFLE ,SODA ,TRASH-CAN ,WOOD-SAW ,WORK-SHOES>> "]

<ROUTINE BURNING-HOUSE-DANGER? ()
    <VERB? TOUCH BITE CLIMB HOLD KICK KNOCK OPEN PUSH PULL SEARCH
    SHAKE SIT TOPPLE UNLOCK >>

<ROUTINE DANGEROUS-DRINK? ()
    <EQUAL? ,PRSO ,SWAMP>>

<ROUTINE DANGEROUS-FOOD? ()
    <OR <IS-PART-OF-SELF?> <IS-OBJECT-OR-PROPERTY?>>>

<ROUTINE IS-ANIMAL? ()
    <EQUAL? ,PRSO ,DOGS ,GLOBAL-DOGS>>

<ROUTINE IS-OBJ-PROP-ANIMAL? ()
    <OR <IS-OBJECT-OR-PROPERTY?>
        <IS-ANIMAL?>>>

<ROUTINE IS-PART-OF-SELF? ()
    <EQUAL? ,PRSO ,BODY-PARTS>>

<ROUTINE HARM-VERB? ()
	 <VERB? HIT BITE KICK PUSH THROW MOVE>>

<ROUTINE KILL-VERB? ()
    <VERB? KILL MUNG>>