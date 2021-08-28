"[RIDX: 715]"

<GLOBAL C-TABLE:TABLE <ITABLE NONE 100>>
<CONSTANT C-TABLELEN 100>
<GLOBAL C-INTS:NUMBER 100>

<CONSTANT C-INTLEN 4>	; "[RIDX: 716]"
<CONSTANT C-RTN 0>	; "[RIDX: 717]"
<CONSTANT C-TICK 1>	; "Offset of count."

<ROUTINE DEQUEUE (RTN)
	 <SET RTN <QUEUED? .RTN>>
	 <COND (<T? .RTN>
		<PUT .RTN ,C-RTN 0>)>
	 <RTRUE>>

<ROUTINE QUEUED? (RTN "AUX" C E)
	 <SET E <REST ,C-TABLE ,C-TABLELEN>>
	 <SET C <REST ,C-TABLE ,C-INTS>>
	 <REPEAT ()
		 <COND (<EQUAL? .C .E>
			<RFALSE>)
		       (<EQUAL? <GET .C ,C-RTN> .RTN>
			<COND (<ZERO? <GET .C ,C-TICK>>
			       <RFALSE>)
			      (T
			       <RETURN .C>)>)>
		 <SET C <REST .C ,C-INTLEN>>>>

"[RIDX: 720]"

