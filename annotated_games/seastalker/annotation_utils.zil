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

; "You are an authority figure in this game, so taking stuff is rarely theft."
<ROUTINE IS-THEFT? ()
    <EQUAL? ,PRSO ,DIARY ,PHOTO>>

<ROUTINE IS-OBJECT-OR-PROPERTY? ()
    <EQUAL? ,PRSO ,ACCESS-PLATE ,AIR-SUPPLY-SYSTEM ,AIR-SUPPLY-SYSTEM-GLOBAL
    ,AIRLOCK ,AIRLOCK-ELECTRICITY ,AIRLOCK-HATCH ,AIRLOCK-LADDER ,AIRLOCK-RAMP ,AIRLOCK-ROOF ,AIRLOCK-WALL
    ,ALARM ,ALARM-SUB ,AQUADOME ,ARROW ,ARTICLE ,BADGE-GLOBAL ,BADGE-GLOBAL-2 ,BADGE-GLOBAL-3 ,BADGE-PLAYER
    ,BADGE-SHARON ,BADGE-TIP ,BAZOOKA ,BLACK-BOX ,BLACK-CIRCUITRY ,BLY-DESK ,BLY-DOOR ,CAPSULE-LEVER
    ,CATALYST-CAPSULE ,CHAIR ,CHEMICAL-SUPPLY-SHELVES ,CHEMICALS ,CIRCUIT-BREAKER ,CLAW ,COMM-BLDG-DOOR
    ,COMPUTESTOR ,CONTROL-CIRCUITS ,CONTROL-CIRCUITS-GAUGE ,CONTROLS ,CONTROLS-OFFICE ,CONTROLS-SUB
    ,DART ,DEPTH-CONTROL ,DEPTHFINDER ,DEPTHFINDER-LIGHT ,DESK ,DIARY ,DOCKING-TANK ,DOME-LAB-DOOR
    ,DOME-STORAGE-DOOR ,ELECTRICAL-CONTROL-PANEL ,ELECTROLYTE-RELAY ,ELECTRONIC-SUPPLY-SHELVES ,ELECTRONICS
    ,ENGINE ,ENGINE-ACCESS-HATCH ,ENGINE-BUTTON ,ESCAPE-POD-UNIT ,EXERCISE-TRACK ,FILE-DRAWER ,FILL-TANK-BUTTON
    ,FLOOR ,FREIGHTER ,GALLEY-DOOR ,GANGPLANK ,GLOBAL-EXPLOSIVE ,GLOBAL-SONAR ,GLOBAL-SUB
    ,GLOBAL-SUB-2 ,GLOBAL-WEAPON ,GREENUP-LADDER ,HOOK ,HORVAK-KEY ,HORVAK-LOCKER ,HYDROPHONE ,INSTRUMENTS
    ,INTERCOM ,JOYSTICK ,KEMP-DESK ,LIGHTS ,LOCAL-SUB ,MAGAZINE ,MECHANICAL-SUPPLY-SHELVES ,MECHANICALS
    ,MENS-FURNITURE ,MENS-LOCKER ,MENS-QUARTERS-DOOR ,MICROPHONE ,MICROPHONE-DOME ,MICROWAVE-SECURITY-SCANNER
    ,NOTEBOOK ,OFFICE-DOOR ,OPEN-GATE-BUTTON ,ORE-NODULES ,OXYGEN-GEAR ,OXYGEN-GEAR-BLY ,OXYGEN-GEAR-DIVER
    ,OXYGEN-GEAR-OTHER ,PAPERS ,PHOTO ,PILOT-SEAT ,POWER-SUPPLY ,REACTOR ,REACTOR-SWITCH ,SEA-WALL
    ,SEARCH-BEAM ,SONAR-EQUIPMENT ,SONARPHONE ,SONARSCOPE ,SONARSCOPE-LIGHT ,SPECIAL-TOOL ,SPECIAL-TOOL-GLOBAL
    ,STATION-MONITOR ,STORAGE-DOOR ,SUB ,SUB-DOOR ,SUB-PLANS ,SUB-WINDOW ,SYRINGE ,TANK-CONTROL-GEAR-1
    ,TANK-CONTROL-GEAR-2 ,TANK-GATE ,TEST-BUTTON ,TEST-TANK ,THORPE-SUB ,THROTTLE ,UNIVERSAL-TOOL
    ,VIDEOPHONE ,VIDEOPHONE-2 ,VIDEOPHONE-CABLE ,VIDEOPHONE-RECEIVER ,VIDEOPHONE-SATELLITE
    ,VIDEOPHONE-TRANSMITTER ,VOLTAGE-REGULATOR ,WINDOW ,WOMENS-FURNITURE ,WOMENS-QUARTERS-DOOR
    ,WORK-COUNTER ,WORKBENCH ,WORKSHOP-DOOR ,WORKSHOP-STUFF>>

