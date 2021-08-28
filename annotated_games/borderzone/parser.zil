
"PARSER for
			    BORDER ZONE
	 (c) Copyright 1987 Infocom, Inc.  All Rights Reserved"

;"Parser global variable convention:  All parser globals will begin
with 'P-'. Local variables are not restricted in any way." 

<SETG SIBREAKS ".,\"">

;<ROUTINE LIT? ("OPTIONAL" (ROOM ,HERE))
	 T>

<GLOBAL P-AND <>> 

<GLOBAL IN-FRONT-FLAG <>>
	
<GLOBAL PRSA <>>

<GLOBAL PRSI <>>

<GLOBAL PRSO <>>

<GLOBAL P-SYNTAX 0>

<GLOBAL P-LEN 0>

<GLOBAL WINNER 0>   

<GLOBAL P-LEXV <ITABLE 59 (LEXV) 0 #BYTE 0 #BYTE 0>>
<GLOBAL P-INBUF <ITABLE 99 (BYTE LENGTH) 0>>
<GLOBAL RESERVE-INBUF <ITABLE 99 (BYTE LENGTH) 0>>
<GLOBAL RESERVE-LEXV <ITABLE 59 (LEXV) 0 #BYTE 0 #BYTE 0>>
<GLOBAL AGAIN-LEXV <ITABLE 59 (LEXV) 0 #BYTE 0 #BYTE 0>>

<GLOBAL RESERVE-PTR <>>

<GLOBAL OOPS-INBUF <ITABLE 99 (BYTE LENGTH) 0>>
<GLOBAL OOPS-TABLE <TABLE <> <> <> <> <> <>>>
<CONSTANT O-PTR 0>	"word pointer to unknown token in P-LEXV"
<CONSTANT O-START 1>	"word pointer to sentence start in P-LEXV"
<CONSTANT O-LENGTH 2>	"byte length of unparsed tokens in P-LEXV"
<CONSTANT O-END 3>	"byte pointer to first free byte in OOPS-INBUF"
<CONSTANT O-CONT 4>	"P-CONT saved for use after AGAIN"
<CONSTANT O-LEN 5>	"P-LEN ditto"

<GLOBAL P-CONT <>> ;"Parse-cont variable"  

<GLOBAL P-IT-OBJECT <>>

<GLOBAL P-HIM-OBJECT <>>

<GLOBAL P-HER-OBJECT <>>

<ROUTINE THIS-IS-IT (OBJ)
	 <COND (<OR <EQUAL? .OBJ <> ,PROTAGONIST> ;"is this necessary?"
		    <EQUAL? .OBJ ,NOT-HERE-OBJECT ,ME ,GLOBAL-ROOM>
		    <AND <VERB? WALK>
			 <PRSO? .OBJ>> ;"PRSO is a direction">
		<RTRUE>)  
	       (<FSET? .OBJ ,PERSON>
		<SETG P-HIM-OBJECT .OBJ>)
	       (T
		<SETG P-IT-OBJECT .OBJ>)>>

<GLOBAL P-OFLAG <>> ;"Orphan flag" 

<GLOBAL P-MERGED <>>

<GLOBAL P-ACLAUSE <>>    

<GLOBAL P-ANAM <>>  

<GLOBAL P-AADJ <>>

"Parser variables and temporaries:"

<CONSTANT P-LEXWORDS 1>	"Byte offset to # of entries in LEXV"
<CONSTANT P-LEXSTART 1>	"Word offset to start of LEXV entries"
<CONSTANT P-LEXELEN 2>	"Number of words per LEXV entry"
<CONSTANT P-WORDLEN 4>
<CONSTANT P-PSOFF 6>	"Offset to parts of speech byte"
<CONSTANT P-P1OFF 7>	"Offset to first part of speech"
<CONSTANT P-P1BITS 3>	"First part of speech bit mask in PSOFF byte"
<CONSTANT P-ITBLLEN 10>
	;<CONSTANT P-ITBLLEN 9>
<GLOBAL P-ITBL
	<TABLE 0 0 0 0 0 0 0 0 0 0>>  

<GLOBAL P-OTBL
	<TABLE 0 0 0 0 0 0 0 0 0 0>>  

<GLOBAL P-VTBL
	<TABLE 0 0 0 0>>

<GLOBAL P-OVTBL
	<TABLE 0 0 0 0>>

<GLOBAL P-NCN 0>    

<CONSTANT P-VERB 0> 

<CONSTANT P-VERBN 1>

<CONSTANT P-PREP1 2>

<CONSTANT P-PREP1N 3>    

<CONSTANT P-PREP2 4>    

<CONSTANT P-NC1 6>  

<CONSTANT P-NC1L 7> 

<CONSTANT P-NC2 8>  

<CONSTANT P-NC2L 9> 

<GLOBAL QUOTE-FLAG <>>

<GLOBAL P-END-ON-PREP <>>

<GLOBAL P-PRSA-WORD <>>

<ROUTINE CHECK-REFRESH ()
	 <COND (<BTST <GET 0 8> 4>
		<PUT 0 8 <BAND <GET 0 8> -5>>
		<V-$ISL <>>)>>

" Grovel down the input finding the verb, prepositions, and noun clauses.
   If the input is <direction> or <walk> <direction>, fall out immediately
   setting PRSA to ,V?WALK and PRSO to <direction>. Otherwise, perform
   all required orphaning, syntax checking, and noun clause lookup."   

<GLOBAL VERBOSE-CLOCK T>

<GLOBAL MINUTES-FLAG <>>

