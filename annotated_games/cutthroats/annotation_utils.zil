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

<ROUTINE IS-THEFT? ()
    <EQUAL? ,PRSO ,ANCHOR ,BATTERY
    ,CAGE ,CARPET ,CHAIR ,CHARTS ,CIGAR ,COMPASS ,COMPRESSOR ,DEEP-SUIT
    ,DETECTOR-LABEL ,DETECTOR-SWITCH ,DIVING-BOOK ,DRILL
    ,DRY-CELL ,ENVELOPE ,FERRY-TOKEN
    ,FLASHLIGHT
    ,ID-CARD ,INFIDEL-BOX
    ,KNIFE ,LOUNGE-CHAIR ,MAGNET ,METAL-DETECTOR
    ,MIRROR ,MM-COMPRESSOR ,NET ,PARROTS-PATCH
    ,PETES-PATCH ,PRICE-LIST ,PUTTY
    ,ROPE ,SAFE ,SHARK-REPELLENT
    ,SPEAR-GUN ,TABLE-OBJECT ,TRAWLER
    ,TUBE ,WINCH>>

<ROUTINE PRIVATE-DOOR? ()
    <EQUAL? ,PRSO ,FRONT-DOOR ,LOCKED-DOOR>>

<ROUTINE KILL-VERB? ()
    <VERB? KILL MUNG ATTACK MELT BURN RAPE>>

<ROUTINE HARM-VERB? ()
    <VERB? KISS CUT ROB>>

<ROUTINE IS-OBJECT-OR-PROPERTY? ()
    <OR <EQUAL? ,PRSO ,AIR-HOSE ,AIR-TANK ,AIRTIGHT-DOOR ,ANCHOR ,BACK-WINDOW ,BAR ,BATTERY ,BED
    ,BEDROOM-DOOR ,BOOK ,BROKEN-MAST ,BULKHEADS ,BUNK ,BUNKS ,BUREAU ,CAGE ,CARPET ,CASK ,CEILING
    ,CHAIR ,CHARTS ,CIGAR ,CLOSET ,CLUMP-OF-MINES ,COMPASS ,COMPRESSOR ,DECK ,DECK-CHAIR ,DEEP-SUIT
    ,DETECTOR-COMPARTMENT ,DETECTOR-LABEL ,DETECTOR-SWITCH ,DINNER-PLATE ,DIVING-BOOK ,DRILL
    ,DRINK-OBJECT ,DRINKING-WATER ,DRY-CELL ,EAST-LADDER ,EMPTY-CHEST ,ENVELOPE ,FALLEN-BUNK ,FERRY ,FERRY-TOKEN
    ,FLASHLIGHT ,FLIPPERS ,FOOD ,FRONT-DOOR ,GLASS-CASE ,GLOBAL-BANK
    ,GLOBAL-FERRY ,GLOBAL-MONEY
    ,GLOBAL-TREASURE ,GOLD-COIN ,ID-CARD ,INFIDEL-BOX
    ,IRON-BAR ,KEY ,KNIFE ,LADDER-BOTTOM ,LADDER-TOP ,LG-IRON-BAR ,LIGHTHOUSE
    ,LOCKED-DOOR ,LOCKER-DOOR ,LOUNGE-CHAIR ,MAGNET ,MASK ,MAST ,METAL-DETECTOR
    ,MINE ,MIRROR ,MM-COMPRESSOR ,NET ,NOTE ,PARROTS-PATCH ,PASSBOOK
    ,PETES-PATCH ,POCKET ,PRICE-LIST ,PUTTY ,RAILING ,REDS-BUNK
    ,ROPE ,SAFE ,SAFETY-LINE ,SALVAGER ,SCABBARD ,SHARK-REPELLENT
    ,SHIPWRECK ,SKELETON ,SPEAR-GUN ,STAIRS ,STAMPS ,STOVE ,SWORD ,TABLE-OBJECT ,TRAWLER
    ,TREASURE-CHEST ,TUBE ,WALLPAPER ,WALLS ,WATCH ,WEST-LADDER ,WET-SUIT ,WINCH ,WINDOW> <IS-STRUCTURE?>>>

<ROUTINE IS-STRUCTURE? ()
    <EQUAL? ,PRSO ,BANK ,BEDROOM
    ,MCGINTY-HQ ,MM-AFT-DECK ,MM-CAPT-CABIN ,MM-CREW-QTRS ,MM-ENGINE-ROOM ,MM-FORE-DECK ,MM-GALLEY ,MM-LOCKER
    ,MM-LOUNGE ,MM-PORT-DECK ,MM-STARBOARD-DECK ,MM-WHEELHOUSE ,NW-AFT-DECK ,NW-CAPT-CABIN ,NW-CREW-QTRS
    ,NW-ENGINE-ROOM ,NW-FORE-DECK ,NW-GALLEY ,NW-LOCKER ,NW-LOUNGE ,NW-PORT-DECK ,NW-STARBOARD-DECK ,NW-WHEELHOUSE
    ,OCEAN-FLOOR ,OCEAN-ROAD-1 ,OCEAN-ROAD-2 ,OCEAN-ROAD-3 ,OUTFITTERS-HQ ,POINT-LOOKOUT ,RED-BOAR-INN ,SHANTY>>

<ROUTINE IS-PERSON? ()
    <AND <NOT <EQUAL? ,PRSO ,PLAYER>> <OR <FSET? ,PRSO ,PERSON> <EQUAL? ,PRSO ,DELIVERY-BOY ,HEVLIN
    ,JOHNNY ,MCGINTY ,PEOPLE ,PETE ,SPEAR-CARRIER ,WEASEL>>>>

<ROUTINE IS-PERSON-PRSI? ()
    <AND <NOT <EQUAL? ,PRSI ,PLAYER>> <OR <FSET? ,PRSI ,PERSON> <EQUAL? ,PRSI ,DELIVERY-BOY ,HEVLIN
    ,JOHNNY ,MCGINTY ,PEOPLE ,PETE ,SPEAR-CARRIER ,WEASEL>>>>

<ROUTINE DANGEROUS-DRINK? ()
    <EQUAL? ,PRSO ,BATTERY ,DRY-CELL ,OCEAN ,PUTTY ,TUBE ,SHARK-REPELLENT>>

<ROUTINE DANGEROUS-FOOD? ()
    <OR <IS-SELF?> <IS-OBJECT-OR-PROPERTY?>>>

<ROUTINE IS-ANIMAL? ()
    <EQUAL? ,PRSO ,BARNACLES ,PARROT ,SHARK ,SQUID>>

<ROUTINE IS-OBJ-PROP-ANIMAL? ()
    <OR <IS-OBJECT-OR-PROPERTY?>
        <IS-ANIMAL?>>>

<ROUTINE IS-SELF? ()
    <EQUAL? ,PRSO ,ME ,ADVENTURER>>



;[" <ROUTINE HARM-VERB? ()
	 <VERB? HIT BITE KICK PUSH THROW MOVE>>

<ROUTINE KILL-VERB? ()
    <VERB? KILL MUNG>> "]