<ROUTINE QUEUE (RTN TICK "AUX" C E (INT <>))
	 <SET E <REST ,C-TABLE ,C-TABLELEN>>
	 <SET C <REST ,C-TABLE ,C-INTS>>
	 <REPEAT ()
		 <COND (<EQUAL? .C .E>
			<COND (<T? .INT>
			       <SET C .INT>)
			      (T
			       <COND (<L? ,C-INTS ,C-INTLEN>
				      <TELL "[RIDX: 722]" CR>)>
			       <SETG C-INTS <- ,C-INTS ,C-INTLEN>>
			       <SET INT <REST ,C-TABLE ,C-INTS>>)>
			<PUT .INT ,C-RTN .RTN>
			<RETURN>)
		       (<EQUAL? <GET .C ,C-RTN> .RTN>
			<SET INT .C>
			<RETURN>)
		       (<ZERO? <GET .C ,C-RTN>>
			<SET INT .C>)>
		 <SET C <REST .C ,C-INTLEN>>>
	 <COND (%<COND (<GASSIGNED? ZILCH>
			'<G? .INT ,CLOCK-HAND>)
		       (ELSE
			'<L=? <LENGTH .INT> <LENGTH ,CLOCK-HAND>>)>
		<SET TICK <- <+ .TICK 3>>>)>
	 <PUT .INT ,C-TICK .TICK>
	 .INT>

<GLOBAL CLOCK-WAIT?:FLAG <>>
<GLOBAL CLOCK-HAND:NUMBER <>>
<GLOBAL HOURS:NUMBER 15>
<GLOBAL MINUTES:NUMBER 30>
<GLOBAL SECONDS:NUMBER 0>
<GLOBAL FREEZE?:FLAG <>>
<GLOBAL QUIET?:FLAG <>>

<ROUTINE DO-MOVES (N "AUX" X)
	 <SETG OLD-HERE <>>
	 <SETG QUIET? T>
	 <REPEAT ()
		 <COND (<ZERO? .N>
			<RETURN>)>
		 <SET X <CLOCKER>>
		 <DEC N>>
	 <SETG QUIET? <>>
	 <RTRUE>>

<ROUTINE CLOCKER ("AUX" E TICK RTN (FLG <>) (Q? <>))
	 <COND (<T? ,CLOCK-WAIT?>
		<SETG CLOCK-WAIT? <>>
		<RFALSE>)>
	 <SETG CLOCK-HAND <REST ,C-TABLE ,C-INTS>>
	 <SET E <REST ,C-TABLE ,C-TABLELEN>>
	 <REPEAT ()
		 <COND (<EQUAL? ,CLOCK-HAND .E>
			<INC MOVES>
			<COND (<T? ,FREEZE?>
			       <RETURN>)>
			<SETG SECONDS <+ ,SECONDS 15>>
			<COND (<G? ,SECONDS 59>
			       <SETG SECONDS <- ,SECONDS 60>>
	 		       <INC MINUTES>
			       <COND (<G? ,MINUTES 59>
		       	       	      <SETG MINUTES <- ,MINUTES 60>>
		       	       	      <INC HOURS>
		       	       	      <COND (<G? ,HOURS 23>
			      	      	     <SETG HOURS 0>)>)>)>
			<RETURN>)
		       (<T? <GET ,CLOCK-HAND ,C-RTN>>
			<SET TICK <GET ,CLOCK-HAND ,C-TICK>>
			<COND (<L? .TICK -1>
			       <PUT ,CLOCK-HAND ,C-TICK <- <- .TICK> 3>>
			       <SET Q? ,CLOCK-HAND>)
			      (<T? .TICK>
			       <COND (<G? .TICK 0>
				      <SET TICK <- .TICK 1>>
				      <PUT ,CLOCK-HAND ,C-TICK .TICK>)>
			       <COND (<T? .TICK>
				      <SET Q? ,CLOCK-HAND>)>
			       <COND (<NOT <G? .TICK 0>>
				      <SET RTN
					   %<COND (<GASSIGNED? ZILCH>
						   '<GET ,CLOCK-HAND ,C-RTN>)
						  (T
						   '<NTH ,CLOCK-HAND
							 <+ <* ,C-RTN 2>
							    1>>)>>
				      <COND (<ZERO? .TICK>
					     <PUT ,CLOCK-HAND ,C-RTN 0>)>
				      <COND (<APPLY .RTN>
					     <SET FLG T>)>
				      <COND (<AND <ZERO? .Q?>
						<T? <GET ,CLOCK-HAND ,C-RTN>>>
					     <SET Q? T>)>)>)>)>
		 <SETG CLOCK-HAND <REST ,CLOCK-HAND ,C-INTLEN>>
		 <COND (<ZERO? .Q?>
			<SETG C-INTS <+ ,C-INTS ,C-INTLEN>>)>>
	 <RETURN .FLG>>

"*** GARDENS ***"

<ROUTINE I-BLOW ("AUX" (ST 0))
	 <UNMAKE ,TREE ,NODESC>
	 <MOVE ,PARASOL ,TREE>
	 <UNMAKE ,PARASOL ,OPENED>
	 <SETG P-HER-OBJECT ,NOT-HERE-OBJECT>
	 <SETG P-IT-OBJECT ,PARASOL>
	 <MAKE ,JWOMAN ,CHILLY>
	 <MAKE ,JWOMAN ,NODESC>
	 <TELL CR "[RIDX: 727]" D ,PARASOL
" out of the " D ,JWOMAN
"[RIDX: 729]"
D ,PARASOL
"[RIDX: 730]" D ,JWOMAN
"[RIDX: 731]" D ,LNWALK ,PERIOD>
	 <COND (<ZERO? ,TR?>
		<RTRUE>)>
	 <TELL CR
"You stare up at the " D ,PARASOL>
	 <COND (<ZERO? ,RAID?>
		<TELL ,PCR
"[RIDX: 733]">)
	       (T
		<TELL "[RIDX: 734]">)>
	 <TELL
"[RIDX: 735]" D ,EWIND
"[RIDX: 736]"
D ,PARASOL "[RIDX: 737]">
	 <COND (<EQUAL? <GETB 0 30> 5> ; "Atari ST?"
		<INC ST>
		<ST-QUOTE>
		<HLIGHT ,H-ITALIC>)
	       (T
		<TELL "\"">)>
	 <TELL "It's time.">
	 <HLIGHT ,H-NORMAL>
	 <COND (<ZERO? .ST>
		<TELL "\"">)
	       (T
		<ST-QUOTE>)>
	 <TELL CR CR
"You bend to pet the " D ,MEEP "[RIDX: 743]">
	 <COND (<VISIBLE? ,BALL>
		<TELL ". Then you ">
		<COND (<NOT <IN? ,BALL ,PLAYER>>
		       <TELL "pick up the " D ,BALL ", ">)>
		<TELL "retrieve the " D ,PARASOL>
		<COND (<IN? ,BALL ,PLAYER>
		       <TELL " with the " D ,BALL>)>
		<TELL " and hurry off">
		<COND (<IN? ,PRAM ,HERE>
		       <TELL ", pushing the " D ,PRAM " before you">)
		      (T
		       <TELL " to find a " D ,PRAM>)>)
	       (T
		<TELL "[RIDX: 753]" D ,BALL>)>
	 <TELL
"[RIDX: 754]"><UPDATE-SCORE 5>
	 <CARRIAGE-RETURNS>
	 <SETG HERE ,THE-END>
	 <MOVE ,PLAYER ,HERE>
	 <V-$PRAMS>
	 <TELL CR "[RIDX: 755]">
	 <ITALICIZE "Trinity.">
	 <CRLF>
	 <FINISH>
	 <RTRUE>>


<ROUTINE V-$PRAMS ("AUX" X)
	 ;<CLEAR -1>
	 ;<SPLIT 13>
	 ;<SCREEN ,S-WINDOW>
	 ;<BUFOUT <>>
	 ;<CURSET 11 <- ,MIDSCREEN 21>>
	 ;<HLIGHT ,H-BOLD>
	 <TELL ,ALLPRAMS>
	 ;<HLIGHT ,H-NORMAL>
	 ;<SCREEN ,S-TEXT>
	 ;<SET X <INPUT 1>>
         ;<V-$REFRESH>
	 <V-LOOK>
	 <RTRUE>>

<ROUTINE I-CRANE-APPEARS ()
	 <COND (<NOT <HERE? ROUND-POND>>
		<RFALSE>)
	       (<IS? ,CRANE ,NODESC>     ; "Buys one move"
		<UNMAKE ,CRANE ,NODESC>
		<RFALSE>)
	       (T
		<DEQUEUE I-CRANE-APPEARS>
		<MOVE ,CRANE ,RPOND>
		<SETG P-IT-OBJECT ,CRANE>
		<TELL CR "One of the " D ,BOAT " on the " D ,RPOND
		      "[RIDX: 761]">
		<SAY-WIND>
		<TELL
"[RIDX: 762]" D ,CRANE "[RIDX: 763]" CR>
		<RTRUE>)>>

<GLOBAL LAYAWAY:NUMBER 3>

<ROUTINE I-BWOMAN ("AUX" (COIN? <>) (BAG? <>) (BOTH? <>))

	 <COND (<NOT <HERE? BROAD-WALK>>
		<RFALSE>)>

	 <SETG P-HER-OBJECT ,BWOMAN>
	 <COND (<T? ,RAID?>
		<COND (<IS? ,BWOMAN ,SEEN>
		       <UNMAKE ,BWOMAN ,SEEN>
		       <RFALSE>)
		      (<PROB 50>
		       <RFALSE>)>
		<CRLF>
		<BWOMAN-CRY>
		<RTRUE>)>
	 <COND (<IN? ,SCOIN ,BWOMAN>
		<SETG P-IT-OBJECT ,COIN>
		<SET COIN? T>)>
	 <COND (<IN? ,BAG ,BWOMAN>
		<SETG P-IT-OBJECT ,BAG>
		<SET BAG? T>)>
	 <COND (<AND <ZERO? .BAG?>
		     <ZERO? .COIN?>>
		<COND (<IS? ,BWOMAN ,SEEN>
		       <UNMAKE ,BWOMAN ,SEEN>
		       <RFALSE>)
		      (<PROB 50>
		       <RFALSE>)>
		<CRLF>
		<BWOMAN-CRY>
		<RTRUE>)
	       (<AND <T? .BAG?>
		     <T? .COIN?>>
		<SET BOTH? T>)>
	 <DEC LAYAWAY>
	 <COND (<ZERO? ,LAYAWAY>
		<MAKE ,BWOMAN ,SEEN>
		<TELL CR CTHE ,BWOMAN " shrugs and ">
		<COND (<OR <T? .BOTH?>
			   <T? .COIN?>>
		       <REMOVE ,SCOIN>
		       <COND (<T? .BAG?>
			      <REMOVE ,BAG>)>
		       <TELL "pockets your change">)
		      (T
		       <REMOVE ,BAG>
		       <TELL "puts your bag away">)>
		<TELL ". \"Keep ">
		<COND (<T? .BOTH?>
		       <TELL "'em">)
		      (T
		       <TELL "it">)>
		<TELL "[RIDX: 771]" CR>
		<RTRUE>)
	       (T
		<MAKE ,BWOMAN ,SEEN>
		<CRLF>
		<COND (<EQUAL? ,LAYAWAY 1>
		       <TELL CTHE ,BWOMAN "[RIDX: 772]">)>
		<TELL "\"Take yer ">
		<COND (<AND <T? .COIN?>
			    <T? .BAG?>>
		       <TELL "bag and change">)
		      (<T? .BAG?>
		       <TELL "bag">)
		      (T
		       <TELL "change">)>
		<TELL ", guv'ner">
		<COND (<EQUAL? ,LAYAWAY 1>
		       <TELL "! Ain't got all day">)>
		<TELL "!\"" CR>)>
	 <RTRUE>>

<ROUTINE BWOMAN-CRY ("AUX" (X 0))
	 <COND (<T? ,RAID?>
		<SET X 1>)>
	 <MAKE ,BWOMAN ,SEEN>
	 <TELL "\"" <PICK-NEXT <GET ,BWOMAN-CRIES .X>> "!\"">
	 <COND (<PROB 50>
		<TELL <PICK-NEXT <GET ,BWOMAN-CRIES 2>> "s the " D ,BWOMAN>
		<PRINTC 46>)>
	 <CRLF>
	 <RTRUE>>

<GLOBAL BWOMAN-CRIES
	<PTABLE
	 <LTABLE 2
	 	 "[RIDX: 784]"
		 "[RIDX: 785]"
	 	 "[RIDX: 786]"
	 	 "Thirty p"
	 	 "Feed the birds">
	 <LTABLE 2
	 	 "Sirens! The sirens"
	 	 "Lord, have mercy"
	 	 "[RIDX: 791]">
	 <LTABLE 2
		 " crie" " holler" " call" " yell">>>

<ROUTINE I-RUBY ("OPTIONAL" (CR T))
	 <COND (<IS? ,RUBY ,CHILLY>	 ; "1-move delay."
		<UNMAKE ,RUBY ,CHILLY>
		<RFALSE>)
	       (<NOT <VISIBLE? ,RUBY>>
		<RFALSE>)
	       (T
		<COND (<ZERO? .CR>
		       <TELL "[RIDX: 798]">)
		      (T
		       <TELL CR ,ALLATONCE>)>
		<MEEP-GETS-RUBY>
		<RTRUE>)>>

<GLOBAL RUBYROOM:OBJECT <>>

<ROUTINE MEEP-GETS-RUBY ()
	 <SETG RUBYROOM ,HERE>
	 <UNMAKE ,RUBY ,CHILLY>
	 <MAKE ,RUBY ,TOUCHED>
	 <DEQUEUE I-RUBY>
	 <QUEUE I-MEEP -1>
	 <SETG P-IT-OBJECT ,NOT-HERE-OBJECT>
	 <TELL "[RIDX: 799]">
	 <COND (<HERE? WABE>
		<TELL "of the " D ,THICKET>)
	       (T
		<TELL "from behind a tree">)>
	 <TELL ". It ">
	 <COND (<IN? ,RUBY ,PRAM>
		<TELL "[RIDX: 803]">)>
	 <TELL "snatches away the " D ,RUBY " with its beak">
	 <COND (<IN? ,RUBY ,PRAM>
		T)
	       (<NOT <HERE? WABE>>
		<TELL ", " <PICK-NEXT <GET ,MEEP-TABLE 0>>>)
	       (T
		<TELL "[RIDX: 807]">)>
	 <MOVE ,RUBY ,MEEP>
	 <MOVE-MEEP>
	 <COND (<HERE? BROAD-WALK>
		<UNMAKE ,MEEP ,TOLD>
		<UNMAKE ,RUBY ,TOLD>
		<TELL CR "[RIDX: 808]" D ,BWOMAN ,PERIOD>)>
	 <COND (<IS? ,EWIND ,SEEN>
		<UNMAKE ,EWIND ,SEEN>
		<MAKE ,WWIND ,SEEN>
		<TELL CR CTHE ,EWIND
"[RIDX: 809]" CR>)>
	 <RTRUE>>

<ROUTINE I-MEEP ()
	 <COND (<NOT <IN? ,MEEP ,HERE>>
		<RFALSE>)>
	 <TELL CR
"[RIDX: 810]"
D ,RUBY " in its beak as it " <PICK-NEXT <GET ,MEEP-TABLE 0>>>
	 <MOVE-MEEP>
	 <RTRUE>>

<GLOBAL MEEP-TABLE:TABLE
	<PTABLE
	 <LTABLE 2
	 	 "[RIDX: 812]"
	 	 "[RIDX: 813]"
	 	 "[RIDX: 814]">
	 <PTABLE
		 <PTABLE BROAD-WALK "east" ROUND-POND>
		 <PTABLE ROUND-POND "east" LAN-WALK>
		 <PTABLE LION-GATE "southeast" ROUND-POND>
		 <PTABLE LAN-GATE "south" LAN-WALK>
		 <PTABLE PAL-GATE "east" FLOWER-WALK>
		 <PTABLE FLOWER-WALK "north" LAN-WALK>
		 <PTABLE AT-TERRACE "southeast" LAN-WALK>
		 <PTABLE WABE "northeast" LAN-WALK>
		 <PTABLE LONG-WATER "west" LAN-WALK>
		 <PTABLE IN-WATER "west" LAN-WALK>
		 0>
	 <LTABLE 2
		 "[RIDX: 825]"
		 "[RIDX: 826]"
		 "[RIDX: 827]"
		 "[RIDX: 828]">
	 <LTABLE 2
	 	 "[RIDX: 829]"
	 	 "[RIDX: 830]"
	 	 "[RIDX: 831]"
	 	 "emits a brief squawk"
		 "[RIDX: 833]"
	 	 "[RIDX: 834]"
		 "[RIDX: 825]">
	 <LTABLE 2
		 "prance" "hop" "race" "strut">
	 <LTABLE 2
		 "[RIDX: 840]"
		 "listens intently"
		 "[RIDX: 842]">
	 <LTABLE 2
		 "doesn't respond"
		 "[RIDX: 844]"
		 "[RIDX: 845]"
		 "pays you no heed">>>

<ROUTINE MOVE-MEEP ("AUX" (CNT 0) X TBL)
	 <PCLEAR>
	 <SETG P-IT-OBJECT ,NOT-HERE-OBJECT>
	 <TELL "[RIDX: 848]">
	 <COND (<HERE? LAN-WALK>
		<REMOVE ,MEEP>
		<TELL "east">)
	       (T
		<SET X <GET ,MEEP-TABLE 1>>
		<REPEAT ()
		 	<SET TBL <GET .X .CNT>>
		 	<COND ; (<ZERO? .TBL> ; "[RIDX: 850]"
				 <TELL "[BUG!]" CR>
				 <RTRUE>)
		       	      (<EQUAL? ,HERE <GET .TBL 0>>
			       <MOVE ,MEEP <GET .TBL 2>>
			       <TELL <GET .TBL 1>>
			       <RETURN>)>
		 	<INC CNT>>)>
	 <COND (<NOT <IS? ,TREE ,BORING>>
		<MAKE ,TREE ,BORING>
		<TELL
"[RIDX: 852]" D ,MEEP>)>
	 <PRINT ,PERIOD>
	 <RTRUE>>

<ROUTINE I-FMEEP ()
	 <COND (<NOT <HERE? ON-ISLE>>
		<RFALSE>)
	       (<IS? ,TS6-DOOR ,OPENED>
		<DEQUEUE I-FMEEP>
		<MEEP-TO-ZERO>
		<TELL CR ,CTHEMEEP
"[RIDX: 853]" D ,TS6
"[RIDX: 854]" CR>
		<RTRUE>)
	       (<IS? ,MEEP ,SEEN>
		<UNMAKE ,MEEP ,SEEN>
		<RFALSE>)
	       (<PROB 50>
		<RFALSE>)>
	 <MAKE ,MEEP ,SEEN>
	 <TELL CR ,CTHEMEEP <PICK-NEXT <GET ,MEEP-TABLE 2>> ,PERIOD>
	 <RTRUE>>

<GLOBAL RAID?:NUMBER 0>

<ROUTINE I-AIR-RAID ("AUX" (Q <>))
	 <COND (<ZERO? ,RAID?>
		<COND (<AND <EQUAL? ,MINUTES 57>
			    <EQUAL? ,SECONDS 45>>
		       <PUTP ,BWOMAN ,P?FDESC
"[RIDX: 856]">
		       <SETG RAID? 10>)
		      (T
		       <RFALSE>)>)>
	 <COND (<HERE? WABE>
		<SET Q T>)>
	 <DEC RAID?>
	 <CRLF>
	 <COND (<EQUAL? ,RAID? 9>
		<MAKE ,TREE ,TOUCHED>
		<TELL "[RIDX: 857]">
		<SAY-WIND>
		<TELL
"[RIDX: 858]" D ,SOUND
"[RIDX: 859]" CR>
		<SETG DO-WINDOW <GET ,QUOTES ,THOREAU>>
		<RTRUE>)

	       (<EQUAL? ,RAID? 8>
		<TELL "[RIDX: 860]">
		<COND (<ZERO? .Q>
		       <TELL
"[RIDX: 861]">)>
		<PRINT ,PERIOD>
		<COND (<AND <HERE? AT-TERRACE>
			    <IN? ,BOY ,HERE>>
		       <TELL CR "[RIDX: 862]" D ,SPHONES
"[RIDX: 863]" CR>
		       <LAST-BUBBLE>)>
		<BOY-SCRAMS>
		<RTRUE>)

	       (<EQUAL? ,RAID? 7>
		<TELL "[RIDX: 864]">
		<COND (<ZERO? .Q>
		       <TELL
"[RIDX: 865]"
D ,NANNIES>)>
		<PRINT ,PERIOD>
		<RTRUE>)

	       (<EQUAL? ,RAID? 6>
		<TELL "[RIDX: 866]">
		<COND (<ZERO? .Q>
		       <TELL ". Worried " D ,NANNIES " turn their " D ,GPRAM
			     " toward the gates">)>
		<PRINT ,PERIOD>
		<RTRUE>)

	       (<EQUAL? ,RAID? 5>
		<TELL
"[RIDX: 870]">
		<COND (<ZERO? .Q>
		       <TELL
"[RIDX: 871]">)>
		<PRINT ,PERIOD>
		<RTRUE>)

	       (<EQUAL? ,RAID? 4>
		<TELL
"[RIDX: 872]">
		<COND (<ZERO? .Q>
		       <TELL ". Frightened " D ,TOURISTS
" and screaming " D ,GPRAM " flee in every " D ,INTDIR>)>
		<PRINT ,PERIOD>
		<RTRUE>)

	       (<EQUAL? ,RAID? 3>
		<TELL
"[RIDX: 876]" D ,SIRENS>
		<COND (<ZERO? .Q>
		       <TELL
"[RIDX: 877]">)>
		<PRINT ,PERIOD>
		<RTRUE>)

	       (<EQUAL? ,RAID? 2>
		<TELL CTHE ,GROUND
"[RIDX: 878]">
		<COND (<ZERO? .Q>
		       <TELL
". Terror-stricken " D ,TOURISTS " dive for cover">)>
		<PRINT ,PERIOD>
		<RTRUE>)

	       (<EQUAL? ,RAID? 1>
		<VAPORIZE-GARDENS>)>
	 <RTRUE>>

<ROUTINE VAPORIZE-GARDENS ()
	 <TELL "The ">
	 <SAY-WIND>
	 <TELL
"[RIDX: 882]">
	 <PRINT-ID "events:591"><JIGS-UP>
	 <RTRUE>>

<GLOBAL HCNT:NUMBER 7>

<ROUTINE I-LONDON-HOLE ("OPTIONAL" (CR? T))
	 <DEC HCNT>
	 <COND (<NOT <HERE? LONG-WATER IN-WATER>>
		<RFALSE>)
	       (<T? .CR?>
		<CRLF>)>
	 <COND (<EQUAL? ,HCNT 6>
		<TELL CTHE ,WWIND "[RIDX: 885]" CR>
		<RTRUE>)

	       (<EQUAL? ,HCNT 5>
		<PUTP ,LONG-WATER ,P?OVERHEAD ,MISSILE>
		<PUTP ,IN-WATER ,P?OVERHEAD ,MISSILE>
		<MAKE ,MISSILE ,TOUCHED>
		<SETG P-IT-OBJECT ,MISSILE>
		<TELL
"[RIDX: 886]" D ,MISSILE "[RIDX: 887]" CR>
		<RTRUE>)

	       (<EQUAL? ,HCNT 4>
		<MAKE ,LWDOOR ,TOUCHED>
		<PUTP ,LONG-WATER ,P?SEE-E ,LWDOOR>
		<PUTP ,IN-WATER ,P?SEE-E ,LWDOOR>
		<SETG P-IT-OBJECT ,LWDOOR>
		<TELL CTHE ,MISSILE
"[RIDX: 888]"
D ,LWATER ,PCR "[RIDX: 889]" D ,MISSILE
"[RIDX: 890]"
D ,LWDOOR "[RIDX: 891]" D ,CSURFACE " of the water." CR>
		<RTRUE>)

	       (<EQUAL? ,HCNT 3>
		<TELL
"[RIDX: 893]"
D ,LWATER "[RIDX: 894]" D ,LWDOOR ,PCR CTHE ,MISSILE
"[RIDX: 895]" CR>
		<RTRUE>)

	       (<EQUAL? ,HCNT 2>
		<TELL "[RIDX: 896]"
D ,LWDOOR "[RIDX: 897]" ,PCR CTHE ,MISSILE
"[RIDX: 898]" CR>
		<RTRUE>)

	       (<EQUAL? ,HCNT 1>
		<TELL
"[RIDX: 899]" D ,LWATER
"[RIDX: 900]" D ,CSURFACE
"[RIDX: 901]"
D ,GARDENS ", including the " D ,MEEP " you met before">
		<ENTICINGLY>
		<TELL "[RIDX: 904]" D ,LWDOOR ,PCR
		      CTHE ,MISSILE " is closing in fast." CR>
		<RTRUE>)>

	 <TELL
CTHE ,MISSILE "[RIDX: 906]" D ,LWDOOR
"[RIDX: 907]"
D ,LWATER "[RIDX: 908]">
	 <PRINT-ID "events:657"><JIGS-UP>
	 <RTRUE>>

<GLOBAL BREATH-HELD?:NUMBER 0>

<ROUTINE I-HOLD-BREATH ("OPTIONAL" (CR? T))
	 <DEC BREATH-HELD?>
	 <COND (<EQUAL? ,BREATH-HELD? 3 2>
		<RFALSE>)
	       (<T? .CR?>
		<CRLF>)>
	 <COND (<EQUAL? ,BREATH-HELD? 1>
		<TELL ,CANT "hold " D ,BREATH " much longer." CR>
		<RTRUE>)
	       (T
		<SETG BREATH-HELD? 0>
		<DEQUEUE I-HOLD-BREATH>
		<COND (<HERE? UNDER-WATER>
		       <TELL
"[RIDX: 913]" D ,CSURFACE " as " D ,BREATH " gives out" ,PCR>
		       <GOTO ,IN-CIST>)
		      (T
		       <TELL
"[RIDX: 916]" CR>)>)>
	 <RTRUE>>

<GLOBAL ODEG:NUMBER 6>
<GLOBAL OSIGN:NUMBER 0>
<GLOBAL IDEG:NUMBER 14>
<GLOBAL ISIGN:NUMBER 0>

<GLOBAL OROOMS:TABLE
	<PTABLE IN-MEADOW ON-HILL AT-FALLS BONEYARD
		OSSUARY PROM ON-MESA ON-BLUFF
		IN-GARDEN AT-CRATER ON-MOOR ON-BEACH ON-ISLE>>

<GLOBAL IROOMS:TABLE
	<PTABLE FCLEARING SBOG NBOG AT-CHASM UNDER-CLIFF
		AT-BEND DOCKSIDE DOCKSIDE>>

<GLOBAL OSIGN-DOORS:TABLE
	<PTABLE TS0-DOOR <> TS1-DOOR <> TS2-DOOR <> TS3-DOOR <>
		TS4-DOOR <> TS5-DOOR <> TS6-DOOR <>>>

<ROUTINE NEW-OSIGN (DOOR "OPTIONAL" (V T) "AUX" OLD)
	 <UNMAKE ,TS1-DOOR ,OPENED>
	 <UNMAKE ,TS2-DOOR ,OPENED>
	 <UNMAKE ,TS3-DOOR ,OPENED>
	 <UNMAKE ,TS4-DOOR ,OPENED>
	 <UNMAKE ,TS5-DOOR ,OPENED>
	 <UNMAKE ,TS6-DOOR ,OPENED>
	 <SET OLD ,OSIGN>
	 <SETG OSIGN .DOOR>
	 <SETG ODEG 5>
	 <SETG ISIGN </ ,OSIGN 2>>
	 <SETG IDEG 12>
	 <MOVE ,OUTER-SHADOW <GET ,OROOMS ,OSIGN>>
	 <MOVE ,INNER-SHADOW <GET ,IROOMS ,ISIGN>>
	 <SET DOOR <GET ,OSIGN-DOORS ,OSIGN>>
	 <COND (<AND <T? .DOOR>
		     <NOT <IS? .DOOR ,NOALL>>>
		<MAKE .DOOR ,OPENED>
		<COND (<EQUAL? .DOOR ,TS2-DOOR>
		       <MAKE ,TUN1 ,LIGHTED>)>)>
	 <RESET-SHDIRS>
	 <COND (<T? .V>
		<TELL "[RIDX: 919]"
		      <GET ,SYMBOL-NAMES ,OSIGN> " symbol." CR>)>
	 <COND (<PRSI? LEFT RIGHT>
		<COND (<AND <G? .OLD 11>
		     	    <ZERO? ,OSIGN>>
		       <REPORT-SUNSET>
		       <RTRUE>)
	       	      (<AND <EQUAL? .OLD 0 1>
		     	    <G? ,OSIGN 11>>
		       <REPORT-SUNSET T>)>
		<RTRUE>)
	     ; (<PRSI? LEFT>
		<COND (<AND <G? .OLD 11>
		     	    <ZERO? ,OSIGN>>
		       <REPORT-SUNSET>
		       <RTRUE>)
	       	      (<AND <EQUAL? .OLD 0 1>
		     	    <G? ,OSIGN 11>>
		       <REPORT-SUNSET T>)>
		<RTRUE>)>
	 <RTRUE>>

"[RIDX: 921]"

<GLOBAL SHDIRS <TABLE "north" P?NORTH "east" "west">>

<ROUTINE RESET-SHDIRS ("AUX" X Y Z Q)
	 <COND (<L? ,OSIGN 3>
		<SET X "north">
		<SET Y ,P?NORTH>
		<COND (<ZERO? ,FLIP?>
		       <SET Z "east">
		       <SET Q "west">)
		      (T
		       <SET Z "west">
		       <SET Q "east">)>)
	       (<L? ,OSIGN 5>
		<COND (<ZERO? ,FLIP?>
		       <SET X "northeast">
		       <SET Y ,P?NE>
		       <SET Z "southeast">
		       <SET Q "northwest">)
		      (T
		       <SET X "northwest">
		       <SET Y ,P?NW>
		       <SET Z "southwest">
		       <SET Q "northeast">)>)
	       (<L? ,OSIGN 8>
		<SET Z "south">
		<SET Q "north">
		<COND (<ZERO? ,FLIP?>
		       <SET X "east">
		       <SET Y ,P?EAST>)
		      (T
		       <SET X "west">
		       <SET Y ,P?WEST>)>)
	       (<L? ,OSIGN 10>
		<COND (<ZERO? ,FLIP?>
		       <SET X "southeast">
		       <SET Y ,P?NW>
		       <SET Z "southwest">
		       <SET Q "northeast">)
		      (T
		       <SET X "southwest">
		       <SET Y ,P?NE>
		       <SET Z "southeast">
		       <SET Q "northwest">)>)
	       (T
		<SET X "south">
	 	<SET Y ,P?SOUTH>
	 	<COND (<ZERO? ,FLIP?>
		       <SET Z "west">
		       <SET Q "east">)
		      (T
		       <SET Z "east">
		       <SET Q "west">)>)>
	 <PUT ,SHDIRS 0 .X>
	 <PUT ,SHDIRS 1 .Y>
	 <PUT ,SHDIRS 2 .Z>
	 <PUT ,SHDIRS 3 .Q>
	 <RTRUE>>

<ROUTINE I-SHADOW ("AUX" (V <>) (DOOR <>) (OHERE <>))
	 <COND (<ZERO? ,SUN-MOVING?>
		<RFALSE>)>

       ; "Handle outer shadow."

	 <INC ODEG>
	 <COND (<G? ,ODEG 12>
		<SETG ODEG 0>
		<INC OSIGN>
		<RESET-SHDIRS>
		<COND (<IN? ,OUTER-SHADOW ,HERE>
		       <INC V>
		       <SHADOW-GOES>)>
		<COND (<G? ,OSIGN 12>
		       <SETG OSIGN 0>
		       <SETG ODEG 0>
		       <SETG ISIGN 0>
		       <SETG IDEG 7>
		       <RESET-SHDIRS>
		       <MOVE ,OUTER-SHADOW ,IN-MEADOW>
		       <MOVE ,INNER-SHADOW ,FCLEARING>
		       <COND (<AND <IS? ,HERE ,SHADOWY>
				   <NOT <IS? ,HERE ,INDOORS>>>
			      <REPORT-SUNSET>
			      <COND (<HERE? IN-MEADOW FCLEARING>
				     <SHADOW-COMES>)>
			      <RTRUE>)>
		       <RETURN .V>)>
		<MOVE ,OUTER-SHADOW <GET ,OROOMS ,OSIGN>>
		<COND (<IN? ,OUTER-SHADOW ,HERE>
		       <INC V>
		       <SHADOW-COMES>)>)>

	 <SET DOOR <GET ,OSIGN-DOORS ,OSIGN>>
	 <COND (<AND <EQUAL? ,ODEG 5>
		     <T? .DOOR>
		     <HERE? ON-GNOMON>>
		<SET V T>
		<SETG P-IT-OBJECT ,RING>
		<TELL CR CTHE ,RING " on the " D ,BDIAL
		      "[RIDX: 955]">
		<ITALICIZE "click.">
		<CRLF>
	      ; <PRINT ,PERIOD>)>

       ; "Handle inner shadow."

	 <INC IDEG>
	 <COND (<G? ,IDEG 25>
		<SETG IDEG 0>
		<INC ISIGN>
		<COND (<IN? ,INNER-SHADOW ,HERE>
		       <INC V>
		       <SHADOW-GOES>)>
		<MOVE ,INNER-SHADOW <GET ,IROOMS ,ISIGN>>
		<COND (<IN? ,INNER-SHADOW ,HERE>
		       <INC V>
		       <SHADOW-COMES>)>)>

       ; "Handle doors."

	 <COND (<IN? ,OUTER-SHADOW ,HERE>
		<SET OHERE T>)>

	 <COND (<AND <EQUAL? ,ODEG 5>
		     <T? .DOOR>>
		<COND (<T? .OHERE>
		       <INC V>
		       <TELL CR
"The tip of the " D ,OUTER-SHADOW " touches the " D ,TS0 ,PERIOD>)>
		<COND (<NOT <IS? .DOOR ,NOALL>>
		       <MAKE .DOOR ,OPENED>
		       <COND (<EQUAL? .DOOR ,TS2-DOOR>
			      <MAKE ,TUN1 ,LIGHTED>)>
		       <COND (<T? .OHERE>
			      <TELL CR
"[RIDX: 961]" D .DOOR " in the " D ,TS0 " swings open." CR>
			      <COND (<AND <HERE? ON-ISLE>
					  <IN? ,MEEP ,TS6>>
				     <I-FMEEP>)>
			      <RTRUE>)>)>
		<RETURN .V>)

	       (<AND <EQUAL? ,ODEG 6>
		     <T? .DOOR>
		     <T? .OHERE>>
		<SETG P-IT-OBJECT ,OUTER-SHADOW>
		<TELL CR CTHE ,OUTER-SHADOW <PICK-NEXT ,CREEPERS>
		      "across the " D ,TS0>
		<COND (<NOT <IS? .DOOR ,NOALL>>
		       <SETG P-IT-OBJECT .DOOR>
		       <TELL "'s open door">)>
		<PRINT ,PERIOD>
		<RTRUE>)

	       (<EQUAL? ,ODEG 7>
		<COND (<T? .DOOR>
		       <UNMAKE .DOOR ,OPENED>
		       <COND (<EQUAL? .DOOR ,TS2-DOOR>
			      <UNMAKE ,TUN1 ,LIGHTED>)>
		       <COND (<HERE? IN-ORBIT ON-SAT PLAYGROUND ON-BIRD>
			      <RETURN .V>)
			     (<T? .OHERE>
			      <INC V>
			      <TELL CR
CTHE ,OUTER-SHADOW <PICK-NEXT ,CREEPERS> "away from the " D ,TS0>)>
		       <COND (<IS? .DOOR ,NOALL>
			      <COND (<T? .OHERE>
				     <PRINT ,PERIOD>)>
			      <RETURN .V>)
			     (<T? .OHERE>
			      <TELL ", and the ">)
			     (<GLOBAL-IN? .DOOR ,HERE>
			      <TELL CR "The ">)
			     (T
			      <RETURN .V>)>
		       <SETG P-IT-OBJECT ,NOT-HERE-OBJECT>
		       <TELL "door ">
		       <COND (<IS? ,HERE ,SHADOWY>
			      <TELL "in the stem ">)>
		       <TELL "[RIDX: 971]">
		       <COND (<OR <EQUAL? .DOOR ,TS0-DOOR>
				  <NOT <IS? ,HERE ,SHADOWY>>>
			      <MAKE .DOOR ,NOALL>
			      <TELL
"[RIDX: 972]" CR>
			      <COND (<HERE? TUN1>
				     <SAY-IF-HERE-LIT>)>
			      <RTRUE>)>
		       <PRINT ,PERIOD>
		       <RTRUE>)
		      (<T? .OHERE>
		       <SHADOW-CREEPS>
		       <PRINT ,PERIOD>
		       <RTRUE>)
		      (T
		       <RETURN .V>)>)

	       (<AND <IN? ,INNER-SHADOW ,HERE>
		     <ZERO? <MOD ,IDEG 5>>>
		<SETG P-IT-OBJECT ,INNER-SHADOW>
		<SHADOW-CREEPS>
		<PRINT ,PERIOD>
		<RTRUE>)

	       (<OR <AND <T? .OHERE>
			 <EQUAL? ,ODEG 11>>
		    <AND <IN? ,INNER-SHADOW ,HERE>
			 <EQUAL? ,IDEG 23>>>
		<SETG P-IT-OBJECT <COND (<ZERO? .OHERE>
					 ,INNER-SHADOW)
					(T
					 ,OUTER-SHADOW)>>
		<SHADOW-CREEPS>
		<TELL ". It's almost" ,OUTASITE>
		<RTRUE>)

	       (T
		<RETURN .V>)>>

<ROUTINE SHADOW-CREEPS ()
	 <SETG P-IT-OBJECT <COND (<IN? ,OUTER-SHADOW ,HERE>
				  ,OUTER-SHADOW)
	       			 (T
				  ,INNER-SHADOW)>>
	 <TELL CR CTHE ,OUTER-SHADOW <PICK-NEXT ,CREEPERS>>
	 <SHDIRWARD>
	 <RTRUE>>

<ROUTINE SHDIRWARD ()
	 <TELL <GET ,SHDIRS 0> "ward">
	 <RTRUE>>

<ROUTINE SHADOW-COMES ()
	 <SETG P-IT-OBJECT <COND (<IN? ,OUTER-SHADOW ,HERE>
				  ,OUTER-SHADOW)
	       			 (T
				  ,INNER-SHADOW)>>
	 <EDGE-OF>
	 <TELL A ,OUTER-SHADOW <PICK-NEXT ,CREEPERS> "into view." CR>
	 <RTRUE>>

<ROUTINE EDGE-OF ()
	 <TELL CR "The edge of ">
	 <RTRUE>>

<ROUTINE SHADOW-GOES ()
	 <SETG P-IT-OBJECT ,NOT-HERE-OBJECT>
	 <EDGE-OF>
	 <TELL THE ,OUTER-SHADOW " disappears ">
	 <SHDIRWARD>
	 <PRINT ,PERIOD>
	 <RTRUE>>

<GLOBAL CREEPERS:TABLE
	<LTABLE 2 " inches " " creeps " " moves slowly ">>

<ROUTINE REPORT-SUNSET ("OPTIONAL" (BW <>))
	 <CRLF>
	 <COND (<NOT <IS? ,SUN ,TOUCHED>>
		<TELL "[RIDX: 982]">)>
	 <TELL "[RIDX: 983]">
	 <COND (<ZERO? .BW>
		<SAY-WEST>)
	       (T
		<SAY-EAST>)>
	 <TELL "ern " D ,HORIZON>
	 <COND (<IS? ,SUN ,TOUCHED>
		<TELL
"[RIDX: 985]">
		<COND (<ZERO? .BW>
		       <SAY-EAST>)
		      (T
		       <SAY-WEST>)>
		<PRINT ,PERIOD>
		<RTRUE>)>
	 <MAKE ,SUN ,TOUCHED>
	 <TELL
"[RIDX: 986]">
	 <ITALICIZE "brighter.">
	 <TELL
"[RIDX: 988]" D ,DMOUNTS " and " D ,TREETOPS
"[RIDX: 990]" D ,HORIZON
", casting double " D ,DSHADOW "[RIDX: 992]"><PRINT-ID "events:1036">
	 <COND (<ZERO? .BW>
		<SAY-WEST>)
	       (T
		<SAY-EAST>)>
	 <TELL "[RIDX: 994]">
	 <COND (<ZERO? .BW>
		<SAY-EAST>)
	       (T
		<SAY-WEST>)>
	 <TELL "[RIDX: 995]" CR>
	 <RTRUE>>

<ROUTINE I-DROP-OAK ()
	 <MAKE ,OAK ,TOUCHED>
	 <COND (<HERE? AT-CHASM>
		<TELL CR "[RIDX: 996]" D ,OAK
"[RIDX: 997]" CR>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<GLOBAL ORBCNT:NUMBER 0>

<ROUTINE I-ORBIT ("AUX" (ON? <>) (MAG? <>) (DOOR <>))
	 <COND (<AND <HERE? ON-SAT>
		     <T? ,SUITED?>>
		<SET ON? T>
		<COND (<AND <IS? ,TS1-DOOR ,OPENED>
			    <NOT <IS? ,TS1-DOOR ,NOALL>>>
		       <SET DOOR T>)>)>
	 <COND (<GOT? ,LUMP>
		<SET MAG? T>)>
	 <INC ORBCNT>
	 <CRLF>
	 <COND (<EQUAL? ,ORBCNT 1>
	   	<COND (<T? ,SUITED?>
		       <TELL CTHE ,FILM
"[RIDX: 999]" ,PCR>)>
		<TELL CTHE ,TS1-DOOR "[RIDX: 1000]" CR>
		<RTRUE>)

	       (<EQUAL? ,ORBCNT 2>
		<SETG P-IT-OBJECT ,NOT-HERE-OBJECT>
		<TELL "[RIDX: 1001]" D ,TS1-DOOR
"[RIDX: 1002]" CR>
		<RTRUE>)

	       (<EQUAL? ,ORBCNT 3>
		<MAKE ,XRAY ,TOUCHED>
		<SETG P-IT-OBJECT ,XRAY>
		<TELL "Far ahead, a " D ,XRAY " drifts into view." CR>
		<RTRUE>)

	       (<EQUAL? ,ORBCNT 4>
		<TELL CTHE ,XRAY " drifts closer." CR>
		<COND (<T? .MAG?>
		       <TELL CR "You feel the " D ,LUMP
"[RIDX: 1007]" D ,XRAY "!" CR>)>
		<RTRUE>)

	       (<EQUAL? ,ORBCNT 5>
		<COND (<T? .MAG?>
		       <MOVE ,LUMP ,ON-SAT>
		       <MAKE ,LUMP ,NODESC>
		       <UNMAKE ,LUMP ,TAKEABLE>
		       <MAKE ,LUMP ,TRYTAKE>
		       <TELL CTHE ,LUMP
"[RIDX: 1009]" D ,XRAY " glides past. ">
		       <COND (<ZERO? ,SUITED?>
			      <TELL "It">
			      <CLANGS>
			      <TELL "just out of reach">)
			     (T
			      <SET ON? T>
		       	      <SETG HERE ,ON-SAT>
		       	      <MOVE ,PLAYER ,HERE>
		       	      <SETG OLD-HERE <>>
		       	      <TELL "You find " D ,ME
"[RIDX: 1014]" ,PCR>
		       	      <ITALICIZE "Ploop!">
		       	      <TELL " The " D ,FILM
"[RIDX: 1017]" D ,XRAY ,PTHE D ,LUMP>
			      <CLANGS>
			      <TELL "[RIDX: 1018]">)>
		       <TELL ,PCR>
		       <VOICE-MUTTERS "[RIDX: 1019]">)>
		<TELL CTHE ,XRAY>
		<COND (<ZERO? .ON?>
		       <SETG P-IT-OBJECT ,XRAY>
		       <TELL "[RIDX: 1020]" CR>
		       <RTRUE>)>
		<SETG P-THEM-OBJECT ,THRUSTERS>
		<TELL "'s " D ,THRUSTERS
"[RIDX: 1022]" CR>
		<RTRUE>)

	       (<EQUAL? ,ORBCNT 6>
		<TELL CTHE ,XRAY " drifts ">
		<COND (<ZERO? .ON?>
		       <TELL "farther ">)>
		<TELL "back in the " D ,INTDIR " you just came from." CR>
		<COND (<T? .DOOR>
		       <SETG P-IT-OBJECT ,TS1-DOOR>
		       <TELL CR CTHE ,TS1-DOOR
			    "[RIDX: 1027]" CR>)>
		<RTRUE>)

	       (<EQUAL? ,ORBCNT 7>
		<SETG P-IT-OBJECT ,ICBM>
		<MAKE ,ICBM ,TOUCHED>
		<TELL
"[RIDX: 1028]"
D ,ICBM "[RIDX: 1029]" CR>
		<COND (<T? .DOOR>
		       <TELL CR CTHE ,XRAY
			     "[RIDX: 1030]"
			     D ,TS1-DOOR ,PERIOD>)>
		<RTRUE>)

	       (<EQUAL? ,ORBCNT 8>
		<TELL CTHE ,THRUSTERS " on the ">
		<COND (<ZERO? .ON?>
		       <TELL "distant ">)>
		<TELL D ,XRAY
"[RIDX: 1033]" D ,ICBM ,PERIOD>
		<COND (<T? .DOOR>
		       <SETG P-IT-OBJECT ,TS1-DOOR>
		       <TELL CR CTHE ,TS1-DOOR
			    " is very close now." CR>)>
		<RTRUE>)>
	 <TELL CTHE ,XRAY
"[RIDX: 1035]">
	 <STAR-WARS>
	 <RTRUE>>

<ROUTINE STAR-WARS ()
	 <TELL
,PA "[RIDX: 1036]"
D ,ICBM
"[RIDX: 1037]" D ,XRAY "[RIDX: 1038]">
	 <PRINT-ID "events:1177"><JIGS-UP>
	 <RTRUE>>

<ROUTINE CLANGS ()
	 <TELL
"[RIDX: 1040]">
	 <RTRUE>>

<GLOBAL BACTION:NUMBER 0>

"[RIDX: 1041]"

<ROUTINE I-BUBBLES ()
	 <COND (<AND <HERE? NBOG AT-CHASM>
		     <PROB 20>>
		<TELL CR "A " D ,SBUBBLE
"[RIDX: 1043]">
		<SAY-POP>
		<PRINT ,PERIOD>
		<RTRUE>)
	       (<NOT <HERE? PROM>>
		<SETG BACTION 0>
		<RFALSE>)
	       (<ZERO? ,BACTION>
		<CRLF>
		<BOY-DIPS>
		<COND (<T? ,IN-DISH?>
		       <SETG IN-DISH? <>>
		       <SETG OLD-HERE <>>
		       <SETG SUITED? ,SUIT-LIFE>
		       <SETG BACTION 1> ; "[RIDX: 1044]"
		       <QUEUE I-BUBBLE-SUIT -1>
		       <TELL
"[RIDX: 1045]"
,PCR>
		       <BOY-BLOWS-BUBBLE>
		       <TELL ". You find " D ,ME
"[RIDX: 1047]" D ,FILM
			     " of iridescent color">)>
		<PRINT ,PERIOD>
		<RTRUE>)
	       (<EQUAL? ,BACTION 1>
		<CRLF>
		<BOY-BLOWS-BUBBLE>
		<PRINT ,PERIOD>
		<RTRUE>)
	       (T
		<CRLF>
		<BOY-WAITS>)>
	 <RTRUE>>

<ROUTINE I-BOY ("OPTIONAL" (CR T))
	 <COND (<NOT <HERE? AT-TERRACE>>
		<SETG BACTION 0>
		<RFALSE>)
	       (<T? .CR>
		<CRLF>)>
	 <COND (<ZERO? ,BACTION>
		<BOY-DIPS>
		<PRINT ,PERIOD>
		<RTRUE>)
	       (<EQUAL? ,BACTION 1>
		<BOY-BLOWS-BUBBLE>
		<PRINT ,PERIOD>
		<RTRUE>)
	       (T
		<BOY-WAITS>)>
	 <RTRUE>>

<ROUTINE BOY-DIPS ()
	 <INC BACTION>
	 <TELL CTHE ,GIANT " dips the " D ,WAND
	       "[RIDX: 1051]">
	 <RTRUE>>

<ROUTINE BOY-BLOWS-BUBBLE ()
	 <INC BACTION>
	 <UNMAKE ,HERE ,NOALL>
	 <TELL CTHE ,GIANT " pulls the " D ,WAND
"[RIDX: 1053]" D ,SBUBBLE>
	 <RTRUE>>

<ROUTINE BOY-WAITS ()
	 <SAY-BOY-BOPS>
	 <MAKE ,HERE ,NOALL>
	 <COND (<T? ,SUITED?>
		<PRINT ,PERIOD>
		<RTRUE>)>
	 <TELL " as the " D ,SBUBBLE>
	 <COND (<NOT <IS? ,BOY ,SEEN>>
		<MAKE ,BOY ,SEEN>
		<SAY-POP>
		<PRINT ,PERIOD>
		<SETG DO-WINDOW <GET ,QUOTES ,POPE>>
		<RTRUE>)
	       (<PROB 50>
		<TELL " floats away." CR>
		<RTRUE>)
	       (T
		<SAY-POP>
		<PRINT ,PERIOD>)>
	 <RTRUE>>

<ROUTINE SAY-POP ()
	 <TELL "[RIDX: 1056]">
	 <HLIGHT ,H-ITALIC>
	 <TELL "pop">
	 <HLIGHT ,H-NORMAL>
	 <RTRUE>>

<ROUTINE SAY-BOY-BOPS ()
	 <COND (<EQUAL? ,BACTION 2>
		<SETG BACTION 0>)>
	 <TELL CTHE ,GIANT <PICK-NEXT ,BOY-BOPS> "[RIDX: 1058]">
	 <RTRUE>>

<GLOBAL BOY-BOPS:TABLE
	<LTABLE 2
	" snaps his fingers"
	" bobs his head"
	" kicks his feet"
	" hums softly">>

<GLOBAL VACUUM:NUMBER 3>

<ROUTINE I-VACUUM ("AUX" (X <>))
	 <COND (<T? ,SUITED?>
		<RFALSE>)>
	 <DEC VACUUM>
	 <COND (<VISIBLE? ,CAGE>
		<COND (<IN? ,LEM ,CAGE>
		       <SET X ,LEM>)
		      (<IN? ,MAGPIE ,CAGE>
		       <SET X ,MAGPIE>)>)>
	 <COND (<EQUAL? ,VACUUM 2>
		<ICE-VAC>
		<TELL CR
"[RIDX: 1064]"><PRINT-ID "events:1314">
		<COND (<T? .X>
		       <TELL ,PTHE D .X
			     "[RIDX: 1066]"><PRINT-ID "events:1317">)>
		<PRINT ,PERIOD>
		<RTRUE>)>
	 <CRLF>
	 <COND (<EQUAL? ,VACUUM 1>
		<TELL "[RIDX: 1068]"><PRINT-ID "events:1322">
		<COND (<T? .X>
		       <TELL ". So is the " D .X
			     "[RIDX: 1071]"><PRINT-ID "events:1325">)>
		<PRINT ,PERIOD>
		<RTRUE>)>
	 <TELL
"[RIDX: 1073]">
	 <PRINT-ID "events:1330"><JIGS-UP>
	 <RTRUE>>

<GLOBAL SUITED?:NUMBER 0>
<CONSTANT SUIT-LIFE 4>

<ROUTINE I-BUBBLE-SUIT ("OPTIONAL" (CR? T))
	 <COND (<HERE? IN-ORBIT ON-SAT IN-SKY>
		<RFALSE>)
	       (<T? .CR?>
		<CRLF>)>
	 <DEC SUITED?>
	 <TELL CTHE ,FILM " around you">
	 <COND (<EQUAL? ,SUITED? 3>
		<TELL "[RIDX: 1077]" CR>
		<RTRUE>)
	       (<EQUAL? ,SUITED? 2>
		<TELL " is sagging a bit." CR>
		<RTRUE>)
	       (<EQUAL? ,SUITED? 1>
		<TELL "[RIDX: 1079]" CR>
		<RTRUE>)
	       (T
		<POP-BUBBLE-SUIT>
		<SAY-POP>
		<PRINT ,PERIOD>)>
	 <RTRUE>>

<GLOBAL ILIFE:NUMBER 6>

<ROUTINE I-ICE ("AUX" (SEE 0) (GOT 0))
	 <COND (<VISIBLE? ,ICE>
		<INC SEE>
		<COND (<GOT? ,ICE>
		       <INC GOT>)>)>
	 <COND (<OR <AND <HERE? IN-ORBIT ON-SAT>
			 <ZERO? ,SUITED?>>
		    <CHILLY? ,ICE>>
		<COND (<EQUAL? ,ILIFE 6>
		       <RFALSE>)>
		<SETG ILIFE 6>
		<COND (<T? .SEE>
		       <ICE-HARDENS-IN>
		       <COND (<HERE? ON-GNOMON>
			      <TELL "thin, ">)>
		       <TELL "frosty air." CR>
		       <RTRUE>)>
		<RFALSE>)>
	 <DEC ILIFE>
	 <COND (<ZERO? ,ILIFE>
		<REMOVE-ICE>
		<COND (<T? .SEE>
		       <TELL CR "The ">
		       <COND (<T? .GOT>
			      <TELL "melting ">)>
		       <TELL D ,ICE>
		       <COND (<ZERO? .GOT>
			      <TELL
"[RIDX: 1085]" CR>
			      <RTRUE>)>
		       <TELL "[RIDX: 1086]">
		     ; <COND (<T? ,SUITED?>
			      <POP-BUBBLE-SUIT>
			      <TELL "slices through the " D ,FILM ". ">
			      <ITALICIZE "Pop!">
			      <TELL " Then the crystal ">)>
		       <COND (<HERE? IN-ORBIT ON-SAT IN-SKY>
			      <TELL "tumbles" ,OUTASITE>
			      <RTRUE>)
			     (<AND <HERE? PROM>
				   <T? ,IN-DISH?>>
			      <TELL "[RIDX: 1092]" CR>
			      <RTRUE>)>
		       <TELL "[RIDX: 1093]" CR>
		       <RTRUE>)>
		<RFALSE>)
	       (<ZERO? .SEE>
		<RFALSE>)
	       (<EQUAL? ,ILIFE 3>
		<TELL CR "[RIDX: 1094]" D ,ICE " glisten." CR>
		<RTRUE>)
	       (<EQUAL? ,ILIFE 2>
		<CRLF>
		<COND (<ZERO? .GOT>
		       <TELL "It looks as if the " D ,ICE
			     "[RIDX: 1097]" CR>
		       <RTRUE>)>
		<TELL
"[RIDX: 1098]" D ,ICE ,PERIOD>
		<RTRUE>)
	       (<EQUAL? ,ILIFE 1>
		<TELL CR CTHE ,ICE " is ">
		<COND (<ZERO? .GOT>
		       <TELL "[RIDX: 1100]" CR>
		       <RTRUE>)>
		<TELL "[RIDX: 1101]" CR>
		<RTRUE>)>
	 <RFALSE>>

<ROUTINE ICE-VAC ()
	 <COND (<NOT <IN? ,ICE ,PLAYER>>
		<RFALSE>)>
	 <SETG ILIFE 6>
	 <ICE-HARDENS-IN>
	 <TELL "sudden vacuum." CR>
	 <RTRUE>>

<ROUTINE ICE-HARDENS-IN ()
	 <TELL CR CTHE ,ICE " hardens in the ">
	 <RTRUE>>

<ROUTINE CHILLY? (OBJ "AUX" L)
	 <COND (<ZERO? .OBJ>
		<RFALSE>)>
	 <SET L <LOC .OBJ>>
	 <COND (<EQUAL? .L <> ,LOCAL-GLOBALS ,GLOBAL-OBJECTS>
		<RFALSE>)
	       (<OR <AND <IN? .L ,ROOMS>
			 <IS? .L ,CHILLY>>
		    <CHILLY? .L>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE I-LEM ("OPTIONAL" (CR T) "AUX" L)
	 <COND (<T? ,QUIET?>
		<RFALSE>)>
	 <SET L <LOC ,LEM>>
	 <COND (<OR <ZERO? .L>
		    <NOT <VISIBLE? ,LEM>>>
		<UNMAKE ,LEM ,SEEN>
		<MAKE ,LEM ,CHILLY>
		<RFALSE>)
	       (<EQUAL? .L ,PLAYER>
		<COND (<T? .CR>
		       <CRLF>)>
		<COND (<IS? ,LEM ,CHILLY>
		       <UNMAKE ,LEM ,CHILLY>
		       <MAKE ,LEM ,SEEN>
		       <TELL ,CTHELEM
"[RIDX: 1107]" D ,HANDS ,PERIOD><PRINT-ID "events:1470">
		       <RTRUE>)>
		<TELL "[RIDX: 1109]" D ,LEM
		      "[RIDX: 1110]">
		<COND (<ZERO? ,LIT?>
		       <TELL "falls with a ">)>
		<FREE-LEM>
		<RTRUE>)
	       (<EQUAL? .L ,FISSURE>
		<MAKE ,LEM ,CHILLY>
		<COND (<ZERO? .CR>
		       T)
		      (<IS? ,LEM ,SEEN>
		       <UNMAKE ,LEM ,SEEN>
		       <RFALSE>)
		      (<PROB 50>
		       <RFALSE>)>
		<COND (<T? .CR>
		       <CRLF>)>
		<MAKE ,LEM ,SEEN>
		<TELL ,CTHELEM <PICK-NEXT <GET ,RAT-TABLE 2>> ,PERIOD>
		<RTRUE>)
	       (<EQUAL? .L ,IN-CLOSET>
		<MAKE ,LEM ,CHILLY>
		<COND (<IS? ,CLOSET-DOOR ,OPENED>
		       <EXIT-LEM>
		       <COND (<T? .CR>
			      <CRLF>)>
		       <TELL ,CTHELEM>
		       <SNAKE-LUNCH>
		       <RTRUE>)
		      (<ZERO? .CR>
		       T)
		      (<IS? ,LEM ,SEEN>
		       <UNMAKE ,LEM ,SEEN>
		       <RFALSE>)
		      (<PROB 50>
		       <RFALSE>)
		      (T
		       <CRLF>)>
		<COND (<ZERO? ,LIT?>
		       <TELL <PICK-NEXT <GET ,SKINK-TABLE 1>> ,PERIOD>
		       <RTRUE>)>
		<TELL ,CTHELEM <PICK-NEXT <GET ,RAT-TABLE 3>> ,PERIOD>
		<RTRUE>)
	       (<EQUAL? .L ,CAGE>
		<MAKE ,LEM ,CHILLY>
		<COND (<IS? .L ,OPENED>
		       <COND (<T? .CR>
		       	      <CRLF>)>
		       <COND (<ZERO? ,LIT?>
			      <TELL "You hear the ">)
			     (T
			      <TELL "The ">)>
		       <TELL D ,LEM>
		       <COND (<SEE-SNAKE?>
			      <MAKE ,LEM ,FLIPPED>
			      <MAKE ,LEM ,SEEN>
			      <UNMAKE ,LEM ,TOUCHED>
			      <TELL
"[RIDX: 1114]" CR>
			      <RTRUE>)
			     (<IS? ,LEM ,TOUCHED>
			      <UNMAKE ,LEM ,TOUCHED>
			      <MAKE ,LEM ,SEEN>
			      <TELL " scamper">
			      <COND (<ZERO? ,LIT?>
				     <TELL "ing">)
				    (T
				     <TELL "s">)>
			      <TELL "[RIDX: 1118]" CR>
			      <RTRUE>)
			     (T
			      <TELL " scramble">
			      <COND (<T? ,LIT?>
				     <TELL "s">)>
			      <TELL "[RIDX: 1121]">
			      <FREE-LEM>)>
		       <RTRUE>)
		      (<SEE-SNAKE?>
		       <COND (<T? .CR>
		       	      <CRLF>)>
		       <MAKE ,LEM ,SEEN>
		       <TELL ,CTHELEM>
		       <COND (<NOT <IS? ,LEM ,FLIPPED>>
			      <MAKE ,LEM ,FLIPPED>
			      <TELL "sees the " D ,SNAKE
				    "[RIDX: 1123]" CR>
			      <RTRUE>)>
		       <TELL <PICK-NEXT <GET ,RAT-TABLE 3>> ,PERIOD>
		       <RTRUE>)
		      (<IS? ,LEM ,SEEN>
		       <UNMAKE ,LEM ,SEEN>
		       <RFALSE>)
		      (<OR <ZERO? .CR>
			   <PROB 25>>
		       <COND (<T? .CR>
		       	      <CRLF>)>
		       <COND (<ZERO? ,LIT?>
			      <HEAR-LEM-IN ,CAGE>
			      <RTRUE>)>
		       <MAKE ,LEM ,SEEN>
		       <TELL ,CTHELEM "in the cage "
			     <PICK-NEXT <GET ,RAT-TABLE 2>> ,PERIOD>
		       <RTRUE>)
		      (T
		       <RFALSE>)>)
	       (T
		<COND (<T? .CR>
		       <CRLF>)>
		<MAKE ,LEM ,SEEN>
		<TELL ,CTHELEM>
		<COND (<AND <IS? .L ,CONTAINER>
			    <IS? .L ,OPENED>>
		       <TELL "leaps out of " THE .L " and ">)
		      (<IS? .L ,SURFACE>
		       <TELL "leaps off " THE .L " and ">)>
		<FREE-LEM>
		<RTRUE>)
	     ; (T
		<MAKE ,LEM ,CHILLY>
		<RFALSE>)>>

<ROUTINE SNAKE-LUNCH ()
	 <TELL "[RIDX: 1129]" D ,CLOSET-DOOR
"[RIDX: 1130]" D ,SNAKE ,PCR CTHE ,LEM
"[RIDX: 1131]">
	 <SNAKE-LEAVES>
	 <EXIT-LEM>
	 <UPDATE-SCORE 3>
	 <RTRUE>>

<GLOBAL RAT-TABLE:TABLE
	<PTABLE
	 <LTABLE 2
	 	 "[RIDX: 1132]"
	 	 "[RIDX: 1133]"
	 	 "[RIDX: 1134]"
	 	 "[RIDX: 1135]">
	 <LTABLE 2
	 	 " scratching "
		 " pacing "
		 " moving "
		 " scrambling "
		 " sniffing ">
	 <LTABLE 2
	 	 "[RIDX: 1141]"
		 "[RIDX: 1142]"
		 "scratches its ear"
		 "[RIDX: 1144]"
		 "[RIDX: 1145]"
		 "blinks at you">
	 <LTABLE 2
	 	 "[RIDX: 1147]"
	 	 "[RIDX: 1148]"
		 "[RIDX: 1149]">>>

<ROUTINE HEAR-LEM-IN (THING)
	 <MAKE ,LEM ,SEEN>
	 <TELL "You can hear the " D ,LEM <PICK-NEXT <GET ,RAT-TABLE 1>>
	       " about in " THE .THING ,PERIOD>
	 <RTRUE>>

<ROUTINE FREE-LEM ()
	 <MAKE ,LEM ,CHILLY>
	 <MAKE ,LEM ,SEEN>
	 <COND (<T? ,SUITED?>
		<COND (<NOT <IN? ,LEM ,PLAYER>>
		       <MOVE ,LEM ,PLAYER>)>
		<SETG P-IT-OBJECT ,LEM>
		<BOUNCES-IN-FILM ,LEM>
		<RTRUE>)
	       (<HERE? CLIFF-EDGE TOWER-PLAT ON-TOWER>
		<EXIT-LEM>
		<TELL "[RIDX: 1152]">
		<COND (<HERE? CLIFF-EDGE>
		       <TELL D ,TCLIFF>)
		      (T
		       <MOVE ,DLEM ,AT-ZERO>
		       <MAKE ,DLEM ,NOGRASS>
		       <TELL D ,TOWER>)>
		<PRINT ,PERIOD>
		<RTRUE>)
	       (<AND <HERE? IN-ORBIT ON-SAT>
		     <ZERO? ,SUITED?>>
		<EXIT-LEM>
		<TELL "tumbles slowly" ,OUTASITE>
		<RTRUE>)
	       (<HERE? IN-CLOSET>
	      ; <MAKE ,LEM ,NODESC>
		<MOVE ,LEM ,HERE>
		<TELL "plop">
		<COND (<T? ,LIT?>
		       <TELL "s">)>
		<TELL " to the " D ,FLOOR>
		<COND (<IS? ,CLOSET-DOOR ,OPENED>
		       <TELL ". Then it ">
		       <SNAKE-LUNCH>
		       <RTRUE>)>
		<PRINT ,PERIOD>
		<UNMAKE ,LEM ,SEEN>
		<RTRUE>)
	       (<HERE? IN-GARDEN>
		<COND (<AND <IS? ,TS4-DOOR ,OPENED>
			    <NOT <IS? ,TS4-DOOR ,NOALL>>>
		       <EXIT-LEM>
		       <TELL "[RIDX: 1158]"
			     D ,TS4-DOOR ,PERIOD>
		       <RTRUE>)>
		<OUT-THE-DOOR ,GARDEN-DOOR>
		<COND (<NOT <IS? ,COTTAGE-DOOR ,OPENED>>
		       <MAKE ,COTTAGE-DOOR ,OPENED>
		       <TELL CR "[RIDX: 1159]"
			     D ,COTTAGE ,PERIOD>)>
		<RTRUE>)
	       (<HERE? SEROOM>
		<TELL
"races" ,TON "[RIDX: 1161]">
		<OUT-THE-DOOR ,SEROOM-DOOR>
		<RTRUE>)
	       (<HERE? SWROOM>
		<OUT-THE-DOOR ,SWROOM-DOOR>
		<RTRUE>)
	       (<HERE? NROOM>
		<OUT-THE-DOOR ,NROOM-DOOR>
		<RTRUE>)
	       (<HERE? BROOM>
		<OUT-THE-DOOR ,BROOM-DOOR>
		<RTRUE>)
	       (<HERE? NWROOM>
		<SCAMPER-OFF-TO "north">
		<RTRUE>)
	       (<HERE? IN-BATH>
		<SCAMPER-OFF-TO "south">
		<RTRUE>)
	       (<HERE? IN-COTTAGE>
		<OUT-THE-DOOR ,COTTAGE-DOOR>
		<RTRUE>)
	       (<HERE? IN-MILL>
		<EXIT-LEM>
		<MOVE ,DLEM ,UNDER-WATER>
		<MAKE ,DLEM ,CHILLY>
		<TELL "leaps over the " D ,LANDING "[RIDX: 1165]" CR>
		<RTRUE>)
	       (<HERE? IN-SHACK>
		<MOVE ,DLEM ,AT-ZERO>
		<MAKE ,DLEM ,NOGRASS>)>
	 <EXIT-LEM>
	 <TELL "scurries" ,OUTASITE>
	 <RTRUE>>

<ROUTINE SCAMPER-OFF-TO (DIR)
	 <EXIT-LEM>
	 <TELL "scurries off to the " .DIR>
	 <COND (<NOT <IS? ,NROOM-DOOR ,OPENED>>
		<MAKE ,NROOM-DOOR ,OPENED>
		<TELL "[RIDX: 1168]">)>
	 <PRINT ,PERIOD>
	 <RTRUE>>

<ROUTINE OUT-THE-DOOR (DOOR)
	 <EXIT-LEM>
	 <COND (<IS? .DOOR ,OPENED>
		<TELL "[RIDX: 1169]" D .DOOR ,PERIOD>
		<RTRUE>)>
	 <MAKE .DOOR ,OPENED>
	 <TELL "nudges open the " D .DOOR ". Then it scurries" ,OUTASITE>
	 <RTRUE>>

<ROUTINE EXIT-LEM ()
	 <DEQUEUE I-LEM>
	 <VANISH ,LEM>
	 <RTRUE>>

<ROUTINE I-RODENTS ("OPTIONAL" (CR T))
	 <COND (<HERE? ON-PLATFORM>
		<UNMAKE ,RODENTS ,SEEN>
		<RFALSE>)
	       (<IS? ,RODENTS ,TOUCHED>
		<UNMAKE ,RODENTS ,TOUCHED>
		<MAKE ,RODENTS ,SEEN>
		<SETG P-THEM-OBJECT ,RATS>
		<COND (<T? .CR>
		       <CRLF>)>
		<TELL
"[RIDX: 1173]" ,OUTASITE>
		<RTRUE>)
	       (<IS? ,RODENTS ,CHILLY>
		<UNMAKE ,RODENTS ,CHILLY>
		<MAKE ,RODENTS ,SEEN>
		<SETG P-THEM-OBJECT ,RATS>
		<COND (<T? .CR>
		       <CRLF>)>
		<TELL CTHE ,GROUND
" is covered with " D ,RATS "! They're racing ">
		<COND (<HERE? ATUN BTUN>
		       <TELL "east">)
		      (T
		       <TELL "north">
		       <COND (<NOT <HERE? ETUN HTUN>>
			      <TELL "east">)>)>
		<TELL
"[RIDX: 1179]" CR>
		<RTRUE>)
	       (<ZERO? .CR>
		T)
	       (<IS? ,RODENTS ,SEEN>
		<UNMAKE ,RODENTS ,SEEN>
		<RFALSE>)
	       (<PROB 30>
		<RFALSE>)
	       (T
		<CRLF>)>
	 <SETG P-THEM-OBJECT ,RATS>
	 <MAKE ,RODENTS ,SEEN>
	 <TELL CTHE ,RATS <PICK-NEXT <GET ,RAT-TABLE 0>> ,PERIOD>
	 <RTRUE>>

<ROUTINE I-METEOR ()
	 <CRLF>
	 <COND (<IS? ,METEOR ,NOALL>
		<UNMAKE ,METEOR ,NOALL>
		<SETG P-IT-OBJECT ,METEOR>
		<TELL
"[RIDX: 1180]" D ,METEOR
" streak overhead." CR>
		<RTRUE>)
	       (T
		<MAKE ,METEOR ,SEEN>
		<SETG P-IT-OBJECT ,NOT-HERE-OBJECT>
		<DEQUEUE I-METEOR>
		<TELL CTHE ,METEOR
"[RIDX: 1182]" D ,HORIZON ,PCR
"[RIDX: 1183]">
		<ALL-IS-STILL>
		<RTRUE>)>>

<ROUTINE I-MAGPIE ("OPTIONAL" (CR T) "AUX" X CNT)
	 <COND (<OR <T? ,QUIET?>
		    <ZERO? ,LIT?>>
		<RFALSE>)
	     ; (<AND <IN? ,MAGPIE ,CAGE>
		     <IS? ,CAGE ,OPENED>
		     <T? ,LIT?>>
		<MAGPIE-SCRAMS>
		<RTRUE>)
	       (<VISIBLE? ,MAGPIE>
		<COND (<ZERO? .CR>
		       T)
		      (<IS? ,MAGPIE ,SEEN>
		       <UNMAKE ,MAGPIE ,SEEN>
		       <RFALSE>)
		      (<PROB 30>
		       <RFALSE>)
		      (T
		       <CRLF>)>
		<MAKE ,MAGPIE ,SEEN>
		<COND (<PROB 30>
		       <TELL CTHE ,MAGPIE <PICK-NEXT <GET ,PIE-TABLE 2>>
			     ,PERIOD>
		       <RTRUE>)>
		<COND (<PROB 30>
		       <SET X T>
		       <TELL CTHE ,MAGPIE <PICK-NEXT <GET ,PIE-TABLE 0>>
			     "s, ">)>
		<PRINTC 34>
		<COND (<PROB 50>
		       <TELL "Awk! ">)>
		<COND (<OR <ZERO? ,INLEN>
			   <VERB? WAIT WAIT-FOR LISTEN>
			   <PROB 50>>
		       <TELL <PICK-NEXT <GET ,PIE-TABLE 1>>>)
		      (T
		       <PRINT-SENTENCE>)>
		<COND (<OR <T? .X>
			   <PROB 50>>
		       <TELL ".">
		       <COND (<PROB 50>
			      <TELL " Awk!">)>
		       <TELL "\"" CR>
		       <RTRUE>)>
		<COND (<PROB 50>
		       <TELL ". Awk!">)
		      (T
		       <TELL ",">)>
		<TELL "\"" <PICK-NEXT <GET ,PIE-TABLE 0>>
		      "s the " D ,MAGPIE ,PERIOD>
		<RTRUE>)
	       (T
		<UNMAKE ,MAGPIE ,SEEN>
		<RFALSE>)>>

<ROUTINE EXIT-MAGPIE ()
	 <DEQUEUE I-MAGPIE>
	 <VANISH ,MAGPIE>
	 <RTRUE>>

<GLOBAL PIE-TABLE:TABLE
	<PTABLE
	 <LTABLE 2 " croak" " squawk" " screeche" " say" " mutter">
	 <LTABLE 2
	 	 "Milk and honey"
	 	 "[RIDX: 1201]"
	 	 "Fresh whole lizard"
	 	 "[RIDX: 1203]"
	 	 "Crescent moon"
	 	 "[RIDX: 1205]"
	 	 "[RIDX: 1206]"
	 	 "It go BOOM">
	 <LTABLE 2
		 " blinks at you"
		 "[RIDX: 1209]"
		 " wiggles its head"
		 " whistles"
		 "[RIDX: 1212]"
		 "[RIDX: 1213]"
		 "[RIDX: 1214]"
		 " cranes its neck"
		 " beats its wings"
		 " sharpens its beak">>>

<ROUTINE I-JAWS ("AUX" (X <>))
	 <DEC JAW-TIME>
	 <COND (<ZERO? ,JAW-TIME>
		<DEQUEUE I-JAWS>
		<MAKE ,TRAP ,OPENED>
		<REMOVE ,ICHOR>
		<SET X <FIRST? ,TRAP>>
		<COND (<T? .X>
		       <COND (<EQUAL? .X ,CAGE>
			      <COND (<IN? ,LEM .X>
				     <REMOVE ,LEM>)
				    (<IN? ,MAGPIE .X>
				     <REMOVE ,MAGPIE>)>)>
		       <MOVE .X ,NBOG>)>
		<MOVE ,ICHOR ,TRAP>
		<COND (<HERE? NBOG>
		       <TELL CR "The jaws of the " D ,TRAP " slowly reopen">
		       <COND (<T? .X>
			      <TELL ", and " THE .X " fall">
			      <COND (<NOT <IS? .X ,PLURAL>>
				     <TELL "s">)>
			      <TELL " out onto the ground">)>
		       <PRINT ,PERIOD>
		       <RTRUE>)
		      (T
		       <RFALSE>)>)
	       (T
		<RFALSE>)>>

<ROUTINE I-BEE ()
	 <COND (<NOT <IN? ,BEE ,HERE>>
		<MAKE ,BEE ,TOUCHED>
		<COND (<AND <IS? ,HERE ,SHADOWY>
			    <NOT <IS? ,HERE ,INDOORS>>>
		       <MOVE ,BEE ,HERE>
		       <TELL CR <PICK-NEXT <GET ,BEE-TABLE 0>> ,PERIOD>
		       <COND (<HERE? NBOG>
			      <COND (<IS? ,TRAP ,OPENED>
				     <BEE-ENTERS-TRAP>
				     <RTRUE>)>
			      <TELL CR
"[RIDX: 1225]" D ,TRAP
"[RIDX: 1226]" CR>)>
		       <RTRUE>)
		      (T
		       <RFALSE>)>)
	       (<AND <HERE? NBOG>
		     <IS? ,TRAP ,OPENED>>
		<BEE-ENTERS-TRAP>
		<RTRUE>)
	       (<T? ,SUITED?>
		<POP-BUBBLE-SUIT>
		<TELL CR CTHE ,BEE "[RIDX: 1227]" D ,FILM
"[RIDX: 1228]" ,PCR>
		<ITALICIZE "Pop!">
		<CRLF>
		<RTRUE>)
	       (<IS? ,BEE ,TOUCHED>
		<UNMAKE ,BEE ,TOUCHED>
		<TELL CR <PICK-NEXT <GET ,BEE-TABLE 1>> ,PERIOD>
		<RTRUE>)
	       (<IS? ,BEE ,SEEN>
		<UNMAKE ,BEE ,SEEN>
		<MAKE ,BEE ,TOUCHED>
		<TELL CR CTHE ,BEE
"[RIDX: 1230]" ,PCR><PRINT-ID "events:1960">
		<VOICE-MUTTERS "[RIDX: 1232]" <>>
		<RTRUE>)
	       (T
		<TELL CR "[RIDX: 1233]" D ,BEE
"[RIDX: 1234]">
		<PRINT-ID "events:1968"><JIGS-UP>
		<RTRUE>)>>

<ROUTINE BEE-ENTERS-TRAP ()
	 <CLOSE-TRAP>
	 <DEQUEUE I-BEE>
	 <REMOVE ,BEE>
	 <TELL CR "[RIDX: 1236]" D ,TRAP
"[RIDX: 1237]">
	 <ITALICIZE "Click!">
	 <TELL " The " D ,TRAP
"[RIDX: 1240]" CR>
	 <RTRUE>>

<GLOBAL BEE-TABLE:TABLE
	<PTABLE
	 <LTABLE 2
	 	 "[RIDX: 1241]"
	 	 "[RIDX: 1242]"
	 	 "[RIDX: 1243]"
	 	 "[RIDX: 1244]">
	 <LTABLE 2
	  "[RIDX: 1245]"
	  "[RIDX: 1246]"
	  "[RIDX: 1247]"
	  "[RIDX: 1248]">
	 <LTABLE 2
	 	 "[RIDX: 1249]"
	 	 "[RIDX: 1250]"
	 	 "[RIDX: 1251]"
	 	 "[RIDX: 1252]">>>

<ROUTINE I-SKINK ("AUX" L)
	 <SET L <LOC ,SKINK>>
	 <COND (<NOT <EQUAL? .L ,PLAYER>>
		<MAKE ,SKINK ,CHILLY>)>

	 <COND (<AND <ZERO? ,LIT?>
		     <EQUAL? .L ,HERE>>
		<COND (<IS? ,SKINK ,SEEN>
		       <UNMAKE ,SKINK ,SEEN>
		       <RFALSE>)>
		<MAKE ,SKINK ,SEEN>
		<TELL CR <PICK-NEXT <GET ,SKINK-TABLE 1>> ,PERIOD>
		<RTRUE>)

	       (<AND <EQUAL? .L ,TUN3>
		     <HERE? TUN3>>
		<CRLF>
		<COND (<NOT <IN? ,SHARD ,CREVICE>>
		       <UNMAKE ,SKINK ,SEEN>
		       <MOVE ,SKINK ,CREVICE>
		       <SETG P-IT-OBJECT ,NOT-HERE-OBJECT>
		       <TELL "[RIDX: 1254]" D ,SKINK
"[RIDX: 1255]" D ,CREVICE ,PERIOD>
		       <RTRUE>)>
		<TELL CTHE ,SKINK>
		<COND (<AND <IN? ,LAMP ,TUN2>
			    <IS? ,LAMP ,LIGHTED>>
		       <COND (<NOT <IS? ,SKINK ,SHADOWY>>
			      <SKINK-TO-TUN2>
			      <FIRST-SKINK-EXIT>
			      <RTRUE>)
			     (<NOT <IS? ,SKINK ,SEEN>>
			      <PUT <GET ,SKINK-TABLE 2> 1 2>
			      <TELL
"[RIDX: 1256]" D ,TUNNEL ", blinks and">)>
		       <MAKE ,SKINK ,SEEN>
		       <SETG P-IT-OBJECT ,SKINK>
		       <TELL <PICK-NEXT <GET ,SKINK-TABLE 2>> ,PERIOD>
		       <RTRUE>)>
		<SETG P-IT-OBJECT ,NOT-HERE-OBJECT>
	 	<UNMAKE ,SKINK ,SEEN>
	 	<COND (<AND <VISIBLE? ,LAMP>
			    <IS? ,LAMP ,LIGHTED>>
		       <TELL "[RIDX: 1258]" D ,LAMP ", and">)>
		<SKINK-TO-TUN2>
		<PRINT ,PERIOD>
		<RTRUE>)

	       (<AND <EQUAL? .L ,CREVICE>
		     <HERE? TUN3>>
		<COND (<IN? ,SHARD ,CREVICE>
		       <TELL CR CTHE ,SKINK
"[RIDX: 1260]" D ,CREVICE
"[RIDX: 1261]">
		       <SKINK-TO-TUN2>
		       <COND (<AND <IN? ,LAMP ,TUN2>
		     	 	   <IS? ,LAMP ,LIGHTED>>
			      <FIRST-SKINK-EXIT>
			      <RTRUE>)>
		       <PRINT ,PERIOD>
		       <RTRUE>)
		      (<IS? ,SKINK ,SEEN>
		       <UNMAKE ,SKINK ,SEEN>
		       <RFALSE>)
		      (<PROB 50>
		       <RFALSE>)>
		<MAKE ,SKINK ,SEEN>
		<SETG P-IT-OBJECT ,CREVICE>
		<TELL CR <PICK-NEXT <GET ,SKINK-TABLE 3>> ,PERIOD>
		<RTRUE>)

	       (<AND <EQUAL? .L ,TUN2>
		     <HERE? TUN2>>
		<SETG P-IT-OBJECT ,NOT-HERE-OBJECT>
		<UNMAKE ,SKINK ,SEEN>
		<MOVE ,SKINK <COND (<OR <IN? ,SHARD ,TUN3>
			   		<AND <IN? ,LAMP ,TUN3>
			    		     <IS? ,LAMP ,LIGHTED>>>
		       		    ,CREVICE)
		      		   (T
		       		    ,TUN3)>>
		<TELL CR CTHE ,SKINK "[RIDX: 1262]">
		<COND (<AND <VISIBLE? ,LAMP>
			    <IS? ,LAMP ,LIGHTED>>
		       <TELL "beam of the " D ,LAMP>)
		      (T
		       <TELL "glow of the " D ,SHARD>)>
		<TELL "[RIDX: 1265]"
		      D ,CAVERN ,PERIOD>
		<RTRUE>)

	       (<EQUAL? .L ,POCKET>
		<MAKE ,SKINK ,CHILLY>
		<COND (<IS? ,SKINK ,SEEN>
		       <UNMAKE ,SKINK ,SEEN>
		       <RFALSE>)
		      (<PROB 50>
		       <RFALSE>)>
		<MAKE ,SKINK ,SEEN>
		<TELL CR <PICK-NEXT <GET ,SKINK-TABLE 0>> ,PERIOD>
		<RTRUE>)

	       (<NOT <VISIBLE? ,SKINK>>
		<UNMAKE ,SKINK ,SEEN>
		<MAKE ,SKINK ,CHILLY>
		<RFALSE>)

	       (<EQUAL? .L ,PLAYER>
		<UNMAKE ,SKINK ,SEEN>
		<CRLF>
		<COND (<IS? ,SKINK ,CHILLY>
		       <UNMAKE ,SKINK ,CHILLY>
		       <SETG P-IT-OBJECT ,SKINK>
		       <TELL CTHE ,SKINK
" [RIDX: 1107]" D ,HANDS ,PERIOD><PRINT-ID "events:2116">
		       <RTRUE>)>
		<TELL
"[RIDX: 1268]" D ,SKINK "[RIDX: 1269]">
		<FREE-SKINK>
		<RTRUE>)>

	 <TELL CR CTHE ,SKINK>
	 <PRINTC 32>
	 <COND (<EQUAL? .L ,CAGE>
		<TELL "squeezes[RIDX: 1121]">)
	       (<AND <IS? .L ,CONTAINER>
		     <IS? .L ,OPENED>>
		<TELL "leaps out of " THE .L " and ">)
	       (<IS? .L ,SURFACE>
		<TELL "leaps off " THE .L " and ">)>
	 <FREE-SKINK>
	 <RTRUE>>

<ROUTINE SKINK-TO-TUN2 ()
	 <MOVE ,SKINK ,TUN2>
	 <TELL "[RIDX: 1275]" D ,TUNNEL>
	 <RTRUE>>

<ROUTINE FIRST-SKINK-EXIT ()
	 <MAKE ,SKINK ,SHADOWY>
	 <SETG P-IT-OBJECT ,SKINK>
	 <MAKE ,SKINK ,SEEN>
	 <MOVE ,SKINK ,TUN3>
	 <TELL
,PA "[RIDX: 1276]"
D ,LAMP ,PCR "[RIDX: 1277]" D ,SKINK
"[RIDX: 1278]" CR>
	 <RTRUE>>

<GLOBAL SKINK-TABLE:TABLE
	<PTABLE
	 <LTABLE 2
	 	 "[RIDX: 1279]"
	 	 "[RIDX: 1280]"
		 "[RIDX: 1281]">
	 <LTABLE 2
	 	 "[RIDX: 1282]"
	 	 "[RIDX: 1283]"
	 	 "[RIDX: 1284]">
	 <LTABLE 2
	 	 "[RIDX: 1285]"
	 	 "[RIDX: 1286]"
	 	 "[RIDX: 1287]">
	 <LTABLE 2
	 	 "[RIDX: 1288]"
	 	 "[RIDX: 1289]"
	 	 "[RIDX: 1290]">>>

<ROUTINE FREE-SKINK ()
	 <MAKE ,SKINK ,CHILLY>
	 <MAKE ,SKINK ,SEEN>
	 <COND (<T? ,SUITED?>
		<COND (<NOT <IN? ,SKINK ,PLAYER>>
		       <MOVE ,SKINK ,PLAYER>)>
		<SETG P-IT-OBJECT ,SKINK>
		<BOUNCES-IN-FILM ,SKINK>
		<RTRUE>)>
	 <SETG P-IT-OBJECT ,NOT-HERE-OBJECT>
	 <COND (<HERE? TUN2>
		<MOVE ,SKINK ,TUN3>
		<TELL "scurries away" ,TOW ,PERIOD>
		<RTRUE>)
	       (<HERE? TUN3>
		<MOVE ,SKINK ,CREVICE>
		<TELL "scurries into the ">
		<COND (<IN? ,SHARD ,CREVICE>
		       <TELL "lighted ">)>
		<TELL D ,CREVICE ,PERIOD>
		<RTRUE>)>
	 <EXIT-SKINK>
	 <COND (<AND <HERE? IN-ORBIT ON-SAT>
		     <ZERO? ,SUITED?>>
		<TELL "drifts slowly">)
	       (<HERE? IN-CLOSET>
		<TELL "disappears">
		<COND (<T? ,LIT?>
		       <TELL "[RIDX: 1296]" D ,FLOOR>)>
		<PRINT ,PERIOD>
		<RTRUE>)
	       (T
		<COND (<AND <HERE? PROM>
			    <T? ,IN-DISH?>>
		       <TELL "[RIDX: 1297]">)>
		<TELL "scurries">)>
	 <PRINT ,OUTASITE>
	 <RTRUE>>

<ROUTINE EXIT-SKINK ()
	 <PRINT-ID "events:2210"><VANISH ,SKINK>
	 <DEQUEUE I-SKINK>
	 <RTRUE>>

<GLOBAL STICKS:NUMBER 0>

<ROUTINE I-STYX ("OPTIONAL" (CR? T) "AUX" (DOCK <>) (B <>))
	 <COND (<T? ,IN-DORY?>
		<RFALSE>)
	       (<ZERO? ,STICKS>
		<COND (<NOT <HERE? DOCKSIDE>>
		       <RFALSE>)>
		<INC STICKS>
		<SETG P-IT-OBJECT ,DORY>
		<MOVE ,DORY ,HERE>
		<DORY-APPEARS>
		<PRINT ,PERIOD>
		<RTRUE>)>

	 <INC STICKS> ; "Update counter."
	 <COND (<G? ,STICKS 12>
		<SETG STICKS 1>)>

       ; "[RIDX: 1303]"

	 <COND (<EQUAL? ,STICKS 1>
		<MOVE ,DORY ,DOCKSIDE>)
	       (<EQUAL? ,STICKS 3>
		<MAKE ,DORY ,TOUCHED>
		<MOVE ,SHADES ,DOCKSIDE>)
	       (<EQUAL? ,STICKS 4>
		<MOVE ,SHADES ,DORY>)
	       (<EQUAL? ,STICKS 6 11>
		<UNMAKE ,DORY ,TOUCHED>)
	       (<EQUAL? ,STICKS 7>
		<REMOVE ,DORY>)
	       (<EQUAL? ,STICKS 8>
		<MOVE ,DORY ,ON-BEACH>)
	       (<EQUAL? ,STICKS 10>
		<MAKE ,DORY ,TOUCHED>
		<REMOVE ,SHADES>)
	       (<EQUAL? ,STICKS 12>
		<REMOVE ,DORY>)>

       ; "[RIDX: 1304]"

	 <COND (<HERE? DOCKSIDE>
		<SET DOCK T>)
	       (<HERE? ON-BEACH>
		<SET B T>)
	       (T
		<RFALSE>)>

	 <COND (<OR <AND <EQUAL? ,STICKS 1>
			 <T? .DOCK>>
		    <AND <EQUAL? ,STICKS 8>
			 <T? .B>>>
		<COND (<T? .CR?>
		       <CRLF>)>
	  	<SETG P-HIM-OBJECT ,CHARON>
		<TELL CTHE ,DORY "[RIDX: 1305]" CR>
		<RTRUE>)

	       (<OR <AND <EQUAL? ,STICKS 2>
		     	 <T? .DOCK>>
		    <AND <EQUAL? ,STICKS 9>
			 <T? .B>>>
		<COND (<T? .CR?>
		       <CRLF>)>
		<SETG P-HIM-OBJECT ,CHARON>
		<TELL CTHE ,DORY "[RIDX: 1306]" D ,BEACH>
	 	<COND (<NOT <IS? ,CHARON ,TOUCHED>>
		       <MAKE ,CHARON ,TOUCHED>
		       <MAKE-OUT-CHARON>
		       <RTRUE>)>
	 	<PRINT ,PERIOD>
		<RTRUE>)

	       (<OR <AND <EQUAL? ,STICKS 3>
		     	 <T? .DOCK>>
		    <AND <EQUAL? ,STICKS 10>
			 <T? .B>>>
		<COND (<T? .CR?>
		       <CRLF>)>
		<SETG P-HIM-OBJECT ,CHARON>
		<SETG P-THEM-OBJECT ,SHADES>
		<SOUNDLESS-LANDING>
		<TELL ,PCR>
		<COND (<T? .DOCK>
		       <SETG P-THEM-OBJECT ,SHADES>
		       <TELL
"[RIDX: 1307]" D ,BEACH
"[RIDX: 1308]"
D ,ME "[RIDX: 1309]" D ,SHADES
"[RIDX: 1310]" CR>
		       <RTRUE>)>
		<ONE-BY-ONE>
		<PRINT ,PERIOD>
		<RTRUE>)

	       (<AND <EQUAL? ,STICKS 4>
		     <T? .DOCK>>
		<COND (<T? .CR?>
		       <CRLF>)>
		<SETG P-HIM-OBJECT ,CHARON>
		<SETG P-THEM-OBJECT ,SHADES>
		<TELL
"The ghostly " D ,SHADES "[RIDX: 1312]" D ,CHARON
"[RIDX: 1313]" CR>
		<RTRUE>)

	       (<AND <EQUAL? ,STICKS 5>
		     <T? .DOCK>>
		<COND (<T? .CR?>
		       <CRLF>)>
		<SETG P-HIM-OBJECT ,CHARON>
		<SETG P-THEM-OBJECT ,SHADES>
		<TELL
"The last of the " D ,SHADES "[RIDX: 1315]" CR>
		<RTRUE>)

	       (<OR <AND <EQUAL? ,STICKS 6>
			 <T? .DOCK>>
		    <AND <EQUAL? ,STICKS 11>
			 <T? .B>>>
		<COND (<T? .CR?>
		       <CRLF>)>
		<SETG P-HIM-OBJECT ,CHARON>
		<TELL "[RIDX: 1316]" D ,CHARON
		      " pushes his ">
		<COND (<T? .DOCK>
		       <SETG P-THEM-OBJECT ,SHADES>
		       <TELL "crowded ">)
		      (T
		       <TELL "empty ">)>
		<TELL D ,DORY " away from the " D ,BEACH ,PERIOD>
		<RTRUE>)

	       (<OR <AND <EQUAL? ,STICKS 7>
			 <T? .DOCK>>
		    <AND <EQUAL? ,STICKS 12>
			 <T? .B>>>
		<COND (<T? .CR?>
		       <CRLF>)>
		<SETG P-THEM-OBJECT ,NOT-HERE-OBJECT>
		<SETG P-HIM-OBJECT ,NOT-HERE-OBJECT>
		<TELL "You watch as the " D ,DORY " and its ">
		<COND (<ZERO? .DOCK>
		       <TELL "navigator ">)
		      (T
		       <TELL "passengers ">)>
		<TELL
"[RIDX: 1325]" CR>
		<RTRUE>)

	       (T
		<RFALSE>)>>

<ROUTINE DORY-APPEARS ()
	 <TELL CR
"[RIDX: 1326]">
	 <RTRUE>>

<ROUTINE MAKE-OUT-CHARON ()
	 <TELL "[RIDX: 1327]" D ,CHARON " at the stern." CR>
	 <RTRUE>>

<ROUTINE SOUNDLESS-LANDING ()
	 <TELL CTHE ,CHARON "[RIDX: 1329]" D ,SOUND
	       "less " D ,LANDING>
	 <RTRUE>>

<ROUTINE ONE-BY-ONE ()
	 <TELL "One by one, the " D ,SHADES
"[RIDX: 1332]">
	 <RTRUE>>

<GLOBAL PATIENCE:NUMBER 3>

<ROUTINE I-CHARON ()
	 <DEC PATIENCE>
	 <COND (<EQUAL? ,PATIENCE 2>
		<RFALSE>)>
	 <TELL CR CTHE ,CHARON>
	 <COND (<EQUAL? ,PATIENCE 1>
		<TELL
"[RIDX: 1333]" CR>
		<RTRUE>)
	       (T
		<TELL
" points you in the " D ,INTDIR " of the " D ,BEACH
,PA "[RIDX: 1336]" CR><PRINT-ID "events:2403">
		<EXIT-DORY>
		<RTRUE>)>>

<ROUTINE I-CRABS ("OPTIONAL" (CR T))
	 <COND (<OR <NOT <HERE? WSAND>>
		    <IS? ,CRABS ,SEEN>>
		<UNMAKE ,CRABS ,SEEN>
		<RFALSE>)
	       (<ZERO? .CR>
		T)
	       (<PROB 50>
		<RFALSE>)
	       (T
		<CRLF>)>
	 <TELL "The ">
	 <COND (<PROB 50>
		<COND (<PROB 50>
		       <TELL "alert ">)
		      (T
		       <TELL "wretched ">)>)>
	 <TELL D ,CRABS <PICK-NEXT <GET ,LAGOON-TABLE 0>> ,PERIOD>
	 <SETG P-THEM-OBJECT ,CRABS>
	 <RTRUE>>

<GLOBAL LAGOON-TABLE:TABLE
	<PTABLE
	 <LTABLE 2
	 	 "[RIDX: 1342]"
	 	 "[RIDX: 1343]"
	 	 "[RIDX: 1344]"
	 	 "[RIDX: 1345]">
	 <LTABLE 2
	 	 " stands on its tail"
	 	 " chatters happily"
	 	 "[RIDX: 1348]"
	 	 "[RIDX: 1349]"
	 	 "[RIDX: 1350]"
	 	 "[RIDX: 1351]"
	 	 "[RIDX: 1352]"
	 	 "[RIDX: 1353]">>>

<GLOBAL FCOUNT:NUMBER 6>

<ROUTINE I-FLIPPER ("OPTIONAL" (CR T))
	 <COND (<OR <HERE? ON-SCAFFOLD AT-SDOORS>
		    <IS? ,FLIPPER ,SEEN>>
		<UNMAKE ,FLIPPER ,SEEN>
		<RFALSE>)
	       (<T? ,FCOUNT>
		<DEC FCOUNT>
		<COND (<G? ,FCOUNT 2>
		       <RFALSE>)
		      (<EQUAL? ,FCOUNT 2>
		       <MOVE ,FIN ,HERE>
		       <SETG P-IT-OBJECT ,FIN>
		       <TELL CR
"[RIDX: 1355]" D ,LAGOON ,PERIOD>
		       <RTRUE>)
		      (<NOT <IN? ,FIN ,HERE>>
		       <MOVE ,FIN ,HERE>
		       <SETG P-IT-OBJECT ,FIN>
		       <SETG FCOUNT 2>
		       <TELL CR CTHE ,FIN "[RIDX: 1356]" CR>
		       <RTRUE>)
		      (<EQUAL? ,FCOUNT 1>
		       <COND (<T? .CR>
			      <CRLF>)>
		       <TELL "[RIDX: 1357]" CR>
		       <RTRUE>)
		      (T
		       <SETG FCOUNT 0>
		       <REMOVE ,FIN>
		       <MOVE ,FLIPPER ,HERE>
		       <THIS-IS-IT ,FLIPPER>
		       <MAKE ,FLIPPER ,SEEN>
		       <COND (<T? .CR>
			      <CRLF>)>
		       <TELL
"[RIDX: 1358]" D ,HANDS
"[RIDX: 1359]"
D ,LAGOON "[RIDX: 1360]"
D ,FLIPPER "[RIDX: 1361]" CR>
		       <RTRUE>)>)
	       (<NOT <IN? ,FLIPPER ,HERE>>
		<MAKE ,FLIPPER ,SEEN>
		<MOVE ,FLIPPER ,HERE>
		<THIS-IS-IT ,FLIPPER>
		<TELL CR CTHE ,FLIPPER "[RIDX: 1362]" CR>
		<RTRUE>)
	       (<T? .CR>
		<COND (<PROB 50>
		       <CRLF>)
		      (T
		       <RFALSE>)>)>
	 <MAKE ,FLIPPER ,SEEN>
	 <TELL CTHE ,FLIPPER <PICK-NEXT <GET ,LAGOON-TABLE 1>> ,PERIOD>
	 <RTRUE>>

<ROUTINE I-TIDE ("AUX" (W <>))
	 <COND (<ZERO? ,MINUTES>
		<COND (<NOT <IS? ,TSWITCH ,OPENED>>
		       <TELL CR "[RIDX: 1364]" CR>)>
		<TELL CR
"[RIDX: 1365]">
		<COND (<HERE? ON-SCAFFOLD AT-SDOORS>
		       <TELL "maze of plumbing">)
		      (T
		       <TELL D ,ESHED>)>
		<TELL ".">
		<PRINT-ID "events:2515"><JIGS-UP>
		<RTRUE>)
	       (<HERE? WSAND>
		<SET W T>)>

       ; "[RIDX: 1369]"

	 <COND (<OR <HERE? ON-SCAFFOLD AT-SDOORS>
		    <L? ,MINUTES 54>
		    <NOT <EQUAL? ,SECONDS 45 15>>> ; "Always at 45 or 15."
		T)
	       (<EQUAL? ,MINUTES 54>
		<CRLF>
		<COND (<EQUAL? ,SECONDS 15>
		       <TELL
"[RIDX: 1371]" CR>)
		      (T
		       <TELL "The ">
		       <COND (<T? .W>
		       	      <TELL "distant " D ,ISLET>)
		      	     (T
		       	      <TELL D ,BEACH>)>
		       <TELL
"[RIDX: 1374]" CR>)>
		<BURNS-QUOTED?>
		<RTRUE>)
	       (<EQUAL? ,MINUTES 55>
		<COND (<AND <EQUAL? ,SECONDS 15>
			    <NOT <IS? ,COCO ,TRYTAKE>>>
		       <MAKE ,COCO ,TRYTAKE>
		       <MOVE ,COCO ,ISLET>
		       <COND (<T? .W>
		       	      <SETG P-IT-OBJECT ,COCO>
		       	      <TELL CR "A faint ">
		       	      <ITALICIZE "plop">
		       	      <TELL "[RIDX: 1377]" D ,ISLET
". There's now a " D ,COCO "[RIDX: 1379]" CR>
		       	      <RTRUE>)>
		       <RFALSE>)
		      (<AND <T? .W>
			    <EQUAL? ,SECONDS 45>>
		       <TELL CR "[RIDX: 1380]" D ,COCO
		      		"[RIDX: 1381]" CR>
		       <BURNS-QUOTED?>
		       <RTRUE>)>
		<RFALSE>)
	       (<EQUAL? ,MINUTES 56>
		<COND (<EQUAL? ,SECONDS 15>
		       <MOVE ,COCO ,WSAND>
		       <MAKE ,COCO ,CHILLY>
		       <UNMAKE ,COCO ,NODESC>
		       <PUTP ,COCO ,P?DESCFCN ,DESCRIBE-COCO>
		       <COND (<T? .W>
		       	      <SETG P-IT-OBJECT ,COCO>
		       	      <TELL CR CTHE ,COCO
"[RIDX: 1382]" D ,ISLET " on the rising tide." CR>
		       	      <BURNS-QUOTED?>
			      <RTRUE>)>
		       <RFALSE>)
		      (<AND <IS? ,COCO ,CHILLY>
			    <T? .W>>
		       <TELL CR CTHE ,COCO " bobs gently on the "
		      	     D ,CSURFACE " of the " D ,LAGOON ,PERIOD>
		       <RTRUE>)>
		<RFALSE>)
	       (<EQUAL? ,MINUTES 57>
		<COND (<EQUAL? ,SECONDS 45>
		       <TELL CR
"[RIDX: 1386]" CR>
		       <COND (<AND <T? .W>
			    	   <IS? ,COCO ,CHILLY>>
		       	      <TELL CR CTHE ,COCO
"[RIDX: 1387]" ,OUTASITE>)>
		       <BURNS-QUOTED?>
		       <RTRUE>)
		      (<AND <IS? ,COCO ,CHILLY>
			    <T? .W>>
		       <TELL CR CTHE ,COCO
			     "[RIDX: 1388]" CR>
		       <RTRUE>)>
		<RFALSE>)
	       (<AND <EQUAL? ,MINUTES 58>
		     <EQUAL? ,SECONDS 15>
		     <IS? ,COCO ,CHILLY>
		     <T? .W>>
		<VANISH ,COCO>
		<TELL CR CTHE ,COCO "[RIDX: 1389]" D ,LAGOON
		      ,PERIOD>
		<RTRUE>)
	       (T
		<RFALSE>)>

       ; "Handle PA system."

	 <COND (<IS? ,TSWITCH ,OPENED> ; "[RIDX: 1391]"
		<RFALSE>)
	       (<ZERO? ,SECONDS>
		<TELL ,Z-MINUS <GET <GET ,PA-TABLE 1> <- 60 ,MINUTES>>
		      " minute">
		<COND (<NOT <EQUAL? ,MINUTES 59>>
		       <TELL "s">)>
		<TELL ".\"" CR>
		<RTRUE>)
	       (<AND <EQUAL? ,MINUTES 58>
		     <EQUAL? ,SECONDS 30>>
		<TELL ,Z-MINUS "ninety seconds.\"" CR>
		<RTRUE>)
	       (<EQUAL? ,MINUTES 59>
		<PRINT ,Z-MINUS>
		<COND (<EQUAL? ,SECONDS 15>
	 	       <TELL "[RIDX: 1396]" CR>
		       <RTRUE>)
		      (<EQUAL? ,SECONDS 30>
		       <TELL "thirty seconds.\"" CR>
		       <RTRUE>)>
		<TELL
"[RIDX: 1398]" CR>
		<RTRUE>)
	       (<EQUAL? ,SECONDS 30>
		<CRLF>
		<PRINTC 34>
		<TELL <PICK-NEXT <GET ,PA-TABLE 0>> ".\"" CR>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE BURNS-QUOTED? ()
	 <COND (<IS? ,LAGOON ,SEEN>
		<RFALSE>)>
	 <MAKE ,LAGOON ,SEEN>
	 <CRLF>
	 <VOICE-MUTTERS "[RIDX: 1400]" <>>
	 <RTRUE>>

<GLOBAL PA-TABLE:TABLE
	<PTABLE
	 <LTABLE 2
	 	 "[RIDX: 1401]"
	 	 "Detonator check, go"
	 	 "[RIDX: 1403]"
	 	 "[RIDX: 1404]"
	 	 "[RIDX: 1405]"
	 	 "H-E nominal"
	 	 "[RIDX: 1407]"
	 	 "[RIDX: 1408]">
	 <PTABLE "BUG!" "one" "two" "three" "four" "five"
		 "six" "seven" "eight" "nine" "ten">>>

<ROUTINE I-FALLING ("OPTIONAL" (CR T) "AUX" OBJ NXT)
	 <COND (<T? .CR>
		<CRLF>)>
	 <COND (<OR <T? ,SUITED?>
		    <AND <IN? ,PARASOL ,PLAYER>
			 <IS? ,PARASOL ,OPENED>>>
		<QUEUE I-NAGASAKI -1>
		<TELL CTHE ,CITY
"[RIDX: 1422]"
D ,PGROUND ".." ,PCR>
		<COND (<T? ,SUITED?>
		       <POP-BUBBLE-SUIT>
		       <HLIGHT ,H-ITALIC>
		       <TELL "Pop">
		       <HLIGHT ,H-NORMAL>
		       <TELL "! The " D ,FILM
"[RIDX: 1426]">
		       <COND (<BROLLY-FILLS?>
			      <CRLF>)
			     (T
		       	      <I-FALLING>
		       	      <RTRUE>)>)>

		<ITALICIZE "Crunch.">
		<CRLF> <CRLF>

		<SET OBJ <FIRST? ,PLAYER>>
		<REPEAT ()
			<COND (<ZERO? .OBJ>
			       <RETURN>)>
			<SET NXT <NEXT? .OBJ>>
			<COND (<AND <NOT <EQUAL? .OBJ ,POCKET ,HONEY>>
				    <NOT <IS? .OBJ ,WORN>>>
			       <MOVE .OBJ ,SPILE>)>
			<SET OBJ .NXT>>
		<SETG IN-SAND? T>
		<GOTO ,PLAYGROUND>)
	       (T
		<TELL
"[RIDX: 1428]">
		<PRINT-ID "events:2703"><JIGS-UP>)>
	 <RTRUE>>

<ROUTINE I-NAGASAKI ("OPTIONAL" (CR T) "AUX" (S <>))
	 <COND (<HERE? IN-SHELTER>
		<SET S T>)>
	 <COND (<AND <EQUAL? ,MINUTES 56>
		     <ZERO? ,SECONDS>>
		<MOVE ,GIRL ,PLAYGROUND>
		<QUEUE I-GIRL -1>
		<COND (<ZERO? .S>
		       <COND (<T? .CR>
			      <CRLF>)>
		       <GIRL-APPEARS>
		       <RTRUE>)
		      (<OR <IN? ,PARASOL ,PLAYGROUND>
			   <IN? ,PARASOL ,SPILE>>
		       <MOVE ,PARASOL ,GIRL>)>
		<RFALSE>)
	       (<EQUAL? ,MINUTES 2>
		<COND (<T? .CR>
		       <CRLF>)>
		<TELL ,ALLATONCE "the ">
		<COND (<T? .S>
		       <TELL D ,SHELTER>)
		      (T
		       <TELL D ,SKY>)>
		<TELL
"[RIDX: 1433]">
		<COND (<IN? ,GIRL ,HERE>
		       <TELL "[RIDX: 1434]" D ,GIRL
"[RIDX: 1435]" D ,CHILDREN
"[RIDX: 1436]" D ,NAGASAKI>)
		      (T
		       <TELL
"[RIDX: 1437]">)>
		<TELL ".">
		<PRINT-ID "events:2742"><JIGS-UP>
		<RTRUE>)
	       (<NOT <EQUAL? ,MINUTES 1>>
		<RFALSE>)
	       (<EQUAL? ,SECONDS 15>
		<MAKE ,PLANES ,SEEN>
		<SETG P-THEM-OBJECT ,PLANES>
		<MOVE ,PLANES ,LOCAL-GLOBALS>
		<PUTP ,PLAYGROUND ,P?HEAR ,PLANES>
		<PUTP ,PLAYGROUND ,P?OVERHEAD ,PLANES>
		<PUTP ,ON-BIRD ,P?HEAR ,PLANES>
		<PUTP ,ON-BIRD ,P?OVERHEAD ,PLANES>
		<PUTP ,IN-SHELTER ,P?HEAR ,PLANES>
		<TELL CR
"[RIDX: 1440]" D ,SOUND "[RIDX: 1441]">
		<OVER-OR-OUT>
		<COND (<IN? ,GIRL ,HERE>
		       <MAKE ,GIRL ,SEEN>
		       <TELL ,PTHE D ,GIRL "[RIDX: 1442]">
		       <COND (<T? .S>
			      <TELL D ,CEILING>)
			     (T
			      <TELL D ,SKY>)>
		       <PRINT ,PERIOD>
		       <RTRUE>)
		      (<ZERO? .S>
		       <TELL ,PTHE D ,KIDS " and " D ,TEACHERS
			     "[RIDX: 1444]" CR>
		       <RTRUE>)>
		<PRINT ,PERIOD>
		<RTRUE>)

	       (<EQUAL? ,SECONDS 30>
		<COND (<T? .CR>
		       <CRLF>)>
		<TELL CTHE ,SOUND>
		<OVER-OR-OUT>
		<TELL
"[RIDX: 1445]" D ,PLANES ,PERIOD>
		<COND (<IN? ,GIRL ,HERE>
		       <MAKE ,GIRL ,SEEN>
		       <TELL CR CTHE ,GIRL
			 "[RIDX: 1446]">
		       <COND (<T? .S>
			      <TELL "crouches down in a " D ,CORNER " of ">)
			     (T
			      <TELL "[RIDX: 1449]">)>
		       <TELL THE ,SHELTER ,PERIOD>)>
		<COND (<ZERO? .S>
		       <TEACHERS-COME>)>
		<RTRUE>)

	       (<EQUAL? ,SECONDS 45>
		<COND (<T? .CR>
		       <CRLF>)>
		<TELL "The drone of the " D ,PLANES>
		<OVER-OR-OUT>
		<TELL " increases. It " D ,SOUND
		      "[RIDX: 1452]" CR>
		<COND (<IN? ,GIRL ,HERE>
		       <MAKE ,GIRL ,SEEN>
		       <TELL CR CTHE ,GIRL
"[RIDX: 1453]" CR>
		       <RTRUE>)
		      (<ZERO? .S>
		       <TEACHERS-COME>)>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE GIRL-APPEARS ()
	 <TELL
"[RIDX: 1454]" D ,SWINGS
"[RIDX: 1455]" CR>
	 <GIRL-SEES-YOU>
	 <RTRUE>>

<ROUTINE GIRL-SEES-YOU ()
	 <UNMAKE ,GIRL ,NODESC>
	 <SETG P-HER-OBJECT ,GIRL>
	 <TELL CR
"[RIDX: 1456]" D ,TEACHERS
"[RIDX: 1457]" CR>
	 <COND (<IN? ,PARASOL ,GIRL>
		<SETG P-IT-OBJECT ,PARASOL>
		<MOVE ,PARASOL ,PLAYGROUND>
		<TELL CR
"[RIDX: 1458]" D ,PARASOL
"[RIDX: 1459]" CR>
		<RTRUE>)
	       (<VISIBLE? ,PARASOL>
		<SETG P-IT-OBJECT ,PARASOL>
		<TELL CR "Suddenly, the " D ,PARASOL>
		<COND (<IN? ,PARASOL ,PLAYER>
		       <TELL " in " D ,HANDS>)
		      (T
		       <TELL " at your feet">)>
		<TELL "[RIDX: 1463]" CR>)>
	 <RTRUE>>

<ROUTINE OVER-OR-OUT ()
	 <COND (<HERE? IN-SHELTER>
		<TELL " outside">)
	       (T
		<TELL " overhead">)>
	 <RTRUE>>

<ROUTINE TEACHERS-COME ()
	 <TELL CR
"[RIDX: 1466]" D ,TEACHERS " drop their " D ,SPADE
"[RIDX: 1468]" D ,INTDIR " of the " D ,SHELTER ,PERIOD>
	 <TEACHERS-NOTICE>
	 <RTRUE>>

<ROUTINE I-GIRL ("OPTIONAL" (CR T) "AUX" (S <>))
	 <COND (<HERE? IN-SHELTER>
		<SET S T>)>
	 <COND (<NOT <IN? ,GIRL ,HERE>>
		<MAKE ,GIRL ,SHADOWY> ; "New fear delay."
		<COND (<OR <IS? ,GIRL ,NODESC>
			   <IN? ,PARASOL ,GIRL>>
		       <RFALSE>)
		      (T
		       <MOVE ,GIRL ,HERE>
		       <SETG P-HER-OBJECT ,GIRL>
		       <TELL CR CTHE ,GIRL>
		       <COND (<T? .S>
			      <UNMAKE ,GIRL ,CHILLY>
			      <TELL "[RIDX: 1473]">)
			     (T
			      <TELL "[RIDX: 1474]">)>
		       <TELL "of the " D ,SHELTER ,PERIOD>
		       <RTRUE>)>)>

	 <SETG P-HER-OBJECT ,GIRL>
	 <COND (<IS? ,GIRL ,NODESC> ; "1st time seen?"
		<TELL CR "[RIDX: 1477]" D ,SPILE>
		<COND (<IN? ,PARASOL ,GIRL>
		       <TELL ", playing with the " D ,PARASOL>)>
		<TELL "[RIDX: 1479]" CR>
		<GIRL-SEES-YOU>
		<RTRUE>)
	       (<IS? ,GIRL ,SEEN>
		<UNMAKE ,GIRL ,SEEN>
		<RFALSE>)
	       (<T? .CR>
		<CRLF>)>
	 <COND (<IN? ,PARASOL ,GIRL>
		<SETG P-IT-OBJECT ,PARASOL>
		<TELL CTHE ,GIRL <PICK-NEXT <GET ,GIRL-TABLE 0>> ,PERIOD>
		<RTRUE>)
	       (<VISIBLE? ,PARASOL>
		<SETG P-IT-OBJECT ,PARASOL>
		<TELL CTHE ,GIRL <PICK-NEXT <GET ,GIRL-TABLE 1>> ,PERIOD>
		<RTRUE>)
	       (<IS? ,GIRL ,SHADOWY>
		<UNMAKE ,GIRL ,SHADOWY>
		<TELL CTHE ,GIRL " looks anxiously ">
		<COND (<T? .S>
		       <TELL "around the " D ,SHELTER
			     ", then back at you." CR>
		       <RTRUE>)>
		<TELL "towards the " D ,TEACHERS
		      "[RIDX: 1484]" CR>
		<RTRUE>)
	       (T
		<TELL "[RIDX: 1485]">
		<COND (<T? .S>
		       <DEQUEUE I-GIRL>
		       <REMOVE ,GIRL>
		       <SETG P-HER-OBJECT ,NOT-HERE-OBJECT>
		       <PRINT ,OUTASITE>
		       <RTRUE>)>
		<TELL " away towards the " D ,TEACHERS ,PERIOD>
		<TEACHERS-NOTICE>
		<RTRUE>)>>

<GLOBAL GIRL-TABLE:TABLE
	<PTABLE
	 <LTABLE 2
	 	 "[RIDX: 1487]"
	 	 "[RIDX: 1488]"
	 	 "[RIDX: 1489]"
	 	 "[RIDX: 1490]">
	 <LTABLE 2
	 	 "[RIDX: 1491]"
	 	 "[RIDX: 1492]"
	 	 "[RIDX: 1493]"
	 	 "[RIDX: 1494]">
	 <LTABLE 2
		 "[RIDX: 1495]"
		 "[RIDX: 1496]"
		 "[RIDX: 1497]">>>

<ROUTINE I-NEWCRANE ("OPTIONAL" (CR T))
	 <COND (<NOT <VISIBLE? ,CRANE>>
		<UNMAKE ,CRANE ,SEEN>
		<RFALSE>)
	       (<HERE? IN-SHELTER>
		<COND (<IS? ,CRANE ,SEEN>
		       <UNMAKE ,CRANE ,SEEN>
		       <RFALSE>)
		      (<T? .CR>
		       <COND (<PROB 50>
			      <CRLF>)
			     (T
			      <RFALSE>)>)>
		<TELL <PICK-NEXT <GET ,GIRL-TABLE 2>> ,PERIOD>
		<RTRUE>)
	       (T
		<DEQUEUE I-NEWCRANE>
		<SETG MCOUNT <COND (<NOT <EQUAL? ,MINUTES 1>> 4)
				   (<EQUAL? ,SECONDS 45> 1)
				   (<EQUAL? ,SECONDS 30> 2)
				   (<EQUAL? ,SECONDS 15> 3)
				   (T 			 4)>>
		<QUEUE I-MCRANE -1>
		<REMOVE ,CRANE>
		<MOVE ,MCRANE ,PLAYGROUND>
		<SETG P-IT-OBJECT ,MCRANE>
		<TELL CR "[RIDX: 1499]" D ,HANDS ,PCR
		      CTHE ,CRANE " is ">
		<ITALICIZE "growing!">
		<TELL
"[RIDX: 1502]" CR>
		<RTRUE>)>>

<GLOBAL MCOUNT:NUMBER 0>

<ROUTINE I-MCRANE ("OPTIONAL" (CR T))
	 <DEC MCOUNT>
	 <COND (<ZERO? ,MCOUNT>
		<DEQUEUE I-MCRANE>
		<REMOVE ,MCRANE>
		<COND (<HERE? IN-SHELTER>
		       <TELL CR
"[RIDX: 1504]" D ,SHELTER ,PERIOD>)
		      (T
		       <SETG P-IT-OBJECT ,NOT-HERE-OBJECT>
		       <COND (<T? .CR>
			      <CRLF>)>
		       <TELL CTHE ,MCRANE
"[RIDX: 1505]" D ,CRANE "[RIDX: 1506]" CR>)>
		<RTRUE>)
	       (<HERE? IN-SHELTER>
		<RFALSE>)
	       (<T? .CR>
		<CRLF>)>
	 <SETG P-IT-OBJECT ,MCRANE>
	 <TELL CTHE ,MCRANE>
	 <COND (<EQUAL? ,MCOUNT 1>
		<TELL
"[RIDX: 1507]" ,AS-IF
"[RIDX: 1508]" CR>
		<RTRUE>)
	       (<EQUAL? ,MCOUNT 2>
		<TELL "[RIDX: 1509]" CR>
		<RTRUE>)
	       (T
		<TELL
"[RIDX: 1510]" CR>
		<RTRUE>)>>

<ROUTINE I-FLIGHT ("OPTIONAL" (CR T))
	 <DEC MCOUNT>
	 <SETG MINUTES 1>
	 <SETG HOURS 11>
	 <SETG SECONDS 15>
	 <COND (<T? .CR>
		<CRLF>)>
	 <COND (<EQUAL? ,MCOUNT 2>
		<MAKE ,PLANES ,SEEN>
		<PUTP ,ON-BIRD ,P?HEAR ,PLANES>
		<PUTP ,ON-BIRD ,P?OVERHEAD ,PLANES>
		<TELL CTHE ,MCRANE
"[RIDX: 1512]" D ,PLANES ,PCR>
		<COND (<AND <IS? ,TS5-DOOR ,OPENED>
			    <NOT <IS? ,TS5-DOOR ,NOALL>>>
		       <TELL
"[RIDX: 1513]"
D ,TS5-DOOR ,PTHE "[RIDX: 1514]" CR>
		       <RTRUE>)
		      (T
		       <TELL
"[RIDX: 1515]">
		       <SAY-DRONE-LOUDER>
		       <TELL CR CTHE ,FATMAN
"[RIDX: 1516]">
		       <PRINT-ID "events:3034"><JIGS-UP>)>)
	       (<EQUAL? ,MCOUNT 1>
		<SAY-DRONE-LOUDER>
		<RTRUE>)
	       (T
		<TELL CTHE ,FATMAN " shatters the " D ,TS5-DOOR
"[RIDX: 1519]">
		<JIGS-UP>
		<RTRUE>)>>

<ROUTINE SAY-DRONE-LOUDER ()
	 <MAKE ,FATMAN ,SEEN>
	 <TELL "The drone of the " D ,PLANES
"[RIDX: 1521]" CR>
	 <RTRUE>>

<GLOBAL DRIBBLE:NUMBER 0>

<ROUTINE I-MILK ("OPTIONAL" (CR T) "AUX" L (V <>))
	 <SET L <LOC ,OCOCO>>
	 <COND (<ZERO? .L>
		<KILL-MILK>
		<RFALSE>)
	       (<VISIBLE? ,OCOCO>
		<SET V T>)>
	 <DEC DRIBBLE>
	 <COND (<ZERO? ,DRIBBLE>
		<KILL-MILK>
		<COND (<ZERO? .V>
		       <RFALSE>)
		      (<T? .CR>
		       <CRLF>)>
	 	<SETG P-IT-OBJECT ,OCOCO>
	 	<LAST-DROPS>
		<RTRUE>)>
	 <MOVE ,MILK .L>
	 <MAKE ,MILK ,NODESC>
	 <COND (<AND <EQUAL? ,DRIBBLE 1>
		     <T? .V>>
		<SETG P-IT-OBJECT ,OCOCO>
		<COND (<T? .CR>
		       <CRLF>)>
		<TELL "[RIDX: 1524]" D ,OCOCO ,PERIOD>
		<RTRUE>)>
	 <RFALSE>>

<ROUTINE LAST-DROPS ()
	 <TELL "The last drops of " D ,MILK
	       " dribble out of the " D ,OCOCO ,PERIOD>
	 <RTRUE>>

<ROUTINE KILL-MILK ()
	 <SETG DRIBBLE 0>
	 <DEQUEUE I-MILK>
	 <REMOVE ,MILK>
	 <RTRUE>>

<GLOBAL XCOUNT:NUMBER 3>

<ROUTINE I-EXPLODE ("OPTIONAL" (CR T))
	 <DEC XCOUNT>
	 <COND (<ZERO? ,XCOUNT>
		<COND (<HERE? IN-COTTAGE>
		       <COND (<T? .CR>
			      <CRLF>)>
		       <TELL "[RIDX: 1528]"
D ,CAULDRON "[RIDX: 1529]">
		       <PRINT-ID "events:3103"><JIGS-UP>
		       <RTRUE>)>
		<COND (<OR <IN? ,CAGE ,IN-COTTAGE>
			   <IN? <LOC ,CAGE> ,IN-COTTAGE>>
		       <COND (<IN? ,MAGPIE ,CAGE>
			      <EXIT-MAGPIE>
			      <MOVE ,DMAGPIE ,CAGE>)>
		       <COND (<IN? ,LEM ,CAGE>
			      <EXIT-LEM>
			      <MOVE ,DLEM ,CAGE>)>)>
		<DEQUEUE I-EXPLODE>
		<UNMAKE ,EMERALD ,NODESC>
		<MOVE ,EMERALD ,CAULDRON>
		<REMOVE ,STEAM>
		<REMOVE ,CWATER>
		<REMOVE ,TOME>
		<REMOVE ,PEDESTAL>
		<REMOVE ,PAGES>
		<MOVE ,CINDERS ,IN-COTTAGE>
		<MAKE ,GMAP ,NODESC>
		<COND (<HERE? ON-BLUFF IN-GARDEN>
		       <COND (<T? .CR>
			      <CRLF>)>
		       <ITALICIZE "Boom!">
		       <TELL
"[RIDX: 1532]" CR><PRINT-ID "events:3128">
		       <RTRUE>)
		      (T
		       <RFALSE>)>)
	       (<AND <EQUAL? ,XCOUNT 1>
		     <HERE? IN-COTTAGE IN-GARDEN ON-BLUFF>>
		<COND (<T? .CR>
		       <CRLF>)>
		<TELL "The rumble in the ">
		<PRINTD <COND (<HERE? IN-COTTAGE> ,CAULDRON)
			      (T ,COTTAGE)>>
		<TELL
"[RIDX: 1535]">
		<PRINTD <COND (<HERE? IN-COTTAGE> ,COTTAGE)
			      (T ,GROUND)>>
		<TELL
"[RIDX: 1536]" CR>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE I-WHOOSH ()
	 <SETG P-IT-OBJECT ,RBOOT>
	 <TELL CR "[RIDX: 1537]" CR>
	 <RTRUE>>

<GLOBAL LLIFE:NUMBER 4>

<ROUTINE I-MILL ("OPTIONAL" (CR T))
	 <COND (<NOT <HERE? IN-MILL>>
		<RFALSE>)
	       (<T? .CR>
		<CRLF>)>
	 <DEC LLIFE>
	 <COND (<ZERO? ,LLIFE>
		<SPILL-MILL>
		<RTRUE>)>
	 <SETG P-IT-OBJECT ,LANDING>
	 <TELL CTHE ,LANDING>
	 <COND (<EQUAL? ,LLIFE 1>
		<TELL
"[RIDX: 1539]" CR><PRINT-ID "events:3169">
		<RTRUE>)
	       (<EQUAL? ,LLIFE 2>
		<TELL "[RIDX: 1541]" CR>
		<RTRUE>)
	       (T
		<TELL
"[RIDX: 1542]" CR>)>
	 <RTRUE>>

<ROUTINE I-TMEEP ("OPTIONAL" (CR T) "AUX" L (FOOD <>))
	 <COND (<T? ,QUIET?>
		<RFALSE>)>
	 <UNMAKE ,MEEP ,NODESC>
	 <SET L <LOC ,MEEP>>
	 <COND (<AND <T? .L> ; "Does MEEP have food?"
		     <LOC ,BAG>
		     <T? ,CCNT>
		     <IN? ,BAG .L>>
		<UNMAKE ,MEEP ,SEEN>
		<SET FOOD T>)
	       (T
		<SETG APPETITE 0>)>

       ; "[RIDX: 1546]"

	<COND (<AND <IN? ,MEEP ,HERE> ; "[RIDX: 1547]"
		    <HERE? IN-SHACK TOWER-PLAT ON-TOWER
			   IN-MILL IN-CIST ON-CIST IN-JEEP IN-CLOSET>>
		<COND (<T? .CR>
		       <CRLF>)>
		<TELL ,CTHEMEEP>
		<COND (<T? .FOOD>
		       <SAY-PECKS>
		       <RTRUE>)>
		<MEEP-ESCAPES>
		<RTRUE>)
	       (<VISIBLE? ,MEEP>
		<COND (<AND <EQUAL? .L ,W100>
		       	    <IN? ,DOG .L>>
		       <COND (<T? .CR>
		       	      <CRLF>)>
		       <COND (<T? .FOOD>
			      <TELL ,CTHEMEEP>
			      <COND (<IS? ,DOG ,WINDY>
				     <UNMAKE ,DOG ,WINDY>
				     <TELL
"[RIDX: 1548]">)>
			      <SAY-PECKS>
			      <RTRUE>)
			     (<IS? ,DOG ,WINDY>
			      <LAST-PECK>
			      <RTRUE>)>
		       <MEEP-SEES-DOG>
		       <RTRUE>)>
		<UNMAKE ,DOG ,WINDY>       ; "Not on dog."
		<COND (<EQUAL? .L ,PLAYER> ; "[RIDX: 1550]"
		       <SETG APPETITE 0>
		       <MAKE ,LEM ,SEEN>   ; "Shut up the lemming."
		       <UNMAKE ,MEEP ,SEEN>
		       <COND (<T? .CR>
			      <CRLF>)>
		       <TELL ,CTHEMEEP>
		       <COND (<IS? ,MEEP ,TOUCHED> ; "Only waits 1 move."
			      <UNMAKE ,MEEP ,TOUCHED>
			      <TELL
"[RIDX: 1553]" CR><PRINT-ID "events:3235">
			      <RTRUE>)>
		       <TELL "[RIDX: 1555]">
		       <MEEP-ESCAPES>
		       <RTRUE>)>
		<COND (<IS? .L ,SURFACE> ; "[RIDX: 1556]"
		       <COND (<T? .CR>
			      <CRLF>)>
		       <TELL ,CTHEMEEP>
		       <COND (<T? .FOOD>
			      <SAY-PECKS>
			      <RTRUE>)>
		       <TELL "hops off " THE .L " and ">
		       <MEEP-ESCAPES>
		       <RTRUE>)
		      (<IS? .L ,CONTAINER>
		       <COND (<IS? .L ,OPENED> ; "[RIDX: 1559]"
			      <COND (<T? .CR>
				     <CRLF>)>
			      <TELL ,CTHEMEEP>
			      <COND (<SEE-SNAKE?>
				     <TELL
"[RIDX: 1560]" CR>
				     <RTRUE>)
				    (<T? .FOOD>
				     <SAY-PECKS>
				     <RTRUE>)
				    (<AND <EQUAL? .L ,CAGE>
					  <IS? ,MEEP ,TOUCHED>>
				     <UNMAKE ,MEEP ,TOUCHED>
				     <TELL
"[RIDX: 1561]" CR>
				     <RTRUE>)>
			      <TELL "hops out of " THE .L " and ">
			      <MEEP-ESCAPES>
			      <RTRUE>)
			     (<IS? ,MEEP ,SEEN>
			      <UNMAKE ,MEEP ,SEEN>
			      <RFALSE>)
			     (T
			      <MAKE ,MEEP ,SEEN>
			      <COND (<T? .CR>
				     <CRLF>)>
			      <TELL ,CTHEMEEP>
			      <COND (<SEE-SNAKE?>
				     <TELL
"[RIDX: 1564]" D ,SNAKE ,PERIOD>
				     <RTRUE>)
				    (<T? .FOOD>
				     <SAY-PECKS>
				     <RTRUE>)
				    (<PROB 50>
				     <COND (<PROB 50>
					    <TELL "glares at you from">)
					   (T
					    <TELL "paces back and forth">)>)
				    (T
				     <COND (<PROB 50>
					    <TELL "looks very unhappy">)
					   (T
					    <TELL "is quietly sulking">)>)>
			      <TELL " inside " THE .L ,PERIOD>
			      <RTRUE>)>)
		      (<T? .FOOD>
		       <MAKE ,MEEP ,SEEN>
		       <COND (<T? .CR>
			      <CRLF>)>
		       <TELL ,CTHEMEEP>
		       <SAY-PECKS>
		       <COND (<AND <ZERO? ,APPETITE>
				   <ZERO? ,CCNT>
				   <HERE? W100>
				   <IN? ,DOG ,HERE>>
			      <CRLF>
			      <MEEP-SEES-DOG>)>
		       <RTRUE>)
		      (<AND <HERE? W100>
			    <IN? ,DOG ,HERE>>
		       <COND (<T? .CR>
			      <CRLF>)>
		       <MEEP-SEES-DOG>
		       <RTRUE>)
		      (<IS? ,MEEP ,SEEN>
		       <UNMAKE ,MEEP ,SEEN>
		       <RFALSE>)
		      (T
		       <MAKE ,MEEP ,SEEN> ; "Normal case."
		       <MAKE ,LEM ,SEEN>
		       <COND (<T? .CR>
			      <CRLF>)>
		       <TELL ,CTHEMEEP <PICK-NEXT <GET ,MEEP-TABLE 3>>
			     ,PERIOD>
		       <RTRUE>)>)>

       ; "[RIDX: 1571]"

	 <COND (<T? .FOOD> ; "Next bite if eating."
		<UPDATE-APPETITE>
		<COND (<AND <ZERO? ,CCNT>      ; "Bag empty?"
			    <ZERO? ,APPETITE>> ; "Yes, done eating."
		       <SET FOOD <>>)>)>

	 <COND (<T? .FOOD>     		       ; "[RIDX: 1575]"
		T)
	       (<NOT <IN? ,DOG ,W100>>
		T)
	       (<OR <EQUAL? .L ,W100>     ; "Pecking?"
		    <AND <EQUAL? .L ,CAGE>
			 <IN? .L ,W100>
			 <IS? .L ,OPENED>>>
		<UNMAKE ,MEEP ,SEEN>
		<SETG MDELAY 0>
		<COND (<ZERO? ,DISTRACTION>
		       <COND (<NOT <IN? ,MEEP ,W100>>
			      <MOVE ,MEEP ,W100>)>
		       <SETG DISTRACTION 3> ; "Start distraction."
		       <UNMAKE ,DOG ,WINDY>
		       <MAKE ,DOG ,NODESC>
		       <SETG TOLERANCE 2>
		       <UNMAKE ,W100 ,TOUCHED>)>
		<RFALSE>)>

	 <COND (<OR <T? .FOOD>
		    <T? ,MDELAY>
		    <AND <IS? .L ,CONTAINER>
			 <NOT <IS? .L ,OPENED>>>
		    <AND <IS? ,HERE ,INDOORS>
			 <NOT <IS? .L ,INDOORS>>
			 <NOT <RANCH-OPEN?>>>
		    <HERE? IN-SHACK TOWER-PLAT ON-TOWER ON-CIST
		       	   IN-CIST UNDER-WATER IN-MILL IN-JEEP IN-CLOSET>>
		<UNMAKE ,MEEP ,SEEN>
		<COND (<T? ,MDELAY>
		       <DEC MDELAY>)>
		<RFALSE>)
	       (<SEE-SNAKE?>
		<MAKE ,SNAKE ,CHILLY>
		<COND (<T? .CR>
		       <CRLF>)>
		<TELL ,CTHEMEEP "trots into the room">
		<COND (<IS? ,SNAKE ,BORING>
		       <TELL ", sees the " D ,SNAKE " again">)
		      (T
		       <MAKE ,SNAKE ,BORING>
		       <TELL
"[RIDX: 1581]" D ,MEEP
"[RIDX: 1582]"
D ,MEEP " abandons the fray">)>
		<TELL "[RIDX: 1584]" CR>
		<RTRUE>)

	       (T
		<MOVE ,MEEP ,HERE>
		<MEEP-ARRIVES>
		<RTRUE>)>>

<ROUTINE EXIT-MEEP ()
	 <DEQUEUE I-TMEEP>
	 <VANISH ,MEEP>
	 <RTRUE>>

<ROUTINE MEEP-SEES-DOG ("AUX" X)
	 <MAKE ,DOG ,SEEN>
	 <TELL ,CTHEMEEP>
	 <COND (<NOT <IS? ,DOG ,BORING>>
		<MAKE ,DOG ,BORING>
		<UNMAKE ,W100 ,TOUCHED>
		<MAKE ,DOG ,WINDY>
		<SET X <FIRST? ,MEEP>>
		<TELL "notices the " D ,DOG>
		<COND (<T? .X>
		       <MOVE .X ,W100>
		       <TELL ", drops " THE .X>)>
		<TELL
" and perches on its massive head. You stifle a shriek as the silly bird cocks its head this way and that, wondering what to make of the sleeping monster. Then it gives you a sly glance,[RIDX: 1212] and begins to peck at the sand fleas behind the dog's ears." CR>
		<RTRUE>)>
	 <TELL "[RIDX: 1589]" ,PCR>
	 <LAST-PECK>
	 <RTRUE>>

<ROUTINE LAST-PECK ()
	 <TELL
"[RIDX: 1590]">
	 <COND (<IS? ,DOG ,WINDY>
		<TELL " perched on its head">)>
	 <TELL
"[RIDX: 1592]"
D ,MEEP ,PTHE "[RIDX: 1593]" CR>
	 <DOG-ALERT>
	 <RTRUE>>

<ROUTINE SAY-PECKS ("OPTIONAL" (CR T) "AUX" X)
	 <MAKE ,LEM ,SEEN> ; "Shut up the lemming."
	 <UNMAKE ,MEEP ,SEEN>
	 <UNMAKE ,DOG ,WINDY>
	 <SET X <FIRST? ,MEEP>>
	 <COND (<T? .X>
		<MOVE .X <LOC ,MEEP>>
		<TELL "drops " THE .X " and ">)>
	 <COND (<ZERO? ,APPETITE>
		<SETG APPETITE 4>
		<TELL "begins to peck at ">)
	       (T
		<UPDATE-APPETITE>
		<TELL <PICK-NEXT ,PECKINGS>>)>
	 <TELL "the ">
	 <COND (<AND <ZERO? ,APPETITE>
		     <ZERO? ,CCNT>>
		<TELL "last few ">)>
	 <TELL "crumbs in the bag.">
	 <COND (<T? .CR>
		<CRLF>)>
	 <RTRUE>>

<GLOBAL PECKINGS:TABLE
	<LTABLE 2
	 "[RIDX: 1603]" "gobbles down " "snaps up ">>

<ROUTINE UPDATE-APPETITE ()
	 <UNMAKE ,DOG ,WINDY>
	 <DEC APPETITE>
	 <COND (<ZERO? ,APPETITE>
		<EMPTY-BAG>
		<RTRUE>)
	       (<EQUAL? ,APPETITE ,CCNT>
		<RTRUE>)
	       (<G? ,CCNT 1>
		<DEC CCNT>
		<RTRUE>)
	       (T
		<SETG CCNT 1>)>
	 <RTRUE>>

<ROUTINE MEEP-ARRIVES ()
	 <MAKE ,LEM ,SEEN>
	 <MAKE ,MEEP ,SEEN>
	 <UNMAKE ,DOG ,WINDY>
	 <TELL CR ,CTHEMEEP>
	 <COND (<PROB 30>
		<TELL "reappears">
		<COND (<PROB 50>
		       <TELL " at your side">)>)
	       (T
		<TELL <PICK-NEXT <GET ,MEEP-TABLE 4>> "s ">
		<COND (<PROB 50>
		       <TELL "into view">)
		      (T
		       <TELL "to your side">)>)>
	 <PRINT ,PERIOD>
	 <COND (<AND <VISIBLE? ,BAG>
		     <NOT <IN? ,BAG ,PLAYER>>>
		<MEEP-SEES-BAG>)
	       (<AND <HERE? W100>
		     <IN? ,DOG ,HERE>>
		<CRLF>
		<MEEP-SEES-DOG>)>
	 <RTRUE>>

<ROUTINE RANCH-OPEN? ()
	 <COND (<OR <IS? ,NEROOM-DOOR ,OPENED>
		    <IS? ,SEROOM-DOOR ,OPENED>
		    <IS? ,SWROOM-DOOR ,OPENED>
		    <IS? ,NROOM-DOOR ,OPENED>
		    <IS? ,BROOM-DOOR ,OPENED>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE MEEP-ESCAPES ("AUX" (DOOR <>))
	 <UNMAKE ,MEEP ,TOUCHED>
	 <UNMAKE ,MEEP ,SEEN>
	 <MAKE ,LEM ,SEEN> ; "Shut up the lemming."
	 <SETG APPETITE <>>
	 <SETG P-IT-OBJECT ,NOT-HERE-OBJECT>
	 <COND (<HERE? ON-CIST IN-CIST>
		<MOVE ,MEEP ,SCIST>
		<TELL "flutters out of the " D ,RESERVOIR
		      " and disappears." CR>
		<RTRUE>)
	       (<HERE? IN-MILL>
		<MOVE ,MEEP ,UNDERM>
		<TELL "leaps over the " D ,LANDING
		      "'s edge and flutters" ,OUTASITE>
		<RTRUE>)
	       (<HERE? IN-JEEP>
		<MOVE ,MEEP ,N75>
		<TELL "[RIDX: 1617]" CR>
		<RTRUE>)
	       (<SEE-SNAKE?>
		<MOVE ,MEEP ,SEROOM>
		<TELL "[RIDX: 1618]" D ,SNAKE
		      "[RIDX: 1619]" CR>
		<RTRUE>)
	       (<AND <VISIBLE? ,BAG>
		     <NOT <IN? ,BAG ,PLAYER>>>
		<MOVE ,MEEP ,HERE>
		<TELL "lands at your feet." CR>
		<MEEP-SEES-BAG>
		<RTRUE>)
	       (<HERE? IHOUSE IN-HALL>
		<MOVE ,MEEP ,NWYARD>
		<TELL "scoots ">
		<COND (<HERE? IHOUSE>
		       <TELL "up the stairs." CR>
		       <RTRUE>)
		      (T
		       <TELL "off down the hall." CR>)>
		<RTRUE>)
	       (<OR <AND <HERE? IN-CLOSET>
		     	 <IS? ,CLOSET-DOOR ,OPENED>>
		    <HERE? IN-BATH BROOM NROOM NWROOM SWROOM NEROOM SEROOM>>
		<COND (<AND <HERE? NEROOM>
			    <NOT <IS? ,NEROOM-DOOR ,OPENED>>>
		       <SET DOOR ,NEROOM-DOOR>)
		      (<AND <HERE? SEROOM>
			    <NOT <IS? ,SEROOM-DOOR ,OPENED>>>
		       <SET DOOR ,SEROOM-DOOR>)
		      (<AND <HERE? SWROOM>
			    <NOT <IS? ,SWROOM-DOOR ,OPENED>>>
		       <SET DOOR ,SWROOM-DOOR>)
		      (<AND <HERE? NROOM>
			    <NOT <IS? ,NROOM-DOOR ,OPENED>>>
		       <SET DOOR ,NROOM-DOOR>)>
		<COND (<T? .DOOR>
		       <MAKE .DOOR ,OPENED>
		       <TELL "nudges open " THE .DOOR
			     "[RIDX: 1625]">)>
		<MOVE ,MEEP <COND (<RANCH-OPEN?> ,ERANCH)
				  (<HERE? IN-BATH> ,BROOM)
				  (T ,IN-BATH)>>
		<TELL "trots" ,OUTASITE>
		<RTRUE>)
	       (<HERE? IN-SHACK TOWER-PLAT ON-TOWER>
		<MOVE ,MEEP ,AT-ZERO>
		<TELL "disappears ">
		<COND (<HERE? IN-SHACK>
		       <TELL "to the west">)
		      (T
		       <TELL "[RIDX: 1629]" D ,PLATFORM>)>
		<TELL ,PCR
"[RIDX: 1630]" CR>
		<RTRUE>)

	       (T
		<UNMAKE ,DOG ,WINDY>
		<MOVE ,MEEP ,HERE>
		<MAKE ,MEEP ,SEEN>
		<SETG P-IT-OBJECT ,MEEP>
		<COND (<ZERO? ,LIT?>
		       <TELL "[RIDX: 1631]" CR>
		       <RTRUE>)
		      (T
		       <TELL <PICK-NEXT <GET ,MEEP-TABLE 3>> ,PERIOD>)>
		<COND (<AND <HERE? W100>
			    <IN? ,DOG ,HERE>>
		       <CRLF>
		       <MEEP-SEES-DOG>)>
		<RTRUE>)>>

<ROUTINE MEEP-SEES-BAG ("AUX" L)
	 <UNMAKE ,MEEP ,TOUCHED>
	 <UNMAKE ,DOG ,WINDY>
	 <SET L <LOC ,BAG>>
	 <COND (<AND <EQUAL? .L ,CAGE>
		     <NOT <IS? .L ,OPENED>>
		     <IS? ,BAG ,SEEN>>
		<RTRUE>)>
	 <TELL CR "The bird spies the " D ,EBAG>
	 <COND (<EQUAL? .L ,HERE>
		T)
	       (<IS? .L ,SURFACE>
		<MOVE ,MEEP .L>
		<TELL ". It leaps up onto " THE .L>)
	       (<NOT <IS? .L ,OPENED>>
		<MAKE ,BAG ,SEEN>
		<SETG APPETITE 0>
		<TELL " inside " THE .L "[RIDX: 1636]" CR>
		<RTRUE>)
	       (T
		<MOVE ,MEEP .L>
		<TELL ". It leaps into " THE .L>)>
	 <TELL " and ">
	 <SAY-PECKS>
	 <RTRUE>>

<ROUTINE I-SNAKE ("OPTIONAL" (CR T))
	 <COND (<NOT <SEE-SNAKE?>>
		<MAKE ,SNAKE ,SEEN>
		<RFALSE>)
	       (<T? .CR>
		<CRLF>)>
	 <SETG P-IT-OBJECT ,SNAKE>
	 <COND (<IS? ,SNAKE ,SEEN>
		<UNMAKE ,SNAKE ,SEEN>
		<TELL CTHE ,SNAKE>
		<COND (<HERE? IN-CLOSET>
		       <TELL "[RIDX: 1640]">)
		      (T
		       <TELL <PICK-NEXT ,SNAKE-DOINGS>>)>
		<TELL ,AS-IF "[RIDX: 1641]" CR>
		<RTRUE>)>
	 <MAKE ,ANKLE ,SURFACE>
	 <QUEUE I-BITTEN 1>
	 <TELL CTHE ,SNAKE
" strikes " D ,ANKLE "[RIDX: 1643]">
	 <SNAKE-LEAVES>
	 <TELL CR
"[RIDX: 1644]"><PRINT-ID "events:3648">
	 <ITS-ALREADY "beginning to swell">
	 <RTRUE>>

<ROUTINE SEE-SNAKE? ()
	 <COND (<NOT <IS? ,SNAKE ,LIVING>>
		<RFALSE>)
	       (<HERE? NEROOM>
		<RTRUE>)
	       (<AND <HERE? IN-CLOSET>
		     <IS? ,CLOSET-DOOR ,OPENED>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<GLOBAL SNAKE-DOINGS:TABLE
	<LTABLE 2
	 "[RIDX: 1647]"
	 "[RIDX: 1648]"
	 " hisses a threat">>

<ROUTINE SNAKE-LEAVES ()
	 <UNMAKE ,SNAKE ,LIVING>
	 <REMOVE ,XSNAKE>
	 <VANISH ,SNAKE>
	 <DEQUEUE I-SNAKE>
	 <PUTP ,NEROOM ,P?ODOR 0>
	 <PUTP ,NEROOM ,P?HEAR 0>
	 <PUTP ,IN-CLOSET ,P?ODOR 0>
	 <PUTP ,IN-CLOSET ,P?HEAR 0>
	 <TELL " and slithers" ,OUTASITE>
	 <RTRUE>>

<ROUTINE I-BITTEN ("OPTIONAL" (CR T))
	 <COND (<T? .CR>
		<CRLF>)>
	 <TELL
"[RIDX: 1652]">
	 <COND (<IS? ,HERE ,INDOORS>
		<TELL D ,FLOOR>)
	       (T
		<TELL D ,GROUND>)>
	 <TELL ,PCR>
	 <COND (<G? ,MINUTES 27>
		<TELL "Moment">)
	       (T
		<TELL "Minute">)>
	 <TELL "s later, ">
	 <DO-KABOOM>
	 <PRINT-ID "events:3697"><JIGS-UP>
	 <RTRUE>>

<ROUTINE I-TUNNEL ("OPTIONAL" (CR T))
	 <COND (<ZERO? ,MINUTES>
		<COND (<T? .CR>
		       <CRLF>)>
		<COND (<HERE? TUN1>
		       <TELL CTHE ,UBOMB " erupts ">)
		      (T
		       <TELL "[RIDX: 1659]" D ,TUNNEL
			     " is bathed ">)>
		<TELL "[RIDX: 1661]">
		<PRINT-ID "events:3710"><JIGS-UP>
		<RTRUE>)
	       (<OR <IS? ,WSWITCH ,OPENED>
		    <NOT <VISIBLE? ,WTK>>>
		<RFALSE>)
	       (<OR <NOT <EQUAL? ,TFREQ 42>>
		    <NOT <IS? ,ANTENNA ,OPENED>>>
		<COND (<T? ,QUIET?>
		       <RFALSE>)
		      (<T? .CR>
		       <COND (<EQUAL? ,SECONDS 0 30>
			      <RFALSE>)
			     (T
			      <CRLF>)>)>
		<MAKE ,WTK ,SEEN>
		<TELL CTHE ,WTK <PICK-NEXT ,HISSES> ,PERIOD>
		<RTRUE>)
	       (<ZERO? ,SECONDS>
		<MAKE ,WTK ,SEEN>
		<COND (<T? .CR>
		       <CRLF>)>
		<COND (<NOT <IS? ,WTK ,SHADOWY>>
		       <MAKE ,WTK ,SHADOWY>
		       <TELL "[RIDX: 1663]">)>
		<TELL "\"" <GET <GET ,WTK-TABLE 0> <- 60 ,MINUTES>> ".\"" CR>
		<RTRUE>)
	       (<OR <ZERO? .CR>
		    <EQUAL? ,SECONDS 30>>
		<COND (<T? .CR>
		       <CRLF>)>
		<MAKE ,WTK ,SEEN>
		<TELL CTHE ,WTK <PICK-NEXT ,HISSES> ,PERIOD>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<GLOBAL WTK-TABLE:TABLE
	<PTABLE
	 <PTABLE "BUG!" "One" "Two" "Three" "Four" "Five" "Six"
		 "Seven" "Eight" "Nine" "Ten">
	 <LTABLE 2 " hisses" " says" " crackles" " chatters" " rasps"
		   " says" " buzzes" " chirps">>>

<GLOBAL HISSES:TABLE
	<LTABLE 2 " hisses quietly" "[RIDX: 1686]"
		  "[RIDX: 1687]" " clicks and hisses">>

<ROUTINE I-WTK ()
	 <COND (<AND <ZERO? ,QUIET?>
		     <NOT <IS? ,WSWITCH ,OPENED>>
		     <NOT <IS? ,WTK ,CHILLY>>
		     <NOT <IS? ,WTK ,SEEN>>
		     <VISIBLE? ,WTK>
		     <PROB 30>>
		<MAKE ,WTK ,SEEN>
		<TELL CR CTHE ,WTK <PICK-NEXT ,HISSES> ,PERIOD>
		<RTRUE>)>
	 <UNMAKE ,WTK ,SEEN>
	 <RFALSE>>

<ROUTINE I-FLARE ()
	 <COND (<AND <EQUAL? ,MINUTES 29>
		     <EQUAL? ,SECONDS 45>>
		<KABOOM>
		<RTRUE>)
	       (<AND <NOT <IS? ,HERE ,INDOORS>>
		     <EQUAL? ,MINUTES 24 27 28>
		     <EQUAL? ,SECONDS 45>>
	      	<COND (<EQUAL? ,MINUTES 24>
		       <COND (<HERE? S100 W100>
			      <CRACKLES "five">
			      <FIVE-MINUTE-WARNING>)>
		       <FIRST-SEE-FLARE>
		       <TELL "[RIDX: 1690]" CR>
		       <RTRUE>)
		      (<EQUAL? ,MINUTES 27>
		       <COND (<HERE? S100 W100>
			      <CRACKLES "two">
			      <TWO-MINUTE-WARNING>
			      <COND (<HERE? W100>
				     <HINGE-SQUEAK>
				     <RTRUE>)>
			      <TELL CR
"[RIDX: 1692]" D ,TRENCHES
" nearby." CR>)>
		       <PUTP ,W100 ,P?ODOR 0>
		       <PUTP ,W100 ,P?HEAR 0>
		     ; <SETG DISTRACTION 0>
		       <REMOVE ,DOG>
		       <DEQUEUE I-DOG>
		       <COND (<IS? ,FLARE ,NODESC>
			      <FIRST-SEE-FLARE>)
			     (T
			      <MAKE ,FLARE ,CHILLY>
			      <TELL CR
"Another " D ,FLARE "[RIDX: 1695]">)>
		       <TELL "[RIDX: 1696]" CR>
		       <RTRUE>)
		      (T
		       <COND (<IS? ,FLARE ,NODESC>
			      <FIRST-SEE-FLARE>)
			     (T
			      <TELL CR "A ">
			      <COND (<IS? ,FLARE ,CHILLY>
			       	     <TELL "third ">)
			      	    (T
			       	     <TELL "second ">)>
			      <TELL D ,FLARE>)>
		       <TELL "[RIDX: 1700]" CR>
		       <RTRUE>)>)
	       (T
		<RFALSE>)>>

<ROUTINE HINGE-SQUEAK ()
	 <TELL CR
"[RIDX: 1701]" D ,BHOUSE>
	 <COND (<IN? ,DOG ,W100>
		<TELL "[RIDX: 1702]">)>
	 <TELL
"[RIDX: 1703]" CR>
	 <HOLD-IT>
	 <KINDA-SPY>
	 <SURROUNDED>
	 <RTRUE>>

<ROUTINE FIRST-SEE-FLARE ()
	 <UNMAKE ,FLARE ,NODESC>
	 <TELL CR "[RIDX: 1704]" D ,GDESERT
"[RIDX: 1705]" D ,FLARE " streaks upward,">
	 <RTRUE>>

<ROUTINE CRACKLES (STR)
	 <TELL CR
"A " D ,SPEAKER "[RIDX: 1708]" .STR " minutes">
	 <RTRUE>>

<ROUTINE KABOOM ()
	 <TELL CR ,ALLATONCE>
	 <DO-KABOOM>
	 <RTRUE>>

<ROUTINE DO-KABOOM ()
	 <TELL "the ">
	 <COND (<HERE? IN-CLOSET IHOUSE>
		<TELL "[RIDX: 1711]">
		<BLIGHT>)
	       (<HERE? UNDER-WATER>
		<TELL "water around you is">
		<BLIGHT>)
	       (<HERE? IN-HALL>
		<TELL "hallway is">
		<BLIGHT>)
	       (<HERE? IN-SHACK TOWER-PLAT ON-TOWER AT-ZERO N25 NZERO
		       NEZERO EZERO AT-TNT S25 W25 WZERO>
		<COND (<HERE? IN-SHACK>
		       <TELL D ,GADGET>)
		      (T
		       <COND (<NOT <HERE? ON-TOWER AT-ZERO TOWER-PLAT>>
			      <TELL "distant ">)>
		       <TELL D ,DTOWER>)>
		<DAZZLE>)
	       (<IS? ,HERE ,INDOORS>
		<TELL D ,WINDOWS " are">
		<BLIGHT>)
	       (T
		<TELL "desert around you">
		<DAZZLE>)>
	 <TELL "! You jam " D ,HANDS
"[RIDX: 1718]">
	 <MUCH-OF>
	 <RTRUE>>

<ROUTINE BLIGHT ()
	 <TELL "[RIDX: 1719]">
	 <RTRUE>>

<ROUTINE DAZZLE ()
	 <TELL "[RIDX: 1720]">
	 <RTRUE>>

<GLOBAL DISTRACTION:NUMBER 0> "[RIDX: 1721]"
<GLOBAL TOLERANCE:NUMBER 4> "[RIDX: 1722]"
<GLOBAL MLIVES:NUMBER 2> "[RIDX: 1723]"

<ROUTINE I-TRINITY ("AUX" (W <>) (V <>) (Z <>) X )

       ; "[RIDX: 1725]"

	 <COND (<IS? ,WTK ,CHILLY> ; "No talkie if wet."
		T)
	       (<AND <NOT <IS? ,WSWITCH ,OPENED>>	; "Turned on?"
		     <VISIBLE? ,WTK>>			; "Hearable?"
		<COND (<AND <IS? ,ANTENNA ,OPENED>      ; "Antenna up?"
			    <IS? ,RDIAL ,SEEN>		; "Right freq?"
		     	    <EQUAL? ,TFREQ ,MAGICFREQ>>
		       <SET W T>
		       <UNMAKE ,WTK ,SEEN>)
	       	      (<T? ,QUIET?>
		       T)
		      (<IS? ,WTK ,SEEN>   ; "Delay."
		       <UNMAKE ,WTK ,SEEN>)
	       	      (<PROB 50> ; "Random talkie noise."
		       <SET V T>
		       <MAKE ,WTK ,SEEN>
		       <TELL CR CTHE ,WTK <PICK-NEXT ,HISSES>
			     ,PERIOD>)>)>

	; "Monitor BREAKER."

	 <COND (<IS? ,BREAKER ,OPENED>
		<COND (<IS? ,BREAKER ,BORING> ; "[RIDX: 1734]"
		       <COND (<T? .W>
			      <KSCRUB>)>
		       <POLICE-CONVERGE>
		       <RTRUE>)
		      (<IS? ,BREAKER ,SHADOWY>
		       <COND (<T? .W>
			      <TELL CR "[RIDX: 1735]">
	 		      <BITTER-VOICE>)>
		       <POLICE-CONVERGE>
		       <RTRUE>)>
		<MAKE ,BREAKER ,SHADOWY>
		<COND (<T? .W>
		       <SET V T>
		       <REVEAL-WIRE>)>)> ; "Second move."

	 <COND (<AND <HERE? ON-TOWER TOWER-PLAT>
		     <L? ,MINUTES 30>
		     <ZERO? ,DISTRACTION>>
		<DEC TOLERANCE>
		<COND (<ZERO? ,TOLERANCE>
		       <COND (<T? .W>
			      <NO-TOLERANCE>)>
		       <POLICE-CONVERGE>
		       <RTRUE>)
		      (<AND <T? .W>
			    <EQUAL? ,TOLERANCE 1>>
		       <SET V T>
		       <EYES-SEE-MOVEMENT>)>)>

       ; "Handle distraction."

	 <COND (<T? ,DISTRACTION>
		<DEC DISTRACTION>
		<COND (<ZERO? ,DISTRACTION>
		       <UNMAKE ,DOG ,NODESC>
		       <UNMAKE ,DOG ,SEEN>
		       <MAKE ,SPOT ,SEEN>
		       <UNMAKE ,TOWER-PLAT ,TOUCHED>
		       <UNMAKE ,ON-TOWER ,TOUCHED>
		       <UNMAKE ,IN-SHACK ,TOUCHED>
		       <COND (<T? .W>
			      <SET V T>
			      <SOME-BUZZARD>)>
		       <COND (<IN? ,CAGE ,W100>
			      <REMOVE ,CAGE>)>
		       <COND (<IN? ,WALLET ,W100>
			      <REMOVE ,WALLET>)>
		       <COND (<T? ,MLIVES>
			      <MOVE ,MEEP ,W75>)>
		       <COND (<HERE? W75 W50 W25>
			      <SET V T>
			      <COND (<AND <HERE? W75>
				   	  <T? ,MLIVES>>
			      	     <MEEP-ARRIVES>)>
			      <SPOT-SWEEPS "northeast">)
			     (<HERE? AT-ZERO ON-TOWER TOWER-PLAT IN-SHACK>
		       	      <SET V T>
			      <TELL CR CTHE ,SLIGHT
				    "[RIDX: 1739]" CR>)>)

		      (<EQUAL? ,DISTRACTION 2>
		       <UNMAKE ,SPOT ,SEEN>
		       <UNMAKE ,TOWER-PLAT ,TOUCHED>
		       <UNMAKE ,IN-SHACK ,TOUCHED>
		       <MAKE ,SLIGHT ,SEEN>
		       <COND (<T? .W>
			      <SET V T>
			      <HEAR-BARKING>)>
		       <COND (<HERE? W75 W50 W25>
			      <SET V T>
			      <SPOT-SWEEPS "southwest">)
			     (<HERE? AT-ZERO ON-TOWER TOWER-PLAT IN-SHACK>
		       	      <SET V T>
			      <TELL CR "[RIDX: 1741]"
D ,TOWER "[RIDX: 1742]" CR>)>)

		      (T
		       <DEC MLIVES>
		       <COND (<ZERO? ,MLIVES>
			      <DEQUEUE I-TMEEP>
	 		      <REMOVE ,MEEP>
			      <MOVE ,FEATHERS ,W100>)>
		       <COND (<T? .W>
			      <SET V T>
		       	      <BARK-CONTINUES>)>
		       <COND (<AND <ZERO? ,MLIVES>
				   <HERE? W75 D5 D9>>
			      <SET V T>
			      <TELL CR
"[RIDX: 1743]" D ,GDESERT ,PERIOD>)>)>)>

	 ; "Handle countdown."

	  <COND (<ZERO? .W>
		 <RETURN .V>)
		(<EQUAL? ,MINUTES 29>
		 <COND (<ZERO? ,SECONDS>
			<Z-MINUS-45>
			<RTRUE>)
		       (<EQUAL? ,SECONDS 15>
			<Z-MINUS-30>
			<RTRUE>)
		       (<EQUAL? ,SECONDS 30>
			<Z-MINUS-15>
			<RTRUE>)>
		 <FINAL-SECONDS>
		 <RTRUE>)
		(<EQUAL? ,MINUTES 9>
		 <DO-NINE>
		 <RTRUE>)
		(<EQUAL? ,MINUTES 28>
		 <DO-28>
		 <RTRUE>)
		(<AND <EQUAL? ,MINUTES 27>
		      <EQUAL? ,SECONDS 30>>
		 <TELL CR "[RIDX: 1745]" CR>
		 <RTRUE>)
		(<L? ,MINUTES 9>
		 <COND (<OR <T? ,QUIET?>
			    <T? .V>
			    <EQUAL? ,SECONDS 15 45>>
			<RFALSE>)>
		 <CRLF>
		 <COND (<ZERO? ,SECONDS>
			<TELL CTHE ,WTK <PICK-NEXT ,HISSES>
			      ,PERIOD>
			<RTRUE>)
		       (<PROB 50>
			<SET Z T>
			<COND (<PROB 50>
			       <COND (<PROB 50>
			       	      <TELL "A voice on the " D ,WTK>)
			      	     (T
			       	      <TELL CTHE ,WTK>)>
			       <TELL <PICK-NEXT <GET ,WTK-TABLE 1>> ", ">)
			      (T
			       <TELL CTHE ,WTK <PICK-NEXT ,HISSES> ". ">)>)>
		 <TELL "\"" <PICK-NEXT ,BABBLE>>
		 <COND (<OR <T? .Z>
			    <PROB 50>>
			<TELL ".\"" CR>
			<RTRUE>)>
		 <TELL ",\"" <PICK-NEXT <GET ,WTK-TABLE 1>>>
		 <COND (<PROB 50>
			<TELL " a voice on">)>
		 <TELL " the " D ,WTK ,PERIOD>
		 <RTRUE>)
		(<EQUAL? ,SECONDS 15>
		 <TELL CR <GET ,TECHNOBABBLE <- 27 ,MINUTES>> CR>
		 <RTRUE>)
		(<EQUAL? ,SECONDS 0 30>
		 <RFALSE>)
		(T
		 <SET X <- ,MINUTES 10>>
	   	 <TELL ,Z-MINUS <GET ,CDOWN .X> " minutes">
	   	 <COND (<HERE? W100 S100>
			T)
		       (<EQUAL? ,MINUTES 27>
			<TWO-MINUTE-WARNING>
			<TELL CR "[RIDX: 1755]" D ,WTK ,PERIOD>
			<RTRUE>)
		       (<EQUAL? ,MINUTES 24>
			<FIVE-MINUTE-WARNING>
			<TELL CR CTHE ,WTK
"[RIDX: 1756]" CR>
			<RTRUE>)>
		 <TELL ".\"" CR>)>
	  <RTRUE>>

<ROUTINE TWO-MINUTE-WARNING ()
	 <TELL
"[RIDX: 1758]">
	 <ITALICIZE "away">
	 <TELL " from Zero.\"" CR>
	 <RTRUE>>

<ROUTINE FIVE-MINUTE-WARNING ()
	 <TELL
"[RIDX: 1761]" CR>
	 <RTRUE>>

<GLOBAL BABBLE:TABLE
	<LTABLE 2
	 "[RIDX: 1762]"
	 "H-E secured"
	 "[RIDX: 1764]"
	 "SCR-299 checks, Able"
	 "[RIDX: 1766]"
	 "[RIDX: 1767]"
	 "[RIDX: 1768]"
	 "[RIDX: 1769]">>

<GLOBAL TECHNOBABBLE:TABLE
	<PTABLE
"[RIDX: 1770]"

"[RIDX: 1771]"

"[RIDX: 1772]"

"[RIDX: 1773]"

"[RIDX: 1774]"

"[RIDX: 1775]"

"[RIDX: 1776]"

"[RIDX: 1777]"

"[RIDX: 1778]"

"[RIDX: 1779]"

"[RIDX: 1780]"

"[RIDX: 1781]"

"[RIDX: 1782]"

"[RIDX: 1783]"

"[RIDX: 1784]"

"[RIDX: 1785]"

"[RIDX: 1786]"

"[RIDX: 1787]"

"[RIDX: 1788]">>

<ROUTINE DO-28 ()
	 <COND (<EQUAL? ,SECONDS 45>
		<TELL ,Z-MINUS
"[RIDX: 1789]" CR>
		<RTRUE>)>
	 <CRLF>
	 <COND (<ZERO? ,SECONDS>
		<TELL "[RIDX: 1790]" CR>
		<RTRUE>)
	       (<EQUAL? ,SECONDS 15>
		<TELL "[RIDX: 1791]" CR>
		<RTRUE>)>
	 <TELL
"The music on the " D  ,WTK
"[RIDX: 1793]" CR>
	 <RTRUE>>

<ROUTINE DO-NINE ()
	 <CRLF>
	 <COND (<ZERO? ,SECONDS>
		<TELL CTHE ,WTK
" whines softly. \""  D ,BAKER "[RIDX: 1795]" CR>
		<RTRUE>)
	       (<EQUAL? ,SECONDS 15>
		<TELL
"\"" D ,ABLE " to "  D ,BAKER "[RIDX: 1798]" D ,ABLE ".\"" CR>
		<RTRUE>)
	       (<EQUAL? ,SECONDS 30>
		<TELL
"[RIDX: 1800]" CR>
		 <RTRUE>)>
	 <TELL CTHE ,WTK
"[RIDX: 1801]" CR>
	 <RTRUE>>

<ROUTINE SPOT-SWEEPS (STR)
	 <TELL CR "A " D ,SLIGHT " beam sweeps " .STR " across the "
	       D ,GDESERT ,PERIOD>
	 <RTRUE>>

<GLOBAL CDOWN:TABLE
	<PTABLE "nineteen" "eighteen" "seventeen" "sixteen" "fifteen"
		"fourteen" "thirteen" "twelve" "eleven" "ten" "nine"
		"eight" "seven" "six" "five" "four" "three" "two"
		"one" "[BUG!]">>

<ROUTINE REVEAL-WIRE ()
	 <TELL CR "[RIDX: 1825]" D ,WTK ,PCR
"\"I didn't copy, " D ,BAKER "[RIDX: 1827]" D ,VOICES
". \"" D ,BAKER
"[RIDX: 1829]">
	 <ITALICIZE "zero">
	 <TELL "[RIDX: 1831]">
	 <COND (<G? ,MINUTES 28>
		<TELL "Is this a scrub, " D ,BAKER "[RIDX: 1833]" D ,ABLE "[RIDX: 1834]" CR>
		<POLICE-CONVERGE>
		<RTRUE>)>
	 <TELL
"[RIDX: 1835]" D ,BAKER "[RIDX: 1836]" D ,ABLE "[RIDX: 1837]">
	 <WIRE-ID>
	 <TELL "[RIDX: 1838]" D ,ABLE ".\"" CR>
	 <RTRUE>>

<ROUTINE WIRE-ID ()
	 <COND (<ZERO? ,XWIRE>
		<SETG XWIRE <PICK-ONE ,WIRE-COLORS>>)>
	 <COND (<EQUAL? ,XWIRE "POS">
		<TELL "positive">)
	       (<EQUAL? ,XWIRE "GND">
		<TELL "ground">)
	       (<EQUAL? ,XWIRE "INF">
		<TELL "informer">)
	       (T
		<TELL "detonator">)>
	 <RTRUE>>

<ROUTINE KSCRUB ("OPTIONAL" (WIN <>))
	 <TELL CR "[RIDX: 1848]">
	 <COND (<IS? ,BREAKER ,BORING>
		<TELL " again">)>
	 <COND (<ZERO? .WIN>
		<BITTER-VOICE>
		<RTRUE>)>
	 <TELL "[RIDX: 1850]" D ,BAKER "[RIDX: 1851]">
	 <WIRE-ID>
	 <TELL ,PTHE "[RIDX: 1852]"
D ,ABLE ,PTHE "[RIDX: 1853]" CR CR CTHE ,WTK
<PICK-NEXT ,HISSES> ,PERIOD>
	 <RTRUE>>

<ROUTINE BITTER-VOICE ()
	 <TELL ", " D ,ABLE "[RIDX: 1855]" D ,BAKER "[RIDX: 1856]" CR>
	 <RTRUE>>

<ROUTINE NO-TOLERANCE ()
	 <TELL CR
"\"" D ,PITTS "[RIDX: 1858]"
D ,TOWER "[RIDX: 1859]" CR>
	 <RTRUE>>

<ROUTINE EYES-SEE-MOVEMENT ()
	 <QUEUE I-EYE 1>
	 <TELL CR "\"" D ,PITTS " to " D ,ABLE ". ">
	 <COND (<NOT <IS? ,WIGHT ,LOCATION>>
		<MAKE ,WIGHT ,LOCATION>
		<TELL "[RIDX: 1863]" D ,WTK "[RIDX: 1864]" D ,PITTS "[RIDX: 1865]" CR>
		<RTRUE>)
	       (<NOT <IS? ,WIGHT ,LIGHTED>>
		<MAKE ,WIGHT ,LIGHTED>
		<TELL "[RIDX: 1866]" D ,PITTS "?\"|
|
\"Har har, " D ,ABLE ". " D ,PITTS
"[RIDX: 1869]" D ,BAKER ".\"" CR>
		<RTRUE>)>
	 <TELL "[RIDX: 1871]" D ,PITTS "[RIDX: 1872]" D ,BAKER ". Stand by.\"" CR>
	 <RTRUE>>

<ROUTINE I-EYE ()
	 <COND (<HERE? ON-TOWER TOWER-PLAT>
		<RFALSE>)>
	 <TELL CR "\"" D ,PITTS " to " D ,BAKER ". ">
	 <COND (<NOT <IS? ,WIGHT ,LIGHTED>>
		<TELL "[RIDX: 1877]">)
	       (T
		<TELL "[RIDX: 1878]">)>
	 <TELL ".\"|
|
\"Roger, " D ,PITTS ".\"" CR>
	 <RTRUE>>

<ROUTINE HEAR-BARKING ()
	 <CRLF>
	 <COND (<EQUAL? ,MLIVES 1> ; "2nd time around?"
		<TELL "[RIDX: 1882]" D ,WTK
		      ,PCR "\"Buzzards, " D ,PITTS "[RIDX: 1884]" D ,BAKER ". Stand by.\"" CR>
		<RTRUE>)>
	 <TELL "[RIDX: 1886]" D ,WTK
"[RIDX: 1887]" D ,PITTS "[RIDX: 1888]" D ,BAKER ". What's on, " D ,PITTS "?\"|
|
\"Stand by, " D ,BAKER "[RIDX: 1891]" D ,BAKER "[RIDX: 1892]" D ,ABLE ". No hold. " D ,PITTS
"[RIDX: 1894]" D ,PITTS ".\"" CR>
	 <RTRUE>>

<ROUTINE BARK-CONTINUES ()
	 <TELL CR "The barking on the " D ,WTK
		  "[RIDX: 1897]">
	 <COND (<ZERO? ,MLIVES>
		<TELL "[RIDX: 1898]">
		<ITALICIZE "crack,">
		<TELL "[RIDX: 1900]" CR>
		<RTRUE>)>
	 <TELL ", then dies away." CR>
	 <RTRUE>>

<ROUTINE SOME-BUZZARD ()
	 <TELL CR "\"" D ,PITTS " to " D ,BAKER ".">
	 <COND (<ZERO? ,MLIVES>
		<TELL
"[RIDX: 1905]" CR CR>)
	       (T
		<TELL
"[RIDX: 1906]">)>
	 <TELL "\"Roger, " D ,PITTS ". Stand by.\"" CR>
	 <COND (<IN? ,CAGE ,W100>
		<TELL CR "[RIDX: 1909]" D ,CAGE " out here">
		<COND (<IN? ,LEM ,CAGE>
		       <TELL "[RIDX: 1911]">)>
		<TELL "[RIDX: 1912]" D ,BAKER ".\"" CR>)>
	 <RTRUE>>

<ROUTINE Z-MINUS-45 ()
	 <TELL ,Z-MINUS "[RIDX: 1914]" D ,BAKER "[RIDX: 1915]" CR>
	 <RTRUE>>

<ROUTINE Z-MINUS-30 ()
	 <TELL ,Z-MINUS "[RIDX: 1916]">
	 <ITALICIZE "away">
	 <TELL "[RIDX: 1918]" CR>
	 <RTRUE>>

<ROUTINE Z-MINUS-15 ()
	 <TELL ,Z-MINUS
"[RIDX: 1919]" CR>
	 <RTRUE>>

<ROUTINE FINAL-SECONDS ()
	 <TELL ,Z-MINUS
"[RIDX: 1920]">
	 <ITALICIZE "clunk">
	 <TELL "[RIDX: 1922]" CR>
	 <RTRUE>>

<ROUTINE I-BIKES ()
	 <COND (<HERE? LAN-WALK>
		<DEQUEUE I-BIKES>
		<MAKE ,BIKES ,SEEN>
		<TELL CR
"[RIDX: 1923]" D ,LAN-WALK
"[RIDX: 1924]" CR>
		<RTRUE>)>
	 <RFALSE>>

<GLOBAL WIGHTER:NUMBER 3>

<ROUTINE I-WIGHT ()
	 <COND (<NOT <HERE? IN-BARROW>>
		<RFALSE>)
	       (<ZERO? ,LIT?>
		<DEC WIGHTER>
		<CRLF>
		<COND (<EQUAL? ,WIGHTER 3>
		       <TELL
"[RIDX: 1925]" CR>
		       <WIGHT-ID>)
		      (<EQUAL? ,WIGHTER 2>
		       <TELL "[RIDX: 1926]" CR>)
		      (<EQUAL? ,WIGHTER 1>
		       <TELL
"[RIDX: 1927]" CR>)
		      (T
		       <WIGHT-KILLS-YOU>
		       <RTRUE>)>
		<COND (<AND <IN? ,KEY ,KEYHOLE>
			    <NOT <IS? ,SLOPE ,OPENED>>>
		       <MOVE ,KEY ,WIGHT>
		       <TELL CR
"[RIDX: 1928]"
D ,KEY "[RIDX: 1929]" CR>)>
		<RTRUE>)
	       (<IS? ,WIGHT ,SEEN>
		<UNMAKE ,WIGHT ,SEEN>
		<RFALSE>)
	       (<PROB 50>
		<RFALSE>)>
	 <TELL CR CTHE ,WIGHT <PICK-NEXT ,WIGHT-DOINGS> ,PERIOD>
	 <RTRUE>>

<GLOBAL WIGHT-DOINGS:TABLE
	<LTABLE 2
	 "[RIDX: 1930]"
	 "[RIDX: 1931]"
	 "[RIDX: 1932]"
	 "[RIDX: 1933]"
	 "[RIDX: 1934]"
	 "[RIDX: 1935]"
	 "[RIDX: 1936]">>

<ROUTINE WIGHT-KILLS-YOU ()
	 <TELL
"[RIDX: 1937]">
	 <ITALICIZE "snap,">
	 <TELL "[RIDX: 1939]">
	 <PRINT-ID "events:4473"><JIGS-UP>
	 <RTRUE>>

<ROUTINE I-SLOPE ()
	 <COND (<AND <HERE? ICE-CAVE>
		     <IS? ,SLOPE ,OPENED>>
		<UNMAKE ,SLOPE ,OPENED>
		<TELL CR
"[RIDX: 1941]" D ,SLOPE
"[RIDX: 1942]" D ,CEILING ,PA "clatter and ">
		<ITALICIZE "thump">
		<TELL
" fill the " D ,CAVE "[RIDX: 1946]">
		<ALL-IS-STILL>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE I-HARDHAT ("AUX" (V <>))
	 <COND (<VISIBLE? ,LAMP>
		<SET V T>)>
	 <DEC BEAM>
	 <COND (<ZERO? ,BEAM>
		<DEQUEUE I-HARDHAT>
		<UNMAKE ,LAMP ,LIGHTED>
		<COND (<T? .V>
		       <LAMPLIGHT "[RIDX: 1948]">
		       <SAY-IF-HERE-LIT>
		       <RTRUE>)>
		<RFALSE>)
	       (<AND <HERE? IN-SHACK>
		     <IS? ,X5 ,OPENED>
		     <NOT <IS? ,WATT ,TOUCHED>>>
		<GET-WIRES>)>
	 <COND (<ZERO? .V>
		<RFALSE>)
	       (<EQUAL? ,BEAM 4>
		<LAMPLIGHT "is quite dim now">
		<RTRUE>)
	       (<EQUAL? ,BEAM 9>
		<LAMPLIGHT "is getting dimmer">
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE LAMPLIGHT (STR)
	 <TELL CR CTHE ,LAMP "'s light " .STR ,PERIOD>
	 <RTRUE>>

<ROUTINE I-DOG ()
	 <COND (<NOT <HERE? W100>>
		<RFALSE>)
	       (<IS? ,DOG ,SEEN>
		<UNMAKE ,DOG ,SEEN>
		<RFALSE>)
	       (<PROB 50>
		<RFALSE>)>
	 <MAKE ,DOG ,SEEN>
	 <TELL CR CTHE ,DOG <PICK-NEXT ,DOGGIE-DOOS> ,PERIOD>
	 <RTRUE>>

<GLOBAL DOGGIE-DOOS:TABLE
	<LTABLE 2
	 " twitches"
	 " growls softly"
	 " turns over"
	 " whines gently"
	 " snuffles"
	 " scratches itself">>

<ROUTINE I-VOICES ()
	 <COND (<HERE? ON-TOWER>
		<HOLD-IT>
		<TELL CR
"[RIDX: 1958]" D ,TLADDER "[RIDX: 1959]">
		<EXCUSES>
		<RTRUE>)
	       (<AND <HERE? TOWER-PLAT>
		     <IS? ,SPOT ,SEEN>>
		<DEC TOLERANCE>)>
	 <COND (<ZERO? ,MINUTES>
		<DEQUEUE I-VOICES>
		<QUEUE I-FLARE -1>
	 	<QUEUE I-TRINITY -1>
	 	<QUEUE I-DOG -1>
		<QUEUE I-OPPIE -1>
		<UNMAKE ,VOICES ,SEEN>
		<PUTP ,IN-SHACK ,P?HEAR 0>
		<PUTP ,TOWER-PLAT ,P?HEAR 0>
		<TELL CR
"[RIDX: 1960]" D ,VOICES
"[RIDX: 1961]">
		<COND (<HERE? IN-SHACK>
		       <TELL "[RIDX: 1962]">
		       <ALL-IS-STILL>
		       <RTRUE>)>
		<TELL
"[RIDX: 1963]" CR>
		<RTRUE>)
	       (<EQUAL? ,MINUTES 58>
		<COND (<EQUAL? ,SECONDS 15>
		       <RFALSE>)
		      (<EQUAL? ,SECONDS 30>
		       <MAKE ,VOICES ,SEEN>
		       <TELL CR "[RIDX: 1964]">
		       <COND (<HERE? IN-SHACK>
			      <TELL "[RIDX: 1965]">)
			     (T
			      <TELL "[RIDX: 1966]">)>
		       <TELL "[RIDX: 1967]" CR>
		       <RTRUE>)>
		<TELL CR
"[RIDX: 1968]">
		<COND (<HERE? IN-SHACK>
		       <TELL "outside." CR>
		       <RTRUE>)>
		<TELL "down below." CR>
		<RTRUE>)>
	 <CRLF>
	 <COND (<ZERO? ,SECONDS>
		<TELL
"[RIDX: 1971]" D ,PITTS "[RIDX: 1972]" CR>
		<RTRUE>)
	       (<EQUAL? ,SECONDS 15>
		<TELL
"[RIDX: 1973]">
		<COND (<HERE? IN-SHACK>
		       <TELL "outside">)
		      (T
		       <TELL "below">)>
		<TELL
"[RIDX: 1976]" CR>
		<RTRUE>)
	       (<EQUAL? ,SECONDS 30>
		<MAKE ,SPOT ,SEEN>
		<UNMAKE ,TOWER-PLAT ,TOUCHED>
		<UNMAKE ,IN-SHACK ,TOUCHED>
		<TELL ,ALLATONCE "the ">
		<COND (<HERE? IN-SHACK>
		       <TELL D ,SHACK>)
		      (T
		       <TELL D ,PLATFORM>)>
		<TELL "[RIDX: 1978]">
		<COND (<HERE? IN-SHACK>
		       <TELL "somewhere outside">)
		      (T
		       <TELL "[RIDX: 1980]" D ,HORIZON>)>
		<TELL "[RIDX: 1981]" D ,VOICES "[RIDX: 1982]" CR>
		<RTRUE>)
	       (T
		<TELL
"[RIDX: 1983]" D ,VOICES " altogether." CR>)>
	 <RTRUE>>

<ROUTINE I-RCOUNT ("OPTIONAL" (CR T) "AUX" (X <>) STR)
	 <COND (<EQUAL? ,HOURS 15>
		<COND (<T? .CR>
		       <CRLF>)>
		<COND (<HERE? ON-PLATFORM UNDER-PLAT>
		       <TELL
"[RIDX: 1987]" D ,RSPEAKER ,PCR>)
		      (T
		       <TELL "[RIDX: 1988]">)>
		<COND (<HERE? CLIFF-EDGE>
		       <TELL
"[RIDX: 1989]">
		       <HURRICANE>
		       <CLIFF-DROWN>
		       <RTRUE>)>
		<TELL
"[RIDX: 1990]" D ,DSHADOW
"[RIDX: 1991]">
		<COND (<HERE? ON-PLATFORM>
		       <TELL D ,PLATFORM>)
		      (T
		       <TELL D ,GROUND>)>
		<TELL ".">
		<COND (<HERE? ON-PLATFORM UNDER-PLAT>
		       <PRINT-ID "events:4663"><JIGS-UP>
		       <RTRUE>)>
		<TELL " Then ">
		<HURRICANE>
		<TELL "into oblivion.">
		<PRINT-ID "events:4668"><JIGS-UP>
		<RTRUE>)
	       (<NOT <HERE? ON-PLATFORM UNDER-PLAT>>
		<RFALSE>)>
	 <COND (<EQUAL? ,MINUTES 59>
		<COND (<T? .CR>
		       <CRLF>)>
		<COND (<PROB 50>
		       <SET X T>
		       <RSPEAKER-BARKS>)>
		<SET STR <COND (<ZERO? ,SECONDS> "Shestdyesiat")
			       (<EQUAL? ,SECONDS 15> "Sorokpyat")
		      	       (<EQUAL? ,SECONDS 30> "Treetsat")
		      	       (T "Pyatnatsat")>>
		<TELL "\"" .STR " sekund">
		<COND (<OR <T? .X>
			   <PROB 50>>
		       <TELL ".\"" CR>)
		      (T
		       <BARKS-RSPEAKER>)>
		<COND (<VISIBLE? ,MAGPIE>
		       <TELL CR "\"" .STR " sekund,\""
			     <PICK-NEXT <GET ,PIE-TABLE 0>>
			     "s the " D ,MAGPIE ,PERIOD>)>
		<RTRUE>)
	       (<EQUAL? ,MINUTES 58>
		<COND (<ZERO? ,SECONDS>
		       <COND (<T? .CR>
		       	      <CRLF>)>
		       <RSPEAKER-BARKS>
		       <TELL "\"Dva minut.\"" CR>
		       <RTRUE>)
		      (<EQUAL? ,SECONDS 30>
		       <COND (<T? .CR>
		       	      <CRLF>)>
		       <TELL "\"Dyevianosta sekund">
		       <BARKS-RSPEAKER>
		       <RTRUE>)>
		<RFALSE>)
	       (<ZERO? ,SECONDS>
		<COND (<T? .CR>
		       <CRLF>)>
		<COND (<EQUAL? ,MINUTES 40>
		       <SET X T>
		       <TELL "A hidden " D ,RSPEAKER>
		       <SAY-BARKS>
		       <TELL "[RIDX: 2010]">)
		      (<PROB 50>
		       <SET X T>
		       <RSPEAKER-BARKS>)>
		<TELL "\"" <GET ,RMINUTES <- ,MINUTES 41>> " minut">
		<COND (<ZERO? .X>
		       <BARKS-RSPEAKER>
		       <RTRUE>)>
		<TELL ".\"" CR>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE RSPEAKER-BARKS ()
	 <TELL "A " D ,RSPEAKER>
	 <SAY-BARKS>
	 <TELL ", ">
	 <RTRUE>>

<ROUTINE BARKS-RSPEAKER ()
	 <TELL ",\"">
	 <SAY-BARKS>
	 <TELL " a " D ,RSPEAKER ,PERIOD>
	 <RTRUE>>

<ROUTINE SAY-BARKS ()
	 <COND (<PROB 50>
		<TELL " barks">
		<RTRUE>)>
	 <TELL " intones">
	 <RTRUE>>

<GLOBAL RMINUTES
	<PTABLE "Dyevianatsat" "Vosyemnatsat" "Syemnatsat" "Shestnatsat"
		"Pyatnatsat" "Chetirnatsat" "Treenatsat" "Dvenatsat"
		"Adeenatsat" "Dyesiat" "Dyeviat" "Vosyem" "Syem" "Shest"
		"Pyat" "Chetirye" "Tree" "[BUG!]">>

<ROUTINE HURRICANE ()
	 <TELL "[RIDX: 2038]">
	 <RTRUE>>

<GLOBAL OSC:NUMBER 16>

<ROUTINE I-OPPIE ("OPTIONAL" (CR T))
	 <DEC OSC>
	 <COND (<G? ,MINUTES 27>
		<COND (<G? ,OSC 8>
		       <DEQUEUE I-OPPIE>
		       <RFALSE>)
		      (<G? ,OSC 4>
		       <SETG OSC 4>)>)>
	 <COND (<EQUAL? ,OSC 4>
		<UNMAKE ,OPPIE ,NODESC>
		<COND (<NOT <HERE? S100>>
		       <RFALSE>)
		      (<T? .CR>
		       <CRLF>)>
		<SETG P-HIM-OBJECT ,OPPIE>
		<COND (<IS? ,OPPIE ,SEEN>
		       <TELL CTHE ,OPPIE " reappears">)
		      (T
		       <MAKE ,OPPIE ,SEEN>
		       <TELL
"A " D ,OPPIE "[RIDX: 2042]">)>
		<TELL " inside the " D ,SHELTER "'s " D ,SBENTRY ,PERIOD>
		<RTRUE>)
	       (<ZERO? ,OSC>
		<SETG OSC 16>
		<MAKE ,OPPIE ,NODESC>
		<COND (<NOT <HERE? S100>>
		       <RFALSE>)
		      (<T? .CR>
		       <CRLF>)>
		<SETG P-HIM-OBJECT ,NOT-HERE-OBJECT>
		<MAKE ,OPPIE ,SEEN>
		<TELL
"[RIDX: 2045]" D ,OPPIE
"[RIDX: 2046]" D ,SHELTER ,PERIOD>
		<COND (<G? ,MINUTES 27>
		       <DEQUEUE I-OPPIE>)>
		<RTRUE>)
	       (<AND <L? ,OSC 4>
		     <HERE? S100>>
		<MAKE ,OPPIE ,SEEN>
		<SETG P-HIM-OBJECT ,OPPIE>
		<COND (<T? .CR>
		       <CRLF>)>
		<COND (<EQUAL? ,OSC 3>
		       <TELL
"[RIDX: 2047]" D ,OPPIE
"[RIDX: 2048]" CR>
		       <RTRUE>)
		      (<EQUAL? ,OSC 2>
		       <TELL
"You notice the " D ,OPPIE "[RIDX: 2050]" CR>
		       <RTRUE>)>
		<TELL CTHE ,OPPIE
		      "[RIDX: 2051]" CR>
		<RTRUE>)>
	 <RFALSE>>

<ROUTINE I-LUMP ("OPTIONAL" (V <>) "AUX" (OBJ <>) X Y)
	 <COND (<T? .V>
		T)
	       (<NOT <VISIBLE? ,LUMP>>
		<UNMAKE ,LUMP ,SEEN>
		<RFALSE>)>
	 <SET X <FIRST? ,PLAYER>>
	 <REPEAT ()
		 <COND (<OR <ZERO? .X>
			    <T? .OBJ>>
			<RETURN>)
		       (<EQUAL? .X ,LUMP>
			T)
		       (<IS? .X ,FERRIC>
			<SET OBJ .X>
			<RETURN>)
		       (<SEE-ANYTHING-IN? .X>
			<SET Y <FIRST? .X>>
			<REPEAT ()
				<COND (<ZERO? .Y>
				       <RETURN>)
				      (<EQUAL? .Y ,LUMP>
				       T)
				      (<IS? .Y ,FERRIC>
				       <SET OBJ .Y>
				       <RETURN>)>
				<SET Y <NEXT? .Y>>>)>
		 <SET X <NEXT? .X>>>
	 <COND (<ZERO? .OBJ>
		<RFALSE>)
	       (<T? .V>
		T)
	       (<IS? ,LUMP ,SEEN>
		<UNMAKE ,LUMP ,SEEN>
		<RFALSE>)
	       (<PROB 25>
		<RFALSE>)>
	 <SET X <LOC .OBJ>>
	 <MAKE ,LUMP ,SEEN>
	 <TELL CR "You can feel ">
	 <COND (<EQUAL? .X ,PLAYER>
		<TELL THE .OBJ>)
	       (T
		<TELL "something ">
		<COND (<IS? .X ,SURFACE>
		       <TELL " on ">)
		      (T
		       <TELL " in ">)>
		<TELL THE .X>)>
	 <TELL "[RIDX: 2058]" D ,LUMP ,PERIOD>
	 <RTRUE>>