<ROUTINE PARSER ("AUX" (PTR ,P-LEXSTART) WRD (VAL 0) (VERB <>) (DONT <>)
		       OMERGED
		       OWINNER LEN (DIR <>) (NW 0) (LW 0)(CNT -1)(OF-FLAG <>))
	<SETG MINUTES-FLAG <>>
	<COND (<NOT ,P-OFLAG>
	       <COPYT ,P-ITBL ,P-OTBL <* ,P-ITBLLEN 2>>)>
	<COPYT ,P-ITBL 0 <* ,P-ITBLLEN 2>>
	<SETG P-NAM <>>
	<SETG IN-FRONT-FLAG <>>
	<SETG P-ADJ <>>
	<SET OMERGED ,P-MERGED>
	<SET OWINNER ,WINNER>
	;<SETG P-ADVERB <>>
	<SETG P-MERGED <>>
	<SETG P-END-ON-PREP <>>
	<PUT ,P-PRSO ,P-MATCHLEN 0>
	<PUT ,P-PRSI ,P-MATCHLEN 0>
	<PUT ,P-BUTS ,P-MATCHLEN 0>
	<COND (<AND <NOT ,QUOTE-FLAG> <N==? ,WINNER ,PROTAGONIST>>
	       <SETG WINNER ,PROTAGONIST>
	       <SETG HERE <LOC ,WINNER>>)>
	<COND (<AND ,VERBOSE-CLOCK ,CHRONOGRAPH-ON>
	       <CRLF>
	       <TELL "[">
	       <CHRONOGRAPH-TELL>
	       <TELL "]">)>
	<COND (,RESERVE-PTR
	       <SET PTR ,RESERVE-PTR>
	       <STUFF ,P-LEXV ,RESERVE-LEXV>
	       <INBUF-STUFF ,P-INBUF ,RESERVE-INBUF>
	       <COND (<AND <EQUAL? ,VERBOSITY 1 2>
			   <EQUAL? ,PROTAGONIST ,WINNER>>
		      <CRLF>)>
	       <SETG RESERVE-PTR <>>
	       <SETG P-CONT <>>)
	      (,P-CONT
	       <SET PTR ,P-CONT>
	       <COND (<AND ,VERBOSE-CLOCK ,CHRONOGRAPH-ON> <CRLF>)>
	       <COND (<AND <EQUAL? ,VERBOSITY 1 2>
			   <EQUAL? ,PROTAGONIST ,WINNER>>
		      <CRLF>)>
	       <SETG P-CONT <>>)
	      (T
	       <SETG WINNER ,PROTAGONIST>
	       <SETG QUOTE-FLAG <>>
	       <SETG HERE <LOC ,WINNER>>
	       <COND (<AND ,VERBOSE-CLOCK ,CHRONOGRAPH-ON> <CRLF>)>
	       <COND (<EQUAL? ,VERBOSITY 1 2>
		      <CRLF>)>
	       <CHECK-REFRESH>
	       <STATUS-LINE>
	       <TELL ">">
	       <PUTB ,P-INBUF 1 0>
	       <READ ,P-INBUF ,P-LEXV ,READ-CLOCK I-CLOCKER>
	       ;<SETG READ-INTERRUPTED <>>
	       <COND (,READ-INTERRUPTED
		      <SETG READ-INTERRUPTED <>>
		      <AGAIN>)>)>
	<SETG P-LEN <GETB ,P-LEXV ,P-LEXWORDS>>
	<COND (<0? ,P-LEN>
	       <TELL "[I beg your pardon?]" CR>
	       <RFALSE>)
	      (<EQUAL? <GET ,P-LEXV .PTR> ,W?OOPS ,W?O>
	       <COND (<EQUAL? <GET ,P-LEXV <+ .PTR ,P-LEXELEN>>
			      ,W?PERIOD ,W?COMMA>
		      <SET PTR <+ .PTR ,P-LEXELEN>>
		      <SETG P-LEN <- ,P-LEN 1>>)>
	       <COND (<NOT <G? ,P-LEN 1>>
		      <TELL "[There was no word after OOPS!]" CR>
		      <RFALSE>)
		     (<SET VAL <GET ,OOPS-TABLE ,O-PTR>>
		      <COND (<G? ,P-LEN 2>
			     <TELL
"[Warning: only the first word after OOPS is used.]" CR>)>
		      <PUT ,AGAIN-LEXV .VAL <GET ,P-LEXV <+ .PTR ,P-LEXELEN>>>
		      <SETG WINNER .OWINNER> ;"Fixes OOPS w/chars"
		      <INBUF-ADD <GETB ,P-LEXV <+ <* .PTR ,P-LEXELEN> 6>>
				 <GETB ,P-LEXV <+ <* .PTR ,P-LEXELEN> 7>>
				 <+ <* .VAL ,P-LEXELEN> 3>>
		      <STUFF ,P-LEXV ,AGAIN-LEXV>
		      <SETG P-LEN <GETB ,P-LEXV ,P-LEXWORDS>>
		      <SET PTR <GET ,OOPS-TABLE ,O-START>>
		      <INBUF-STUFF ,P-INBUF ,OOPS-INBUF>)
		     (T
		      <PUT ,OOPS-TABLE ,O-END <>>
		      <TELL
"[OOPS is useful only after the \"I don't know the word...\" response.]" CR>
		      <RFALSE>)>
	       ;<COND (,DEBUG
		      <SET CNT ,P-LEN>
		      <SET VAL .PTR>
		      <TELL "[Sentence now reads:">
		      <REPEAT ()
		       <COND (<DLESS? CNT 0> <RETURN>)>
		       <PRINTC 32>
		       <COND (<ZERO? <GET ,P-LEXV .VAL>>
			      <WORD-PRINT <GETB <REST ,P-LEXV <* .VAL 2>> 2>
					  <GETB <REST ,P-LEXV <* .VAL 2>> 3>>)
			     (T <PRINTB <GET ,P-LEXV .VAL>>)>
		       <SET VAL <+ 2 .VAL>>>
		      <TELL ".]" CR>)>)
	      (T
	       <PUT ,OOPS-TABLE ,O-END <>>)>
	<COND (<EQUAL? <GET ,P-LEXV .PTR> ,W?AGAIN ,W?G>
	       <COND (,P-OFLAG
		      <TELL "[It's difficult to repeat fragments.]" CR>
		      <RFALSE>)
		     (<NOT ,P-WON>
		      <TELL "[That would just repeat a mistake!]" CR>
		      <RFALSE>)
		     (<AND <NOT <EQUAL? .OWINNER ,PROTAGONIST>>
			   <NOT <VISIBLE? .OWINNER>>>
		      <TELL "[You can't see " D .OWINNER " anymore.]" CR>
		      <STOP>
		      <RFALSE>)
		     (<G? ,P-LEN 1>
		      <COND (<OR <EQUAL? <GET ,P-LEXV <+ .PTR ,P-LEXELEN>>
					,W?PERIOD ,W?COMMA ,W?THEN>
				 <EQUAL? <GET ,P-LEXV <+ .PTR ,P-LEXELEN>>
					,W?AND>>
			     <SET PTR <+ .PTR <* 2 ,P-LEXELEN>>>
			     <PUTB ,P-LEXV ,P-LEXWORDS
				   <- <GETB ,P-LEXV ,P-LEXWORDS> 2>>)
			    (T
			     <TELL "[I couldn't understand that sentence.]" CR>
			     <RFALSE>)>)
		     (T
		      <SET PTR <+ .PTR ,P-LEXELEN>>
		      <PUTB ,P-LEXV ,P-LEXWORDS 
			    <- <GETB ,P-LEXV ,P-LEXWORDS> 1>>)>
	       <COND (<G? <GETB ,P-LEXV ,P-LEXWORDS> 0>
		      <STUFF ,RESERVE-LEXV ,P-LEXV>
		      <INBUF-STUFF ,RESERVE-INBUF ,P-INBUF>
		      <SETG RESERVE-PTR .PTR>)
		     (T
		      <SETG RESERVE-PTR <>>)>
	       <SETG WINNER .OWINNER>
	       <SETG P-MERGED .OMERGED>
	       <INBUF-STUFF ,P-INBUF ,OOPS-INBUF>
	       <STUFF ,P-LEXV ,AGAIN-LEXV>
	       <SET DIR ,AGAIN-DIR>
	       <COPYT ,P-OTBL ,P-ITBL <* ,P-ITBLLEN 2>>)
	      (T
	       <STUFF ,AGAIN-LEXV ,P-LEXV>
	       <INBUF-STUFF ,OOPS-INBUF ,P-INBUF>
	       <PUT ,OOPS-TABLE ,O-START .PTR>
	       <PUT ,OOPS-TABLE ,O-LENGTH <* 4 ,P-LEN>>
	       <SET LEN
		    <* 2 <+ .PTR <* ,P-LEXELEN <GETB ,P-LEXV ,P-LEXWORDS>>>>>
	       <PUT ,OOPS-TABLE ,O-END <+ <GETB ,P-LEXV <- .LEN 1>>
					  <GETB ,P-LEXV <- .LEN 2>>>>
	       <SETG RESERVE-PTR <>>
	       <SET LEN ,P-LEN>
	       <PUT ,P-NAMW 0 <>>
	       <PUT ,P-NAMW 1 <>>
	       <PUT ,P-OFW 0 <>>
	       <PUT ,P-OFW 1 <>>
	       <PUT ,P-ADJW 0 <>>
	       <PUT ,P-ADJW 1 <>>
	       <SETG P-NCN 0>
	       <SETG P-GETFLAGS 0>
	       <REPEAT ()
		<SETG P-LEN <- ,P-LEN 1>>
		<COND (<L? ,P-LEN 0>
		       <SETG QUOTE-FLAG <>>
		       <RETURN>)
		      (<OR <SET WRD <GET ,P-LEXV .PTR>>
			   <SET WRD <NUMBER? .PTR>>>
		       <COND (<ZERO? ,P-LEN> <SET NW 0>)
			     (T <SET NW <GET ,P-LEXV <+ .PTR ,P-LEXELEN>>>)>
		       <COND (<AND <EQUAL? .WRD ,W?TO>
				   <EQUAL? .VERB ,ACT?TELL>>
			      <PUT ,P-ITBL ,P-VERB ,ACT?TELL>
			      <SET WRD ,W?QUOTE>)
			     (<AND <EQUAL? .WRD ,W?THEN>
				   <G? ,P-LEN 0>
				   <NOT .VERB>
				   <NOT ,QUOTE-FLAG>>
			      <PUT ,P-ITBL ,P-VERB ,ACT?TELL>
			      <PUT ,P-ITBL ,P-VERBN 0>
			      <SET WRD ,W?QUOTE>)
			     (<AND <EQUAL? .WRD ,W?PERIOD>
				   <EQUAL? .LW ,W?MR ;,W?DR ;,W?ST>>
			      <SETG P-NCN <- ,P-NCN 1>>
			      <CHANGE-LEXV .PTR .LW T>
			      <SET WRD .LW>
			      <SET LW 0>)>
		       <COND ;(<AND <EQUAL? .WRD ,W?PERIOD>
				   <EQUAL? .LW ,W?MR ;,W?DR ;,W?ST>>
			      <SET LW 0>)
			     (<EQUAL? .WRD ,W?THEN ,W?PERIOD ,W?QUOTE> 
			      <COND (<EQUAL? .WRD ,W?QUOTE>
				     <COND (,QUOTE-FLAG
					    <SETG QUOTE-FLAG <>>)
					   (T
					    <SETG QUOTE-FLAG T>)>)>
			      <OR <0? ,P-LEN>
				  <SETG P-CONT <+ .PTR ,P-LEXELEN>>>
			      <PUTB ,P-LEXV ,P-LEXWORDS ,P-LEN>
			      <RETURN>)
			     (<AND <SET VAL
					<WT? .WRD ,PS?DIRECTION
					          ,P1?DIRECTION>>
				   <EQUAL? .VERB <> ,ACT?WALK ,ACT?GO>
				   <OR <AND <EQUAL? .LEN 1>
					    <OR <NOT ,P-OFLAG>
						<NOT <WT? .WRD
							  ,PS?ADJECTIVE>>>>
				       ;<EQUAL? .LEN 1>
				       <AND <EQUAL? .LEN 2>
					    <EQUAL? .VERB ,ACT?WALK ,ACT?GO>>
				       <AND <EQUAL? .NW ,W?THEN ,W?PERIOD
							,W?QUOTE>
					    <NOT <L? .LEN 2>>>
				       <AND ,QUOTE-FLAG
					    <EQUAL? .LEN 2>
					    <EQUAL? .NW ,W?QUOTE>>
				       <AND <G? .LEN 2>
					    <EQUAL? .NW ,W?COMMA ,W?AND>>>>
			      <SET DIR .VAL>			      
			      <COND (<EQUAL? .NW ,W?COMMA ,W?AND>
				     <CHANGE-LEXV <+ .PTR ,P-LEXELEN>
						  ,W?THEN>)>
			      <COND (<NOT <G? .LEN 2>>
				     <SETG QUOTE-FLAG <>>
				     <RETURN>)>)
			     (<AND <SET VAL <WT? .WRD ,PS?VERB ,P1?VERB>>
				   <NOT .VERB>>
			      <SETG P-PRSA-WORD .WRD>
			      <SET VERB .VAL>
			      <PUT ,P-ITBL ,P-VERB .VAL>
			      <PUT ,P-ITBL ,P-VERBN ,P-VTBL>
			      <PUT ,P-VTBL 0 .WRD>
			      <PUTB ,P-VTBL 2 <GETB ,P-LEXV
						    <SET CNT
							 <+ <* .PTR 2> 2>>>>
			      <PUTB ,P-VTBL 3 <GETB ,P-LEXV <+ .CNT 1>>>)
			     (<OR <SET VAL <WT? .WRD ,PS?PREPOSITION 0>>
				  <EQUAL? .WRD ,W?ALL ,W?ONE ,W?BOTH>
				  <WT? .WRD ,PS?ADJECTIVE>
				  <WT? .WRD ,PS?OBJECT>>
			      <COND (<AND <G? ,P-LEN 1> ;"1 IN RETROFIX #34"
				      <EQUAL? .NW ,W?OF>
				      <0? .VAL>
				      <NOT <EQUAL? .WRD ,W?ALL ,W?ONE ,W?A>>
				      <NOT <EQUAL? .WRD ,W?BOTH>>
				      <0? <GET ,P-OFW ,P-NCN>>
				        ;"take pix of x of y">
				     <PUT ,P-OFW ,P-NCN .WRD> ;"save of-word"
				     <SET OF-FLAG T>)
				    (<AND <NOT <0? .VAL>>
				          <OR <0? ,P-LEN>
					      <EQUAL? .NW ,W?THEN ,W?PERIOD>>>
				     <SETG P-END-ON-PREP T>
				     <COND (<L? ,P-NCN 2>
					    <PUT ,P-ITBL ,P-PREP1 .VAL>
					    <PUT ,P-ITBL ,P-PREP1N .WRD>)>)
				    (<EQUAL? ,P-NCN 2>
				     <TELL
"[There were too many nouns in that sentence.]" CR>
				     <RFALSE>)
				    (T
				     <SETG P-NCN <+ ,P-NCN 1>>
				     <COND (<AND <EQUAL? .VAL ,PR?IN>
						 <EQUAL? .NW ,W?FRONT>>
					    <SETG IN-FRONT-FLAG T>)
					   (<AND <EQUAL? .VAL ,PR?DOWN>
						 <EQUAL? .NW ,W?IN>
						 <EQUAL? <GET ,P-LEXV
							      <+ .PTR 4>>
							 ,W?FRONT>>
					    <SETG IN-FRONT-FLAG T>)>
				     <OR <SET PTR <CLAUSE .PTR .VAL .WRD>>
					 <RFALSE>>
				     <COND (<L? .PTR 0>
					    <SETG QUOTE-FLAG <>>
					    <RETURN>)>)>)
			     (<EQUAL? .WRD ,W?OF> ;"RETROFIX #34"
			      <COND (<OR <ZERO? .OF-FLAG>
					 <EQUAL? .NW ,W?PERIOD ,W?THEN>>
				     <CANT-USE .PTR>
				     <RFALSE>)
				    (T
				     <SET OF-FLAG <>>)>)
			     (<WT? .WRD ,PS?BUZZ-WORD>
			      <COND (<EQUAL? .WRD ,W?MINUTES ,W?MINUTE>
				     <SETG MINUTES-FLAG T>)>)
			     (<AND <EQUAL? .VERB ,ACT?TELL>
				   <WT? .WRD ,PS?VERB>>
			      <TELL
"[Please consult your manual for the correct way to talk to characters.]" CR>
			      <RFALSE>)
			     (T
			      <CANT-USE .PTR>
			      <RFALSE>)>)
		      (T
		       <UNKNOWN-WORD .PTR>
		       <RFALSE>)>
		<SET LW .WRD>
		<SET PTR <+ .PTR ,P-LEXELEN>>>
	       <PUT ,OOPS-TABLE ,O-CONT ,P-CONT>
	       <PUT ,OOPS-TABLE ,O-LEN ,P-LEN>)>
	<PUT ,OOPS-TABLE ,O-PTR <>>
	<COND (.DIR
	       <SETG PRSA ,V?WALK>
	       <SETG PRSO .DIR>
	       <SETG P-OFLAG <>>
	       <SETG P-WALK-DIR .DIR>
	       <SETG AGAIN-DIR .DIR>
	       <RETURN T>)>
	<COND (,P-OFLAG
	       <ORPHAN-MERGE>)>
	<SETG P-WALK-DIR <>>
	<SETG AGAIN-DIR <>>
	<COND (<AND <SYNTAX-CHECK>
		    <SNARF-OBJECTS>
		    <MANY-CHECK>
		    <TAKE-CHECK>>
	       T)>>

