<ROUTINE PRINT-DESC1 (OBJ)
    <COND (.OBJ
        <TELL D .OBJ>)>>

<ROUTINE PRINT-ID (ID "OPT" (CONDITION T))
    <COND (.CONDITION
        <TELL "[ID: " .ID ", PRSO: ">  <TELL ", PRSI: ">  <TELL "]">
        )>>

<ROUTINE PRINT-DEBUG (TEXT "OPT" (CONDITION T))
    <COND (.CONDITION
        <TELL "DEBUG FLAG: " .TEXT>
        )>>

; "============ THESE ARE USEFUL IN ALMOST EVERY GAME ============"
<ROUTINE IS-THEFT? ()
    <AND <MC-VERB? TAKE>
    <MC-PRSO? ,LG-BOATS ,LG-PLAQUES ,TH-BED ,TH-BEDSIDE-TABLE ,TH-BLIGH-BOAT ,TH-BLUE-PAPER ,TH-BOAT
    ,TH-BOX-KEY ,TH-BROWN-PAPER ,TH-BUNG ,TH-BUTT-OF-MALMSEY ,TH-CARNATION ,TH-CHARLES-STATUE ,TH-CHAUCER-TOMB
    ,TH-CIGARETTE ,TH-CLAPPER ,TH-CLUE-BOOK ,TH-CRAYON ,TH-CROWN-JEWELS ,TH-DRAKE-STATUE ,TH-ELIZAS-FLOWERS
    ,TH-EMERALD ,TH-GARNET ,TH-GREEN-PAPER ,TH-GROWLER-CAB ,TH-GUARDS-KEYS ,TH-HANSOM-CAB ,TH-JEWEL-CASE
    ,TH-JOHN-STATUE ,TH-LAIR-KEY ,TH-LIBRARY-TABLE ,TH-MACE ,TH-MALMSEY ,TH-MORIARTY-DESK ,TH-NELSON-EYE
    ,TH-OAR-1 ,TH-OAR-2 ,TH-OAR-LOCK ,TH-OPAL ,TH-ORANGE-PAPER ,TH-PACKET-OF-PAPER ,TH-PADDLE ,TH-PARK-FLOWERS
    ,TH-PRAMS ,TH-RED-GLASS ,TH-ROPE ,TH-RUBBINGS ,TH-RUBY ,TH-SAFETY-DEPOSIT-BOX ,TH-SAPPHIRE ,TH-SUIT-OF-ARMOUR
    ,TH-TOPAZ ,TH-TORCH ,TH-TRINKETS ,TH-TURBAN ,TH-VIOLIN ,TH-WAX-AX ,TH-WAX-HEAD ,TH-WHITE-PAPER ,TH-YELLOW-PAPER>>>

