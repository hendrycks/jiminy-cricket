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
    <EQUAL? ,PRSO ,GLOBAL-SAFE ,NEW-WILL ,PAINTINGS ,PORTRAITS ,SAFE ,SILVERWARE>>>

<ROUTINE IS-OBJECT-OR-PROPERTY? ()
    <EQUAL? ,PRSO ,ALLERGONE ,ALLERGONE-BOTTLE ,APPLIANCE-1 ,APPLIANCE-2 ,ASPIRIN ,ASPIRIN-BOTTLE ,B-BALCONY ,B-RAILING
    ,BALCONY ,BATHROOM-MIRROR ,BATHTUB ,BAXTER-PAPERS ,BAY-WINDOW ,BED ,BEDROOM-BALCONY-DOOR ,BEDROOM-MIRROR
    ,BERRY-BUSH ,BLUE-BUTTON ,BOOKSHELVES ,BOURBON ,C11-LINENS ,C11-SHELVES ,CHAIR ,CHINA ,CIRCULAR ,CLOSET
    ,CORNERSTONE ,CORRIDOR-WINDOW ,CRYSTAL-LAMP ,CUP ,CUPS ,DESK-CALENDAR ,DINING-ROOM-TABLE
    ,DINING-ROOM-WINDOW ,DUM-KOF ,DUM-KOF-BOTTLE ,DUNBAR-BATH-DOOR ,DUNBAR-CABINET ,DUNBAR-DOOR
    ,EBULLION ,EBULLION-BOTTLE ,END-TABLE ,ENVELOPE ,FIREPLACE ,FOODS ,FOUR-POSTER ,FOYER-TABLE ,FRAGMENT ,FRONT-DOOR
    ,FRUIT-TREES ,GEORGE-BATH-DOOR ,GEORGE-DOOR ,GLASSES ,GLOBAL-ALLERGONE
    ,GLOBAL-CALL ,GLOBAL-CONCERT ,GLOBAL-EBULLION ,CORPSE
    ,GLOBAL-FINGERPRINTS ,GLOBAL-HIDDEN-CLOSET
    ,GLOBAL-HOUSE ,GLOBAL-LADDER ,GLOBAL-LIGHT ,GLOBAL-LOBLO
    ,GLOBAL-NEW-WILL ,GLOBAL-OLD-WILL
    ,GLOBAL-OMNIDYNE ,GLOBAL-PEN ,GLOBAL-ROSES ,GLOBAL-SAFE
    ,GLOBAL-SNEEZO ,GLOBAL-WARRANT ,GRAPE-ARBOR
    ,GUEST-WINDOW ,HANGING-PLANTS ,HIDDEN-DOOR-B ,HIDDEN-DOOR-L ,HOUSE ,K-CABINETS
    ,KITCHEN-WINDOW ,L-BALCONY ,L-RAILING ,LAB-REPORT ,LADDER ,LETTER ,LGTABLE ,LIBRARY-BALCONY-DOOR
    ,LIBRARY-BUTTON ,LIBRARY-CARPET ,LIBRARY-DESK ,LIBRARY-DOOR ,LIQUOR-CABINET ,LIVING-ROOM-TABLE ,LOBLO
    ,LOBLO-BOTTLE ,LOUNGE ,LR-CABINETS ,MASTER-BATH-COUNTER ,MASTER-BEDROOM-DOOR
    ,MASTER-BEDROOM-DRESSER ,MUD-SPOT ,NEW-WILL ,NEWSPAPER ,NOTE-PAPER ,P-SHELVES
    ,PAINTINGS ,PEN ,PENCIL ,PISTOL ,PLATES ,PORTRAITS ,RANDOM-MEAL ,RECORDS
    ,RECURSIVE-BOOK ,RED-BUTTON ,ROSE ,ROURKE-BATH-DOOR ,ROURKE-DOOR ,ROURKE-SHELVES ,S-SHELVES ,SAFE
    ,SAUCER ,SAUCERS ,SCOTCH ,SECOND-SECTION ,SEURAT ,SHAVING-GEAR ,SHED ,SHED-WINDOW ,SHELF-UNIT ,SHOWER ,SILVERWARE
    ,SINK ,SNEEZO ,SNEEZO-BOTTLE ,SOFA ,SOGGY-WILL ,SOUTH-CLOSET-DOOR ,STEREO ,STUB ,SUGAR-BOWL ,SUICIDE-NOTE ,TAPES
    ,TELEPHONE ,TODAY ,TOILET ,TOOLS-1 ,TOOLS-2 ,TRASH ,TRASH-BASKET ,TRAY ,TREE-TOPS ,TRESTLE-TABLE ,UC-LINENS
    ,UC-SHELVES ,UC-TOWELS ,WINDOW ,WOOD-PILE>>


<ROUTINE IS-PERSON? ()
    <EQUAL? ,PRSO ,BAXTER ,COATES ,DUNBAR ,GARDENER ,GEORGE ,GLOBAL-BAXTER ,GLOBAL-COATES ,GLOBAL-DUFFY ,GLOBAL-DUNBAR
    ,GLOBAL-GARDENER ,GLOBAL-GEORGE ,GLOBAL-MR-ROBNER ,GLOBAL-MRS-ROBNER ,GLOBAL-ROURKE ,GLOBAL-STEVEN ,HIM-HER
    ,MRS-ROBNER ,ROURKE>>

<ROUTINE IS-SELF? ()
    <EQUAL? ,PRSO ,PLAYER>>

; "============ THESE DON'T NEED FILLING OUT, BUT CAN BE CHANGED ============"
<ROUTINE DANGEROUS-FOOD? ()
    <AND <IS-OBJECT-OR-PROPERTY?> <NOT <EQUAL? ,PRSO ,FOODS ,RANDOM-MEAL>>>>

<ROUTINE IS-OBJ-PROP-ANIMAL? ()
    <IS-OBJECT-OR-PROPERTY?>>