<ROUTINE CHANGE-LEXV (PTR WRD "OPTIONAL" (BPTR <>) "AUX" X Y Z)
	 <COND (.BPTR
		<SET X <+ 2 <* 2 <- .PTR ,P-LEXELEN>>>>
		<SET Y <GETB ,P-LEXV .X>>
		<SET Z <+ 2 <* 2 .PTR>>>
		<PUTB     ,P-LEXV .Z .Y>
		<PUTB ,AGAIN-LEXV .Z .Y>
		<SET Y <GETB ,P-LEXV <+ 1 .X>>>
		<SET Z <+ 3 <* 2 .PTR>>>
		<PUTB     ,P-LEXV .Z .Y>
		<PUTB ,AGAIN-LEXV .Z .Y>)>
	 <PUT ,P-LEXV .PTR .WRD>
	 <PUT ,AGAIN-LEXV .PTR .WRD>>

<GLOBAL P-WALK-DIR <>>
<GLOBAL AGAIN-DIR <>>

"For AGAIN purposes, put contents of one LEXV table into another:"
<ROUTINE STUFF (DEST SRC "OPT" (MAX 29))
	 <COPYT .SRC .DEST <* .MAX 4>>>

;<ROUTINE STUFF (DEST SRC "OPT" (MAX 29 ;0)
		 "AUX" (PTR ,P-LEXSTART) (CTR 1) BPTR)
	 <PUTB .DEST 0 <GETB .SRC 0>>
	 <PUTB .DEST 1 <GETB .SRC 1>>
	 ;<COND (<0? .MAX> <SET MAX <GETB .SRC 0>>)>
	 <REPEAT ()
	  <PUT .DEST .PTR <GET .SRC .PTR>>
	  <SET BPTR <+ <* .PTR 2> 2>>
	  <PUTB .DEST .BPTR <GETB .SRC .BPTR>>
	  <SET BPTR <+ 1 .BPTR>>
	  <PUTB .DEST .BPTR <GETB .SRC .BPTR>>
	  <SET PTR <+ .PTR ,P-LEXELEN>>
	  <COND (<IGRTR? CTR .MAX>
		 <RETURN>)>>>

;"Put contents of one INBUF into another"
<ROUTINE INBUF-STUFF (DEST SRC)
	 <COPYT .SRC .DEST 60>>

;<ROUTINE INBUF-STUFF (DEST SRC "AUX" (CNT -1))
	 <REPEAT ()
	  <COND (<IGRTR? CNT 59> <RETURN>)
		(T <PUTB .DEST .CNT <GETB .SRC .CNT>>)>>>

;<ROUTINE INBUF-STUFF (DEST SRC "AUX" CNT)
	 <SET CNT <GETB .SRC 0>>
	 <REPEAT ()
		 <COND (<DLESS? CNT 0> <RETURN>)>
		 <PUTB .DEST .CNT <GETB .SRC .CNT>>>> 

;"Put the word in the positions specified from P-INBUF to the end of
OOPS-INBUF, leaving the appropriate pointers in AGAIN-LEXV"
<ROUTINE INBUF-ADD (LEN BEG SLOT "AUX" DBEG (CTR 0) TMP)
	 <COND (<SET TMP <GET ,OOPS-TABLE ,O-END>>
		<SET DBEG .TMP>)
	       (T
		<SET TMP <GET ,OOPS-TABLE ,O-LENGTH>>
		<SET DBEG <+ <GETB ,AGAIN-LEXV .TMP>
			     <GETB ,AGAIN-LEXV <+ .TMP 1>>>>)>
	 <PUT ,OOPS-TABLE ,O-END <+ .DBEG .LEN>>
	 <COPYT <REST ,P-INBUF .BEG> <REST ,OOPS-INBUF .DBEG> .LEN>
	 <PUTB ,AGAIN-LEXV .SLOT .DBEG>
	 <PUTB ,AGAIN-LEXV <- .SLOT 1> .LEN>>

;"Check whether word pointed at by PTR is the correct part of speech.
   The second argument is the part of speech (,PS?<part of speech>). The
   3rd argument (,P1?<part of speech>), if given, causes the value
   for that part of speech to be returned."

;"allows three parts ot speech"
<ROUTINE WT? (PTR BIT "OPTIONAL" (B1 5) "AUX" (OFFS ,P-P1OFF) TYP) 
	<COND (<BTST <SET TYP <GETB .PTR ,P-PSOFF>> .BIT>
	       <COND (<G? .B1 4> <RTRUE>)
		     (<EQUAL? .BIT ,PS?OBJECT>
		      1)
		     (T
		      <SET TYP <BAND .TYP ,P-P1BITS>>
		      <COND (<NOT <EQUAL? .TYP .B1>> <SET OFFS <+ .OFFS 1>>)>
		      <GETB .PTR .OFFS>)>)>>

;" Scan through a noun clause, leave a pointer to its starting location"
<ROUTINE CLAUSE (PTR VAL WRD "AUX" OFF NUM (ANDFLG <>) (FIRST?? T) NW (LW 0))
	<SET OFF <* <- ,P-NCN 1> 2>>
	<COND (<NOT <EQUAL? .VAL 0>>
	       <PUT ,P-ITBL <SET NUM <+ ,P-PREP1 .OFF>> .VAL>
	       <PUT ,P-ITBL <+ .NUM 1> .WRD>
	       <SET PTR <+ .PTR ,P-LEXELEN>>)
	      (T <SETG P-LEN <+ ,P-LEN 1>>)>
	<COND (<0? ,P-LEN> <SETG P-NCN <- ,P-NCN 1>> <RETURN -1>)>
	<PUT ,P-ITBL <SET NUM <+ ,P-NC1 .OFF>> <REST ,P-LEXV <* .PTR 2>>>
	<COND (<EQUAL? <GET ,P-LEXV .PTR> ,W?THE ,W?A ,W?AN>
	       <PUT ,P-ITBL .NUM <REST <GET ,P-ITBL .NUM> 4>>)>
	<REPEAT ()
		<COND (<L? <SETG P-LEN <- ,P-LEN 1>> 0>
		       <PUT ,P-ITBL <+ .NUM 1> <REST ,P-LEXV <* .PTR 2>>>
		       <RETURN -1>)>
		<COND (<OR <SET WRD <GET ,P-LEXV .PTR>>
			   <SET WRD <NUMBER? .PTR>>>
		       <COND (<0? ,P-LEN> <SET NW 0>)
			     (T
			      <SET NW <GET ,P-LEXV <+ .PTR ,P-LEXELEN>>>
			      <COND (<ZERO? .NW>	;"added 8/14/86 SWG"
				     <SET NW <NUMBER? <+ .PTR ,P-LEXELEN>>>)>)>
		       <COND (<AND <EQUAL? .WRD ,W?PERIOD>
				   <EQUAL? .LW ,W?MR ;,W?DR ;,W?ST>>
			      <SET LW 0>)
			     (<EQUAL? .WRD ,W?AND ,W?COMMA> <SET ANDFLG T>)
			     (<EQUAL? .WRD ,W?ALL ,W?ONE ,W?BOTH>
			      <COND (<EQUAL? .NW ,W?OF>
				     <SETG P-LEN <- ,P-LEN 1>>
				     <SET PTR <+ .PTR ,P-LEXELEN>>)>)
			     (<OR <EQUAL? .WRD ,W?THEN ,W?PERIOD>
				  <AND <WT? .WRD ,PS?PREPOSITION>
				       <GET ,P-ITBL ,P-VERB>
				          ;"ADDED 4/27 FOR TURTLE,UP"
				       <NOT .FIRST??>>>
			      <SETG P-LEN <+ ,P-LEN 1>>
			      <PUT ,P-ITBL
				   <+ .NUM 1>
				   <REST ,P-LEXV <* .PTR 2>>>
			      <RETURN <- .PTR ,P-LEXELEN>>)
			     ;"This next clause was 2 clauses further down"
			     ;"This attempts to fix EDDIE, TURN ON COMPUTER"
			     (<AND .ANDFLG
				   <EQUAL? <GET ,P-ITBL ,P-VERB> 0>>
			      <SET PTR <- .PTR 4>>
			      <CHANGE-LEXV <+ .PTR 2> ,W?THEN>
			      <SETG P-LEN <+ ,P-LEN 2>>)
			     (<WT? .WRD ,PS?OBJECT>
			      <COND ;"First clause added 1/10/84 to fix
				      'verb AT synonym OF synonym' bug"
			            (<AND <G? ,P-LEN 0>
					  <EQUAL? .NW ,W?OF>
					  <NOT <EQUAL? .WRD ,W?ALL ,W?ONE>>>
				     <PUT ,P-OFW <- ,P-NCN 1> .WRD>)
				     ;"previous line had been just T"
				    (<AND <WT? .WRD ,PS?ADJECTIVE>
					  <NOT <EQUAL? .NW 0>>
					  <WT? .NW ,PS?OBJECT>>)
				    (<AND <NOT .ANDFLG>
					  <NOT <EQUAL? .NW ,W?BUT ,W?EXCEPT>>
					  <NOT <EQUAL? .NW ,W?AND ,W?COMMA>>>
				     <PUT ,P-ITBL
					  <+ .NUM 1>
					  <REST ,P-LEXV <* <+ .PTR 2> 2>>>
				     <RETURN .PTR>)
				    (T <SET ANDFLG <>>)>)
			     ;"next clause replaced by following one
			       from games with characters"
			     ;(<AND <OR ,P-MERGED
				       ,P-OFLAG
				       <NOT <EQUAL? <GET ,P-ITBL ,P-VERB> 0>>>
				   <OR <WT? .WRD ,PS?ADJECTIVE>
				       <WT? .WRD ,PS?BUZZ-WORD>>>)
			     (<OR <WT? .WRD ,PS?ADJECTIVE>
				  <WT? .WRD ,PS?BUZZ-WORD>>
			      <COND (<EQUAL? .WRD ,W?MINUTES ,W?MINUTE>
				     <SETG MINUTES-FLAG T>)>)
			     (<WT? .WRD ,PS?PREPOSITION> T)
			     (T
			      <CANT-USE .PTR>
			      <RFALSE>)>)
		      (T <UNKNOWN-WORD .PTR> <RFALSE>)>
		<SET LW .WRD>
		<SET FIRST?? <>>
		<SET PTR <+ .PTR ,P-LEXELEN>>>> 