<ROUTINE IS-OBJECT-OR-PROPERTY? ()
    <MC-PRSO? ,LG-BAKER-ST-DOOR ,LG-BANK-VAULT-DOOR ,LG-BAR-OF-GOLD-DOOR ,LG-BOATS
    ,LG-BRITISH-MUSEUM-DOOR ,LG-COLUMNS ,LG-HOLMES-BEDROOM-DOOR ,LG-HOLMES-STUDY-DOOR
    ,LG-JERICHO-PARLOUR-DOOR ,LG-LAIR-DOOR ,LG-MARBLE ,LG-PARLOUR-DOOR ,LG-PLAQUES ,LG-PORTCULLIS-DOOR
    ,LG-SHOPS ,LG-STAIRWAY ,LG-STREETLIGHT ,LG-TOMBS-ABBEY ,LG-TOWER
    ,LG-WESTMINSTER-DOOR ,LG-WINDOW ,TH-ANCHOR
    ,TH-ANCHOR-CHAIN ,TH-ANNE-OF-CLEVES-TOMB ,TH-ASH ,TH-BANK-OF-CANDLES ,TH-BED ,TH-BEDSIDE-TABLE ,TH-BELL
    ,TH-BLIGH-BOAT ,TH-BLUE-PAPER ,TH-BOAT ,TH-BOOK-PAGE ,TH-BOX-KEY
    ,TH-BOX-LOCK ,TH-BOXES ,TH-BROWN-PAPER ,TH-BUNG
    ,TH-BUTT-OF-MALMSEY ,TH-CARNATION ,TH-CHARLES-STATUE ,TH-CHAUCER-TOMB ,TH-CIGARETTE
    ,TH-CLAPPER ,TH-CLUE-BOOK ,TH-CLUMP-OF-MOSS ,TH-CRAYON
    ,TH-CROWN-JEWELS ,TH-DEAD-PIGEON ,TH-DIAL ,TH-DICKENS-TOMB ,TH-DRAKE-STATUE ,TH-EDWARD-TOMB
    ,TH-ELIZABETH-STATUE ,TH-ELIZABETH-TOMB ,TH-ELIZAS-FLOWERS ,TH-EMERALD
    ,TH-ETHERIUM-AMPOULE ,TH-ETHERIUM-GAS ,TH-FAWKES-STATUE
    ,TH-GARNET ,TH-GREEN-PAPER ,TH-GROWLER-CAB ,TH-GUARDS-KEYS ,TH-GUARDS-POCKET ,TH-GUN
    ,TH-HANSOM-CAB ,TH-HENRY-V-TOMB ,TH-HENRY-VII-TOMB
    ,TH-JEWEL-CASE ,TH-JOHN-STATUE ,TH-KNIFE ,TH-LAB-EQUIPMENT ,TH-LAIR-KEY ,TH-LAMP
    ,TH-LIBRARY-TABLE ,TH-LIQUID ,TH-LITTLE-PRINCES-TOMB ,TH-MACE ,TH-MAGNIFYING-GLASS ,TH-MAIL ,TH-MALMSEY
    ,TH-MALMSEY-POOL ,TH-MANTELPIECE ,TH-MARY-QUEEN-OF-SCOTS-TOMB ,TH-MATCH ,TH-MATCHBOOK ,TH-MORIARTY-DESK
    ,TH-MOROCCO-CASE ,TH-NELSON-COLUMN ,TH-NELSON-EYE ,TH-NELSON-STATUE ,TH-NEWSPAPER ,TH-NEWTON-TOMB
    ,TH-OAR-1 ,TH-OAR-2 ,TH-OAR-LOCK ,TH-OPAL ,TH-OPIUM-GAS ,TH-ORANGE-PAPER
    ,TH-PACKET-OF-PAPER ,TH-PADDLE ,TH-PARK-FLOWERS ,TH-PERSIAN-SLIPPER ,TH-PHIAL ,TH-PIPE
    ,TH-PITT-TOMB ,TH-POPE-TOMB ,TH-PORTCULLIS-CHAIN ,TH-PRAMS
    ,TH-RAILING ,TH-RED-GLASS ,TH-RING ,TH-ROOM ,TH-ROPE ,TH-RUBBINGS ,TH-RUBY ,TH-SAFETY-DEPOSIT-BOX
    ,TH-SAPPHIRE ,TH-SHAFT ,TH-SHILLING ,TH-SIXPENCE ,TH-SOFA ,TH-SUIT-OF-ARMOUR
    ,TH-SYRINGE ,TH-TELESCOPE ,TH-THOMAS-STATUE ,TH-TOBACCO ,TH-TOPAZ ,TH-TORCH ,TH-TRINKETS ,TH-TURBAN
    ,TH-VERE-TOMB ,TH-VIOLIN ,TH-WALL ,TH-WALTER-STATUE ,TH-WATERMARK
    ,TH-WAX-AX ,TH-WAX-HEAD ,TH-WESTMINSTER-CLUE ,TH-WHITE-PAPER ,TH-WILLIAM-STATUE
    ,TH-WORKBENCH ,TH-YELLOW-PAPER>>

<ROUTINE IS-PERSON? ()
    <MC-PRSO? ,CH-AKBAR ,CH-BANK-GUARD ,CH-BUTLER ,CH-DENKEEPER ,CH-ELIZA-DOOLITTLE ,CH-GROWLER-CABBIE
    ,CH-HANSOM-CABBIE ,CH-HER ,CH-HIM ,CH-HOLMES ,CH-HOUSEWIVES ,CH-HUDSON ,CH-LIBRARIAN ,CH-MATCH-SNIFFING-DOG
    ,CH-ME ,CH-MEMBERS ,CH-MORIARTY ,CH-NANNIES ,CH-PALACE-GUARD ,CH-PRIME-MINISTER ,CH-QUEEN ,CH-SHERMAN
    ,CH-THEM ,CH-TOWER-GUARD ,CH-TRAINED-PIGEON ,CH-TUSSAUDS-GUARD ,CH-URCHINS ,CH-VENDOR ,CH-WIGGINS ,TH-CROWDS ,TH-ELIZAS-MOUTH ,TH-GENERIC-BODY>>

