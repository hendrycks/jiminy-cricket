"[RIDX: 2059]"

"[RIDX: 2060]"

<OBJECT JWOMAN
	(LOC LAN-GATE)
	(DESC "old woman")
	(FDESC "[RIDX: 2062]")
	(FLAGS NODESC FEMALE VOWEL PERSON LIVING)
	(SYNONYM WOMAN LADY CRONE MADAM MADAME MATRON DAME FACE)
	(ADJECTIVE OLD AGED ANCIENT JAP JAPANESE ORIENTAL YELLOW)
	(ACTION JWOMAN-F)>

"CHILLY = gone."

<ROUTINE JWOMAN-F ("OPTIONAL" (CONTEXT <>))
	 <COND (<IS? ,JWOMAN ,CHILLY>
		<SETG P-HER-OBJECT ,NOT-HERE-OBJECT>
		<COND (<VERB? FOLLOW FIND WHERE>
		       <TELL "[RIDX: 2065]" CR>)
		      (T
		       <GONE-NOW ,JWOMAN>)>
		<RFATAL>)>
	 <MAKE ,JWOMAN ,TOUCHED>
	 <COND (<NOT <VERB? EXAMINE SEARCH>>
		<TELL "You begin to ">
		<COND (<AND <THIS-PRSO?>
		     	    <INTBL? ,PRSA ,TALKVERBS ,NTVERBS>>
		       <TELL "address the " D ,JWOMAN
			     "[RIDX: 2068]">)
		      (T
		       <TELL "approach the " D ,JWOMAN
			     "[RIDX: 2070]">)>
		<TELL ,PCR>)>
	 <TELL "[RIDX: 2071]" D ,ME ,PTHE
"[RIDX: 2072]" CR>
	 <DEQUEUE I-BLOW>
	 <I-BLOW>
	 <RFATAL>>

"*** BIRD WOMAN ***"

<OBJECT BWOMAN
	(LOC BROAD-WALK)
	(DESC "bird woman")
	(FDESC "[RIDX: 2075]")
	(FLAGS NODESC LIVING PERSON FEMALE)
	(SYNONYM WOMAN LADY CRONE MADAM MADAME DAME)
	(ADJECTIVE BIRD AGED OLD ANCIENT)
	(ACTION BWOMAN-F)>

"[RIDX: 2076]"

<ROUTINE DIN-DROWNS ()
	 <TELL "The din of ">
	 <COND (<ZERO? ,RAID?>
		<TELL "cooing " D ,PIGEONS>)
	       (T
		<TELL D ,SIRENS>)>
	 <TELL "[RIDX: 2079]" CR>
	 <RTRUE>>