;"from suspect"
<ROUTINE NUMBER? (PTR "AUX" CNT BPTR CHR (SUM 0) (TIM <>) (EXC <>))
	 <SET CNT <GETB <REST ,P-LEXV <* .PTR 2>> 2>>
	 <SET BPTR <GETB <REST ,P-LEXV <* .PTR 2>> 3>>
	 <REPEAT ()
		 <COND (<L? <SET CNT <- .CNT 1>> 0> <RETURN>)
		       (T
			<SET CHR <GETB ,P-INBUF .BPTR>>
			<COND (<EQUAL? .CHR 58>
			       <COND (.EXC <RFALSE>)>
			       <SET TIM .SUM>
			       <SET SUM 0>)
			      (<EQUAL? .CHR 45 %<ASCII !\/>>
			       <COND (.TIM <RFALSE>)>
			       <SET EXC .SUM>
			       <SET SUM 0>)
			      (<G? .SUM 9999> <RFALSE>)
			      (<AND <L? .CHR 58> <G? .CHR 47>>
			       <SET SUM <+ <* .SUM 10> <- .CHR 48>>>)
			      (T <RFALSE>)>
			<SET BPTR <+ .BPTR 1>>)>>
	 <CHANGE-LEXV .PTR ,W?NUMBER>
	 ;<PUT ,P-LEXV .PTR ,W?NUMBER>
	 <COND (<G? .SUM 9999> <RFALSE>)
	       (.EXC
		<SETG P-EXCHANGE .EXC>)
	       (.TIM
		<SETG P-EXCHANGE 0>
		<COND (<G? .TIM 23> <RFALSE>)
		      (<G? .TIM 19> T)
		      (<G? .TIM 12> <RFALSE>)
		      (<G? .TIM  7> T)
		      (T <SET TIM <+ 12 .TIM>>)>
		<SET SUM <+ .SUM <* .TIM 60>>>)
	       (T <SETG P-EXCHANGE 0>)>
	 <SETG P-NUMBER .SUM>
	 ,W?NUMBER>

<GLOBAL P-NUMBER 0>
<GLOBAL P-EXCHANGE 0>

<GLOBAL P-DIRECTION <>>

<ROUTINE ORPHAN-MERGE ("AUX" (CNT -1) TEMP VERB BEG END (ADJ <>) WRD) 
   <SETG P-OFLAG <>>
   <SET WRD <GET <GET ,P-ITBL ,P-VERBN> 0>>
   <COND (<OR <EQUAL? <WT? .WRD ,PS?VERB ,P1?VERB>
		   <GET ,P-OTBL ,P-VERB>>
	      <WT? .WRD ,PS?ADJECTIVE>>
	  <SET ADJ T>)
	 (<AND <WT? .WRD ,PS?OBJECT>
	       <EQUAL? ,P-NCN 0>>
	  <PUT ,P-ITBL ,P-VERB 0>
	  <PUT ,P-ITBL ,P-VERBN 0>
	  <PUT ,P-ITBL ,P-NC1 <REST ,P-LEXV 2>>
	  <PUT ,P-ITBL ,P-NC1L <REST ,P-LEXV 6>>
	  <SETG P-NCN 1>)>
   <COND (<AND <NOT <0? <SET VERB <GET ,P-ITBL ,P-VERB>>>>
	       <NOT .ADJ>
	       <NOT <EQUAL? .VERB <GET ,P-OTBL ,P-VERB>>>>
	  <RFALSE>)
	 (<EQUAL? ,P-NCN 2> <RFALSE>)
	 (<EQUAL? <GET ,P-OTBL ,P-NC1> 1>
	  <COND (<OR <EQUAL? <SET TEMP <GET ,P-ITBL ,P-PREP1>>
			  <GET ,P-OTBL ,P-PREP1>>
		     <0? .TEMP>>
		 <COND (.ADJ
			<PUT ,P-OTBL ,P-NC1 <REST ,P-LEXV 2>>
			<COND (<0? <GET ,P-ITBL ,P-NC1L>>
			       <PUT ,P-ITBL ,P-NC1L <REST ,P-LEXV 6>>)>
			<COND (<0? ,P-NCN> <SETG P-NCN 1>)>)
		       (T
			<PUT ,P-OTBL ,P-NC1 <GET ,P-ITBL ,P-NC1>>
			;<PUT ,P-OTBL ,P-NC1L <GET ,P-ITBL ,P-NC1L>>)>
		 <PUT ,P-OTBL ,P-NC1L <GET ,P-ITBL ,P-NC1L>>)
		(T <RFALSE>)>)
	 (<EQUAL? <GET ,P-OTBL ,P-NC2> 1>
	  <COND (<OR <EQUAL? <SET TEMP <GET ,P-ITBL ,P-PREP1>>
			  <GET ,P-OTBL ,P-PREP2>>
		     <0? .TEMP>>
		 <COND (.ADJ
			<PUT ,P-ITBL ,P-NC1 <REST ,P-LEXV 2>>
			<COND (<0? <GET ,P-ITBL ,P-NC1L>>
			       <PUT ,P-ITBL ,P-NC1L <REST ,P-LEXV 6>>)>)>
		 <PUT ,P-OTBL ,P-NC2 <GET ,P-ITBL ,P-NC1>>
		 <PUT ,P-OTBL ,P-NC2L <GET ,P-ITBL ,P-NC1L>>
		 <SETG P-NCN 2>)
		(T <RFALSE>)>)
	 (,P-ACLAUSE
	  <COND (<AND <NOT <EQUAL? ,P-NCN 1>> <NOT .ADJ>>
		 <SETG P-ACLAUSE <>>
		 <RFALSE>)
		(T
		 <SET BEG <GET ,P-ITBL ,P-NC1>>
		 <COND (.ADJ <SET BEG <REST ,P-LEXV 2>> <SET ADJ <>>)>
		 <SET END <GET ,P-ITBL ,P-NC1L>>
		 <REPEAT ()
			 <SET WRD <GET .BEG 0>>
			 <COND (<EQUAL? .BEG .END>
				<COND (.ADJ <ACLAUSE-WIN .ADJ> <RETURN>)
				      (T <SETG P-ACLAUSE <>> <RFALSE>)>)
			       (<AND <NOT .ADJ>
				     <OR <BTST <GETB .WRD ,P-PSOFF>
					       ,PS?ADJECTIVE> ;"same as WT?"
					 <EQUAL? .WRD ,W?ALL ,W?ONE>>>
				<SET ADJ .WRD>)
			       (<EQUAL? .WRD ,W?ONE>
				<ACLAUSE-WIN .ADJ>
				<RETURN>)
			       (<BTST <GETB .WRD ,P-PSOFF> ,PS?OBJECT>
				<COND (<EQUAL? .WRD ,P-ANAM>
				       <ACLAUSE-WIN .ADJ>)
				      (T
				       <NCLAUSE-WIN>)>
				<RETURN>)>
			 <SET BEG <REST .BEG ,P-WORDLEN>>
			 <COND (<EQUAL? .END 0>
				<SET END .BEG>
				<SETG P-NCN 1>
				<PUT ,P-ITBL ,P-NC1 <BACK .BEG 4>>
				<PUT ,P-ITBL ,P-NC1L .BEG>)>>)>)>
   <PUT ,P-VTBL 0 <GET ,P-OVTBL 0>>
   <PUTB ,P-VTBL 2 <GETB ,P-OVTBL 2>>
   <PUTB ,P-VTBL 3 <GETB ,P-OVTBL 3>>
   <PUT ,P-OTBL ,P-VERBN ,P-VTBL>
   <PUTB ,P-VTBL 2 0>
   ;<AND <NOT <EQUAL? <GET ,P-OTBL ,P-NC2> 0>> <SETG P-NCN 2>>
   <COPYT ,P-OTBL ,P-ITBL <* ,P-ITBLLEN 2>>
   <SETG P-MERGED T>
   ;<REPEAT ()
	   <COND (<G? <SET CNT <+ .CNT 1>> ,P-ITBLLEN>
		  <SETG P-MERGED T>
		  <RTRUE>)
		 (T <PUT ,P-ITBL .CNT <GET ,P-OTBL .CNT>>)>>
   T>

<ROUTINE ACLAUSE-WIN (ADJ) 
	 <PUT ,P-ITBL ,P-VERB <GET ,P-OTBL ,P-VERB>>
	 <CLAUSE-COPY ,P-OTBL ,P-OTBL ,P-ACLAUSE <+ ,P-ACLAUSE 1>
		      ,P-ACLAUSE <+ ,P-ACLAUSE 1> .ADJ>
	 <AND <NOT <EQUAL? <GET ,P-OTBL ,P-NC2> 0>> <SETG P-NCN 2>>
	 <SETG P-ACLAUSE <>>
	 <RTRUE>>

<ROUTINE NCLAUSE-WIN ()
	<CLAUSE-COPY ,P-ITBL ,P-OTBL ,P-NC1 ,P-NC1L
		     ,P-ACLAUSE <+ ,P-ACLAUSE 1>>
	<AND <NOT <EQUAL? <GET ,P-OTBL ,P-NC2> 0>> <SETG P-NCN 2>>
	<SETG P-ACLAUSE <>>
	<RTRUE>>

;"Print undefined word in input. PTR points to the unknown word in P-LEXV"   

<ROUTINE WORD-PRINT (CNT BUF)
	 <REPEAT ()
		 <COND (<DLESS? CNT 0> <RETURN>)
		       (ELSE
			<PRINTC <GETB ,P-INBUF .BUF>>
			<SET BUF <+ .BUF 1>>)>>>

<ROUTINE UNKNOWN-WORD (PTR "AUX" BUF)
	<PUT ,OOPS-TABLE ,O-PTR .PTR>
	<TELL "[I don't know">
	<TELL " the word \"">
	<WORD-PRINT <GETB <REST ,P-LEXV <SET BUF <* .PTR 2>>> 2>
		    <GETB <REST ,P-LEXV .BUF> 3>>
	<TELL ".\"]">
	<CRLF>
	<SETG QUOTE-FLAG <>>
	;<SETG P-OFLAG <>>>

<ROUTINE CANT-USE (PTR "AUX" BUF)
	<TELL "[You used the word \"">
	<WORD-PRINT <GETB <REST ,P-LEXV <SET BUF <* .PTR 2>>> 2>
		    <GETB <REST ,P-LEXV .BUF> 3>>
	<TELL "\" in a way that I don't understand.]" CR>
	<SETG QUOTE-FLAG <>>
	<SETG P-OFLAG <>>>