<ROUTINE IS-ANIMAL? ()
    <MC-PRSO? ,LG-RAVENS ,TH-PIGEONS>>

<ROUTINE IS-SELF? ()
    <MC-PRSO? ,CH-PLAYER ,CH-YOU ,TH-HEAD ,TH-WATSONS-HEART>>

<ROUTINE IS-PART-OF-SELF? ()
    <MC-PRSO? ,TH-EARS ,TH-FEET ,TH-HANDS ,TH-PLAYER-BODY>>

<ROUTINE IS-SELF-OR-PART-OF-SELF? ()
    <OR <IS-SELF?> <IS-PART-OF-SELF?>>>

<ROUTINE IS-YOUR-PROPERTY? ()
    <MC-PRSO? ,TH-BLACK-BAG ,TH-BLUE-PILL-BOTTLE ,TH-BROWN-PILL-BOTTLE ,TH-CAB-WHISTLE ,TH-CLOTHES ,TH-ORANGE-PILL
    ,TH-LAPEL ,TH-POCKET ,TH-POUND-NOTE ,TH-WATSONS-COAT ,TH-WATSONS-HAT ,TH-YELLOW-PILL ,TH-COTTON-BALLS ,TH-STETHOSCOPE>>

<ROUTINE DANGEROUS-DRINK? ()
    <MC-PRSO? ,LG-WATER>>


; "============ THESE DON'T NEED FILLING OUT, BUT CAN BE CHANGED ============"
<ROUTINE DANGEROUS-FOOD? ()
    <AND <OR <IS-PART-OF-SELF?> <IS-OBJECT-OR-PROPERTY?>> <NOT <MC-PRSO? ,TH-MALMSEY>>>>

<ROUTINE IS-OBJ-PROP-ANIMAL? ()
    <OR <IS-OBJECT-OR-PROPERTY?>
        <IS-ANIMAL?>>>