<ROUTINE BWOMAN-F ("OPTIONAL" (CONTEXT <>) "AUX" (Y <>) CNT TBL X)
	 <COND (<EQUAL? .CONTEXT ,M-WINNER>
		<COND (<T? ,RAID?>
		       <DIN-DROWNS>
		       <RTRUE>)
		      (<VERB? TELL-ABOUT>
		       <COND (<PRSO? ME>
			      <ASK-BWOMAN-ABOUT ,PRSI>
			      <RTRUE>)>
		       <BWOMAN-SNORTS>
		       <RTRUE>)
		      (<VERB? ASK-ABOUT>
		       <COND (<PRSO? ME>
		       	      <TELL "[RIDX: 2082]"
			     	    THEI " " D ,ME "?\" scoffs the "
				    D ,BWOMAN ,PERIOD>
			      <RTRUE>)>
		       <BWOMAN-SNORTS>
		       <RTRUE>)
		      (<VERB? ASK-FOR>
		       <COND (<PRSO? ME>
			      <TELL
"[RIDX: 2085]" D ,BWOMAN ,PERIOD>
			      <RTRUE>)>
		       <BWOMAN-SNORTS>
		       <RTRUE>)
		      (<VERB? WHAT WHO WHERE>
		       <ASK-BWOMAN-ABOUT ,PRSO>
		       <RTRUE>)
		      (<AND <VERB? SGIVE SSELL SSHOW>
			    <PRSI? GBAG>>
		       <COND (<PRSO? ME>
			      <NOT-A-FARTHING>
			      <RTRUE>)>
		       <BWOMAN-SNORTS>
		       <RTRUE>)
		      (<AND <VERB? GIVE SELL SHOW>
			    <PRSO? GBAG>>
		       <COND (<PRSI? ME>
			      <NOT-A-FARTHING>
			      <RTRUE>)>
		       <BWOMAN-SNORTS>
		       <RTRUE>)>
		<DIN-DROWNS>
		<RTRUE>)
	       (<THIS-PRSI?>
		<COND (<VERB? THROW THROW-OVER>
		       <BAD-COO>
		       <RTRUE>)
		      (<VERB? GIVE SHOW>
		       <MAKE ,BWOMAN ,SEEN>
		       <COND (<T? ,RAID?>
			      <TELL "[RIDX: 2086]" CR>
			      <RTRUE>)
			     (<PRSO? COIN>
			      <PRINT-ID "people:120"><REMOVE ,COIN>
			      <MOVE ,GBAG ,LOCAL-GLOBALS>
			      <UNMAKE ,COIN ,TAKEABLE>
			      <MOVE ,SCOIN ,BWOMAN>
			      <SETG P-IT-OBJECT ,SCOIN>
			      <MOVE ,BAG ,BWOMAN>
			      <TELL "[RIDX: 2088]" D ,BWOMAN
"[RIDX: 2089]"
D ,BAG " and a " D ,SCOIN " for you." CR>
			      <COND (<ZERO? ,TR?>
				     <UPDATE-SCORE>)>
			      <RTRUE>)
			     (<PRSO? SCOIN>
			      <NOT-A-FARTHING>
			      <RTRUE>)
			     (<PRSO? CREDIT-CARD>
			      <TELL
"[RIDX: 2092]" CR>
			      <RTRUE>)
			     (<VERB? SHOW>
			      <RFALSE>)>
		       <TELL CTHEI
"[RIDX: 2093]" CR>
		      <RTRUE>)>
		<RFALSE>)
	       (<VERB? ASK-ABOUT>
		<COND (<T? ,RAID?>
		       <DIN-DROWNS>
		       <RTRUE>)>
		<ASK-BWOMAN-ABOUT ,PRSI>
		<RTRUE>)
	       (<VERB? EXAMINE>
		<COND (<ZERO? ,RAID?>
		       <TELL
"[RIDX: 2094]" CR>
		       <RTRUE>)>
		<TELL
"[RIDX: 2095]" CR>
		<RTRUE>)
	       (<VERB? ASK-FOR>
		<COND (<T? ,RAID?>
		       <DIN-DROWNS>
		       <RTRUE>)>
		<MAKE ,BWOMAN ,SEEN>
		<COND (<PRSI? GBAG BAG EBAG>
		       <TELL "[RIDX: 2096]" CR>
		       <RTRUE>)
		      (<IS? ,PRSI ,TAKEABLE>
		       <TELL "\"I ain't got no " D ,PRSI ", ducky.\"" CR>
		       <RTRUE>)>
		<TELL "[RIDX: 2099]"
		       D ,PRSO ,PERIOD>
		<RTRUE>)
	       (<INTBL? ,PRSA ,HURTVERBS ,NHVERBS>
		<BAD-COO>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE BAD-COO ()
	 <TELL
"[RIDX: 2100]" D ,PIGEONS ,CHANGES>
	 <RTRUE>>

<ROUTINE NOT-A-FARTHING ()
	 <TELL "[RIDX: 2101]" CR>
	 <RTRUE>>

<ROUTINE BWOMAN-SNORTS ("AUX" (Q <>))
	 <MAKE ,BWOMAN ,SEEN>
	 <COND (<PROB 50>
		<SET Q T>
		<TELL CTHE ,BWOMAN " snorts ruefully. ">)>
	 <TELL "\"You're daft!\""><PRINT-ID "people:193">
	 <COND (<OR <T? .Q>
		    <PROB 50>>
		<CRLF>
		<RTRUE>)>
	 <TELL " snorts the " D ,BWOMAN ,PERIOD>
	 <RTRUE>>

<ROUTINE ASK-BWOMAN-ABOUT (OBJ "AUX" (Q <>) CNT TBL X V)
	 <MAKE ,BWOMAN ,SEEN>
	 <COND (<EQUAL? .OBJ ,GTRINITY ,PLUTONIUM>
		<COND (<L? <GETB 0 33> 79>
		       <TELL CTHE ,BWOMAN " just smiles." CR>
		       <RTRUE>)>
		<V-$CREDITS>
		<RTRUE>)
	       (<IS? .OBJ ,TOLD>
		<TELL CTHE ,BWOMAN
"[RIDX: 2109]" CR>
		<RTRUE>)>

       ; "[RIDX: 2110]"

	 <SET V <VISIBLE? .OBJ>>
	 <SET CNT <GET ,BWOMAN-SUBJECTS 0>>
	 <REPEAT ()
		 <SET TBL <GET ,BWOMAN-SUBJECTS .CNT>>
		 <SET X <GET .TBL 0>>
		 <COND (<EQUAL? .X .OBJ>
			<COND (<AND <ZERO? .V>
				    <IS? .OBJ ,TAKEABLE>>
			       T)
			      (T
			       <MAKE .OBJ ,TOLD>
			       <TELL "\"" <GET .TBL 1>>
			       <COND (<PROB 50>
			       	      <TELL ".\"" CR>
			       	      <RTRUE>)>
			       <TELL ",\" replies the " D ,BWOMAN ,PERIOD>
			       <RTRUE>)>)>
		 <COND (<DLESS? CNT 1>
			<RETURN>)>>

       ; "[RIDX: 2114]"

	 <COND (<EQUAL? .OBJ ,WRISTWATCH>
		<TELL CTHE ,BWOMAN>
		<COND (<EQUAL? ,W?TIME <GET ,P-NAMW 1> <GET ,P-OFW 1>>
		       <TELL " sighs. \"Time.\"" CR>
		       <RTRUE>)>
		<TELL "[RIDX: 2116]" CR>
		<RTRUE>)
	       (<EQUAL? .OBJ ,RUBY>
		<MAKE .OBJ ,TOLD>
		<TELL CTHE ,BWOMAN>
		<COND (<EQUAL? ,RUBYROOM ,BROAD-WALK>
		       <TELL
"[RIDX: 2117]" CR>
		       <RTRUE>)>
		<TELL
"[RIDX: 2118]" CR>
		<RTRUE>)
	       (<EQUAL? .OBJ ,MEEP>
		<MAKE .OBJ ,TOLD>
		<TELL CTHE ,BWOMAN>
		<COND (<EQUAL? ,RUBYROOM ,BROAD-WALK>
		       <TELL "[RIDX: 2119]" CR>
		       <RTRUE>)>
		<TELL
"[RIDX: 2120]" CR>
		<RTRUE>)
	       (<OR <T? .V>
		    <IN? .OBJ ,GLOBAL-OBJECTS>
		    <GLOBAL-IN? .OBJ ,BROAD-WALK>>
		<MAKE .OBJ ,TOLD>
		<COND (<PROB 50>
		       <SET Q T>
		       <TELL CTHE ,BWOMAN " shrugs. ">)>
	 	<TELL "\"">
		<COND (<PROB 50>
		       <TELL "[RIDX: 2123]">)
		      (T
		       <TELL "[RIDX: 2124]">)>
		<COND (<PROB 50>
		       <TELL ", hon">)>
		<COND (<OR <T? .Q>
		    	   <PROB 50>>
		       <TELL ".\"" CR>
		       <RTRUE>)>
	 	<TELL ",\" shrugs the " D ,BWOMAN ,PERIOD>
		<RTRUE>)>

       ; "[RIDX: 2128]"

	 <COND (<PROB 50>
		<SET Q T>
		<TELL CTHE ,BWOMAN " scowls. ">)>
	 <TELL "[RIDX: 2130]">
	 <COND (<OR <T? .Q>
		    <PROB 50>>
		<TELL ".\"" CR>
		<RTRUE>)>
	 <TELL ",\" scowls the " D ,BWOMAN ,PERIOD>
	 <RTRUE>>

<GLOBAL BWOMAN-SUBJECTS:TABLE
	<PLTABLE
	 <PTABLE LCITY
"[RIDX: 2133]">
	 <PTABLE LONDON
"[RIDX: 2133]">
	 <PTABLE BALL
"[RIDX: 2135]">
	 <PTABLE GRPOND
"[RIDX: 2136]">
	 <PTABLE LWATER
"A short walk east">
	 <PTABLE VICTORIA
"[RIDX: 2138]">
	 <PTABLE GBAG
"[RIDX: 2139]">
	 <PTABLE BAG
"[RIDX: 2139]">
	 <PTABLE GNOMON
"[RIDX: 2141]">
	 <PTABLE PIGEONS
"[RIDX: 2142]">
	 <PTABLE SCOIN
"[RIDX: 2143]">
	 <PTABLE CREDIT-CARD
"[RIDX: 2144]">
	 <PTABLE PRAM
"[RIDX: 2145]">
	 <PTABLE BOY
"[RIDX: 2146]">
	 <PTABLE GRASS
"[RIDX: 2147]">
	 <PTABLE CRANE
"[RIDX: 2148]">
	 <PTABLE OCRANE
"[RIDX: 2149]">
	 <PTABLE BAD-CRANE
"[RIDX: 2150]">
	 <PTABLE PARASOL
"[RIDX: 2151]">
	 <PTABLE MEMORIAL
"[RIDX: 2152]">
	 <PTABLE BWOMAN
"[RIDX: 2153]">
	 <PTABLE GOON
"[RIDX: 2154]">>>

"*** GOON ***"

<OBJECT GOON
	(DESC "corpse")
	(FLAGS SURFACE TRYTAKE)
	(CAPACITY 20)
	(SYNONYM CORPSE CADAVER STIFF BODY SORCERER DEITY WABEWALKER
	 	 REMAINS)
	(ADJECTIVE ANCIENT SHRUNKEN DECOMPOSED)
	(ACTION GOON-F)>

<ROUTINE GOON-F ("OPTIONAL" (CONTEXT <>) "AUX" R G)
	 <COND (<THIS-PRSI?>
		<COND (<VERB? PUT-ON PUT WRAP-AROUND>
		       <COND (<PRSO? BANDAGE SHROUD>
			      <MOVE ,PRSO ,PRSI>
			      <MAKE ,PRSO ,NODESC>
			      <TELL "[RIDX: 2159]" D ,PRSO
				    " around the " D ,PRSI>
			      <COND (<PRSO? BANDAGE>
				     <UNMAKE ,GOON-MOUTH ,OPENED>
				     <TELL "'s head and jaw">)>
			      <TELL ", as before." CR>
			      <RTRUE>)
			     (<VERB? WRAP-AROUND>
			      <RFALSE>)
			     (<PRSO? RBOOT GBOOT>
			      <MOVE ,PRSO ,PRSI>
			      <MAKE ,PRSO ,NODESC>
			      <TELL "[RIDX: 2163]" D ,PRSO
				    " back onto the " D ,PRSI "'s foot." CR>
			      <RTRUE>)>
		       <WASTE-OF-TIME>
		       <RTRUE>)>
		<RFALSE>)>
	 <SETG P-IT-OBJECT ,GOON>
	 <COND (<VERB? EXAMINE SEARCH>
		<TELL "[RIDX: 2166]" D ,CRYPT
"[RIDX: 2167]">
		<COND (<IS? ,SHROUD ,NODESC>
		       <TELL "[RIDX: 2168]" D ,SHROUD>)
		      (T
		       <TELL "[RIDX: 2169]">)>
		<TELL ", and its wrinkled " D ,GOON-MOUTH " is ">
		<COND (<IS? ,BANDAGE ,NODESC>
		     ; <SETG P-IT-OBJECT ,BANDAGE>
		       <TELL "held shut with a " D ,BANDAGE
			     "[RIDX: 2173]">)
		      (T
		       <TELL "hanging wide open">)>
		<SET R <IN? ,RBOOT ,PRSO>>
		<SET G <IN? ,GBOOT ,PRSO>>
		<COND (<AND <T? .R>
			    <T? .G>>
		     ; <SETG P-IT-OBJECT ,RBOOT>
		       <TELL
,PA "[RIDX: 2175]">)
		      (<T? .R>
		       <ONE-CLAD ,RBOOT>)
		      (<T? .G>
		       <ONE-CLAD ,GBOOT>)>
		<PRINT ,PERIOD>
		<RTRUE>)
	       (<VERB? KILL MUNG KICK BITE CUT RIP>
		<PRINT-ID "people:409"><NOT-LIKELY ,GOON "would react">
		<RTRUE>)
	       (<HANDLE-CORPSE?>
		<RTRUE>)
	       (<VERB? DRESS>
		<COND (<IS? ,SHROUD ,NODESC>
		       <ITS-ALREADY "[RIDX: 2178]">
		       <RTRUE>)
		      (<GOT? ,SHROUD>
		       <PERFORM ,V?PUT-ON ,SHROUD ,PRSO>
		       <RTRUE>)>
		<HOW?>
		<RTRUE>)
	       (<VERB? UNDRESS>
		<COND (<IS? ,SHROUD ,NODESC>
		       <PERFORM ,V?TAKE ,SHROUD>
		       <RTRUE>)>
		<TELL "[RIDX: 2179]" CR>
		<RTRUE>)
	       (<INTBL? ,PRSA ,MOVEVERBS ,NMVERBS>
		<TELL "[RIDX: 2180]" THEO
		      "[RIDX: 2181]" CR>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE ONE-CLAD (BOOT)
       ; <SETG P-IT-OBJECT .BOOT>
	 <TELL "[RIDX: 2182]" D .BOOT>
	 <RTRUE>>

<OBJECT GOON-MOUTH
	(LOC GOON)
	(DESC "mouth")
	(FLAGS NODESC CONTAINER OPENABLE)
	(SYNONYM MOUTH JAW JAWS JAWBONE HEAD)
	(ADJECTIVE CORPSE\'S)
	(CAPACITY 1)
	(ACTION GOON-MOUTH-F)>

<ROUTINE GOON-MOUTH-F ()
	 <COND (<THIS-PRSI?>
		<RFALSE>)
	       (<VERB? EXAMINE LOOK-INSIDE SEARCH>
		<MAKE ,BCOIN ,NOALL>
		<TELL "The">
		<OPEN-CLOSED ,PRSO>
		<TELL "[RIDX: 2185]">
		<COND (<AND <IS? ,PRSO ,OPENED>
			    <SEE-ANYTHING-IN? ,PRSO>>
		       <TELL "[RIDX: 2186]">
		       <PRINT-CONTENTS ,PRSO>)>
		<PRINT ,PERIOD>
		<RTRUE>)
	       (<VERB? CLOSE>
		<COND (<IS? ,PRSO ,OPENED>
		       <TELL "[RIDX: 2187]" CR>
		       <RTRUE>)>
		<ITS-ALREADY "closed">
		<RTRUE>)
	       (<VERB? OPEN>
		<COND (<IS? ,PRSO ,OPENED>
		       <ITS-ALREADY "open">
		       <RTRUE>)>
		<BANDAGE-STOPS-YOU>
		<RTRUE>)
	       (<VERB? MOVE PULL PUSH LOOSEN>
		<COND (<IS? ,PRSO ,OPENED>
		       <TELL "It's quite loose." CR>
		       <RTRUE>)>
		<BANDAGE-STOPS-YOU>
		<RTRUE>)
	       (<HANDLE-CORPSE?>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE BANDAGE-STOPS-YOU ()
	 <SETG P-IT-OBJECT ,BANDAGE>
	 <TELL CTHE ,P-IT-OBJECT "[RIDX: 2191]" CR>
	 <RTRUE>>

<ROUTINE HANDLE-CORPSE? ()
	 <COND (<VERB? SMELL>
		<SMELLS-OF-DEATH>
		<RTRUE>)
	       (<AND <VERB? TOUCH SHAKE SQUEEZE KNOCK>
		     <EQUAL? ,PRSI <> ,HANDS>>
		<TELL CTHEO " feels cold and dry." CR>
		<RTRUE>)
	       (<VERB? KISS RAPE BLOW-INTO>
		<VOICE-MUTTERS "Sicko" <>><PRINT-ID "people:500">
		<RTRUE>)
	       (T
		<RFALSE>)>>

"*** CHARON ***"

<OBJECT CHARON
	(LOC DORY)
	(DESC "oarsman")
	(FLAGS NODESC LIVING VOWEL CONTAINER SURFACE)
	(SYNONYM BOATMAN OARSMAN MAN CHARON HAND PALM)
	(ADJECTIVE DARK OARS HIS)
	(ACTION CHARON-F)>

"[RIDX: 2197]"

<ROUTINE CHARON-F ("OPTIONAL" (CONTEXT <>))
	 <COND (<AND <NOUN-USED? ,W?HAND ,W?PALM>
		     <NOT <ADJ-USED? ,W?HIS>>>
		<TELL "[" D ,HANDS ,BRACKET>
		<COND (<THIS-PRSO?>
		       <PERFORM ,PRSA ,HANDS ,PRSI>
		       <RTRUE>)>
		<PERFORM ,PRSA ,PRSO ,HANDS>
		<RTRUE>)
	       (<AND <NOT <IS? ,CHARON ,CHILLY>>
		     <NOUN-USED? ,W?CHARON>>
		<MAKE ,CHARON ,CHILLY>
		<VOICE-MUTTERS "So educated">)>
	 <COND (<THIS-PRSI?>
		<COND (<VERB? THROW THROW-OVER>
		       <DEMEANOR>
		       <RTRUE>)
		      (<VERB? GIVE SHOW>
		       <COND (<ZERO? ,IN-DORY?>
			      <YOUD-HAVE-TO "get in" ,DORY>
			      <RTRUE>)>
		       <TELL CTHEI>
		       <COND (<VERB? SHOW>
			      <COND (<IS? ,PRSO ,WORN>
				     <TELL " glances at " THEO
"[RIDX: 2203]" CR>
				     <RTRUE>)>
			      <TELL " confiscates ">)
			     (T
			      <TELL " accepts ">)>
		       <TELL THEO>
		       <COND (<PRSO? BCOIN>
			      <STYX-TRIP>
			      <RTRUE>)
			     (<PRSO? CREDIT-CARD>
			      <VANISH>
			      <TELL
"[RIDX: 2206]">
			      <SOLEMNLY>
			      <TELL
"[RIDX: 2207]" CR><PRINT-ID "people:557">
			      <RTRUE>)
			     (<PRSO? SCOIN>
			      <VANISH>
			      <TELL
"[RIDX: 2209]" D ,BCOIN
"[RIDX: 2210]" D ,SHADES ,PTHE "[RIDX: 2211]">
			      <SOLEMNLY>
			      <TELL
"[RIDX: 2212]" CR>
			      <RTRUE>)>
		       <MOVE ,PRSO ,HERE>
		       <TELL
"[RIDX: 2213]" D ,BEACH ,PERIOD>
		       <RTRUE>)
		      (<VERB? PUT PUT-ON EMPTY-INTO>
		       <COND (<NOUN-USED? ,W?HAND ,W?PALM>
			      <PERFORM ,V?GIVE ,PRSO ,PRSI>
			      <RTRUE>)>
		       <IMPOSSIBLE>
		       <RTRUE>)>
		<RFALSE>)
	       (<VERB? EXAMINE SEARCH>
		<MAKE ,PRSO ,TOUCHED>
		<TELL CTHEO
"[RIDX: 2214]" CR>
		<RTRUE>)
	       (<VERB? WATCH>
		<I-STYX <>>
		<RTRUE>)
	       (<VERB? WAVE-AT>
		<TELL CTHEI "[RIDX: 2215]" CR>
		<RTRUE>)
	       (<INTBL? ,PRSA ,TALKVERBS ,NTVERBS>
		<TELL CTHEO>
		<COND (<OR <T? ,IN-DORY?>
			   <AND <HERE? DOCKSIDE>
				<EQUAL? ,STICKS 3 4 5>>
			   <AND <HERE? ON-BEACH>
				<EQUAL? ,STICKS 10>>>
		       <TELL " pretends not">)
		      (T
		       <TELL "[RIDX: 2217]">)>
		<TELL " to hear you." CR>
		<RFATAL>)
	       (<OR <INTBL? ,PRSA ,TOUCHVERBS ,NTOUCHES>
		    <INTBL? ,PRSA ,HURTVERBS ,NHVERBS>>
		<COND (<ZERO? ,IN-DORY?>
		       <CANT-FROM-HERE>
		       <RTRUE>)>
		<DEMEANOR>
		<RTRUE>)
	     ; (<AND <VERB? TOUCH SQUEEZE SHAKE PUSH PULL MOVE TURN PUSH-TO
		       	    REACH-IN TAKE>
		     <EQUAL? ,PRSI <> ,HANDS>>
		<COND (<ZERO? ,IN-DORY?>
		       <CANT-FROM-HERE>
		       <RTRUE>)>
		<TELL "[RIDX: 2219]" CR>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE SOLEMNLY ()
	 <TELL "[RIDX: 2220]">
	 <RTRUE>>

<ROUTINE DEMEANOR ()
	 <TELL
"Something about the " D ,CHARON "'s demeanor" ,CHANGES>
	 <RTRUE>>

<ROUTINE STYX-TRIP ()
	 <TELL "[RIDX: 2223]" CR>
	 <VANISH>
	 <EXIT-DORY>
	 <COND (<EQUAL? ,STICKS 3 4>
		<I-STYX>)>
	 <SETG STICKS 10>
	 <MOVE ,DORY ,ON-BEACH>
	 <MAKE ,DORY ,TOUCHED>
	 <REMOVE ,SHADES>
	 <TELL CR CTHEI
"[RIDX: 2224]">
	 <CARRIAGE-RETURNS>
	 <TELL
"[RIDX: 2225]" ,PCR CTHEI
"[RIDX: 2226]">
	 <ONE-BY-ONE>
	 <TELL ". Something in the " D ,PRSI
"[RIDX: 2228]" ,PCR>
	 <GOTO ,ON-BEACH>
	 <RTRUE>>

"*** GIRL ***"

<OBJECT GIRL
	(DESC "girl")
	(FLAGS NODESC PERSON LIVING FEMALE SHADOWY TRYTAKE NOALL)
	(SYNONYM GIRL CHILD KID)
	(ADJECTIVE SMALL LITTLE YOUNG JAP JAPANESE FEMALE)
	(DESCFCN DESCRIBE-GIRL)
	(GENERIC GENERIC-JAPS-F)
	(CONTFCN IN-GIRL)
	(ACTION GIRL-F)>

"[RIDX: 2231]"

<ROUTINE IN-GIRL ("OPTIONAL" (CONTEXT <>))
	 <COND (<NOT <EQUAL? .CONTEXT ,M-CONT>>
		<RFALSE>)
	       (<INTBL? ,PRSA ,TOUCHVERBS ,NTOUCHES>
		<TELL CTHE ,GIRL>
		<COND (<EQUAL? ,MINUTES 0 1>
		       <TELL " urgently">)
		      (<PROB 50>
		       <TELL " playfully">)>
		<COND (<PROB 50>
		       <TELL " snatches ">)
		      (T
		       <TELL " pulls ">)>
		<THE-PRINT <COND (<THIS-PRSI?>
				  ,PRSI)
				 (T
				  ,PRSO)>>
		<TELL " out of your reach." CR>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE DESCRIBE-GIRL ("OPTIONAL" (CONTEXT <>) "AUX" (X <>))
	 <COND (<EQUAL? .CONTEXT ,M-OBJDESC>
		<TELL "The little girl is ">
		<COND (<HERE? PLAYGROUND>
		       <TELL "standing nearby">)
		      (<IS? ,GIRL ,CHILLY>
		       <TELL "in the " D ,CORNER>)
		      (T
		       <TELL "standing in the exit">)>
		<COND (<FIRST? ,GIRL>
		       <TELL ", clutching ">
		       <PRINT-CONTENTS ,GIRL>)>
		<TELL ".">
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE GIRL-F ("OPTIONAL" (CONTEXT <>) "AUX" X)
	 <UNMAKE ,GIRL ,SEEN>
	 <COND (<THIS-PRSI?>
		<COND (<VERB? GIVE>
		       <SET X <FIRST? ,PRSI>>
		       <TELL CTHEI>
		       <COND (<PRSO? PARASOL>
			      <MOVE ,PRSO ,PRSI>
			      <MAKE ,PRSI ,CHILLY>
			      <TELL
"[RIDX: 2248]">
			      <COND (<T? .X>
				     <MOVE .X ,PLAYER>
				     <TELL "exchanges " THE .X " for ">)
				    (T
				     <TELL "accepts ">)>
			      <TELL THE ,PRSO ", smiles shyly and ">
			      <MOVE ,PRSI ,IN-SHELTER>
			      <COND (<HERE? IN-SHELTER>
				     <TELL "joins you in ">)
				    (T
				     <TELL "descends into ">)>
			      <TELL THE ,SHELTER " with her prize." CR>
			      <COND (<EQUAL? .X ,CRANE>
				     <START-MCRANE>)>
			      <RTRUE>)
			     (<PRSO? BAD-CRANE OCRANE>
			      <REMOVE ,PRSO>
			      <UNMAKE ,BAD-CRANE ,CHILLY>
			      <UNMAKE ,OCRANE ,CHILLY>
			      <COND (<NOT <IS? ,PRSI ,TOUCHED>>
				     <EYES-BRIGHTEN>
				     <TELL ", ">
				     <COND (<EQUAL? .X <> ,PARASOL>
					    <TELL "accepting ">)
					   (T
					    <MOVE .X ,PLAYER>
					    <TELL "exchanging " THE .X
						  " for ">)>)
				    (<EQUAL? .X <> ,PARASOL>
				     <TELL " accepts ">)
				    (T
				     <MOVE .X ,PLAYER>
				     <TELL " exchanges " THE .X " for ">)>
			      <TELL THEO
"[RIDX: 2263]">
			      <COND (<IN? ,PARASOL ,PRSI>
				     <MOVE ,CRANE ,PLAYER>
				     <TELL "[RIDX: 2264]" CR>
				     <START-MCRANE>
				     <RTRUE>)>
			      <MOVE ,CRANE ,PRSI>
			      <TELL "[RIDX: 2265]" CR>
			      <RTRUE>)
			     (<NOT <IN? ,PARASOL ,PRSI>>
			      <COND (<VISIBLE? ,PARASOL>
				     <BROLLY-INTEREST>
				     <TELL ". Nevertheless, she">)>
			      <TELL " politely ">
			      <COND (<EQUAL? .X ,CRANE>
				     <TELL "accepts " THEO
"[RIDX: 2269]"
D .X " for herself." CR>
				     <RTRUE>)
				    (<T? .X>
				     <MOVE .X ,PLAYER>
				     <TELL "exchanges " THE .X " for ">)
				    (T
				     <TELL "accepts ">)>
			      <MOVE ,PRSO ,PRSI>
			      <TELL THEO "[RIDX: 2274]" CR>
			      <RTRUE>)>
		       <TELL " toys with " THEO
			     "[RIDX: 2276]">
		       <COND (<IS? ,PRSO ,PLURAL>
			      <TELL "them">)
			     (T
			      <TELL "it">)>
		       <TELL "[RIDX: 2279]">
		       <SEE-TWINKLE?>
		       <RTRUE>)
		      (<VERB? SHOW>
		       <TELL CTHEI>
		       <COND (<PRSO? PARASOL>
			      <TELL " stares at the " D ,PARASOL
				    "[RIDX: 2281]" CR>
			      <RTRUE>)
			     (<PRSO? BAD-CRANE OCRANE>
			      <EYES-BRIGHTEN>
			      <PRINT ,PERIOD>
			      <RTRUE>)
			     (<NOT <IN? ,PARASOL ,PRSI>>
			      <BROLLY-BETTER>
			      <RTRUE>)>
		       <TELL " glances at " THEO
			     "[RIDX: 2283]">
		       <SEE-TWINKLE?>
		       <RTRUE>)
		      (<AND <VERB? FEED>
			    <PRSO? BAG>>
		       <TELL CTHEI " makes a face." CR>
		       <RTRUE>)
		      (<VERB? THROW THROW-OVER>
		       <COND (<G? <GETP ,PRSO ,P?SIZE> 3>
			      <MOVE ,PRSO ,HERE>
			      <TELL CTHEI " dodges the flying " D ,PRSO
			     	    "[RIDX: 2286]" ,PCR
			     	    CTHEO " lands at her feet." CR>
			      <RTRUE>)>
		       <TELL "She catches ">
		       <COND (<IS? ,PRSO ,PLURAL>
			      <TELL "them">)
			     (T
			      <TELL "it">)>
		       <TELL "[RIDX: 2291]">
		       <COND (<OR <PRSO? PARASOL OCRANE BAD-CRANE>
				  <IN? ,PARASOL ,PRSI>>
			      <TELL ,PCR>
			      <PERFORM ,V?GIVE ,PRSO ,PRSI>
			      <RTRUE>)>
		       <TELL " and tosses it back">
		       <COND (<VISIBLE? ,PARASOL>
			      <TELL
"[RIDX: 2293]" D ,PARASOL>)>
		       <PRINT ,PERIOD>
		       <RTRUE>)>
		<RFALSE>)
	       (<VERB? EXAMINE SEARCH>
		<TELL CTHEO "[RIDX: 2294]">
		<COND (<SEE-ANYTHING-IN? ,PRSO>
		       <TELL ". She's holding ">
		       <PRINT-CONTENTS ,PRSO>)>
		<PRINT ,PERIOD>
		<RTRUE>)
	       (<VERB? FOLLOW FIND WALK-TO>
		<COND (<OR <NOT <HERE? PLAYGROUND IN-SHELTER>>
			   <IS? ,PRSO ,NODESC>>
		       <REFERRING>
		       <RFATAL>)
		      (<IN? ,PRSO ,HERE>
		       <TELL "She's right here." CR>
		       <RTRUE>)
		      (<HERE? PLAYGROUND>
		       <DO-WALK ,P?EAST>
		       <RTRUE>)>
		<DO-WALK ,P?WEST>
		<RTRUE>)
	       (<VERB? WATCH>
		<I-GIRL <>>
		<RTRUE>)>
	 <MAKE ,GIRL ,SEEN>
	 <COND (<VERB? WAVE-AT POINT-AT BOW>
		<TELL CTHEO>
		<COND (<EQUAL? ,MINUTES 1>
		       <TELL " desperately ">)
		      (<PROB 50>
		       <TELL " cheerfully ">)
		      (T
		       <TELL "[RIDX: 2299]">)>
		<TELL "mimics your action." CR>
		<RTRUE>)
	       (<VERB? TAKE TOUCH>
		<GIRL-SHIES>
		<RTRUE>)
	       (<INTBL? ,PRSA ,TALKVERBS ,NTVERBS>
		<TELL CTHEO <PICK-NEXT ,GIRL-HUHS> ,PERIOD>
		<RFATAL>)
	       (<INTBL? ,PRSA ,HURTVERBS ,NHVERBS>
		<TELL "[RIDX: 2301]" CR><PRINT-ID "people:875">
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE GIRL-SHIES ()
	 <TELL CTHE ,GIRL " backs shyly away." CR>
	 <RTRUE>>

<ROUTINE START-MCRANE ()
	 <SETG P-IT-OBJECT ,CRANE>
	 <MAKE ,CRANE ,LIGHTED>
	 <MAKE ,CRANE ,SEEN>
	 <QUEUE I-NEWCRANE -1>
	 <UPDATE-SCORE 3>
	 <TELL CR "The edges of the " D ,CRANE
	       "[RIDX: 2305]" CR>
	 <RTRUE>>

<ROUTINE EYES-BRIGHTEN ()
	 <MAKE ,GIRL ,TOUCHED>
	 <TELL
"[RIDX: 2306]" D ,PRSO ". \"">
	 <HLIGHT ,H-ITALIC>
	 <TELL "Origami">
	 <HLIGHT ,H-NORMAL>
	 <TELL ",\" she squeaks">
	 <RTRUE>>

<ROUTINE SEE-TWINKLE? ()
	 <COND (<AND <PRSO? CRANE>
		     <IS? ,PRSO ,LIGHTED>>
		<TELL "[RIDX: 2310]">)>
	 <PRINT ,PERIOD>
	 <RTRUE>>

<ROUTINE BROLLY-BETTER ()
	 <COND (<VISIBLE? ,PARASOL>
		<SETG P-IT-OBJECT ,PARASOL>
		<BROLLY-INTEREST>)
	       (<VERB? GIVE>
		<TELL "[RIDX: 2311]" THEO>)
	       (T
		<TELL " gives " THEO " a timid glance">)>
	 <PRINT ,PERIOD>
	 <RTRUE>>

<ROUTINE BROLLY-INTEREST ()
	 <TELL "[RIDX: 2314]" THEO
	       " as she is in that " D ,PARASOL>
	 <RTRUE>>

<GLOBAL GIRL-HUHS:TABLE
	<LTABLE 2
	 "[RIDX: 2316]"
	 "[RIDX: 2317]"
	 "[RIDX: 2318]"
	 "[RIDX: 2319]">>

"*** BOY/GIANT ***"

<OBJECT BOY
	(LOC AT-TERRACE)
	(DESC "boy")
	(FLAGS PERSON LIVING TRYTAKE NOALL)
	(SYNONYM BOY CHILD KID)
	(ADJECTIVE YOUNG)
	(DESCFCN DESCRIBE-BOY)
	(GENERIC GENERIC-KID-F)
	(ACTION BOY-F)>

<ROUTINE GENERIC-KID-F (TBL)
	 <COND (<IS? ,HERE ,WINDY>
		<RETURN ,BOY>)
	       (<EQUAL? ,W?BOY ,P-NAM ,P-XNAM>
		<RETURN ,GIANT>)
	       (T
		<RFALSE>)>>

"[RIDX: 2322]"

<ROUTINE DESCRIBE-BOY ("OPTIONAL" (CONTEXT <>))
	 <COND (<EQUAL? .CONTEXT ,M-OBJDESC>
		<TELL "A ">
		<COND (<HERE? PROM>
		       <TELL "rather large ">)
		      (T
		       <TELL "young ">)>
		<TELL "[RIDX: 2327]" D ,PHONES
" and idly blowing " D ,SBUBBLE "[RIDX: 2329]"
D ,SOAPY-WATER " by his side">
		<COND (<T? ,IN-DISH?>
		       <TELL "[RIDX: 2331]">)>
		<PRINTC 46>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE BOY-F ("OPTIONAL" (CONTEXT <>))
	 <COND (<THIS-PRSI?>
		<COND (<VERB? GIVE SHOW FEED>
		       <TELL
"[RIDX: 2333]" CR>
		       <RTRUE>)>
		<RFALSE>)
	       (<AND <VERB? FOLLOW WHERE>
		     <IS? ,PRSO ,CHILLY>>
		<TELL "[RIDX: 2334]" CR>
		<RTRUE>)
	       (<VERB? EXAMINE WATCH>
		<I-BOY <>>
		<RTRUE>)
	       (<HANDLE-BOY?>
		<RTRUE>)
	       (<VERB? ALARM TOUCH KICK KNOCK KISS SQUEEZE HIT
		       TOUCH-TO MOVE PUSH PULL RAISE TAKE SHAKE>
		<PRINT-ID "people:991"><ANNOY-BOY>
		<RTRUE>)
	       (<INTBL? ,PRSA ,TALKVERBS ,NTVERBS>
		<TELL CTHE ,BOY " doesn't respond" ,AS-IF
		      "he can't hear you." CR>
		<RFATAL>)
	       (T
		<RFALSE>)>>

<ROUTINE HANDLE-BOY? ()
	 <COND (<VERB? WAVE-AT YELL>
		<TELL CTHEO "[RIDX: 2338]" CR>
		<RTRUE>)
	       (<VERB? LISTEN>
		<HEAR-GIANT-MUSIC>
		<RTRUE>)
	       (<VERB? SMELL>
		<TELL
"[RIDX: 2339]" CR><PRINT-ID "people:1009">
		<RTRUE>)
	       (<VERB? RAPE UNDRESS>
		<RAPE-SCOUT>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<OBJECT GIANT
	(LOC PROM)
	(DESC "boy")
	(FLAGS LIVING PERSON TRYTAKE NOALL)
	(SYNONYM GIANT BOY KID CHILD)
	(ADJECTIVE YOUNG GIANT BIG LARGE HUGE)
	(DESCFCN DESCRIBE-BOY)
	(GENERIC GENERIC-KID-F)
	(ACTION GIANT-F)>

<ROUTINE GIANT-F ("OPTIONAL" (CONTEXT <>))
	 <COND (<THIS-PRSI?>
		<COND (<VERB? GIVE SHOW FEED>
		       <BOY-NO-HEED>
		       <RTRUE>)
		      (<VERB? THROW THROW-OVER>
		       <REMOVE ,PRSO>
		       <TELL CTHEO " hits the " D ,PRSI
"[RIDX: 2344]" CR CR>
		       <HURT-GIANT>
		       <RTRUE>)
		      (<VERB? PUT-ON>
		       <PRSO-SLIDES-OFF-PRSI>
		       <RTRUE>)>
		<RFALSE>)
	       (<VERB? EXAMINE>
		<TELL
"[RIDX: 2345]" D ,PHONES ,PERIOD>
		<RTRUE>)
	       (<HANDLE-BOY?>
		<RTRUE>)
	       (<INTBL? ,PRSA ,TALKVERBS ,NTVERBS>
		<BOY-NO-HEED>
		<RFATAL>)
	       (<INTBL? ,PRSA ,MOVEVERBS ,NMVERBS>
		<TELL "[RIDX: 2346]">
		<ITALICIZE "big.">
		<CRLF>
		<RTRUE>)
	       (<VERB? TOUCH KICK CUT RIP KILL KNOCK SHAKE SQUEEZE BITE>
		<PRINT-ID "people:1057(a)" <VERB? KILL>><PRINT-ID "people:1057(b)" <NOT <VERB? KILL>>><HURT-GIANT>
		<RFATAL>)
	       (<VERB? WALK-TO CLIMB-ON STAND-ON SIT CLIMB-UP CLIMB-OVER
		       RIDE>
		<COND (<T? ,IN-DISH?>
		       <EXIT-DISH-FIRST>
		       <RTRUE>)>
		<TELL CTHEO
"[RIDX: 2350]">
		<THROW-TO-CHASM>
		<RFATAL>)
	       (T
		<RFALSE>)>>

<ROUTINE BOY-NO-HEED ()
	 <SAY-BOY-BOPS>
	 <TELL "[RIDX: 2351]" CR>
	 <RTRUE>>

<ROUTINE HURT-GIANT ()
	 <TELL CTHE ,GIANT
"[RIDX: 2352]">
	 <THROW-TO-CHASM>
	 <RTRUE>>

<ROUTINE EXIT-DISH-FIRST ()
	 <TELL "[RIDX: 2353]" CR>
	 <RTRUE>>

<ROUTINE THROW-TO-CHASM ()
	 <TELL ,PCR>
	 <SETG IN-DISH? <>>
	 <SETG HERE ,AT-CHASM>
	 <MOVE ,PLAYER ,HERE>
	 <COND (<ZERO? ,SUITED?>
		<DROP-ALL>)>
	 <V-LOOK>
	 <SETG P-IT-OBJECT ,NOT-HERE-OBJECT>
	 <SETG P-HIM-OBJECT ,NOT-HERE-OBJECT>
	 <TELL CR "[RIDX: 2354]" CR><PRINT-ID "people:1096">
	 <RTRUE>>

<ROUTINE HEAR-GIANT-MUSIC ()
	 <TELL
"[RIDX: 2356]" D ,PHONES ,PERIOD>
	 <RTRUE>>

<ROUTINE RAPE-SCOUT ()
	 <TELL
"[RIDX: 2357]" CR><PRINT-ID "people:1106">
	 <RTRUE>>

"*** ROADRUNNER ***"

<ROUTINE GENERIC-BIRD-F (TBL "AUX" (PTR 6) OBJ)
	 <COND (<EQUAL? ,W?ROADRUNNER ,P-NAM ,P-XNAM>
		<COND (<OR <EQUAL? ,P-ADJ ,W?DEAD ,W?DROWNED>
			   <EQUAL? ,P-XADJ ,W?DEAD ,W?DROWNED>>
		       <RETURN ,DMEEP>)>
		<RETURN ,MEEP>)>
	 <REPEAT ()
		 <SET OBJ <GET ,ALLBIRDS .PTR>>
		 <COND (<OR <EQUAL? ,P-IT-OBJECT .OBJ>
			    <VISIBLE? .OBJ>>
			<RETURN>)
		       (<DLESS? PTR 0>
			<RFALSE>)>>
	 <RETURN .OBJ>>

<GLOBAL ALLBIRDS:TABLE
	<PTABLE MCRANE BAD-CRANE OCRANE CRANE DMEEP MAGPIE MEEP>>

<OBJECT MEEP
	(DESC "roadrunner")
	(FLAGS NODESC LIVING TRYTAKE PERSON NOALL)
	(SYNONYM BIRD ROADRUNNER)
	(VALUE 0)
	(SIZE 5)
	(MASS 5)
	(GENERIC GENERIC-BIRD-F)
	(DESCFCN DESCRIBE-MEEP)
	(CONTFCN 0)
	(ACTION MEEP-F)>

"[RIDX: 2362]"

<ROUTINE DESCRIBE-MEEP ("OPTIONAL" (CONTEXT <>))
	 <COND (<EQUAL? .CONTEXT ,M-OBJDESC>
		<MAKE ,MEEP ,SEEN>
		<TELL ,CTHEMEEP>
		<COND (<T? ,APPETITE>
		       <SAY-PECKS <>>
		       <RTRUE>)>
		<TELL <PICK-NEXT <GET ,MEEP-TABLE 3>>>
		<PRINTC 46>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE OPEN-FOR-MEEP (X)
	 <TELL "You'd have to open " THE .X
	       " for the " D ,MEEP " first." CR>
	 <RTRUE>>

<ROUTINE AFTER-YOU ()
	 <TELL ,CTHEMEEP
"[RIDX: 2367]" CR>
	 <RTRUE>>

<ROUTINE MEEP-F ("OPTIONAL" (CONTEXT <>) "AUX" L X)
	 <SET X <FIRST? ,MEEP>>
	 <COND (<EQUAL? .CONTEXT ,M-WINNER>
		<COND (<OR <VERB? TAKE>
			   <AND <VERB? GET-FOR>
				<PRSI? ME>>>
		       <SET L <LOC ,PRSO>>
		       <COND (<ZERO? .L>
			      <PERPLEXED ,MEEP>
			      <RFATAL>)
			     (<EQUAL? .L ,MEEP>
			      <TELL ,CTHEMEEP "already has " THEO ,PERIOD>
			      <RFATAL>)
			     (<OR <NOT <IS? ,PRSO ,TAKEABLE>>
				  <G? <GETP ,PRSO ,P?SIZE> 3>>
			      <SOUR-LOOK>
			      <RFATAL>)
			     (<AND <IN? ,MEEP ,CAGE>
				   <NOT <IS? ,CAGE ,OPENED>>>
			      <OPEN-FOR-MEEP ,CAGE>
			      <RFATAL>)
			     (<EQUAL? .L ,PLAYER>
			      <TELL ,CTHEMEEP
"couldn't reach " THEO "[RIDX: 2372]" CR>
			      <RFATAL>)
			     (<AND <IS? .L ,CONTAINER>
				   <NOT <IS? .L ,OPENED>>>
			      <OPEN-FOR-MEEP .L>
			      <RFATAL>)
			     (<IN? .L ,PLAYER>
			      <TELL "[RIDX: 2373]" THEO>
			      <COND (<IS? .L ,SURFACE>
				     <TELL " off ">)
				    (T
				     <TELL " out of ">)>
			      <TELL THE .L " first." CR>
			      <RFATAL>)
			     (<MEEP-GETS-TKEY? ,PRSO>
			      <RFATAL>)>
		       <MOVE ,PRSO ,HERE>
		       <UNMAKE ,PRSO ,NODESC>
		       <TELL ,CTHEMEEP "nods brightly, ">
		       <COND (<T? .X>
			      <MOVE .X <LOC ,MEEP>>
			      <TELL "drops " THE .X ", ">)>
		       <TELL "picks up " THEO " and deposits ">
		       <COND (<IS? ,PRSO ,PLURAL>
			      <TELL "them ">)
			     (T
			      <TELL "it ">)>
		       <TELL "at your feet." CR>
		       <RFATAL>)
		      (<AND <VERB? SGET-FOR>
			    <PRSO? ME>>
		       <PERFORM ,V?TAKE ,PRSI>
		       <RFATAL>)
		      (<OR <VERB? DROP THROW THROW-OVER PUT-UNDER
				  PUT-BEHIND PUT-ON POCKET>
			   <AND <VERB? GIVE FEED>
			    	<PRSI? ME>>>
		       <MOVE ,PRSO <LOC ,MEEP>>
		       <UNMAKE ,PRSO ,NODESC>
		       <TELL ,CTHEMEEP "drops " THEO>
		       <COND (<IN? ,MEEP ,HERE>
			      <TELL " at your feet">)>
		       <COND (<NOT <VERB? DROP GIVE FEED>>
			      <TELL "[RIDX: 2387]">)>
		       <PRINT ,PERIOD>
		       <RFATAL>)
		      (<AND <VERB? SGIVE SFEED>
			    <PRSO? ME>>
		       <PERFORM ,V?DROP ,PRSI>
		       <RFATAL>)
		      (<VERB? EXAMINE WATCH LOOK-ON LOOK-UNDER LOOK-BEHIND
			      LOOK-DOWN LOOK-UP LOOK-OUTSIDE LOOK SEARCH
			      COUNT READ>
		       <COND (<PRSO? MEEP>
			      <PERPLEXED ,PRSO>
			      <RFATAL>)>
		       <TELL ,CTHEMEEP>
		       <COND (<PRSO? BAG>
			      <TELL "[RIDX: 2388]" CR>
			      <RFATAL>)>
		       <TELL "peers ">
		       <COND (<VERB? LOOK-UNDER>
			      <TELL "under ">)
			     (<VERB? LOOK-BEHIND>
			      <TELL "behind ">)
			     (T
			      <TELL "at ">)>
		       <TELL THEO " as best it can." CR>
		       <RFATAL>)
		      (<VERB? WALK WALK-TO>
		       <COND (<AND <PRSO? TKEY BBOX SBUNK>
				   <MEEP-GETS-TKEY? ,TKEY>>
			      <RFATAL>)>
		       <AFTER-YOU>
		       <RFATAL>)
		      (<VERB? ENTER THROUGH STAND-UNDER>
		       <COND (<AND <PRSO? SBUNK>
				   <MEEP-GETS-TKEY? ,TKEY>>
			      <RFATAL>)>
		       <AFTER-YOU>
		       <RFATAL>)
		      (<VERB? CROSS CLIMB-OVER CLIMB-DOWN CLIMB-UP CLIMB-ON
			      STAND-ON FOLLOW FLY WALK-AROUND EXIT LEAVE RIDE>
		       <AFTER-YOU>
		       <RFATAL>)
		      (<VERB? EAT TASTE DRINK DRINK-FROM SUCK KISS PISS
			      RAPE>
		       <TELL ,CTHEMEEP>
		       <COND (<NOT <VERB? EAT TASTE>>
			      T)
			     (<T? ,APPETITE>
			      <TELL "is already eating." CR>
			      <RFATAL>)
			     (<PRSO? BAG>
			      <TELL "[RIDX: 2395]" CR>
			      <RFATAL>)>
		       <TELL "[RIDX: 2396]" CR><PRINT-ID "people:1285">
		       <RFATAL>)
		      (<VERB? LISTEN SMELL INHALE>
		       <TELL ,CTHEMEEP>
		       <COND (<VERB? LISTEN>
			      <TELL "listens ">)
			     (T
			      <TELL "sniffs the air ">)>
		       <TELL "[RIDX: 2400]" CR>
		       <RFATAL>)
		      (<ADDRESS-MEEP?>
		       <RFATAL>)>
		<MEEP-COCKS>
		<RFATAL>)
	       (<THIS-PRSI?>
		<COND (<VERB? GIVE>
		       <COND (<IN? ,PRSI ,TS6>
			      <CANT-FROM-HERE>
			      <RTRUE>)
			     (<G? <GETP ,PRSO ,P?SIZE> 3>
			      <SOUR-LOOK>
			      <RTRUE>)
			     (<PRSO? BAG>
			      <GIVE-PRSO-TO-MEEP>
			      <RTRUE>)>
		       <TELL ,CTHEMEEP>
		       <COND (<T? .X>
			      <MOVE .X <LOC ,PRSI>>
			      <TELL "drops " THE .X " and ">)>
		       <MOVE ,PRSO ,PRSI>
		       <TELL "snatches " THEO
			     "[RIDX: 2404]" CR>
		       <RTRUE>)
		      (<VERB? FEED>
		       <COND (<IN? ,PRSI ,TS6>
			      <CANT-FROM-HERE>
			      <RTRUE>)
			     (<NOT <PRSO? BAG>>
			      <NOT-LIKELY ,PRSI
				   "[RIDX: 2405]">
			      <RTRUE>)>
		       <GIVE-PRSO-TO-MEEP>
		       <RTRUE>)
		      (<VERB? SHOW>
		       <TELL ,CTHEMEEP>
		       <COND (<PRSO? BAG>
			      <TELL "hops with excitement">)
			     (<PRSO? RUBY EMERALD MARKER KNIFE SDRIVER SCOIN
				     WTK WALLET PHOTO>
			      <TELL "nods slyly">)
			     (<PROB 50>
			      <TELL "glances at " THEO
				    "[RIDX: 2409]" CR>
			      <RTRUE>)
			     (T
			      <TELL "cocks its head">)>
		       <TELL " when you show it " THEO ,PERIOD>
		       <RTRUE>)
		      (<VERB? THROW THROW-OVER>
		       <MOVE ,PRSO ,HERE>
		       <TELL ,CTHEMEEP>
		       <COND (<G? <GETP ,PRSO ,P?SIZE> 3>
			      <TELL "dodges " THEO
				    "[RIDX: 2413]" CR>
			      <RTRUE>)
			     (<T? .X>
			      <MOVE .X <LOC ,PRSI>>
			      <TELL "drops " THE .X ", ">)>
		       <TELL "retrieves " THEO
			     "[RIDX: 2417]" CR>
		       <RTRUE>)>
		<RFALSE>)
	       (<AND <VERB? TELL>
		     <T? ,P-CONT>>
		<COND (<IN? ,PRSO ,TS6>
		       <MEEP-COCKS>
		       <RFATAL>)
		      (<T? ,APPETITE>
		       <TELL ,CTHEMEEP>
		       <BUSY-EATING>
		       <RFATAL>)>
		<RFALSE>)
	       (<VERB? TELL-ABOUT ASK-ABOUT ASK-FOR>
		<COND (<PRSI? PRSO ME>
		       <PERPLEXED ,PRSO>
		       <RTRUE>)>
		<SHOW-TO-MEEP ,PRSI>
		<RFATAL>)
	       (<ADDRESS-MEEP?>
		<RFATAL>)
	       (<VERB? WATCH>
		<UNMAKE ,PRSO ,SEEN>
		<I-TMEEP <>>
		<RTRUE>)
	       (<VERB? EXAMINE>
		<TELL ,CTHEMEEP
"[RIDX: 2418]">
		<COND (<T? .X>
		       <TELL ". It's holding " A .X " in its beak">)
		      (<T? ,APPETITE>
		       <TELL
"[RIDX: 2421]">)>
		<PRINT ,PERIOD>
		<RTRUE>)
	       (<AND <VERB? FOLLOW>
		     <NOT <VISIBLE? ,PRSO>>>
		<V-WALK-AROUND>
		<RTRUE>)
	       (<VERB? TOUCH KISS>
		<TELL ,CTHEMEEP "[RIDX: 2422]" CR><PRINT-ID "people:1394">
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE ADDRESS-MEEP? ()
	 <COND (<INTBL? ,PRSA ,TALKVERBS ,NTVERBS>
		<TELL "The bird ">
		<COND (<PROB 50>
		       <TELL "chatter">)
		      (T
		       <TELL "cluck">)>
		<TELL "[RIDX: 2427]" CR>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE MEEP-COCKS ()
	 <PCLEAR>
	 <TELL ,CTHEMEEP <PICK-NEXT <GET ,MEEP-TABLE 5>>
	       ", but " <PICK-NEXT <GET ,MEEP-TABLE 6>> ,PERIOD>
	 <RTRUE>>

<ROUTINE GIVE-PRSO-TO-MEEP ("AUX" L)
	 <SET L <LOC ,PRSI>>
	 <MOVE ,PRSO .L>
	 <TELL "You put the " D ,PRSO " ">
	 <COND (<EQUAL? .L ,HERE>
		<TELL "on the ">
		<COND (<IS? ,HERE ,INDOORS>
		       <TELL D ,FLOOR>)
		      (T
		       <TELL D ,GROUND>)>)
	       (T
		<COND (<IS? .L ,SURFACE>
		       <TELL "o">)
		      (T
		       <TELL "i">)>
		<TELL "n " THE .L>)>
	 <TELL " beside the " D ,PRSI ,PERIOD>
	 <RTRUE>>

<ROUTINE SOUR-LOOK ()
	 <TELL ,CTHEMEEP
"[RIDX: 2437]">
	 <COND (<IS? ,PRSO ,PLURAL>
		<TELL "all of ">)>
	 <TELL THEO " in its beak." CR>
	 <RTRUE>>

<ROUTINE MEEP-GETS-TKEY? (OBJ "AUX" X)
	 <COND (<AND <EQUAL? .OBJ ,TKEY>
		     <IS? .OBJ ,SEEN>
		     <NOT <IS? .OBJ ,TOUCHED>>
		     <IN? ,MEEP ,S100>>
		<MAKE .OBJ ,TOUCHED>
		<UNMAKE .OBJ ,NODESC>
		<MOVE .OBJ ,S100>
		<SETG P-IT-OBJECT .OBJ>
		<SET X <FIRST? ,MEEP>>
		<TELL ,CTHEMEEP>
		<COND (<T? .X>
		       <MOVE .X <LOC ,MEEP>>
		       <TELL "drops " THE .X " and ">)>
		<TELL "[RIDX: 2443]" D ,BREATH
"[RIDX: 2444]" D ,SBUNK
,PTHE "[RIDX: 2445]"
D ,PADLOCK ,PCR "Triumphantly, the " D ,MEEP
"[RIDX: 2447]" CR>
		<UPDATE-SCORE 3>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE PERPLEXED (OBJ)
	 <TELL CTHE .OBJ " looks perplexed." CR>
	 <RTRUE>>

<ROUTINE BUSY-EATING ()
	 <TELL "[RIDX: 2449]" CR>
	 <RTRUE>>

<ROUTINE SHOW-TO-MEEP (OBJ "AUX" X)
	 <MAKE ,MEEP ,SEEN>
	 <COND (<EQUAL? .OBJ ,INTDIR ,RIGHT ,LEFT>
		<COND (<AND <EQUAL? ,P-DIRECTION ,P?NE>
			    <HERE? S100>
			    <IS? ,TKEY ,SEEN>
			    <NOT <IS? ,TKEY ,TOUCHED>>>
		       <SET OBJ ,TKEY>)
		      (T
		       <LOOKS-INTDIR ,MEEP>
		       <RTRUE>)>)
	       (<OR <ZERO? .OBJ>
		    <NOT <VISIBLE? .OBJ>>>
		<PERPLEXED ,MEEP>
		<RTRUE>)>
	 <COND (<MEEP-GETS-TKEY? .OBJ>
		<RTRUE>)>
	 <TELL ,CTHEMEEP>
	 <COND (<IN? .OBJ ,MEEP>
		<MOVE .OBJ <LOC ,MEEP>>
		<TELL "drops " THE .OBJ>
		<COND (<IN? ,MEEP ,HERE>
		       <TELL " at your feet">)>
		<PRINT ,PERIOD>
		<RTRUE>)
	       (<T? ,APPETITE>
		<BUSY-EATING>
		<RTRUE>)
	       (<AND <IN? ,MEEP ,HERE>
		     <IN? .OBJ ,HERE>
		     <IS? .OBJ ,TAKEABLE>
		     <L? <GETP .OBJ ,P?SIZE> 4>>
		<SET X <FIRST? ,MEEP>>
		<COND (<T? .X>
		       <MOVE .X ,HERE>
		       <TELL "drops " THE .X ", ">)>
		<TELL "picks up " THE .OBJ "[RIDX: 2417]" CR>
		<RTRUE>)>
	 <TELL "glances at " THE .OBJ
"[RIDX: 2458]" CR>
	 <RTRUE>>

"*** DOG ***"

<OBJECT DOG
	(LOC W100)
	(DESC "German shepherd")
	(FDESC
"[RIDX: 2461]")
	(FLAGS LIVING PERSON TRYTAKE NOALL)
	(SYNONYM DOG WATCHDOG SHEPHERD MUTT POOCH CANINE ANIMAL
	 	 HELLHOUND ALEXIS WOLF)
	(ADJECTIVE GERMAN GREAT BIG LARGE HUGE ENORMOUS HELL)
	(ACTION DOG-F)>

"[RIDX: 2462]"

<ROUTINE DOG-F ()
	 <COND (<OR <NOUN-USED? ,W?HELLHOUND ,W?ALEXIS ,W?WOLF>
		    <ADJ-USED? ,W?HELL>>
		<V-WISH>
		<RFATAL>)>
	 <MAKE ,DOG ,SEEN>
	 <COND (<THIS-PRSI?>
		<COND (<VERB? SHOW>
		       <TELL "[RIDX: 2463]" CR>
		       <RTRUE>)
		      (<VERB? GIVE FEED>
		       <MOVE ,PRSO ,W100>
		       <UNMAKE ,PRSI ,SEEN>
		       <TELL "You deposit " THEO
			     "[RIDX: 2465]" CR>
		       <RTRUE>)
		      (<VERB? THROW THROW-OVER>
		       <MOVE ,PRSO ,HERE>
		       <TELL "You toss " THE ,PRSO>
		       <COND (<VERB? THROW-OVER>
			      <TELL " over ">)
			     (T
			      <TELL " at ">)>
		       <TELL
"[RIDX: 2469]" THE ,PRSO
"[RIDX: 2470]" CR>
		       <RTRUE>)>
		<RFALSE>)
	       (<VERB? EXAMINE WATCH>
		<TELL
"[RIDX: 2471]" D ,BHOUSE
"[RIDX: 2472]" CR>
		<RTRUE>)
	       (<INTBL? ,PRSA ,TALKVERBS ,NTVERBS>
		<COND (<NOT <IS? ,PRSO ,TOUCHED>>
		       <ALMOST-WAKE-DOG>
		       <RFATAL>)>
		<WAKE-DOG>
		<RFATAL>)
	       (<VERB? TOUCH SQUEEZE SHAKE KISS ADJUST
		       RAISE PUSH PULL>
		<COND (<NOT <IS? ,PRSO ,TOUCHED>>
		       <ALMOST-WAKE-DOG T>
		       <RTRUE>)>
		<WAKE-DOG T>
		<RTRUE>)
	       (<VERB? HIT CUT RIP KILL KICK>
		<TELL
"[RIDX: 2473]"><PRINT-ID "people:1584">
		<COND (<VERB? KICK>
		       <TELL D ,FEET>)
		      (<ZERO? ,PRSI>
		       <TELL D ,HANDS>)
		      (T
		       <TELL THEI>)>
		<TELL "[RIDX: 2475]">
		<COND (<AND <NOT <EQUAL? ,PRSI <> ,HANDS ,FEET>>
			    <L? <GETP ,PRSI ,P?SIZE> 3>>
		       <TELL
"[RIDX: 2476]" A ,PRSI ")">)>
		<TELL
"[RIDX: 2478]" CR>
		<RTRUE>)
	       (<VERB? LISTEN>
		<TELL CTHEO "[RIDX: 2479]" CR>
		<RTRUE>)
	       (<VERB? SMELL>
		<TELL CTHEO "[RIDX: 2480]" CR>
		<RTRUE>)
	       (<VERB? RAPE>
		<PRINT-ID "people:1606"><VOICE-MUTTERS "Okay, sicko">
		<WAKE-DOG T>
		<RTRUE>)
	       (<INTBL? ,PRSA ,TOUCHVERBS ,NTOUCHES>
		<TELL
"[RIDX: 2483]" ,CHANGES>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE ALMOST-WAKE-DOG ("OPTIONAL" (TOUCH <>))
	 <MAKE ,PRSO ,TOUCHED>
	 <TELL CTHE ,DOG "[RIDX: 2485]">
	 <COND (<T? .TOUCH>
		<AT-YOUR-TOUCH>)
	       (T
		<AT-YOUR-VOICE>)>
	 <TELL "[RIDX: 2486]" CR>
	 <RTRUE>>

<ROUTINE AT-YOUR-TOUCH ()
	 <TELL " at your touch. ">
	 <RTRUE>>

<ROUTINE WAKE-DOG ("OPTIONAL" (TOUCH <>))
	 <TELL CTHE ,DOG "[RIDX: 2489]">
	 <COND (<T? .TOUCH>
		<AT-YOUR-TOUCH>)
	       (T
		<AT-YOUR-VOICE>)>
	 <TELL
"[RIDX: 2490]" ,PCR>
	 <ITALICIZE "Click.">
	 <TELL
"[RIDX: 2492]" CR>
	 <DOG-ALERT>
	 <RTRUE>>

<ROUTINE DOG-ALERT ()
	 <TELL CR
"[RIDX: 2493]">
	 <AKC>
	 <COND (<HEAR-BAKER?>
		<HEAR-BARKING>)>
	 <TELL CR
"[RIDX: 2494]" D ,SLIGHT
"[RIDX: 2495]" CR>
	 <HOLD-IT>
	 <KINDA-SPY>
	 <SURROUNDED>
	 <RTRUE>>

"*** BARROW WIGHT ***"

<OBJECT WIGHT
	(LOC IN-BARROW)
	(DESC "barrow wight")
	(FLAGS NODESC PERSON LIVING)
	(SYNONYM WIGHT CREATURE MONSTER BEING FORM HUMANOID EYE NERVE)
	(ADJECTIVE BARROW UNDEAD HUMAN STOOPED MALIGNANT DANGLING)
	(DESCFCN DESCRIBE-WIGHT)
	(CONTFCN IN-WIGHT)
	(ACTION WIGHT-F)>

"[RIDX: 2498]"

<ROUTINE IN-WIGHT ("OPTIONAL" (CONTEXT <>))
	 <COND (<NOT <EQUAL? .CONTEXT ,M-CONT>>
		<RFALSE>)
	       (<INTBL? ,PRSA ,TOUCHVERBS ,NTOUCHES>
		<VERY-CLOSE>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE VERY-CLOSE ()
	 <TELL
"[RIDX: 2500]" D ,WIGHT " to do that." CR>
	 <RTRUE>>

<ROUTINE DESCRIBE-WIGHT ("OPTIONAL" (CONTEXT <>))
	 <COND (<NOT <EQUAL? .CONTEXT ,M-OBJDESC>>
		<RFALSE>)>
	 <TELL "A " D ,WIGHT " is ">
	 <COND (<PROB 50>
		<COND (<PROB 50>
		       <TELL "lurking in">)
		      (T
		       <TELL "skulking about in">)>)
	       (T
		<COND (<PROB 50>
		       <TELL "eyeing you from">)
		      (T
		       <TELL "slavering noisily in">)>)>
	 <TELL "[RIDX: 2509]">
	 <WIGHT-HAS>
	 <PRINTC 46>
	 <RTRUE>>

<ROUTINE WIGHT-HAS ()
	 <COND (<SEE-ANYTHING-IN? ,WIGHT>
		<TELL ". It's clutching ">
		<PRINT-CONTENTS ,WIGHT>
		<TELL "[RIDX: 2511]">)>
	 <RTRUE>>

<ROUTINE WIGHT-F ("OPTIONAL" (CONTEXT <>))
	 <MAKE ,WIGHT ,SEEN>
	 <COND (<THIS-PRSI?>
		<COND (<VERB? SHOW POINT-AT SHINE-AT>
		       <COND (<AND <VERB? SHINE-AT>
				   <NOT <PRSO? SHARD LAMP>>>
			      <RFALSE>)>
		       <TELL CTHEI>
		       <COND (<IS? ,PRSO ,LIGHTED>
			      <TELL
"[RIDX: 2513]" CR><PRINT-ID "people:1726">
			      <RTRUE>)>
		       <TELL " scowls at " THEO
			     "[RIDX: 2516]" CR>
		       <RTRUE>)
		      (<VERB? GIVE FEED>
		       <TELL CTHEI>
		       <COND (<IS? ,PRSO ,LIGHTED>
			      <TELL
"[RIDX: 2517]" THEO ,PERIOD>
		       	      <RTRUE>)
			     (<PRSO? GARLIC ICE SKINK>
			      <VANISH>
			      <TELL " crams " THEO
				    "[RIDX: 2519]" CR>
			      <RTRUE>)>
		       <MOVE ,PRSO ,OSSUARY>
		       <SETG P-IT-OBJECT ,NOT-HERE-OBJECT>
		       <TELL " clutches " THEO
"[RIDX: 2521]" CR>
		       <RTRUE>)
		      (<VERB? THROW THROW-OVER PUSH-TO>
		       <COND (<DONT-HAVE? ,PRSO>
			      <YOUD-HAVE-TO "be holding" ,PRSO>
			      <RTRUE>)>
		       <TELL CTHEI " dodges " THEO>
		       <COND (<IS? ,PRSO ,LIGHTED>
			      <MOVE ,PRSO ,HERE>
			      <TELL
"[RIDX: 2524]" CR>
			      <COND (<PRSO? LAMP>
				     <MAKE ,PRSO ,CHILLY>
				     <UNMAKE ,PRSO ,LIGHTED>
				     <SETG BEAM 0>
				     <DEQUEUE I-HARDHAT>
				     <TELL CR "You hear a faint ">
				     <ITALICIZE "pop">
				     <TELL " as the " D ,PRSO
					   " strikes the ground." CR>
				     <SAY-IF-HERE-LIT>)>
			      <RTRUE>)>
		       <TELL ", snatches it up ">
		       <THROWS-BACK ,PRSO>
		       <RTRUE>)>
		<RFALSE>)
	       (<VERB? EXAMINE WATCH SEARCH>
		<TELL "One of the " D ,PRSO
"[RIDX: 2531]" D ,TUNNEL>
		<WIGHT-HAS>
		<PRINT ,PERIOD>
		<RTRUE>)
	       (<VERB? WAVE-AT BOW>
		<TELL CTHEO
"[RIDX: 2532]" CR>
		<RTRUE>)
	       (<VERB? TOUCH KNOCK KICK SQUEEZE MOVE PUSH SHAKE
		       ADJUST SWING>
		<VERY-CLOSE>
		<RTRUE>)
	       (<VERB? HIT KILL>
		<COND (<EQUAL? ,PRSI <> ,HANDS ,FEET>
		       <VERY-CLOSE>
		       <RTRUE>)
		      (<IS? ,PRSI ,LIGHTED>
		       <TELL CTHEO
"[RIDX: 2533]" CR><PRINT-ID "people:1791">
		       <RTRUE>)>
		<TELL CTHEO " grapples " THEI " away from you ">
		<THROWS-BACK ,PRSI>
		<RTRUE>)
	       (<INTBL? ,PRSA ,TALKVERBS ,NTVERBS>
		<WIGHT-RESPONDS>
		<RFATAL>)
	       (<VERB? KISS RAPE>
		<TELL "[RIDX: 2537]" D ,PRSO
"[RIDX: 2538]"><PRINT-ID "people:1801">
		<PRINT-ID "people:1802"><JIGS-UP>
		<RFATAL>)
	       (<VERB? SMELL>
		<TELL CTHEO "[RIDX: 2541]" CR><PRINT-ID "people:1805">
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE WIGHT-RESPONDS ()
	 <TELL CTHE ,WIGHT " snarls in reply." CR>
	 <RTRUE>>

<ROUTINE THROWS-BACK (OBJ)
	 <MOVE .OBJ ,HERE>
	 <TELL
"[RIDX: 2544]"
,AGROUND ,PERIOD>
	 <RTRUE>>

"[RIDX: 2545]"

<OBJECT OPPIE-THINGS
	(LOC OPPIE)
	(DESC "that")
	(FLAGS NODESC NOARTICLE)
	(SYNONYM PIPE HAT)
	(ADJECTIVE PORKPIE MAN\'S HIS)
	(ACTION USELESS)>

<OBJECT OPPIE
	(LOC S100)
	(DESC "thin man")
	(FLAGS NODESC PERSON)
	(FDESC
"[RIDX: 2548]")
	(SYNONYM MAN MISTER PERSON MALE OPPENHEIM OPPIE SIR)
	(ADJECTIVE ROBERT MISTER MR DR DOCTOR
	 	   DOC J JULIUS THIN SKINNY GAUNT)
	(GENERIC GENERIC-GI-F)
	(ACTION OPPIE-F)>

"[RIDX: 2549]"

<ROUTINE GENERIC-GI-F (TBL)
	 <COND (<IS? ,OPPIE ,NODESC>
		<RETURN ,GIS>)>
	 <RETURN ,OPPIE>>

<ROUTINE GONE-NOW (OBJ)
	 <SETG P-IT-OBJECT ,NOT-HERE-OBJECT>
	 <TELL CTHE .OBJ "[RIDX: 2550]" CR>
	 <RTRUE>>

<ROUTINE OPPIE-F ("OPTIONAL" (CONTEXT <>))
	 <COND (<NOT <IS? ,OPPIE ,SEEN>>
		<CANT-SEE-ANY>
		<RFATAL>)
	       (<IS? ,OPPIE ,NODESC>
		<SETG P-HIM-OBJECT ,NOT-HERE-OBJECT>
		<GONE-NOW ,OPPIE>
		<RFATAL>)
	       (<AND <NOT <IS? ,OPPIE ,CHILLY>>
		     <OR <NOUN-USED? ,W?OPPIE ,W?OPPENHEIM>
			 <ADJ-USED? ,W?J ,W?ROBERT ,W?DR>
			 <ADJ-USED? ,W?DOCTOR ,W?DOC ,W?JULIUS>>>
		<MAKE ,OPPIE ,CHILLY>
		<VOICE-MUTTERS "Indeed">)>
	 <COND (<VERB? WATCH>
		<I-OPPIE <>>
		<RTRUE>)
	       (<VERB? EXAMINE>
		<TELL CTHEO " near the " D ,SHELTER
"[RIDX: 2554]" CR>
		<COND (<NOT <IS? ,OPPIE ,BORING>>
		       <MAKE ,OPPIE ,BORING>
		       <SETG DO-WINDOW <GET ,QUOTES ,WHITMAN>>
		       <RFATAL>)>
		<RTRUE>)>
	 <RETURN <HANDLE-GIS?>>>

<OBJECT GIS
	(LOC S100)
	(DESC "GIs")
	(FLAGS NODESC LIVING PERSON PLURAL)
	(SYNONYM GIS GI DRIVERS DRIVER SOLDIER SOLDIERS TROOP TROOPS
	 	 MAN MISTER MEN)
	(ADJECTIVE MILITARY NERVOUS YOUNG NERVOUS\-LOOKING)
	(GENERIC GENERIC-GI-F)
	(ACTION GIS-F)>

"[RIDX: 2556]"

<ROUTINE GIS-F ("OPTIONAL" (CONTEXT <>))
	 <COND (<VERB? EXAMINE WATCH>
		<TELL CTHEO " in the ">
		<COND (<L? ,MINUTES 28>
		       <TELL D ,JEEPS>)
		      (T
		       <TELL D ,TRENCHES>)>
		<TELL
"[RIDX: 2559]">
		<COND (<L? ,MINUTES 28>
		       <TELL
"[RIDX: 2560]">)>
		<TELL "[RIDX: 2561]"
D ,SBUNK " and the " D ,HORIZON "[RIDX: 2563]" D ,BINOS
"[RIDX: 2564]" CR>
		<RTRUE>)>
	 <RETURN <HANDLE-GIS?>>>

<ROUTINE HANDLE-GIS? ()
	 <COND (<THIS-PRSI?>
		<COND (<VERB? GIVE SHOW FEED>
		       <CANT-FROM-HERE>
		       <RTRUE>)>
		<RFALSE>)
	       (<OR <VERB? SMELL SEARCH LOOK-BEHIND LOOK-UNDER>
		    <INTBL? ,PRSA ,TOUCHVERBS ,NTOUCHES>>
		<CANT-FROM-HERE>
		<RTRUE>)
	       (<ENTERING?>
		<DO-WALK ,P?NE>
		<RTRUE>)
	       (<NOT <INTBL? ,PRSA ,TALKVERBS ,NTVERBS>>
		<RFALSE>)>
	 <COND (<PRSO? GIS>
		<TELL "One of the " D ,PRSO>)
	       (T
		<TELL CTHEO>)>
	 <COND (<NOT <IS? ,GIS ,SEEN>>
		<MAKE ,GIS ,SEEN>
		<TELL " starts">
		<AT-YOUR-VOICE>
	 	<TELL "[RIDX: 2567]">
		<COND (<PRSO? GIS>
		       <TELL "other ">)
		      (T
		       <TELL "surrounding ">)>
		<TELL D ,GIS
"[RIDX: 2570]" D ,INTDIR
"[RIDX: 2571]" CR>
		<RFATAL>)>
	  <TELL " points in your " D ,INTDIR>
	  <AT-YOUR-VOICE>
	  <TELL "[RIDX: 2573]" CR>
	  <SURROUNDED>
	  <RFATAL>>

<ROUTINE AT-YOUR-VOICE ()
	 <TELL "[RIDX: 2574]">
	 <RTRUE>>