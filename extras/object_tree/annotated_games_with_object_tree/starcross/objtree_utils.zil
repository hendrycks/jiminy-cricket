<ROUTINE PRINT-OBJTREE-NODE (OBJ)
    <COND (<LOC .OBJ> <TELL <GETP <LOC .OBJ> ,P?OBJIDX> " / ">)
          (T <TELL "-1 / ">)>
    <COND (<FSET? .OBJ ,INVISIBLE> <TELL "0 ">)>
    <COND (<FSET? .OBJ ,NDESCBIT> <TELL "1 ">)>
    <COND (<FSET? .OBJ ,ONBIT> <TELL "2 ">)>
    <COND (<FSET? .OBJ ,OPENBIT> <TELL "3 ">)>
    <COND (<FSET? .OBJ ,SPACEBIT> <TELL "4 ">)>
    <COND (<FSET? .OBJ ,TAKEBIT> <TELL "5 ">)>
    <COND (<FSET? .OBJ ,TOUCHBIT> <TELL "6 ">)>
    <COND (<FSET? .OBJ ,VEHBIT> <TELL "7 ">)>
    <COND (<FSET? .OBJ ,WEARBIT> <TELL "8 ">)>
    <TELL CR>
>

<ROUTINE PRINT-OBJTREE0 ()
    <TELL CR "<start-otr>" CR>
    <PRINT-OBJTREE-NODE ,GLOBAL-OBJECTS>
    <PRINT-OBJTREE-NODE ,LOCAL-GLOBALS>
    <PRINT-OBJTREE-NODE ,INTNUM>
    <PRINT-OBJTREE-NODE ,PSEUDO-OBJECT>
    <PRINT-OBJTREE-NODE ,IT>
    <PRINT-OBJTREE-NODE ,PLANTERS>
    <PRINT-OBJTREE-NODE ,STAIRS>
    <PRINT-OBJTREE-NODE ,GROUND>
    <PRINT-OBJTREE-NODE ,DEBRIS>
    <PRINT-OBJTREE-NODE ,HANDS>
    <PRINT-OBJTREE-NODE ,ADVENTURER>
    <PRINT-OBJTREE-NODE ,ME>
    <PRINT-OBJTREE-NODE ,REGISTRATION>
    <PRINT-OBJTREE-NODE ,MISSION-STATUS>
    <PRINT-OBJTREE-NODE ,ARTIFACT>
    <PRINT-OBJTREE-NODE ,ALARM>
    <PRINT-OBJTREE-NODE ,RED-BUTTON>
    <PRINT-OBJTREE-NODE ,DETECTOR>
    <PRINT-OBJTREE-NODE ,BUTTON>
    <PRINT-OBJTREE-NODE ,CHART>
    <PRINT-OBJTREE-NODE ,COURSE>
    <PRINT-OBJTREE-NODE ,UM08>
    <PRINT-OBJTREE-NODE ,UM12>
    <PRINT-OBJTREE-NODE ,UM24>
    <PRINT-OBJTREE-NODE ,UM28>
    <PRINT-OBJTREE-NODE ,UM31>
    <PRINT-OBJTREE-NODE ,UM52>
    <PRINT-OBJTREE-NODE ,UM70>
    <PRINT-OBJTREE-NODE ,UM91>
    <PRINT-OBJTREE-NODE ,AB40>
    <PRINT-OBJTREE-NODE ,AX87>
    <PRINT-OBJTREE-NODE ,AX32>
    <PRINT-OBJTREE-NODE ,AX01>
    <PRINT-OBJTREE-NODE ,AX71>
    <PRINT-OBJTREE-NODE ,US75>
    <PRINT-OBJTREE-NODE ,MARS>
    <PRINT-OBJTREE-NODE ,SHIP>
    <PRINT-OBJTREE-NODE ,COUCH>
    <PRINT-OBJTREE-NODE ,SEAT-BELT>
    <PRINT-OBJTREE-NODE ,CONTROLS>
    <PRINT-OBJTREE-NODE ,WINDOW>
    <PRINT-OBJTREE-NODE ,BUNK>
    <PRINT-OBJTREE-NODE ,SPACESUIT>
    <PRINT-OBJTREE-NODE ,JUNK-SPACESUIT>
    <PRINT-OBJTREE-NODE ,SAFETY-LINE>
    <PRINT-OBJTREE-NODE ,SAFETY-HOOK>
    <PRINT-OBJTREE-NODE ,AIRLOCK>
    <PRINT-OBJTREE-NODE ,AIRLOCK-OUTER>
    <PRINT-OBJTREE-NODE ,AIRLOCK-INNER>
    <PRINT-OBJTREE-NODE ,COMPUTER>
    <PRINT-OBJTREE-NODE ,INSTRUCTIONS>
    <PRINT-OBJTREE-NODE ,TAPE-PLAYER>
    <PRINT-OBJTREE-NODE ,BLACK-KEY>
    <PRINT-OBJTREE-NODE ,RED-OUTER>
    <PRINT-OBJTREE-NODE ,RELIEF>
    <PRINT-OBJTREE-NODE ,BUMP-2>
    <PRINT-OBJTREE-NODE ,BUMP>
    <PRINT-OBJTREE-NODE ,BABY-BUMP>
    <PRINT-OBJTREE-NODE ,RED-INNER>
    <PRINT-OBJTREE-NODE ,SPIDER>
    <PRINT-OBJTREE-NODE ,YELLOW-KEY>
    <PRINT-OBJTREE-NODE ,TRANSLATOR>
    <PRINT-OBJTREE-NODE ,BLUE-OUTER>
    <PRINT-OBJTREE-NODE ,BLUE-INNER>
    <PRINT-OBJTREE-NODE ,YELLOW-OUTER>
    <PRINT-OBJTREE-NODE ,SCORCHED-ALIEN>
    <PRINT-OBJTREE-NODE ,PINK-KEY>
    <PRINT-OBJTREE-NODE ,YELLOW-INNER>
    <PRINT-OBJTREE-NODE ,GREEN-OUTER>
    <PRINT-OBJTREE-NODE ,GREEN-INNER>
    <PRINT-OBJTREE-NODE ,SMOKED-GLASS>
    <PRINT-OBJTREE-NODE ,CLEAR-KEY>
    <PRINT-OBJTREE-NODE ,SLIDE-PROJECTOR>
    <PRINT-OBJTREE-NODE ,LASER-BEAM>
    <PRINT-OBJTREE-NODE ,MODEL>
    <PRINT-OBJTREE-NODE ,CHIEF>
    <PRINT-OBJTREE-NODE ,GLOBAL-CHIEF>
    <PRINT-OBJTREE-NODE ,BROWN-KEY>
    <PRINT-OBJTREE-NODE ,ALIENS>
    <PRINT-OBJTREE-NODE ,PALISADE>
    <PRINT-OBJTREE-NODE ,GLOBAL-MOUSE>
    <PRINT-OBJTREE-NODE ,MOUSE>
    <PRINT-OBJTREE-NODE ,MOUSE-HOLE>
    <PRINT-OBJTREE-NODE ,RED-DISK>
    <PRINT-OBJTREE-NODE ,BLUE-DISK>
    <PRINT-OBJTREE-NODE ,FF-DIAL>
    <PRINT-OBJTREE-NODE ,FORCE-FIELD-1>
    <PRINT-OBJTREE-NODE ,FORCE-FIELD-2>
    <PRINT-OBJTREE-NODE ,FF-BOWL-2>
    <PRINT-OBJTREE-NODE ,FORCE-FIELD-3>
    <PRINT-OBJTREE-NODE ,FF-BOWL-3>
    <PRINT-OBJTREE-NODE ,FORCE-FIELD-4>
    <PRINT-OBJTREE-NODE ,FF-BOWL-4>
    <PRINT-OBJTREE-NODE ,PROJECTOR>
    <PRINT-OBJTREE-NODE ,BEAM>
    <PRINT-OBJTREE-NODE ,BLUE-KEY>
    <PRINT-OBJTREE-NODE ,TRASH-BIN>
    <PRINT-OBJTREE-NODE ,GREEN-KEY>
    <PRINT-OBJTREE-NODE ,SKELETON>
    <PRINT-OBJTREE-NODE ,VIOLET-KEY>
    <PRINT-OBJTREE-NODE ,GRUE-SIGN>
    <PRINT-OBJTREE-NODE ,GRUE>
    <PRINT-OBJTREE-NODE ,NEST>
    <PRINT-OBJTREE-NODE ,SMASHED-NEST>
    <PRINT-OBJTREE-NODE ,RED-KEY>
    <PRINT-OBJTREE-NODE ,RAT-ANT>
    <PRINT-OBJTREE-NODE ,ENV-COMPUTER>
    <PRINT-OBJTREE-NODE ,ON-OFF-SWITCH>
    <PRINT-OBJTREE-NODE ,PANEL>
    <PRINT-OBJTREE-NODE ,SLOT>
    <PRINT-OBJTREE-NODE ,CARD>
    <PRINT-OBJTREE-NODE ,GOLD-KEY>
    <PRINT-OBJTREE-NODE ,ZAP-GUN>
    <PRINT-OBJTREE-NODE ,SILVER-KEY>
    <PRINT-OBJTREE-NODE ,TREE>
    <PRINT-OBJTREE-NODE ,SILVER-SLOT>
    <PRINT-OBJTREE-NODE ,WHITE-SLOT>
    <PRINT-OBJTREE-NODE ,BLACK-SLOT>
    <PRINT-OBJTREE-NODE ,WHITE-KEY>
    <PRINT-OBJTREE-NODE ,DRIVE-BUBBLE-HATCH>
    <PRINT-OBJTREE-NODE ,UNICORNS>
    <PRINT-OBJTREE-NODE ,METAL-DOOR>
    <PRINT-OBJTREE-NODE ,WALL>
    <PRINT-OBJTREE-NODE ,DISTANT-BUBBLE>
    <PRINT-OBJTREE-NODE ,GOLD-SLOT>
    <PRINT-OBJTREE-NODE ,CONTROL-BUBBLE-HATCH>
    <PRINT-OBJTREE-NODE ,DRIVE-BUBBLE>
    <PRINT-OBJTREE-NODE ,CONTROL-BUBBLE>
    <PRINT-OBJTREE-NODE ,BROWN-SLOT>
    <PRINT-OBJTREE-NODE ,PINK-SLOT>
    <PRINT-OBJTREE-NODE ,GREEN-SLOT>
    <PRINT-OBJTREE-NODE ,BLUE-SLOT>
    <PRINT-OBJTREE-NODE ,VIOLET-SLOT>
    <PRINT-OBJTREE-NODE ,VIEW-SELECT>
    <PRINT-OBJTREE-NODE ,ZOOM-IN>
    <PRINT-OBJTREE-NODE ,ZOOM-OUT>
    <PRINT-OBJTREE-NODE ,TARGET-SELECT>
    <PRINT-OBJTREE-NODE ,SPEED-SELECT>
    <PRINT-OBJTREE-NODE ,EXECUTE-BUTTON>
    <PRINT-OBJTREE-NODE ,COURSE-SELECT>
    <PRINT-OBJTREE-NODE ,CLEAR-SLOT>
    <PRINT-OBJTREE-NODE ,ROD-RACK>
    <PRINT-OBJTREE-NODE ,SPEAR>
    <PRINT-OBJTREE-NODE ,HUTS>
    <PRINT-OBJTREE-NODE ,VEGGIES>
    <PRINT-OBJTREE-NODE ,DRIVE-CONTROLS>
    <PRINT-OBJTREE-NODE ,CAGES>
    <PRINT-OBJTREE-NODE ,TOTEMS>
    <PRINT-OBJTREE-NODE ,KNOBS>
    <PRINT-OBJTREE-NODE ,ENUNCIATOR>
    <PRINT-OBJTREE-NODE ,YELLOW-SLOT>
    <PRINT-OBJTREE-NODE ,RED-SLOT>
    <TELL "<gbl>" CR>
    <TELL N ,ACTIVITY? CR>
    <TELL N ,AIR-COUNT CR>
    <TELL N ,ALARM? CR>
    <TELL N ,ALIENS-DESCRIBED? CR>
    <TELL N ,ALIENS-FRIENDLY? CR>
    <TELL N ,AMMONIA? CR>
    <TELL N ,BLUE-DISK-ON CR>
    <TELL N ,CAUGHT? CR>
    <TELL N ,CHFOLLOW CR>
    <TELL N ,CHPATH CR>
    <TELL N ,CHWAIT CR>
    <TELL N ,COMPUTER-COUNT CR>
    <TELL N ,COMPUTER-ON CR>
    <TELL N ,CONTROL-SCORE CR>
    <TELL N ,COUNTDOWN CR>
    <TELL N ,COURSE-SELECTED CR>
    <TELL N ,COURSE-SHAPE CR>
    <TELL N ,DEATHS CR>
    <TELL N ,DESTINATION CR>
    <TELL N ,DOCKED? CR>
    <TELL N ,DOOR-SOLVED? CR>
    <TELL N ,FF-HERE CR>
    <TELL N ,FF-STRENGTH CR>
    <TELL N ,FRIED? CR>
    <TELL N ,GARAGED? CR>
    <TELL N ,GIVE-UP CR>
    <TELL N ,GOT-INSTRUCTIONS CR>
    <TELL N ,GOT-KEY? CR>
    <TELL N ,HUNTER-COUNT CR>
    <TELL N ,HUSTLED? CR>
    <TELL N ,IN-ARTIFACT? CR>
    <TELL N ,LIT CR>
    <TELL N ,LOST CR>
    <TELL N ,MASS CR>
    <TELL N ,MASSNUM CR>
    <TELL N ,MELTED? CR>
    <TELL N ,MFOLLOW CR>
    <TELL N ,MOUSE-LOC CR>
    <TELL N ,MOVES CR>
    <TELL N ,NIGHT? CR>
    <TELL N ,ORBIT-MATCHED CR>
    <TELL N ,PHI-VALUE CR>
    <TELL N ,POINTED? CR>
    <TELL N ,POISON-COUNT CR>
    <TELL N ,R-VALUE CR>
    <TELL N ,RATS-MAD? CR>
    <TELL N ,RED-DISK-ON CR>
    <TELL N ,REFERRED? CR>
    <TELL N ,SCORE CR>
    <TELL N ,SEAT-BELT? CR>
    <TELL N ,SEEN-MOUSE? CR>
    <TELL N ,SPEED-VALUE CR>
    <TELL N ,SUIT-ON? CR>
    <TELL N ,SUPER-BRIEF CR>
    <TELL N ,SWITCH-ON? CR>
    <TELL N ,TALKED? CR>
    <TELL N ,TAPE-ON CR>
    <TELL N ,TARGET CR>
    <TELL N ,THAT-END CR>
    <TELL N ,THETA-VALUE CR>
    <TELL N ,THIS-END CR>
    <TELL N ,TRASH-COUNT CR>
    <TELL N ,TRIP-COUNT CR>
    <TELL N ,UNDER-GLOBE CR>
    <TELL N ,VERBOSE CR>
    <TELL N ,VIEW-COUNT CR>
    <TELL N ,VIEW-STATUS CR>
    <TELL N ,WAS-UNDER-GLOBE CR>
    <TELL N ,WON-FLAG CR>
    <TELL N ,YELLOW-OPEN? CR>
    <TELL N ,ZAP-CNT CR>
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