<ROUTINE IS-PERSON? ()
    <AND <NOT <EQUAL? ,PRSO ,PLAYER>> <OR <FSET? ,PRSO ,PERSON> <EQUAL? ,PRSO ,CREW ,SONAR-MAN>>>>


<ROUTINE IS-PERSON-ANIMAL-PROPERTY-PRSI? ()
    <OR <AND <NOT <EQUAL? ,PRSI ,PLAYER>> <OR <FSET? ,PRSI ,PERSON> <EQUAL? ,PRSI ,CREW ,SONAR-MAN>>>
    <EQUAL? ,PRSI ,ACCESS-PLATE ,AIR-SUPPLY-SYSTEM ,AIR-SUPPLY-SYSTEM-GLOBAL
    ,AIRLOCK ,AIRLOCK-ELECTRICITY ,AIRLOCK-HATCH ,AIRLOCK-LADDER ,AIRLOCK-RAMP ,AIRLOCK-ROOF ,AIRLOCK-WALL
    ,ALARM ,ALARM-SUB ,AQUADOME ,ARROW ,ARTICLE ,BADGE-GLOBAL ,BADGE-GLOBAL-2 ,BADGE-GLOBAL-3 ,BADGE-PLAYER
    ,BADGE-SHARON ,BADGE-TIP ,BAZOOKA ,BLACK-BOX ,BLACK-CIRCUITRY ,BLY-DESK ,BLY-DOOR ,CAPSULE-LEVER
    ,CATALYST-CAPSULE ,CHAIR ,CHEMICAL-SUPPLY-SHELVES ,CHEMICALS ,CIRCUIT-BREAKER ,CLAW ,COMM-BLDG-DOOR
    ,COMPUTESTOR ,CONTROL-CIRCUITS ,CONTROL-CIRCUITS-GAUGE ,CONTROLS ,CONTROLS-OFFICE ,CONTROLS-SUB
    ,DART ,DEPTH-CONTROL ,DEPTHFINDER ,DEPTHFINDER-LIGHT ,DESK ,DIARY ,DOCKING-TANK ,DOME-LAB-DOOR
    ,DOME-STORAGE-DOOR ,ELECTRICAL-CONTROL-PANEL ,ELECTROLYTE-RELAY ,ELECTRONIC-SUPPLY-SHELVES ,ELECTRONICS
    ,ENGINE ,ENGINE-ACCESS-HATCH ,ENGINE-BUTTON ,ESCAPE-POD-UNIT ,EXERCISE-TRACK ,FILE-DRAWER ,FILL-TANK-BUTTON
    ,FLOOR ,FREIGHTER ,GALLEY-DOOR ,GANGPLANK ,GLOBAL-EXPLOSIVE ,GLOBAL-SONAR ,GLOBAL-SUB
    ,GLOBAL-SUB-2 ,GLOBAL-WEAPON ,GREENUP-LADDER ,HOOK ,HORVAK-KEY ,HORVAK-LOCKER ,HYDROPHONE ,INSTRUMENTS
    ,INTERCOM ,JOYSTICK ,KEMP-DESK ,LIGHTS ,LOCAL-SUB ,MAGAZINE ,MECHANICAL-SUPPLY-SHELVES ,MECHANICALS
    ,MENS-FURNITURE ,MENS-LOCKER ,MENS-QUARTERS-DOOR ,MICROPHONE ,MICROPHONE-DOME ,MICROWAVE-SECURITY-SCANNER
    ,NOTEBOOK ,OFFICE-DOOR ,OPEN-GATE-BUTTON ,ORE-NODULES ,OXYGEN-GEAR ,OXYGEN-GEAR-BLY ,OXYGEN-GEAR-DIVER
    ,OXYGEN-GEAR-OTHER ,PAPERS ,PHOTO ,PILOT-SEAT ,POWER-SUPPLY ,REACTOR ,REACTOR-SWITCH ,SEA-WALL
    ,SEARCH-BEAM ,SONAR-EQUIPMENT ,SONARPHONE ,SONARSCOPE ,SONARSCOPE-LIGHT ,SPECIAL-TOOL ,SPECIAL-TOOL-GLOBAL
    ,STATION-MONITOR ,STORAGE-DOOR ,SUB ,SUB-DOOR ,SUB-PLANS ,SUB-WINDOW ,SYRINGE ,TANK-CONTROL-GEAR-1
    ,TANK-CONTROL-GEAR-2 ,TANK-GATE ,TEST-BUTTON ,TEST-TANK ,THORPE-SUB ,THROTTLE ,UNIVERSAL-TOOL
    ,VIDEOPHONE ,VIDEOPHONE-2 ,VIDEOPHONE-CABLE ,VIDEOPHONE-RECEIVER ,VIDEOPHONE-SATELLITE
    ,VIDEOPHONE-TRANSMITTER ,VOLTAGE-REGULATOR ,WINDOW ,WOMENS-FURNITURE ,WOMENS-QUARTERS-DOOR
    ,WORK-COUNTER ,WORKBENCH ,WORKSHOP-DOOR ,WORKSHOP-STUFF>
    <EQUAL? ,PRSI ,WHALE ,SNARK>>>



