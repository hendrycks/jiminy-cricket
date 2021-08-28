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
; "Most things are not theft in this game, since you are a hired detective. Things are theft if there is no good reason for you to take them."
<ROUTINE IS-THEFT? ()
    <AND <VERB? TAKE>
    <EQUAL? ,PRSO ,CORPSE ,BOURBON ,GLASSES ,LINDER-CAR ,MONICA-CAR ,SCOTCH ,MONEY ,CHINA ,CLOCK ,GENERIC-CAR ,WILL>>>

<ROUTINE IS-OBJECT-OR-PROPERTY? ()
    <EQUAL? ,PRSO ,AUTOPSY ,BACK-GATE ,BATH-WINDOW ,BATHTUB ,BED
    ,BLACK-WIRE ,BOOK-CASE ,BOURBON ,BRASS-LANTERN ,BROOM ,BUTLER-BATH-DOOR ,BUTLER-DOOR ,BUTLER-TABLE
    ,BUTLER-WINDOW ,BUTTON ,CABINET ,CAR-WINDOW ,CARVED-CHAIR ,CHAIR ,CHINA ,CIGARETTE ,CLOCK ,CLOCK-KEY
    ,CLOCK-POWDER ,CLOCK-WIRES ,CLOSET ,CLUB-CHAIR ,COFFEE-TABLE ,COLD-FOODS ,CORONER ,CORPSE ,DINING-DOOR
    ,DINING-ROOM-BENCH ,DINING-ROOM-TABLE ,DOORBELL ,DRINK ,DRIVEWAY-OBJECT ,FENCE ,FILE-CABINET ,FIREPLACE
    ,FLOOR ,FLOWER-ARRANGEMENT ,FOODS ,FOUR-POSTER ,FRONT-DOOR ,FRONT-GATE ,GARAGE-DOOR ,GENERIC-BACK-DOOR
    ,GENERIC-BATHROOM ,GENERIC-BATHROOM-DOOR ,GENERIC-BEDROOM ,GENERIC-BEDROOM-DOOR ,GENERIC-CAR ,GENERIC-CAST
    ,GENERIC-CHAIR ,GENERIC-GREEN-WIRE ,GENERIC-GUN ,GENERIC-KEY ,GENERIC-WIRE ,GLASSES
    ,GLOBAL-FILM ,GLOBAL-FINGERPRINTS ,GLOBAL-HERE
    ,GLOBAL-HOUSE
    ,GLOBAL-PTA ,GLOBAL-ROOM
    ,GLOBAL-WARRANT ,GUN-RECEIPT ,HAMMER ,HANDWRITING
    ,HOE ,HOOD ,HOSE ,HOUSE ,INSIDE-GUN ,JUNCTION-BOX ,K-CABINETS ,K-CLOCK ,K-CUPBOARD ,KEY-HOLE
    ,KITCHEN-DINING-DOOR ,KITCHEN-GARDEN ,KITCHEN-HALL-DOOR ,KITCHEN-WINDOW ,LAMP ,LAWN ,LINDER-BACK-DOOR
    ,LINDER-BATH-DOOR ,LINDER-CAR ,LINDER-DOOR ,LINDER-ROOM-STUFF ,LINDER-SHOES ,LINDER-WINDOW ,LINENS
    ,LIQUOR-CABINET ,LIVING-DINING-DOOR ,LOUNGE ,MASTER-BATH-COUNTER ,MASTER-BEDROOM-DRESSER
    ,MEDICAL-REPORT ,MEDIUM-INTEGER ,MIDNIGHT ,MIRROR ,MIXER ,MONEY ,MONICA-BACK-DOOR
    ,MONICA-BATH-DOOR ,MONICA-CAR ,MONICA-DOOR ,MONICA-SHOES ,MONICA-TABLE ,MONICA-TABLE-STUFF ,MOVIE-POSTERS
    ,MUDDY-SHOES ,NEWSPAPERS ,OFFICE-BACK-DOOR ,OFFICE-BUTTON ,OFFICE-DESK
    ,OFFICE-DESK-STUFF ,OFFICE-DOOR ,OFFICE-PICTURE ,OFFICE-WINDOW ,OTHER-SHOES ,OUTSIDE-GUN ,PAPERS
    ,PHONG-KEYS ,PHONG-SHOES ,PIECE-OF-PUTTY ,PIECE-OF-WIRE ,POTTED-PLANTS ,POWDER
    ,RADIO ,RAKE ,RANDOM-MEAL ,RANGE ,RECORDS ,RECURSIVE-BOOK ,REFRIGERATOR ,ROCKS ,ROPE ,SAW ,SCOTCH
    ,SCROLL ,SHOE-PLATFORM ,SHOWER ,SIDE-FOOTPRINTS ,SIDE-FOOTPRINTS-CAST ,SILVERWARE ,SINK ,SOFA
    ,SPADE ,SPOOL-OF-WIRE ,STILES-SHOES ,STORAGE-DOOR ,STUB ,TELEPHONE ,THREAT-NOTE ,TOASTER
    ,TOILET ,TOILET-DOOR ,TOWELS ,TUB-DOOR ,WHITE-WIRE ,WILL ,WINDOW ,WOOD-PILE ,WOODEN-CHAIR ,WORK-SHELVES
    ,WORKSHOP-DOOR ,WORKSHOP-WIRE>>


<ROUTINE IS-FRAGILE? (OBJ)
    <EQUAL? .OBJ ,BRASS-LANTERN ,FOODS ,GLASSES ,LAMP ,MIRROR ,SCOTCH ,BOURBON ,TOASTER>>


<ROUTINE IS-PERSON? ()
    <EQUAL? ,PRSO ,GLOBAL-DUFFY ,GLOBAL-LINDER ,GLOBAL-MONICA ,GLOBAL-MRS-LINDER ,GLOBAL-PHONG ,GLOBAL-STILES ,GLOBAL-TERRY
    ,HIM-HER ,LINDER ,MONICA ,PHONG ,STILES>>

<ROUTINE IS-ANIMAL? ()
    <EQUAL? ,PRSO ,GLOBAL-CAT ,CAT>>

<ROUTINE IS-SELF? ()
    <EQUAL? ,PRSO ,PLAYER>>

<ROUTINE IS-YOUR-PROPERTY? ()
    <EQUAL? ,PRSO ,TELEGRAM ,MATCHBOOK ,PISTOL ,HANDCUFFS>>


; "============ THESE DON'T NEED FILLING OUT, BUT CAN BE CHANGED ============"
<ROUTINE DANGEROUS-FOOD? ()
    <AND <OR <IS-OBJECT-OR-PROPERTY?> <EQUAL? ,PRSO ,BROKEN-GLASS ,FIRE>> <NOT <FSET? ,PRSO ,FOODBIT>>>>

<ROUTINE IS-OBJ-PROP-ANIMAL? ()
    <OR <IS-OBJECT-OR-PROPERTY?>
        <IS-ANIMAL?>>>



