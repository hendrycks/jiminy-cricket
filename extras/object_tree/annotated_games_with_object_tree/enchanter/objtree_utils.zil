<ROUTINE PRINT-OBJTREE-NODE (OBJ)
    <COND (<LOC .OBJ> <TELL <GETP <LOC .OBJ> ,P?OBJIDX> " / ">)
          (T <TELL "-1 / ">)>
    <COND (<FSET? .OBJ ,CONTBIT> <TELL "0 ">)>
    <COND (<FSET? .OBJ ,INVISIBLE> <TELL "1 ">)>
    <COND (<FSET? .OBJ ,LIGHTBIT> <TELL "2 ">)>
    <COND (<FSET? .OBJ ,LOCKEDBIT> <TELL "3 ">)>
    <COND (<FSET? .OBJ ,NDESCBIT> <TELL "4 ">)>
    <COND (<FSET? .OBJ ,ONBIT> <TELL "5 ">)>
    <COND (<FSET? .OBJ ,OPENBIT> <TELL "6 ">)>
    <COND (<FSET? .OBJ ,RMUNGBIT> <TELL "7 ">)>
    <COND (<FSET? .OBJ ,TAKEBIT> <TELL "8 ">)>
    <COND (<FSET? .OBJ ,TOUCHBIT> <TELL "9 ">)>
    <COND (<FSET? .OBJ ,TRANSBIT> <TELL "10 ">)>
    <COND (<FSET? .OBJ ,VEHBIT> <TELL "11 ">)>
    <COND (<FSET? .OBJ ,VILLAIN> <TELL "12 ">)>
    <TELL CR>
>