;"Perform syntax matching operations, using P-ITBL as the source of the verb
and adjectives for this input. Returns false if no syntax matches, and does
it's own orphaning. If return is true, the syntax is saved in P-SYNTAX."

<GLOBAL P-SLOCBITS 0>

<CONSTANT P-SYNLEN 8>

<CONSTANT P-SBITS 0>

<CONSTANT P-SPREP1 1>

<CONSTANT P-SPREP2 2>

<CONSTANT P-SFWIM1 3>

<CONSTANT P-SFWIM2 4>

<CONSTANT P-SLOC1 5>

<CONSTANT P-SLOC2 6>

<CONSTANT P-SACTION 7>

<CONSTANT P-SONUMS 3>

<ROUTINE SYNTAX-CHECK
	("AUX" SYN LEN NUM OBJ (DRIVE1 <>) (DRIVE2 <>) PREP VERB TMP)
	<COND (<0? <SET VERB <GET ,P-ITBL ,P-VERB>>>
	       <TELL "[There was no verb in that sentence!]" CR>
	       <RFALSE>)>
	<SET SYN <GET ,VERBS <- 255 .VERB>>>
	<SET LEN <GETB .SYN 0>>
	<SET SYN <REST .SYN>>
	<REPEAT ()
		<SET NUM <BAND <GETB .SYN ,P-SBITS> ,P-SONUMS>>
		<COND (<G? ,P-NCN .NUM> T)
		      (<AND <NOT <L? .NUM 1>>
			    <0? ,P-NCN>
			    <OR <0? <SET PREP <GET ,P-ITBL ,P-PREP1>>>
				<EQUAL? .PREP <GETB .SYN ,P-SPREP1>>>>
		       <SET DRIVE1 .SYN>)
		      (<EQUAL? <GETB .SYN ,P-SPREP1> <GET ,P-ITBL ,P-PREP1>>
		       <COND (<AND <EQUAL? .NUM 2> <EQUAL? ,P-NCN 1>>
			      <SET DRIVE2 .SYN>)
			     (<EQUAL? <GETB .SYN ,P-SPREP2>
				      <GET ,P-ITBL ,P-PREP2>>
			      <SYNTAX-FOUND .SYN>
			      <RTRUE>)>)>
		<COND (<DLESS? LEN 1>
		       <COND (<OR .DRIVE1 .DRIVE2> <RETURN>)
			     (T
			      <TELL ,RECOGNIZE>
			      <RFALSE>)>)
		      (T <SET SYN <REST .SYN ,P-SYNLEN>>)>>
	<COND (<AND .DRIVE1
		    <SET OBJ
			 <GWIM <GETB .DRIVE1 ,P-SFWIM1>
			       <GETB .DRIVE1 ,P-SLOC1>
			       <GETB .DRIVE1 ,P-SPREP1>>>>
	       <PUT ,P-PRSO ,P-MATCHLEN 1>
	       <PUT ,P-PRSO 1 .OBJ>
	       <SYNTAX-FOUND .DRIVE1>)
	      (<AND .DRIVE2
		    <SET OBJ
			 <GWIM <GETB .DRIVE2 ,P-SFWIM2>
			       <GETB .DRIVE2 ,P-SLOC2>
			       <GETB .DRIVE2 ,P-SPREP2>>>>
	       <PUT ,P-PRSI ,P-MATCHLEN 1>
	       <PUT ,P-PRSI 1 .OBJ>
	       <SYNTAX-FOUND .DRIVE2>)
	      (<EQUAL? .VERB ,ACT?FIND ;,ACT?WHAT>
	       <TELL "[I can't answer that question.]" CR>
	       <RFALSE>)
	      ;(<CHANGE-CLOTHES? .VERB>
	       <V-YELL>
	       <RFALSE>)
	      (T
	       <COND (<EQUAL? ,WINNER ,PROTAGONIST>
		      <ORPHAN .DRIVE1 .DRIVE2>
		      <TELL "[Wh">)
		     (T
		      <TELL
"[Your command was not complete. Next time, type wh">)>
	       <COND (<EQUAL? .VERB ,ACT?WALK ,ACT?GO ;,ACT?HEAD>
		      <TELL "ere">)
		     (<OR <AND .DRIVE1
			       <EQUAL? <GETB .DRIVE1 ,P-SFWIM1> ,PERSON>>
			  <AND .DRIVE2
			       <EQUAL? <GETB .DRIVE2 ,P-SFWIM2> ,PERSON>>>
		      <TELL "om">)
		     (T <TELL "at">)>
	       <COND (<EQUAL? ,WINNER ,PROTAGONIST>
		      <TELL " do you want to ">)
		     (T
		      <TELL " you want " T ,WINNER " to ">)>
	       <VERB-PRINT>
	       <COND (.DRIVE2
		      <CLAUSE-PRINT ,P-NC1 ,P-NC1L>)>
	       <SETG P-END-ON-PREP <>>
	       <PREP-PRINT <COND (.DRIVE1 <GETB .DRIVE1 ,P-SPREP1>)
				 (T <GETB .DRIVE2 ,P-SPREP2>)>>
	       <COND (<EQUAL? ,WINNER ,PROTAGONIST>
		      <SETG P-OFLAG T>
		      <TELL "?]" CR>)
		     (T
		      <SETG P-OFLAG <>>
		      <TELL ".]" CR>)>
	       <RFALSE>)>>

;<ROUTINE CHANGE-CLOTHES? (VERB "AUX" TMP)
 <COND (<NOT <EQUAL? .VERB ,ACT?SET>>
	<RFALSE>)
       (<ZERO? <SET TMP <GET ,P-ITBL ,P-NC1>>>
	<RFALSE>)
       (<EQUAL? <GET .TMP 0> ,W?CLOTHES ,W?CLOTHING>
	<RTRUE>)
       (<EQUAL? <GET .TMP 0> ,W?MY>
	<COND (<EQUAL? <GET .TMP 2> ,W?CLOTHES ,W?CLOTHING>
	       <RTRUE>)
	      (T <RFALSE>)>)>>

<ROUTINE VERB-PRINT ("AUX" TMP)
	<SET TMP <GET ,P-ITBL ,P-VERBN>>	;"? ,P-OTBL?"
	<COND (<EQUAL? .TMP 0> <TELL "tell">)
	      (<0? <GETB ,P-VTBL 2>>
	       <PRINTB <GET .TMP 0>>)
	      (T
	       <WORD-PRINT <GETB .TMP 2> <GETB .TMP 3>>
	       <PUTB ,P-VTBL 2 0>)>> 

;<ROUTINE CANT-ORPHAN ()
	 <TELL "\"I don't understand! What are you referring to?\"" CR>
	 <RFALSE>>

<ROUTINE ORPHAN (D1 D2 "AUX" (CNT -1))
	<COND (<NOT ,P-MERGED>
	       <PUT ,P-OCLAUSE ,P-MATCHLEN 0>)>
	<PUT ,P-OVTBL 0 <GET ,P-VTBL 0>>
	<PUTB ,P-OVTBL 2 <GETB ,P-VTBL 2>>
	<PUTB ,P-OVTBL 3 <GETB ,P-VTBL 3>>
	<COPYT ,P-ITBL ,P-OTBL <* ,P-ITBLLEN 2>>
	;<REPEAT ()
		<COND (<IGRTR? CNT ,P-ITBLLEN> <RETURN>)
		      (T <PUT ,P-OTBL .CNT <GET ,P-ITBL .CNT>>)>>
	<COND (<EQUAL? ,P-NCN 2>
	       <CLAUSE-COPY ,P-ITBL ,P-OTBL ,P-NC2 ,P-NC2L ,P-NC2 ,P-NC2L>)>
	<COND (<NOT <L? ,P-NCN 1>>
	       <CLAUSE-COPY ,P-ITBL ,P-OTBL ,P-NC1 ,P-NC1L ,P-NC1 ,P-NC1L>)>
	<COND (.D1
	       <PUT ,P-OTBL ,P-PREP1 <GETB .D1 ,P-SPREP1>>
	       <PUT ,P-OTBL ,P-NC1 1>)
	      (.D2
	       <PUT ,P-OTBL ,P-PREP2 <GETB .D2 ,P-SPREP2>>
	       <PUT ,P-OTBL ,P-NC2 1>)>> 
 
<ROUTINE ORPHAN-VERB ()
	 <PUT ,P-VTBL 0 ,W?ZZMGCK>
	 <PUT ,P-OVTBL 0 ,W?ANSWER>	;"maybe fix 'what do you want to'"
	 <PUT ,P-OTBL ,P-VERB ,ACT?$ID>
	 <PUT ,P-OTBL ,P-VERBN ,P-VTBL>
	 <PUT ,P-OTBL ,P-PREP1 0>
	 <PUT ,P-OTBL ,P-PREP1N 0>
	 <PUT ,P-OTBL ,P-PREP2 0>
	 <PUT ,P-OTBL 5 0>
	 <PUT ,P-OTBL ,P-NC1 1>
	 <PUT ,P-OTBL ,P-NC1L 0>
	 <PUT ,P-OTBL ,P-NC2 0>
	 <PUT ,P-OTBL ,P-NC2L 0>
	 <SETG P-OFLAG T>>

<ROUTINE CLAUSE-PRINT (BPTR EPTR "OPTIONAL" (THE? T)) 
	<BUFFER-PRINT <GET ,P-ITBL .BPTR> <GET ,P-ITBL .EPTR> .THE?>>    
 
<ROUTINE BUFFER-PRINT (BEG END CP "AUX" (NOSP <>) WRD (FIRST?? T) (PN <>))
	 <REPEAT ()
		<COND (<EQUAL? .BEG .END>
		       <RETURN>)
		      (T
		       <COND (.NOSP
			      <SET NOSP <>>)
			     (T
			      <TELL " ">)>
		       <COND (<EQUAL? <SET WRD <GET .BEG 0>> ,W?PERIOD>
			      <SET NOSP T>)
			     ;(<AND <OR <WT? .WRD ,PS?BUZZ-WORD>
				       <WT? .WRD ,PS?PREPOSITION>>
				   <NOT <WT? .WRD ,PS?ADJECTIVE>>
				   <NOT <WT? .WRD ,PS?OBJECT>>>
			      <SET NOSP T>)
			     (<EQUAL? .WRD ,W?ME>
			      <PRINTD ,ME>
			      <SET PN T>)
			     (<EQUAL? .WRD ,W?MY>
			      <PRINTI "your">
			      <SET PN T>)
			     (<NAME? .WRD>
			      <CAPITALIZE .BEG>
			      <SET PN T>)
			     (T
			      <COND (<AND .FIRST?? <NOT .PN> .CP>
				     <TELL "the ">)>
			      <COND (<OR ,P-OFLAG ,P-MERGED> <PRINTB .WRD>)
				    (<AND <EQUAL? .WRD ,W?IT ,W?THEM>
					  <ACCESSIBLE? ,P-IT-OBJECT>>
				     <PRINTD ,P-IT-OBJECT>)
				    (<AND <EQUAL? .WRD ,W?HIM ,W?HIMSELF>
					  <ACCESSIBLE? ,P-HIM-OBJECT>>
				     <TELL D ,P-HIM-OBJECT>)
				    (<AND <EQUAL? .WRD ,W?HER ,W?HERSELF>
					  <ACCESSIBLE? ,P-HER-OBJECT>>
				     <TELL D ,P-HER-OBJECT>)
				    (T
				     <WORD-PRINT <GETB .BEG 2>
						 <GETB .BEG 3>>)>
			      <SET FIRST?? <>>)>)>
		<SET BEG <REST .BEG ,P-WORDLEN>>>>