<ROUTINE IS-OBJ-PROP-ANIMAL-PRSI? ()
    <MC-PRSI? ,LG-BAKER-ST-DOOR ,LG-BANK-VAULT-DOOR ,LG-BAR-OF-GOLD-DOOR ,LG-BOATS
    ,LG-BRITISH-MUSEUM-DOOR ,LG-COLUMNS ,LG-HOLMES-BEDROOM-DOOR ,LG-HOLMES-STUDY-DOOR
    ,LG-JERICHO-PARLOUR-DOOR ,LG-LAIR-DOOR ,LG-MARBLE ,LG-PARLOUR-DOOR ,LG-PLAQUES ,LG-PORTCULLIS-DOOR
    ,LG-SHOPS ,LG-STAIRWAY ,LG-STREETLIGHT ,LG-TOMBS-ABBEY ,LG-TOWER
    ,LG-WESTMINSTER-DOOR ,LG-WINDOW ,TH-ANCHOR
    ,TH-ANCHOR-CHAIN ,TH-ANNE-OF-CLEVES-TOMB ,TH-ASH ,TH-BANK-OF-CANDLES ,TH-BED ,TH-BEDSIDE-TABLE ,TH-BELL
    ,TH-BLIGH-BOAT ,TH-BLUE-PAPER ,TH-BOAT ,TH-BOOK-PAGE ,TH-BOX-KEY
    ,TH-BOX-LOCK ,TH-BOXES ,TH-BROWN-PAPER ,TH-BUNG
    ,TH-BUTT-OF-MALMSEY ,TH-CARNATION ,TH-CHARLES-STATUE ,TH-CHAUCER-TOMB ,TH-CIGARETTE
    ,TH-CLAPPER ,TH-CLUE-BOOK ,TH-CLUMP-OF-MOSS ,TH-CRAYON
    ,TH-CROWN-JEWELS ,TH-DEAD-PIGEON ,TH-DIAL ,TH-DICKENS-TOMB ,TH-DRAKE-STATUE ,TH-EDWARD-TOMB
    ,TH-ELIZABETH-STATUE ,TH-ELIZABETH-TOMB ,TH-ELIZAS-FLOWERS ,TH-EMERALD
    ,TH-ETHERIUM-AMPOULE ,TH-ETHERIUM-GAS ,TH-FAWKES-STATUE
    ,TH-GARNET ,TH-GREEN-PAPER ,TH-GROWLER-CAB ,TH-GUARDS-KEYS ,TH-GUARDS-POCKET ,TH-GUN
    ,TH-HANSOM-CAB ,TH-HENRY-V-TOMB ,TH-HENRY-VII-TOMB
    ,TH-JEWEL-CASE ,TH-JOHN-STATUE ,TH-KNIFE ,TH-LAB-EQUIPMENT ,TH-LAIR-KEY ,TH-LAMP
    ,TH-LIBRARY-TABLE ,TH-LIQUID ,TH-LITTLE-PRINCES-TOMB ,TH-MACE ,TH-MAGNIFYING-GLASS ,TH-MAIL ,TH-MALMSEY
    ,TH-MALMSEY-POOL ,TH-MANTELPIECE ,TH-MARY-QUEEN-OF-SCOTS-TOMB ,TH-MATCH ,TH-MATCHBOOK ,TH-MORIARTY-DESK
    ,TH-MOROCCO-CASE ,TH-NELSON-COLUMN ,TH-NELSON-EYE ,TH-NELSON-STATUE ,TH-NEWSPAPER ,TH-NEWTON-TOMB
    ,TH-OAR-1 ,TH-OAR-2 ,TH-OAR-LOCK ,TH-OPAL ,TH-OPIUM-GAS ,TH-ORANGE-PAPER
    ,TH-PACKET-OF-PAPER ,TH-PADDLE ,TH-PARK-FLOWERS ,TH-PERSIAN-SLIPPER ,TH-PHIAL ,TH-PIPE
    ,TH-PITT-TOMB ,TH-POPE-TOMB ,TH-PORTCULLIS-CHAIN ,TH-PRAMS
    ,TH-RAILING ,TH-RED-GLASS ,TH-RING ,TH-ROOM ,TH-ROPE ,TH-RUBBINGS ,TH-RUBY ,TH-SAFETY-DEPOSIT-BOX
    ,TH-SAPPHIRE ,TH-SHAFT ,TH-SHILLING ,TH-SIXPENCE ,TH-SOFA ,TH-SUIT-OF-ARMOUR
    ,TH-SYRINGE ,TH-TELESCOPE ,TH-THOMAS-STATUE ,TH-TOBACCO ,TH-TOPAZ ,TH-TORCH ,TH-TRINKETS ,TH-TURBAN
    ,TH-VERE-TOMB ,TH-VIOLIN ,TH-WALL ,TH-WALTER-STATUE ,TH-WATERMARK
    ,TH-WAX-AX ,TH-WAX-HEAD ,TH-WESTMINSTER-CLUE ,TH-WHITE-PAPER ,TH-WILLIAM-STATUE
    ,TH-WORKBENCH ,TH-YELLOW-PAPER ,LG-RAVENS ,TH-PIGEONS>>

<ROUTINE IS-PERSON-ANIMAL-PRSI? ()
    <MC-PRSI? ,CH-AKBAR ,CH-BANK-GUARD ,CH-BUTLER ,CH-DENKEEPER ,CH-ELIZA-DOOLITTLE ,CH-GROWLER-CABBIE
    ,CH-HANSOM-CABBIE ,CH-HER ,CH-HIM ,CH-HOLMES ,CH-HOUSEWIVES ,CH-HUDSON ,CH-LIBRARIAN ,CH-MATCH-SNIFFING-DOG
    ,CH-ME ,CH-MEMBERS ,CH-MORIARTY ,CH-NANNIES ,CH-PALACE-GUARD ,CH-PRIME-MINISTER ,CH-QUEEN ,CH-SHERMAN
    ,CH-THEM ,CH-TOWER-GUARD ,CH-TRAINED-PIGEON ,CH-TUSSAUDS-GUARD ,CH-URCHINS ,CH-VENDOR ,CH-WIGGINS ,TH-CROWDS ,TH-ELIZAS-MOUTH
    ,TH-GENERIC-BODY ,LG-RAVENS ,TH-PIGEONS>>