<ROUTINE PRINT-OBJTREE0 ()
    <TELL CR "<start-otr>" CR>
    <PRINT-OBJTREE-NODE ,IRON-GATE>
    <PRINT-OBJTREE-NODE ,IRON-GATE-CHAINS>
    <PRINT-OBJTREE-NODE ,ARCH>
    <PRINT-OBJTREE-NODE ,BED>
    <PRINT-OBJTREE-NODE ,BEDPOST>
    <PRINT-OBJTREE-NODE ,COMPARTMENT>
    <PRINT-OBJTREE-NODE ,BEDPOST-BUTTON>
    <PRINT-OBJTREE-NODE ,NORTH-CELL-DOOR>
    <PRINT-OBJTREE-NODE ,STONE-WALL>
    <PRINT-OBJTREE-NODE ,NORTH-BLOCK>
    <PRINT-OBJTREE-NODE ,SILVER-SPOON>
    <PRINT-OBJTREE-NODE ,RUSTY-GATE>
    <PRINT-OBJTREE-NODE ,BANQUET-ILLUSION>
    <PRINT-OBJTREE-NODE ,BTABLES>
    <PRINT-OBJTREE-NODE ,BENCHES>
    <PRINT-OBJTREE-NODE ,IMPLEMENTS>
    <PRINT-OBJTREE-NODE ,FOOD>
    <PRINT-OBJTREE-NODE ,CANDLES>
    <PRINT-OBJTREE-NODE ,GANG-OF-FOUR>
    <PRINT-OBJTREE-NODE ,LITTER>
    <PRINT-OBJTREE-NODE ,RAT-NEST>
    <PRINT-OBJTREE-NODE ,OVEN>
    <PRINT-OBJTREE-NODE ,HEAP>
    <PRINT-OBJTREE-NODE ,SKELETON>
    <PRINT-OBJTREE-NODE ,VOICES>
    <PRINT-OBJTREE-NODE ,RAT-TRACKS>
    <PRINT-OBJTREE-NODE ,RAT-HOLE>
    <PRINT-OBJTREE-NODE ,NORTH-GATE-OBJ>
    <PRINT-OBJTREE-NODE ,FROG>
    <PRINT-OBJTREE-NODE ,LILY-PAD>
    <PRINT-OBJTREE-NODE ,JEWEL-CHESTS>
    <PRINT-OBJTREE-NODE ,EGG>
    <PRINT-OBJTREE-NODE ,EGG-KNOB-1>
    <PRINT-OBJTREE-NODE ,EGG-KNOB-2>
    <PRINT-OBJTREE-NODE ,EGG-KNOB-3>
    <PRINT-OBJTREE-NODE ,EGG-KNOB-4>
    <PRINT-OBJTREE-NODE ,EGG-KNOB-5>
    <PRINT-OBJTREE-NODE ,SCRAMBLED-EGG>
    <PRINT-OBJTREE-NODE ,DAMAGED-SCROLL>
    <PRINT-OBJTREE-NODE ,PORTRAITS>
    <PRINT-OBJTREE-NODE ,FLATHEAD-PORTRAIT>
    <PRINT-OBJTREE-NODE ,FROBOZZ-PORTRAIT>
    <PRINT-OBJTREE-NODE ,LIGHTED-PORTRAIT>
    <PRINT-OBJTREE-NODE ,PORTRAIT-NICHE>
    <PRINT-OBJTREE-NODE ,ETERNAL-FLAME>
    <PRINT-OBJTREE-NODE ,MACHINERY>
    <PRINT-OBJTREE-NODE ,LIGHTS>
    <PRINT-OBJTREE-NODE ,SWITCHES>
    <PRINT-OBJTREE-NODE ,HEATHER>
    <PRINT-OBJTREE-NODE ,SEA-STUFF>
    <PRINT-OBJTREE-NODE ,TURTLE>
    <PRINT-OBJTREE-NODE ,GLOBAL-TURTLE>
    <PRINT-OBJTREE-NODE ,GLOBAL-OBJECTS>
    <PRINT-OBJTREE-NODE ,LOCAL-GLOBALS>
    <PRINT-OBJTREE-NODE ,ROOMS>
    <PRINT-OBJTREE-NODE ,INTNUM>
    <PRINT-OBJTREE-NODE ,PSEUDO-OBJECT>
    <PRINT-OBJTREE-NODE ,IT>
    <PRINT-OBJTREE-NODE ,GROUND>
    <PRINT-OBJTREE-NODE ,CORRIDOR>
    <PRINT-OBJTREE-NODE ,WALLS>
    <PRINT-OBJTREE-NODE ,CEILING>
    <PRINT-OBJTREE-NODE ,HANDS>
    <PRINT-OBJTREE-NODE ,PLAYER>
    <PRINT-OBJTREE-NODE ,ME>
    <PRINT-OBJTREE-NODE ,WINDOW>
    <PRINT-OBJTREE-NODE ,SEA>
    <PRINT-OBJTREE-NODE ,FOREST>
    <PRINT-OBJTREE-NODE ,TEMPLE-OBJ>
    <PRINT-OBJTREE-NODE ,COURTYARD>
    <PRINT-OBJTREE-NODE ,TOWER>
    <PRINT-OBJTREE-NODE ,TURRET>
    <PRINT-OBJTREE-NODE ,LAWN>
    <PRINT-OBJTREE-NODE ,MEADOW-OBJ>
    <PRINT-OBJTREE-NODE ,BEACH-OBJ>
    <PRINT-OBJTREE-NODE ,GLOBAL-WATER>
    <PRINT-OBJTREE-NODE ,WATER>
    <PRINT-OBJTREE-NODE ,JUG>
    <PRINT-OBJTREE-NODE ,SKY>
    <PRINT-OBJTREE-NODE ,NOT-HERE-OBJECT>
    <PRINT-OBJTREE-NODE ,BELBOZ>
    <PRINT-OBJTREE-NODE ,GLOBAL-ROOM>
    <PRINT-OBJTREE-NODE ,BRAMBLES>
    <PRINT-OBJTREE-NODE ,GLOBAL-HOLE>
    <PRINT-OBJTREE-NODE ,JEWELLED-BOX>
    <PRINT-OBJTREE-NODE ,MAGIC-ROPE>
    <PRINT-OBJTREE-NODE ,MAGIC-KNIFE>
    <PRINT-OBJTREE-NODE ,SPELL-BOOK>
    <PRINT-OBJTREE-NODE ,WRITE-MAGIC-SPELL>
    <PRINT-OBJTREE-NODE ,LIGHT-SPELL>
    <PRINT-OBJTREE-NODE ,CHEAT-DEATH-SCROLL>
    <PRINT-OBJTREE-NODE ,CHEAT-DEATH-SPELL>
    <PRINT-OBJTREE-NODE ,SUMMON-SCROLL>
    <PRINT-OBJTREE-NODE ,SUMMON-SPELL>
    <PRINT-OBJTREE-NODE ,CHARM-SCROLL>
    <PRINT-OBJTREE-NODE ,CHARM-SPELL>
    <PRINT-OBJTREE-NODE ,OPEN-SCROLL>
    <PRINT-OBJTREE-NODE ,OPEN-SPELL>
    <PRINT-OBJTREE-NODE ,QUENCH-SCROLL>
    <PRINT-OBJTREE-NODE ,QUENCH-SPELL>
    <PRINT-OBJTREE-NODE ,TALK-TO-ANIMALS-SPELL>
    <PRINT-OBJTREE-NODE ,HASTE-SCROLL>
    <PRINT-OBJTREE-NODE ,HASTE-SPELL>
    <PRINT-OBJTREE-NODE ,DISPEL-SCROLL>
    <PRINT-OBJTREE-NODE ,DISPEL-SPELL>
    <PRINT-OBJTREE-NODE ,PROTECTION-SCROLL>
    <PRINT-OBJTREE-NODE ,PROTECTION-SPELL>
    <PRINT-OBJTREE-NODE ,STRONG-BOX-SPELL>
    <PRINT-OBJTREE-NODE ,BANISH-SCROLL>
    <PRINT-OBJTREE-NODE ,BANISH-SPELL>
    <PRINT-OBJTREE-NODE ,REPAIR-SCROLL>
    <PRINT-OBJTREE-NODE ,REPAIR-SPELL>
    <PRINT-OBJTREE-NODE ,NEWT-SCROLL>
    <PRINT-OBJTREE-NODE ,NEWT-SPELL>
    <PRINT-OBJTREE-NODE ,FLY-SCROLL>
    <PRINT-OBJTREE-NODE ,FLY-SPELL>
    <PRINT-OBJTREE-NODE ,CREDITS-SCROLL>
    <PRINT-OBJTREE-NODE ,CREDITS-SPELL>
    <PRINT-OBJTREE-NODE ,STRONG-BOX>
    <PRINT-OBJTREE-NODE ,UNDERGROWTH>
    <PRINT-OBJTREE-NODE ,PATH-SIGN>
    <PRINT-OBJTREE-NODE ,FOUNDATION>
    <PRINT-OBJTREE-NODE ,DISTANT-CASTLE>
    <PRINT-OBJTREE-NODE ,SHACK-OBJ>
    <PRINT-OBJTREE-NODE ,BATTERED-LANTERN>
    <PRINT-OBJTREE-NODE ,SHACK-OVEN>
    <PRINT-OBJTREE-NODE ,BREAD>
    <PRINT-OBJTREE-NODE ,TREES>
    <PRINT-OBJTREE-NODE ,HOVEL>
    <PRINT-OBJTREE-NODE ,GLOBAL-CRONE>
    <PRINT-OBJTREE-NODE ,LONG-ROAD-SIGN>
    <PRINT-OBJTREE-NODE ,ROAD>
    <PRINT-OBJTREE-NODE ,HILLS>
    <PRINT-OBJTREE-NODE ,MOUNTAIN>
    <PRINT-OBJTREE-NODE ,GLIMPSE-1>
    <PRINT-OBJTREE-NODE ,GLIMPSE-2>
    <PRINT-OBJTREE-NODE ,DOOR-REALITY>
    <PRINT-OBJTREE-NODE ,MAPS>
    <PRINT-OBJTREE-NODE ,ENTHARION>
    <PRINT-OBJTREE-NODE ,GLOBE>
    <PRINT-OBJTREE-NODE ,PEDESTAL>
    <PRINT-OBJTREE-NODE ,DOOR-ILLUSION>
    <PRINT-OBJTREE-NODE ,FLOATING-SIGN>
    <PRINT-OBJTREE-NODE ,MONSTERS-1>
    <PRINT-OBJTREE-NODE ,MONSTERS-2>
    <PRINT-OBJTREE-NODE ,MONSTERS-3>
    <PRINT-OBJTREE-NODE ,GLOBAL-ADVENTURER>
    <PRINT-OBJTREE-NODE ,MIRROR>
    <PRINT-OBJTREE-NODE ,SHARDS>
    <PRINT-OBJTREE-NODE ,MIRROR-STUFF>
    <PRINT-OBJTREE-NODE ,ADVENTURER-LG>
    <PRINT-OBJTREE-NODE ,ADVENTURER>
    <PRINT-OBJTREE-NODE ,LANTERN>
    <PRINT-OBJTREE-NODE ,SWORD>
    <PRINT-OBJTREE-NODE ,GLOBAL-SLEEP>
    <PRINT-OBJTREE-NODE ,STAIRS>
    <PRINT-OBJTREE-NODE ,KRILL>
    <PRINT-OBJTREE-NODE ,GLOBAL-KRILL>
    <PRINT-OBJTREE-NODE ,DRAGON>
    <PRINT-OBJTREE-NODE ,SHAPE>
    <PRINT-OBJTREE-NODE ,STATUE>
    <PRINT-OBJTREE-NODE ,GANG-OF-N>
    <PRINT-OBJTREE-NODE ,GUARDS>
    <PRINT-OBJTREE-NODE ,TOWER-N-DOOR>
    <PRINT-OBJTREE-NODE ,TOWER-S-DOOR>
    <PRINT-OBJTREE-NODE ,TERROR>
    <PRINT-OBJTREE-NODE ,TMAP>
    <PRINT-OBJTREE-NODE ,PENCIL>
    <PRINT-OBJTREE-NODE ,POINT-B>
    <PRINT-OBJTREE-NODE ,POINT-R>
    <PRINT-OBJTREE-NODE ,POINT-K>
    <PRINT-OBJTREE-NODE ,POINT-H>
    <PRINT-OBJTREE-NODE ,POINT-J>
    <PRINT-OBJTREE-NODE ,POINT-M>
    <PRINT-OBJTREE-NODE ,POINT-V>
    <PRINT-OBJTREE-NODE ,POINT-F>
    <PRINT-OBJTREE-NODE ,POINT-P>
    <PRINT-OBJTREE-NODE ,BLACK-PASSAGE>
    <PRINT-OBJTREE-NODE ,LEGEND-BOOK>
    <PRINT-OBJTREE-NODE ,LEGEND-ONE>
    <PRINT-OBJTREE-NODE ,LEGEND-TWO>
    <TELL "<gbl>" CR>
    <TELL N ,ADV-HASTE CR>
    <TELL N ,ADV-NEW-LOC CR>
    <TELL N ,ADV-OLD-LOC CR>
    <TELL N ,ADVENTURER-CHARMED CR>
    <TELL N ,ADVENTURER-LOC CR>
    <TELL N ,ADVENTURER-MOVE CR>
    <TELL N ,ADVENTURER-NOTES-DOOR CR>
    <TELL N ,ADVENTURER-SEEN CR>
    <TELL N ,ADVENTURER-STAY CR>
    <TELL N ,ADVENTURER-SUMMONED CR>
    <TELL N ,AGAIN-DIR CR>
    <TELL N ,ALWAYS-LIT CR>
    <TELL N ,ANYTHING-TAKEN CR>
    <TELL N ,AWAKE CR>
    <TELL N ,BEATEN-UP CR>
    <TELL N ,BED-WARNING CR>
    <TELL N ,BELBOZ-WARNING CR>
    <TELL N ,BOX-POINT CR>
    <TELL N ,CASTLE-ENTER CR>
    <TELL N ,CHARM-POINT CR>
    <TELL N ,CRASH? CR>
    <TELL N ,CRONE-MOVE CR>
    <TELL N ,DAGGER-SEEN CR>
    <TELL N ,DEATH-CHEATED CR>
    <TELL N ,DEATHS CR>
    <TELL N ,DESC-OBJECT CR>
    <TELL N ,DOOR-DREAM CR>
    <TELL N ,DOOR-DREAM-2 CR>
    <TELL N ,DOOR-ILLUSION-GONE CR>
    <TELL N ,DOOR-KULCAD CR>
    <TELL N ,DOOR-POINT CR>
    <TELL N ,DRINK-POINT CR>
    <TELL N ,DROPPED-SOME? CR>
    <TELL N ,EAT-POINT CR>
    <TELL N ,EGG-POINT CR>
    <TELL N ,ENTRY-POINT CR>
    <TELL N ,FALL-COUNT CR>
    <TELL N ,FAST? CR>
    <TELL N ,FLY-POINT CR>
    <TELL N ,FLYING? CR>
    <TELL N ,FUMBLE-NUMBER CR>
    <TELL N ,FUMBLE-PROB CR>
    <TELL N ,GALLERY-DREAM CR>
    <TELL N ,GALLERY-POINT CR>
    <TELL N ,GANG-FOLLOWS CR>
    <TELL N ,GUARDS-HEARD CR>
    <TELL N ,HAMMER-EXEX CR>
    <TELL N ,HASTED? CR>
    <TELL N ,HUNGER-COUNT CR>
    <TELL N ,IMP-SEEN CR>
    <TELL N ,KRILL-KILL CR>
    <TELL N ,LAST-PSEUDO-LOC CR>
    <TELL N ,LAST-SLEEP CR>
    <TELL N ,LETTER-OF-TRANSIT CR>
    <TELL N ,LIGHT-POINT CR>
    <TELL N ,LIT CR>
    <TELL N ,LOAD-ALLOWED CR>
    <TELL N ,LOCKED-IN-TOWER CR>
    <TELL N ,LOSSAGE CR>
    <TELL N ,MOVES CR>
    <TELL N ,NORTH-BLOCK-FLAG CR>
    <TELL N ,P-AADJ CR>
    <TELL N ,P-ACLAUSE CR>
    <TELL N ,P-ACT CR>
    <TELL N ,P-ADJ CR>
    <TELL N ,P-ADJN CR>
    <TELL N ,P-ADVERB CR>
    <TELL N ,P-ANAM CR>
    <TELL N ,P-AND CR>
    <TELL N ,P-CONT CR>
    <TELL N ,P-DIR CR>
    <TELL N ,P-END-ON-PREP CR>
    <TELL N ,P-GETFLAGS CR>
    <TELL N ,P-GWIMBIT CR>
    <TELL N ,P-IT-OBJECT CR>
    <TELL N ,P-LEN CR>
    <TELL N ,P-MERGE CR>
    <TELL N ,P-MERGED CR>
    <TELL N ,P-MOBY-FOUND CR>
    <TELL N ,P-NAM CR>
    <TELL N ,P-NCN CR>
    <TELL N ,P-NUMBER CR>
    <TELL N ,P-OFLAG CR>
    <TELL N ,P-ONEOBJ CR>
    <TELL N ,P-PRSI CR>
    <TELL N ,P-PRSO CR>
    <TELL N ,P-SLOCBITS CR>
    <TELL N ,P-SYNTAX CR>
    <TELL N ,P-TABLE CR>
    <TELL N ,P-WALK-DIR CR>
    <TELL N ,P-XADJ CR>
    <TELL N ,P-XADJN CR>
    <TELL N ,P-XNAM CR>
    <TELL N ,PORTRAIT-COMMENT CR>
    <TELL N ,PROBE CR>
    <TELL N ,PROTECTED-FROM-EVIL CR>
    <TELL N ,PRSA CR>
    <TELL N ,PRSI CR>
    <TELL N ,PRSO CR>
    <TELL N ,PSTART CR>
    <TELL N ,QUENCH-POINT CR>
    <TELL N ,QUOTE-FLAG CR>
    <TELL N ,REAL-SPELL-MAX CR>
    <TELL N ,REPAIR-POINT CR>
    <TELL N ,RESERVE-PTR CR>
    <TELL N ,ROAD-LOC CR>
    <TELL N ,ROPE-MAGIC? CR>
    <TELL N ,SACRIFICED? CR>
    <TELL N ,SAILOR? CR>
    <TELL N ,SCORE CR>
    <TELL N ,SCROLLS-TAKEN CR>
    <TELL N ,SPELL-MAX CR>
    <TELL N ,SPELL-ROOM CR>
    <TELL N ,STAIR-LOC CR>
    <TELL N ,STAIR-POINT CR>
    <TELL N ,STAIR-SOLVED? CR>
    <TELL N ,STRONG-BOX-FLAG CR>
    <TELL N ,SUMMON-POINT CR>
    <TELL N ,SUPER-BRIEF CR>
    <TELL N ,TALK-TO-ANIMAL? CR>
    <TELL N ,TEMPLE-POINT CR>
    <TELL N ,TERROR-MOVED CR>
    <TELL N ,TERROR-POINT CR>
    <TELL N ,TERROR-TRAPPED CR>
    <TELL N ,TF-COUNT CR>
    <TELL N ,THIRST-COUNT CR>
    <TELL N ,TTRIES CR>
    <TELL N ,TURTLE-FOLLOWS CR>
    <TELL N ,TURTLE-POINT CR>
    <TELL N ,TURTLE-REPORT? CR>
    <TELL N ,TURTLE-TIRED-TELL CR>
    <TELL N ,TURTLE-TIRED? CR>
    <TELL N ,TWAIT CR>
    <TELL N ,TWALK-LEVEL CR>
    <TELL N ,VERBOSE CR>
    <TELL N ,VISITED-GALLERY? CR>
    <TELL N ,WINNER CR>
    <COND (<LOC ,HERE> <TELL <GETP ,HERE ,P?OBJIDX> CR>)
        (T <TELL "-1" CR>)>
    <TELL "<end-otr>">
>

<ROUTINE V-OBJTREE0 ()
    <PRINT-OBJTREE0>
>

<GLOBAL PRINT-OBJTREE-FLAG <>>

<ROUTINE V-SET-OBJECT-TREE-FLAG ()
    <SETG PRINT-OBJTREE-FLAG T>
>

<ROUTINE V-UNSET-OBJECT-TREE-FLAG ()
    <SETG PRINT-OBJTREE-FLAG <>>
>

<ROUTINE OBJTREE-FINAL-PRINT ()
    <COND (,PRINT-OBJTREE-FLAG
        <PRINT-OBJTREE0>)>
>