<ROUTINE NAME? (WRD)
	 <COND (<EQUAL? .WRD ,W?TOPAZ ,W?RIZNIK>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE CAPITALIZE (PTR)
	 <COND (<OR ,P-OFLAG ,P-MERGED>
		<PRINTB <GET .PTR 0>>)
	       (T
		<PRINTC <- <GETB ,P-INBUF <GETB .PTR 3>> 32>>
		<WORD-PRINT <- <GETB .PTR 2> 1> <+ <GETB .PTR 3> 1>>)>>

<ROUTINE PREP-PRINT (PREP "AUX" WRD)
	<COND (<NOT <0? .PREP>>
	       <TELL " ">
	       <COND ;(<EQUAL? .PREP ,PR?THROUGH>
		      <TELL "through">)
		     (T
		      <SET WRD <PREP-FIND .PREP>>
		      <PRINTB .WRD>)>)>>    
 
<ROUTINE CLAUSE-COPY (SRC DEST SRCBEG SRCEND DESTBEG DESTEND
		      "OPTIONAL" (INSRT <>) "AUX" BEG END)
	<SET BEG <GET .SRC .SRCBEG>>
	<SET END <GET .SRC .SRCEND>>
	<PUT .DEST .DESTBEG
	     <REST ,P-OCLAUSE
		   <+ <* <GET ,P-OCLAUSE ,P-MATCHLEN> ,P-LEXELEN> 2>>>
	<REPEAT ()
		<COND (<EQUAL? .BEG .END>
		       <PUT .DEST .DESTEND
			    <REST ,P-OCLAUSE
				  <+ <* <GET ,P-OCLAUSE ,P-MATCHLEN> ,P-LEXELEN>
				     2>>>
		       <RETURN>)
		      (T
		       <COND (<AND .INSRT <EQUAL? ,P-ANAM <GET .BEG 0>>>
			      <CLAUSE-ADD .INSRT>)>
		       <CLAUSE-ADD <GET .BEG 0>>)>
		<SET BEG <REST .BEG ,P-WORDLEN>>>>

<ROUTINE CLAUSE-ADD (WRD "AUX" PTR)
	<SET PTR <+ <GET ,P-OCLAUSE ,P-MATCHLEN> 2>>
	<PUT ,P-OCLAUSE <- .PTR 1> .WRD>
	<PUT ,P-OCLAUSE .PTR 0>
	<PUT ,P-OCLAUSE ,P-MATCHLEN .PTR>>   
 
<ROUTINE PREP-FIND (PREP "AUX" (CNT 0) SIZE)
	<SET SIZE <* <GET ,PREPOSITIONS 0> 2>>
	<REPEAT ()
		<COND (<IGRTR? CNT .SIZE> <RFALSE>)
		      (<EQUAL? <GET ,PREPOSITIONS .CNT> .PREP>
		       <RETURN <GET ,PREPOSITIONS <- .CNT 1>>>)>>>  
 
<ROUTINE SYNTAX-FOUND (SYN)
	<SETG P-SYNTAX .SYN>
	<SETG PRSA <GETB .SYN ,P-SACTION>>>   
 
<GLOBAL P-GWIMBIT 0>
 
<ROUTINE GWIM (GBIT LBIT PREP "AUX" OBJ)
	<COND (<EQUAL? .GBIT ,RLANDBIT>
	       <RETURN ,ROOMS>)>
	<SETG P-GWIMBIT .GBIT>
	<SETG P-SLOCBITS .LBIT>
	<PUT ,P-MERGE ,P-MATCHLEN 0>
	<COND (<GET-OBJECT ,P-MERGE <>>
	       <SETG P-GWIMBIT 0>
	       <COND (<EQUAL? <GET ,P-MERGE ,P-MATCHLEN> 1>
		      <SET OBJ <GET ,P-MERGE 1>>
		      <TELL "[">
		      <COND (<AND <NOT <0? .PREP>>
				  <NOT ,P-END-ON-PREP>>
			     <SET PREP <PREP-FIND .PREP>>
			     <PRINTB .PREP>
			     <COND (<EQUAL? .PREP ,W?OUT>
				    <TELL " of">)>
			     <COND (<NOT <FSET? .OBJ ,NARTICLEBIT>>
				    <TELL " the ">)
				   (T
				    <TELL " ">)>)>
		      <TELL D .OBJ "]" CR>
		      .OBJ)>)
	      (T
	       <SETG P-GWIMBIT 0>
	       <RFALSE>)>>   
 
<ROUTINE SNARF-OBJECTS ("AUX" PTR)
	<COND (<NOT <EQUAL? <SET PTR <GET ,P-ITBL ,P-NC1>> 0>>
	       <SETG P-PHR 0>
	       <SETG P-SLOCBITS <GETB ,P-SYNTAX ,P-SLOC1>>
	       <OR <SNARFEM .PTR <GET ,P-ITBL ,P-NC1L> ,P-PRSO> <RFALSE>>
	       <OR <0? <GET ,P-BUTS ,P-MATCHLEN>>
		   <SETG P-PRSO <BUT-MERGE ,P-PRSO>>>)>
	<COND (<NOT <EQUAL? <SET PTR <GET ,P-ITBL ,P-NC2>> 0>>
	       <SETG P-PHR 1>
	       <SETG P-SLOCBITS <GETB ,P-SYNTAX ,P-SLOC2>>
	       <OR <SNARFEM .PTR <GET ,P-ITBL ,P-NC2L> ,P-PRSI> <RFALSE>>
	       <COND (<NOT <0? <GET ,P-BUTS ,P-MATCHLEN>>>
		      <COND (<EQUAL? <GET ,P-PRSI ,P-MATCHLEN> 1>
			     <SETG P-PRSO <BUT-MERGE ,P-PRSO>>)
			    (T <SETG P-PRSI <BUT-MERGE ,P-PRSI>>)>)>)>
	<RTRUE>>  

<ROUTINE BUT-MERGE (TBL "AUX" LEN BUTLEN (CNT 1) (MATCHES 0) OBJ NTBL)
	<SET LEN <GET .TBL ,P-MATCHLEN>>
	<PUT ,P-MERGE ,P-MATCHLEN 0>
	<REPEAT ()
		<COND (<DLESS? LEN 0> <RETURN>)
		      (<AND ,P-BUTS
			    <INTBL? <SET OBJ <GET .TBL .CNT>>
				    <REST ,P-BUTS 2>
				    <GET ,P-BUTS 0>>>)
		      (T
		       <PUT ,P-MERGE <+ .MATCHES 1> .OBJ>
		       <SET MATCHES <+ .MATCHES 1>>)>
		<SET CNT <+ .CNT 1>>>
	<PUT ,P-MERGE ,P-MATCHLEN .MATCHES>
	<SET NTBL ,P-MERGE>
	<SETG P-MERGE .TBL>
	.NTBL>

<GLOBAL P-NAM <>>

<GLOBAL P-NAMW <TABLE 0 0>>

<GLOBAL P-ADJ <>>

<GLOBAL P-ADJW <TABLE 0 0>>

<GLOBAL P-OFW <TABLE 0 0>> ;"the FIRST! noun in a NOUN-OF-NOUN phrase"

<GLOBAL P-PHR 0>	"Which noun phrase is being parsed?"

<GLOBAL P-PRSO <ITABLE NONE 50>>

<GLOBAL P-PRSI <ITABLE NONE 50>>

<GLOBAL P-BUTS <ITABLE NONE 50>>

<GLOBAL P-MERGE <ITABLE NONE 50>>

<GLOBAL P-OCLAUSE <ITABLE NONE 50>>
 
<CONSTANT P-MATCHLEN 0>    
 
<GLOBAL P-GETFLAGS 0>    
 
<CONSTANT P-ALL 1>  
 
<CONSTANT P-ONE 2>  
 
<CONSTANT P-INHIBIT 4>   

<ROUTINE SNARFEM
	 (PTR EPTR TBL "AUX" (BUT <>) LEN TMP WRD NW ONEOBJ (WAS-ALL <>))
   <SETG P-AND <>>
   <COND (<EQUAL? ,P-GETFLAGS ,P-ALL>
	  <SET WAS-ALL T>)>
   <SETG P-GETFLAGS 0>
   <PUT ,P-BUTS ,P-MATCHLEN 0>
   <PUT .TBL ,P-MATCHLEN 0>
   <SET WRD <GET .PTR 0>>
   <REPEAT ()
	   <COND (<EQUAL? .PTR .EPTR>
		  <SET TMP <GET-OBJECT <OR .BUT .TBL>>>
		  <COND (.WAS-ALL <SETG P-GETFLAGS ,P-ALL>)>
		  <RETURN .TMP>)
		 (T
		  <COND (<==? .EPTR <REST .PTR ,P-WORDLEN>>
			 <SET NW 0>)
			(T <SET NW <GET .PTR ,P-LEXELEN>>)>
		  <COND (<EQUAL? .WRD ,W?ALL ,W?BOTH>
			 ;<SETG P-NAM .WRD>
			 <SETG P-GETFLAGS ,P-ALL>
			 <COND (<EQUAL? .NW ,W?OF>
				<SET PTR <REST .PTR ,P-WORDLEN>>)>)
			(<EQUAL? .WRD ,W?BUT ,W?EXCEPT>
			 <OR <GET-OBJECT <OR .BUT .TBL>> <RFALSE>>
			 <SET BUT ,P-BUTS>
			 <PUT .BUT ,P-MATCHLEN 0>)
			(<EQUAL? .WRD ,W?A ,W?ONE>
			 <COND (<NOT ,P-ADJ>
				<SETG P-GETFLAGS ,P-ONE>
				<COND (<EQUAL? .NW ,W?OF>
				       <SET PTR <REST .PTR ,P-WORDLEN>>)>)
			       (T
				<SETG P-NAM .ONEOBJ>
				<OR <GET-OBJECT <OR .BUT .TBL>> <RFALSE>>
				<AND <0? .NW> <RTRUE>>)>)
			(<AND <EQUAL? .WRD ,W?AND ,W?COMMA>
			      <NOT <EQUAL? .NW ,W?AND ,W?COMMA>>>
			 <SETG P-AND T>
			 <OR <GET-OBJECT <OR .BUT .TBL>> <RFALSE>>
			 T)
			(<WT? .WRD ,PS?BUZZ-WORD>
			 <COND (<EQUAL? .WRD ,W?MINUTE ,W?MINUTES>
				<SETG MINUTES-FLAG T>)>)
			(<EQUAL? .WRD ,W?AND ,W?COMMA>)
			(<EQUAL? .WRD ,W?OF>
			 <COND (<0? ,P-GETFLAGS>
				<SETG P-GETFLAGS ,P-INHIBIT>)>)
			(<AND <WT? .WRD ,PS?ADJECTIVE>
			      <ADJ-CHECK .WRD>
			      <NOT <EQUAL? .NW ,W?OF>>>
			 <SETG P-ADJ .WRD>)
			(<WT? .WRD ,PS?OBJECT>
			 <SETG P-NAM .WRD>
			 <SET ONEOBJ .WRD>)>)>
	   <COND (<NOT <EQUAL? .PTR .EPTR>>
		  <SET PTR <REST .PTR ,P-WORDLEN>>
		  <SET WRD .NW>)>>>

;"ADJ-CHECK will grab the first adjective, unless it comes across one of
the words in the last clause"

<ROUTINE ADJ-CHECK (WRD)
	 <COND (<NOT ,P-ADJ>
		<RTRUE>)
	       (<EQUAL? .WRD ,W?MY>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<CONSTANT SH 128>   
 
<CONSTANT SC 64>    
 
<CONSTANT SIR 32>   
 
<CONSTANT SOG 16>   
 
<CONSTANT STAKE 8>  
 
<CONSTANT SMANY 4>  
 
<CONSTANT SHAVE 2>  

<ROUTINE NOUN-MISSING ()
 <COND (<EQUAL? ,P-NAM ,W?ALL ,W?BOTH>
	<REFERRING>)
       (T <TELL
"[There seems to be a noun missing in that sentence.]" CR>)>>

<ROUTINE GET-OBJECT (TBL "OPTIONAL" (VRB T)
		      "AUX" BITS LEN XBITS TLEN (GCHECK <>) (OLEN 0) OBJ)
	 <SET XBITS ,P-SLOCBITS>
	 <SET TLEN <GET .TBL ,P-MATCHLEN>>
	 <COND (<BTST ,P-GETFLAGS ,P-INHIBIT> <RTRUE>)>
	 <COND (<AND <NOT ,P-NAM> ,P-ADJ <WT? ,P-ADJ ,PS?OBJECT>>
		<SETG P-NAM ,P-ADJ>
		<SETG P-ADJ <>>)
	       (<AND ,P-ADJ 
		     <SET BITS <WT? ,P-ADJ ,PS?DIRECTION ,P1?DIRECTION>>>
		<SETG P-DIRECTION .BITS>)>
	 <COND (<AND <NOT ,P-NAM>
		     <NOT ,P-ADJ>
		     <NOT <EQUAL? ,P-GETFLAGS ,P-ALL>>
		     <0? ,P-GWIMBIT>>
		<COND (.VRB
		       <NOUN-MISSING>)>
		<RFALSE>)>
	 <COND (<OR <NOT <EQUAL? ,P-GETFLAGS ,P-ALL>> <0? ,P-SLOCBITS>>
		<SETG P-SLOCBITS -1>)>
	 <PROG ()
	       <COND (.GCHECK <GLOBAL-CHECK .TBL>)
		     (T
		      <FCLEAR ,PROTAGONIST ,TRANSBIT>
		      <DO-SL ,HERE ,SOG ,SIR .TBL>
		      <FSET ,PROTAGONIST ,TRANSBIT>
		      <DO-SL ,PROTAGONIST ,SH ,SC .TBL>)>
	       <SET LEN <- <GET .TBL ,P-MATCHLEN> .TLEN>>
	       <COND (<AND <BTST ,P-GETFLAGS ,P-ALL>
			   ;<NOT <ZERO? .LEN>>>)
		     (<AND <BTST ,P-GETFLAGS ,P-ONE>
			   <NOT <ZERO? .LEN>>>
		      <COND (<NOT <EQUAL? .LEN 1>>
			     <PUT .TBL 1 <GET .TBL <RANDOM .LEN>>>
			     <TELL "[How about the ">
			     <PRINTD <GET .TBL 1>>
			     <TELL "?]" CR>)>
		      <PUT .TBL ,P-MATCHLEN 1>)
		     (<OR <G? .LEN 1>
			  <AND <0? .LEN> <NOT <EQUAL? ,P-SLOCBITS -1>>>>
		      <COND (<EQUAL? ,P-SLOCBITS -1>
			     <SETG P-SLOCBITS .XBITS>
			     <SET OLEN .LEN>
			     <PUT .TBL
				  ,P-MATCHLEN
				  <- <GET .TBL ,P-MATCHLEN> .LEN>>
			     <AGAIN>)
			    (T
			     <PUT ,P-NAMW ,P-PHR ,P-NAM>
			     <PUT ,P-ADJW ,P-PHR ,P-ADJ>
			     <COND (<0? .LEN>
				    <SET LEN .OLEN>)>
			     <COND (<AND ,P-NAM
				      <SET OBJ <GET .TBL <+ .TLEN 1>>>
				      <SET OBJ <APPLY <GETP .OBJ ,P?GENERIC>>>>
				    <COND (<EQUAL? .OBJ ,NOT-HERE-OBJECT>
					   <RFALSE>)>
				    <PUT .TBL 1 .OBJ>
				    <PUT .TBL ,P-MATCHLEN 1>
				    <SETG P-NAM <>>
				    <SETG P-ADJ <>>
				    <RTRUE>)
			      	   (<AND .VRB ;".VRB added 8/14/84 by JW"
					 <NOT <EQUAL? ,WINNER ,PROTAGONIST>>>
				    <WHICH-PRINT .TLEN .LEN .TBL>
				    ;<CANT-ORPHAN>
				    <RFALSE>)
				   (<AND .VRB ,P-NAM>
				    <WHICH-PRINT .TLEN .LEN .TBL>
				    <SETG P-ACLAUSE
					  <COND (<EQUAL? .TBL ,P-PRSO> ,P-NC1)
						(T ,P-NC2)>>
				    <SETG P-AADJ ,P-ADJ>
				    <SETG P-ANAM ,P-NAM>
				    <ORPHAN <> <>>
				    <SETG P-OFLAG T>)
				   (.VRB
				    <NOUN-MISSING>)>
			     <SETG P-NAM <>>
			     <SETG P-ADJ <>>
			     <RFALSE>)>)
		     (<AND <0? .LEN> .GCHECK>
		      <PUT ,P-NAMW ,P-PHR ,P-NAM>
		      <PUT ,P-ADJW ,P-PHR ,P-ADJ>
		      <COND (.VRB
			     <SETG P-SLOCBITS .XBITS>
			     <OBJ-FOUND ,NOT-HERE-OBJECT .TBL>
			     <SETG P-XNAM ,P-NAM>
			     <SETG P-XADJ ,P-ADJ>
			     <SETG P-NAM <>>
			     <SETG P-ADJ <>>
			     <RTRUE>)>
		      <SETG P-NAM <>>
		      <SETG P-ADJ <>>
		      <RFALSE>)
		     (<0? .LEN>
		      <SET GCHECK T>
		      <AGAIN>)>
	       <SETG P-SLOCBITS .XBITS>
	       <PUT ,P-NAMW ,P-PHR ,P-NAM>
	       <PUT ,P-ADJW ,P-PHR ,P-ADJ>
	       <SETG P-NAM <>>
	       <SETG P-ADJ <>>
	       <RTRUE>>>

<CONSTANT LAST-OBJECT 0> ;"zilch should stick the # of last object here"

<ROUTINE MOBY-FIND (TBL "AUX" (OBJ 1) LEN FOO NAM ADJ)
  <SET NAM ,P-NAM>
  <SET ADJ ,P-ADJ>
  <SETG P-NAM ,P-XNAM>
  <SETG P-ADJ ,P-XADJ>
  ;<COND (,DEBUG
	 <TELL "[MOBY-FIND called, P-NAM=">
	 <PRINTB ,P-NAM>
	 <TELL "]" CR>)>
  <PUT .TBL ,P-MATCHLEN 0>
  %<COND (<GASSIGNED? PREDGEN>	;<NOT <ZERO? <GETB 0 18>>>	;"ZIP case"
	 '<PROG ()
	 <REPEAT ()
		 <COND (<AND ;<SET FOO <META-LOC .OBJ T>>
			     <NOT <IN? .OBJ ,ROOMS>>
			     <SET FOO <THIS-IT? .OBJ>>>
			<SET FOO <OBJ-FOUND .OBJ .TBL>>)>
		 <COND (<IGRTR? OBJ ,LAST-OBJECT>
			<RETURN>)>>>)
	(T		;"ZIL case"
	 '<PROG ()
	 <SETG P-SLOCBITS -1>
	 <SET FOO <FIRST? ,ROOMS>>
	 <REPEAT ()
		 <COND (<NOT .FOO> <RETURN>)
		       (T
			<SEARCH-LIST .FOO .TBL ,P-SRCALL T>
			<SET FOO <NEXT? .FOO>>)>>
	 <DO-SL ,LOCAL-GLOBALS 1 1 .TBL T>
	 <SEARCH-LIST ,ROOMS .TBL ,P-SRCTOP T>>)>
  <COND (<EQUAL? <SET LEN <GET .TBL ,P-MATCHLEN>> 1>
	 <SETG P-MOBY-FOUND <GET .TBL 1>>)>
  <SETG P-NAM .NAM>
  <SETG P-ADJ .ADJ>
  <RETURN .LEN>>

<GLOBAL P-MOBY-FOUND <>>
<GLOBAL P-XNAM <>>
<GLOBAL P-XADJ <>>
<GLOBAL P-XADJN <>>

<ROUTINE WHICH-PRINT (TLEN LEN TBL "AUX" OBJ RLEN)
	 <COND (<ZERO? .LEN>
		<REFERRING>
		<RTRUE>)>
	 <SET RLEN .LEN>
	 <COND (<NOT <EQUAL? ,WINNER ,PROTAGONIST>>
		<TELL "\"I don't understand ">
		;<COND (<EQUAL? ,P-NAM ,W?MODE>
		       <TELL "which mode you mean">)
		      (T
		       <TELL "if you mean ">)>)
	       (T
		<TELL "[Which">
		<COND (<OR ,P-OFLAG
			   ,P-MERGED
			   ,P-AND>
		       <TELL " ">
		       <PRINTB ,P-NAM>)
		      (<EQUAL? .TBL ,P-PRSO>
		       <CLAUSE-PRINT ,P-NC1 ,P-NC1L <>>)
		      (T
		       <CLAUSE-PRINT ,P-NC2 ,P-NC2L <>>)>
		<TELL " do you mean, ">
		;<COND (<NOT <EQUAL? ,P-NAM ,W?MODE>>
		       <TELL ", ">)>)>
	 ;<COND (<NOT <EQUAL? ,P-NAM ,W?MODE>>)>
		<REPEAT ()
			<SET TLEN <+ .TLEN 1>>
			<SET OBJ <GET .TBL .TLEN>>
			<COND (<NOT <FSET? .OBJ ,NARTICLEBIT>>
			       <TELL "the ">)>
			<TELL D .OBJ>
			<COND (<EQUAL? .LEN 2>
			       <COND (<NOT <EQUAL? .RLEN 2>>
				      <TELL ",">)>
			       <TELL " or ">)
			      (<G? .LEN 2>
			       <TELL ", ">)>
			<COND (<L? <SET LEN <- .LEN 1>> 1>
			       <RETURN>)>>
	 <COND (<NOT <EQUAL? ,WINNER ,PROTAGONIST>>
		<TELL ".\"" CR>)
	       (T
		<TELL "?]" CR>)>>

<ROUTINE GLOBAL-CHECK (TBL "AUX" LEN RMG RMGL (CNT 0) OBJ OBITS FOO)
	<SET LEN <GET .TBL ,P-MATCHLEN>>
	<SET OBITS ,P-SLOCBITS>
	<COND (<SET RMG <GETPT ,HERE ,P?GLOBAL>>
	       <SET RMGL <- </ <PTSIZE .RMG> 2> 1>>
	       <REPEAT ()
		       <COND (<THIS-IT? <SET OBJ <GET .RMG .CNT>>>
			      <OBJ-FOUND .OBJ .TBL>)
			     (<AND <SET OBJ <FIRST? .OBJ>>
				   <THIS-IT? .OBJ>>
			      ;"Local global as simple container"
			      <OBJ-FOUND .OBJ .TBL>)>
		       <COND (<IGRTR? CNT .RMGL> <RETURN>)>>)>
	<COND (<EQUAL? <GET .TBL ,P-MATCHLEN> .LEN>
	       <SETG P-SLOCBITS -1>
	       <DO-SL ,GLOBAL-OBJECTS 1 1 .TBL>
	       <SETG P-SLOCBITS .OBITS>
	       ;<COND (<AND <0? <GET .TBL ,P-MATCHLEN>>
			   <EQUAL? ,PRSA ,V?LOOK-INSIDE ,V?SEARCH ,V?EXAMINE>>
		      <DO-SL ,ROOMS 1 1 .TBL>)>)>>
 
<ROUTINE DO-SL (OBJ BIT1 BIT2 TBL "OPTIONAL" (MOBY-FLAG <>) "AUX" BTS)
	<COND (<BTST ,P-SLOCBITS <+ .BIT1 .BIT2>>
	       <SEARCH-LIST .OBJ .TBL ,P-SRCALL .MOBY-FLAG>)
	      (T
	       <COND (<BTST ,P-SLOCBITS .BIT1>
		      <SEARCH-LIST .OBJ .TBL ,P-SRCTOP .MOBY-FLAG>)
		     (<BTST ,P-SLOCBITS .BIT2>
		      <SEARCH-LIST .OBJ .TBL ,P-SRCBOT .MOBY-FLAG>)
		     (T <RTRUE>)>)>>

<CONSTANT P-SRCBOT 2>
<CONSTANT P-SRCTOP 0>
<CONSTANT P-SRCALL 1>

<ROUTINE SEARCH-LIST (OBJ TBL LVL "OPTIONAL" (MOBY-FLAG <>) "AUX" FLS NOBJ)
	<COND (<SET OBJ <FIRST? .OBJ>>
	       <REPEAT ()
		       <COND (<AND <NOT <EQUAL? .LVL ,P-SRCBOT>>
				   <GETPT .OBJ ,P?SYNONYM>
				   <THIS-IT? .OBJ>>
			      <COND (<AND <IN? .OBJ ,GLOBAL-OBJECTS>
					  <SET FLS <GETP .OBJ ,P?SCENARIO>>
					  <NOT <EQUAL? .FLS ,SCENARIO>>>
				     ;"Added to segregate GLOBALs"
				     <SET FLS <>>)
				    (<AND <IN? .OBJ ,GLOBAL-OBJECTS>
					  <SET FLS <GETP .OBJ ,P?TRANSIENT>>
					  <NOT <INTBL? ,HERE
						       <REST .FLS 2>
						       <GET .FLS 0>>>>
				     ;"Transient objects caught here"
				     <SET FLS <>>)
				    (T
				     <OBJ-FOUND .OBJ .TBL>)>)>
		       <COND (<AND <OR <NOT <EQUAL? .LVL ,P-SRCTOP>>
				       <FSET? .OBJ ,SEARCHBIT>
				       <FSET? .OBJ ,SURFACEBIT>>
				   <SET NOBJ <FIRST? .OBJ>>>
			      <COND (<OR <FSET? .OBJ ,OPENBIT>
					 <FSET? .OBJ ,TRANSBIT>
					 .MOBY-FLAG>
				     <SET FLS
					  <SEARCH-LIST
					   .OBJ
					   .TBL
					   <COND (<FSET? .OBJ ,SURFACEBIT>
						  ,P-SRCALL)
						 (<FSET? .OBJ ,SEARCHBIT>
						  ,P-SRCALL)
						 (T ,P-SRCTOP)>
					   .MOBY-FLAG>>)>)>
		       <COND (<SET OBJ <NEXT? .OBJ>>) (T <RETURN>)>>)>> 
 
<ROUTINE OBJ-FOUND (OBJ TBL "AUX" PTR)
	<SET PTR <+ 1 <GET .TBL ,P-MATCHLEN>>>
	<PUT .TBL .PTR .OBJ>
	<PUT .TBL ,P-MATCHLEN .PTR>>

<ROUTINE TAKE-CHECK () 
	<AND <ITAKE-CHECK ,P-PRSO <GETB ,P-SYNTAX ,P-SLOC1>>
	     <ITAKE-CHECK ,P-PRSI <GETB ,P-SYNTAX ,P-SLOC2>>>> 

<ROUTINE ITAKE-CHECK (TBL IBITS "AUX" PTR OBJ TAKEN)
   <COND (<AND <SET PTR <GET .TBL ,P-MATCHLEN>>
	       <OR <BTST .IBITS ,SHAVE>
	           <BTST .IBITS ,STAKE>>>
	  <REPEAT ()
	    <COND (<L? <SET PTR <- .PTR 1>> 0>
		   <RETURN>)
		  (T
		   <SET OBJ <GET .TBL <+ .PTR 1>>>
		   <COND (<EQUAL? .OBJ ,IT>
			  <COND (<NOT <VISIBLE? ,P-IT-OBJECT>>
				 <REFERRING>
				 <RFALSE>)
				(T
				 <SET OBJ ,P-IT-OBJECT>)>)
			 (<EQUAL? .OBJ ,HIM>
			  <COND (<NOT <VISIBLE? ,P-HIM-OBJECT>>
				 <REFERRING T>
				 <RFALSE>)
				(T
				 <SET OBJ ,P-HIM-OBJECT>)>)
			 (<EQUAL? .OBJ ,HER>
			  <COND (<NOT <VISIBLE? ,P-HER-OBJECT>>
				 <REFERRING T>
				 <RFALSE>)
				(T
				 <SET OBJ ,P-HER-OBJECT>)>)>
		   <COND (<OR <HELD? .OBJ>
			      <EQUAL? .OBJ ,HANDS ,INTNUM>>
			  T)
			 (T
			  <SETG PRSO .OBJ>
			  <COND (<FSET? .OBJ ,TRYTAKEBIT>
				 <SET TAKEN T>)
				(<NOT <EQUAL? ,WINNER ,PROTAGONIST>>
				 <SET TAKEN <>>)
				(<AND <BTST .IBITS ,STAKE>
				      <EQUAL? <ITAKE <>> T>>
				 <SET TAKEN <>>)
				(T
				 <SET TAKEN T>)>
			  <COND (<AND .TAKEN <BTST .IBITS ,SHAVE>>
				 <COND (<L? 1 <GET .TBL ,P-MATCHLEN>>
				        <TELL ,YNH
					      " all those things!" CR>
					<RFALSE>)
				       (<EQUAL? .OBJ ,NOT-HERE-OBJECT>
					<TELL "[You can't see that here!]" CR>
					<RFALSE>)>
				 <COND (<EQUAL? ,WINNER ,PROTAGONIST>
					<TELL ,YNH>)
				       (T
					<TELL "It doesn't look as if"
					      T ,WINNER " has">)>
				 <THIS-IS-IT .OBJ>
				 <TELL TR .OBJ>
				 <RFALSE>)
				(<AND <NOT .TAKEN>
				      <EQUAL? ,WINNER ,PROTAGONIST>>
				 <TELL "[taking" T .OBJ " first]" CR>)>)>)>>)
	       (T)>>

<ROUTINE MANY-CHECK ("AUX" (LOSS <>) TMP)
	<COND (<AND <G? <GET ,P-PRSO ,P-MATCHLEN> 1>
		    <NOT <BTST <GETB ,P-SYNTAX ,P-SLOC1> ,SMANY>>>
	       <SET LOSS 1>)
	      (<AND <G? <GET ,P-PRSI ,P-MATCHLEN> 1>
		    <NOT <BTST <GETB ,P-SYNTAX ,P-SLOC2> ,SMANY>>>
	       <SET LOSS 2>)>
	<COND (<EQUAL? .LOSS 1>
	       <TELL "[One at a time, please!]" CR>
	       <RFALSE>)
	      (.LOSS
	       <TELL 
"[Hey, you can't use more than one indirect object with \"">
	       ;<COND (<EQUAL? .LOSS 2>
		      <TELL "in">)>
	       ;<TELL "direct objects with \"">
	       <SET TMP <GET ,P-ITBL ,P-VERBN>>
	       <COND (<0? .TMP>
		      <TELL "tell">)
		     (<OR ,P-OFLAG ,P-MERGED>
		      <PRINTB <GET .TMP 0>>)
		     (T
		      <WORD-PRINT <GETB .TMP 2> <GETB .TMP 3>>)>
	       <TELL "\".]" CR>
	       <RFALSE>)
	      (T)>>

<ROUTINE THIS-IT? (OBJ "AUX" SYNS CNT)
	 <COND (<FSET? .OBJ ,INVISIBLE> ;"in x1 too, protag not found now"
		<RFALSE>)
	       (<NOT <SET SYNS <GETPT .OBJ ,P?SYNONYM>>>
		<RFALSE>)>
	 <COND (<AND ,P-NAM
		     <NOT <INTBL? ,P-NAM .SYNS </ <PTSIZE .SYNS> 2>>>>
		<RFALSE>)>
	 <COND (,P-ADJ
		<COND (<NOT <SET SYNS <GETPT .OBJ ,P?ADJECTIVE>>> <RFALSE>)
		      (<NOT <INTBL? ,P-ADJ .SYNS </ <PTSIZE .SYNS> 2>>>
		       <RFALSE>)>)>
	 <COND (<AND <NOT <ZERO? ,P-GWIMBIT>>
		     <NOT <FSET? .OBJ ,P-GWIMBIT>>>
		<RFALSE>)>
	 <RTRUE>>