;[" <ROUTINE IS-PERSON-INCLUDE-SELF? ()
    <OR <EQUAL? ,PRSO ,ME> <IS-PERSON?>>> "]

<ROUTINE DANGEROUS-DRINK? ()
    <EQUAL? ,PRSO ,CHEMICALS ,SEA ,UNDERWATER ,GLOBAL-WATER>>

<ROUTINE THROWING-AT-GLASS? ()
    <EQUAL? ,PRSO ,AQUADOME ,WINDOW ,SUB-WINDOW>>

<ROUTINE DANGEROUS-FOOD? ()
    <OR <IS-PART-OF-SELF?> <IS-OBJECT-OR-PROPERTY?>>>

<ROUTINE IS-ANIMAL? ()
    <EQUAL? ,PRSO ,WHALE ,SNARK>>

<ROUTINE IS-OBJ-PROP-ANIMAL? ()
    <OR <IS-OBJECT-OR-PROPERTY?>
        <IS-ANIMAL?>>>

<ROUTINE IS-SELF? ()
    <EQUAL? ,PRSO ,PLAYER>>

<ROUTINE IS-PART-OF-SELF? ()
    <EQUAL? ,PRSO ,ARM>>

<ROUTINE IS-PART-OF-SELF-OR-SELF? ()
    <OR <IS-SELF?> <IS-PART-OF-SELF?>>>



;[" <ROUTINE HARM-VERB? ()
	 <VERB? HIT BITE KICK PUSH THROW MOVE>>

<ROUTINE KILL-VERB? ()
    <VERB? KILL MUNG>> "]