"PARSER for M3
Copyright (C) 1984 Infocom, Inc.  All rights reserved."

"Parser global variable convention:  All parser globals will 
  begin with 'P-'.  Local variables are not restricted in any
  way.
" 
 
<SETG SIBREAKS ".,\"!?">

;<GLOBAL GWIM-DISABLE <>> 
 
<GLOBAL PRSA 0>
 
<GLOBAL PRSI 0>

<GLOBAL PRSO 0>

<GLOBAL P-TABLE 0>  
 
<GLOBAL P-ONEOBJ 0> 
 
<GLOBAL P-SYNTAX 0> 
 
;<GLOBAL P-CCSRC 0>  
 
<GLOBAL P-LEN 0>    
 
<GLOBAL P-DIR 0>    
 
<GLOBAL HERE 0>
 
<GLOBAL WINNER 0>   
 
<GLOBAL P-LEXV <ITABLE BYTE 120>>
;"INBUF - Input buffer for READ"   
 
<GLOBAL P-INBUF <ITABLE BYTE 100>>
;"Parse-cont variable"  
 
<GLOBAL P-CONT <>>  
 
<GLOBAL P-IT-OBJECT <>>
<GLOBAL P-IT-LOC <>>

<GLOBAL P-HIM-HER <>>
<GLOBAL P-HIM-HER-LOC <>>
<ROUTINE THIS-IS-S-HE (PER)
	 %<DEBUG-CODE
	   <COND (,IDEBUG
		  <TELL "["
			<COND (<FSET? .PER ,FEMALE> "She")
			      (T "He")>
			"'s " D .PER "]" CR>)>>
	 <SETG P-HIM-HER .PER>
	 <SETG P-HIM-HER-LOC <LOC .PER>>>

;"Orphan flag" 
 
<GLOBAL P-OFLAG <>> 
 
<GLOBAL P-MERGED <>>

<GLOBAL P-ACLAUSE <>>    
 
<GLOBAL P-ANAM <>>  
 
<GLOBAL P-AADJ <>>
;"Parser variables and temporaries"
 
<CONSTANT P-PHRLEN 3>    
 
<CONSTANT P-ORPHLEN 7>   
 
<CONSTANT P-RTLEN 3>
;"Byte offset to # of entries in LEXV"

<CONSTANT P-LEXWORDS 1>
;"Word offset to start of LEXV entries" 
 
<CONSTANT P-LEXSTART 1>
;"Number of words per LEXV entry"  
 
<CONSTANT P-LEXELEN 2>   
 
<CONSTANT P-WORDLEN 4>
;"Offset to parts of speech byte"   
 
<CONSTANT P-PSOFF 4>
;"Offset to first part of speech"
 
<CONSTANT P-P1OFF 5>
;"First part of speech bit mask in PSOFF byte"  
 
<CONSTANT P-P1BITS 3>    
 
<CONSTANT P-ITBLLEN 9>   
 
<GLOBAL P-ITBL <TABLE 0 0 0 0 0 0 0 0 0 0>>  
 
<GLOBAL P-OTBL <TABLE 0 0 0 0 0 0 0 0 0 0>>  
 
<GLOBAL P-VTBL <TABLE 0 0 0 0>>

<GLOBAL P-OVTBL <TABLE 0 0 0 0>>

<GLOBAL P-NCN 0>    
 
<CONSTANT P-VERB 0> 
 
<CONSTANT P-VERBN 1>
 
<CONSTANT P-PREP1 2>
 
<CONSTANT P-PREP1N 3>    
 
<CONSTANT P-PREP2 4>
 
<CONSTANT P-PREP2N 5>    
 
<CONSTANT P-NC1 6>  
 
<CONSTANT P-NC1L 7> 
 
<CONSTANT P-NC2 8>  
 
<CONSTANT P-NC2L 9> 
 
<GLOBAL QUOTE-FLAG <>>

" Grovel down the input finding the verb, prepositions, and noun clauses.
   If the input is <direction> or <walk> <direction>, fall out immediately
   setting PRSA to ,V?WALK and PRSO to <direction>.  Otherwise, perform
   all required orphaning, syntax checking, and noun clause lookup."   


;<GLOBAL X-IS-LISTENING <>>

<ROUTINE PARSER ("AUX" (PTR ,P-LEXSTART) WORD (VAL 0) (VERB <>)
		       LEN (DIR <>) (NW 0) (LW 0) NUM SCNT (CNT -1) OWINNER) 
	<REPEAT ()
		<COND (<G? <SET CNT <+ .CNT 1>> ,P-ITBLLEN> <RETURN>)
		      (T <PUT ,P-ITBL .CNT 0>)>>
	<SETG P-NAM <>>
	<SETG P-ADJ <>>
	<SETG P-MERGED <>>
	<PUT ,P-PRSO ,P-MATCHLEN 0>
	<PUT ,P-PRSI ,P-MATCHLEN 0>
	<PUT ,P-BUTS ,P-MATCHLEN 0>
	<SET OWINNER ,WINNER>
	<COND (<AND <NOT ,QUOTE-FLAG> <N==? ,WINNER ,PLAYER>>
	       <SETG WINNER ,PLAYER>
	       <COND (<NOT <FSET? <LOC ,WINNER> ,VEHBIT>>
		      <SETG HERE <LOC ,WINNER>>)>)>
	<COND (,P-CONT
	       <SET PTR ,P-CONT>
	       <SETG P-CONT <>>
	       <COND (<NOT <VERB? TELL>> <CRLF>)>)
	      (T
	       <SETG WINNER ,PLAYER>
	       <SETG QUOTE-FLAG <>>
	       <COND (<NOT <FSET? <LOC ,WINNER> ,VEHBIT>>
		      <SETG HERE <LOC ,WINNER>>)>
	       <SET SCNT ,P-SPACE>
	       <REPEAT ()
		       <COND (<L? <SET SCNT <- .SCNT 1>> 0> <RETURN>)
			     (T <CRLF>)>>
	       <PUTB ,P-LEXV 0 59>
	       <TELL ">">
	       <READ ,P-INBUF ,P-LEXV>)>
	<SETG P-LEN <GETB ,P-LEXV ,P-LEXWORDS>>
	<COND (<0? ,P-LEN>
	       <COND (<GET <GET ,GOAL-TABLES ,PLAYER-C> ,GOAL-S>
		      <SETG PRSA ,V?CONTINUE>
		      <SETG PRSO <>>
		      <SETG PRSI <>>
		      <RFATAL>)
		     (ELSE
		      <TELL "What?" CR>
		      <RFALSE>)>)
	      (<OR <EQUAL? <SET WORD <GET ,P-LEXV .PTR>> ,W?WHY ,W?HOW ,W?WHEN>
		   <EQUAL? .WORD ,W?DID>>
	       <TELL
"Sorry, but this program can't handle questions like that.
Check your manual for more details." CR>
	       <RFALSE>)>
	<SET LEN ,P-LEN>
	<SETG P-DIR <>>
	<SETG P-NCN 0>
	<SETG P-GETFLAGS 0>
	;"3/25/83: Next statement added."
	<PUT ,P-ITBL ,P-VERBN 0>
	<REPEAT ()
		<COND (<L? <SETG P-LEN <- ,P-LEN 1>> 0>
		       <SETG QUOTE-FLAG <>>
		       <RETURN>)
		      (<OR <SET WORD <GET ,P-LEXV .PTR>>
			   <SET WORD <NUMBER? .PTR>>>
		       <COND (<AND <==? .WORD ,W?TO>
				   <EQUAL? .VERB ,ACT?TELL ,ACT?ASK>>
			      <SET WORD ,W?QUOTE>)
			     (<AND <==? .WORD ,W?THEN>
				   <NOT .VERB>>
			      <PUT ,P-ITBL ,P-VERB ,ACT?TELL>
			      <PUT ,P-ITBL ,P-VERBN 0>
			      <SET WORD ,W?QUOTE>)>
		       <COND (<ABBREV? .LW .WORD> <SET LW 0>)
			     (<OR <EQUAL? .WORD ,W?THEN ,W?PERIOD>
				  <EQUAL? .WORD ,W?QUOTE>> 
			      <COND (<EQUAL? .WORD ,W?QUOTE>
				     <COND (,QUOTE-FLAG
					    <SETG QUOTE-FLAG <>>)
					   (T <SETG QUOTE-FLAG T>)>)>
			      <OR <0? ,P-LEN>
				  <SETG P-CONT <+ .PTR ,P-LEXELEN>>>
			      <PUTB ,P-LEXV ,P-LEXWORDS ,P-LEN>
			      <RETURN>)
			     (<AND <SET VAL
					<WT? .WORD
					     ,PS?DIRECTION
					     ,P1?DIRECTION>>
				   <OR <==? .LEN 1>
				       <AND <==? .LEN 2><==? .VERB ,ACT?WALK>>
				       <AND <EQUAL? <SET NW
						     <GET ,P-LEXV
							 <+ .PTR ,P-LEXELEN>>>
					            ,W?THEN
					            ,W?QUOTE>
					    <G? .LEN 2>>
				       <AND <EQUAL? .NW ,W?PERIOD>
					    <G? .LEN 1>>
				       <AND ,QUOTE-FLAG
					    <==? .LEN 2>
					    <EQUAL? .NW ,W?QUOTE>>
				       <AND <G? .LEN 2>
					    <EQUAL? .NW ,W?COMMA ,W?AND>>>>
			      <SET DIR .VAL>
			      <COND (<EQUAL? .NW ,W?COMMA ,W?AND>
				     <PUT ,P-LEXV
					  <+ .PTR ,P-LEXELEN>
					  ,W?THEN>)>
			      <COND (<NOT <G? .LEN 2>>
				     <SETG QUOTE-FLAG <>>
				     <RETURN>)>)
			     (<AND <SET VAL <WT? .WORD ,PS?VERB ,P1?VERB>>
				   <OR <NOT .VERB>
				       <AND <EQUAL? .VERB ,ACT?WHAT>
					    <NOT <EQUAL? .WORD ,W?IS>>>>>
			      <SET VERB .VAL>
			      <PUT ,P-ITBL ,P-VERB .VAL>
			      <PUT ,P-ITBL ,P-VERBN ,P-VTBL>
			      <PUT ,P-VTBL 0 .WORD>
			      <PUTB ,P-VTBL 2 <GETB ,P-LEXV
						    <SET NUM
							 <+ <* .PTR 2> 2>>>>
			      <PUTB ,P-VTBL 3 <GETB ,P-LEXV <+ .NUM 1>>>)
			     (<OR <SET VAL <WT? .WORD ,PS?PREPOSITION 0>>
				  <AND <OR <EQUAL? .WORD ,W?ALL ,W?ONE ,W?A>
					   <WT? .WORD ,PS?ADJECTIVE>
					   <WT? .WORD ,PS?OBJECT>>
				       <SET VAL 0>>>
			      <COND (<AND <G? ,P-LEN 0>
					  <==? <GET ,P-LEXV
						    <+ .PTR ,P-LEXELEN>>
					       ,W?OF>
					  <NOT <EQUAL? .VERB
						       ,ACT?ACCUSE
						       ,ACT?MAKE>>
					  <0? .VAL>
					  <NOT <EQUAL? .WORD
						       ,W?ALL ,W?ONE ,W?A>>>)
				    (<AND <NOT <0? .VAL>>
				          <OR <0? ,P-LEN>
					      <EQUAL? <GET ,P-LEXV <+ .PTR 2>>
						      ,W?THEN ,W?PERIOD>>>
				     <COND (<L? ,P-NCN 2>
					    <PUT ,P-ITBL ,P-PREP1 .VAL>
					    <PUT ,P-ITBL ,P-PREP1N .WORD>)>)
				    (<==? ,P-NCN 2>
				     <TELL
"There were more than two nouns in that sentence." CR>
				     <RFALSE>)
				    (T
				     <SETG P-NCN <+ ,P-NCN 1>>
				     <OR <SET PTR <CLAUSE .PTR .VAL .WORD>>
					 <RFALSE>>
				     <COND (<L? .PTR 0>
					    <SETG QUOTE-FLAG <>>
					    <RETURN>)>)>)
			     (<WT? .WORD ,PS?BUZZ-WORD>)
			     (T
			      <CANT-USE .PTR>
			      <RFALSE>)>)
		      (T
		       <UNKNOWN-WORD .PTR>
		       <RFALSE>)>
		<SET LW .WORD>
		<SET PTR <+ .PTR ,P-LEXELEN>>>
	<COND (.DIR
	       <SETG PRSA ,V?WALK>
	       <SETG P-WALK-DIR .DIR>
	       <SETG PRSO .DIR>
	       <SETG P-OFLAG <>>
	       <RETURN T>)>
	<COND (<AND ,P-OFLAG <ORPHAN-MERGE>>
	       <SETG WINNER .OWINNER>)>
	<COND (<==? <GET ,P-ITBL ,P-VERB> 0>
	       <PUT ,P-ITBL ,P-VERB ,ACT?$CALL>)>
	<COND (<AND <SYNTAX-CHECK> <SNARF-OBJECTS> <TAKE-CHECK> <MANY-CHECK>>
	       T)>>

"add any word that's a legit abbreviation here"

<ROUTINE ABBREV? (LW WORD)
	 <AND <EQUAL? .WORD ,W?PERIOD>
	      <OR <EQUAL? .LW ,W?MRS ,W?MR ,W?MS>
		  <EQUAL? .LW ,W?SGT ,W?COL ,W?SEN>>>>



<ROUTINE WT? (PTR BIT "OPTIONAL" (B1 5) "AUX" (OFFSET ,P-P1OFF) TYP) 
	<COND (<BTST <SET TYP <GETB .PTR ,P-PSOFF>> .BIT>
	       <COND (<G? .B1 4> <RTRUE>)
		     (T
		      <SET TYP <BAND .TYP ,P-P1BITS>>
		      <COND (<NOT <==? .TYP .B1>> <SET OFFSET <+ .OFFSET 1>>)>
		      <GETB .PTR .OFFSET>)>)>>
 
"Scan through a noun clause, leave a pointer to its starting location"

<ROUTINE CLAUSE (PTR VAL WORD "AUX" OFF NUM (ANDFLG <>) (FIRST?? T) NW (LW 0)) 
	#DECL ((PTR VAL OFF NUM) FIX (WORD NW) <OR FALSE FIX TABLE>
	       (ANDFLG FIRST??) <OR ATOM FALSE>)
	<SET OFF <* <- ,P-NCN 1> 2>>
	<COND (<NOT <==? .VAL 0>>
	       <PUT ,P-ITBL <SET NUM <+ ,P-PREP1 .OFF>> .VAL>
	       <PUT ,P-ITBL <+ .NUM 1> .WORD>
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
		<COND (<OR <SET WORD <GET ,P-LEXV .PTR>>
			   <SET WORD <NUMBER? .PTR>>>
		       <COND (<0? ,P-LEN> <SET NW 0>)
			     (T <SET NW <GET ,P-LEXV <+ .PTR ,P-LEXELEN>>>)>
		       <COND (<AND <==? .WORD ,W?OF>
				   <EQUAL? <GET ,P-ITBL ,P-VERB>
					   ,ACT?ACCUSE ,ACT?MAKE>>
			      <PUT ,P-LEXV .PTR ,W?WITH>
			      <SET WORD ,W?WITH>)>
		       <COND (<ABBREV? .LW .WORD>
			      <SET LW 0>)
			     (<EQUAL? .WORD ,W?AND ,W?COMMA> <SET ANDFLG T>)
			     (<EQUAL? .WORD ,W?ALL ,W?ONE>
			      <COND (<==? .NW ,W?OF>
				     <SETG P-LEN <- ,P-LEN 1>>
				     <SET PTR <+ .PTR ,P-LEXELEN>>)>)
			     (<OR <EQUAL? .WORD ,W?THEN ,W?PERIOD>
				  <AND <WT? .WORD ,PS?PREPOSITION>
				       <NOT .FIRST??>>>
			      <SETG P-LEN <+ ,P-LEN 1>>
			      <PUT ,P-ITBL
				   <+ .NUM 1>
				   <REST ,P-LEXV <* .PTR 2>>>
			      <RETURN <- .PTR ,P-LEXELEN>>)
			     ;"3/16/83: This clause used to be later."
			     (<AND .ANDFLG
				   <OR ;"3/25/83: next statement added."
				       <EQUAL? <GET ,P-ITBL ,P-VERBN> 0>
				       <WT? .WORD ,PS?DIRECTION>
				       <WT? .WORD ,PS?VERB>>>
			      <SET PTR <- .PTR 4>>
			      <PUT ,P-LEXV <+ .PTR 2> ,W?THEN>
			      <SETG P-LEN <+ ,P-LEN 2>>)
			     (<WT? .WORD ,PS?OBJECT>
			      <COND  ;"First clause added 1/10/84 to fix
				      'verb AT synonym OF synonym' bug"
			            (<AND <G? ,P-LEN 0>
					  <EQUAL? .NW ,W?OF>
					  <NOT <EQUAL? .WORD ,W?ALL ,W?ONE>>>
				     T)
				    (<AND <WT? .WORD
					       ,PS?ADJECTIVE
					       ,P1?ADJECTIVE>
					  <NOT <==? .NW 0>>
					  <WT? .NW ,PS?OBJECT>>)
				    (<AND <NOT .ANDFLG>
					  <NOT <EQUAL? .NW ,W?BUT ,W?EXCEPT>>
					  <NOT <EQUAL? .NW ,W?AND ,W?COMMA>>>
				     <PUT ,P-ITBL
					  <+ .NUM 1>
					  <REST ,P-LEXV <* <+ .PTR 2> 2>>>
				     <RETURN .PTR>)
				    (T <SET ANDFLG <>>)>)
			     (<OR <WT? .WORD ,PS?ADJECTIVE>
				  <WT? .WORD ,PS?BUZZ-WORD>>)
			     (<WT? .WORD ,PS?PREPOSITION> T)
			     (T
			      <CANT-USE .PTR>
			      <RFALSE>)>)
		      (T <UNKNOWN-WORD .PTR> <RFALSE>)>
		<SET LW .WORD>
		<SET FIRST?? <>>
		<SET PTR <+ .PTR ,P-LEXELEN>>>> 

<ROUTINE NUMBER? (PTR "AUX" CNT BPTR CHR (SUM 0) (TIM <>) (EXC <>))
	 <SET CNT <GETB <REST ,P-LEXV <* .PTR 2>> 2>>
	 <SET BPTR <GETB <REST ,P-LEXV <* .PTR 2>> 3>>
	 <REPEAT ()
		 <COND (<L? <SET CNT <- .CNT 1>> 0> <RETURN>)
		       (T
			<SET CHR <GETB ,P-INBUF .BPTR>>
			<COND (<==? .CHR 58>
			       <COND (.EXC <RFALSE>)>
			       <SET TIM .SUM>
			       <SET SUM 0>)
			      (<==? .CHR 45>
			       <COND (.TIM <RFALSE>)>
			       <SET EXC .SUM>
			       <SET SUM 0>)
			      (<G? .SUM 9999> <RFALSE>)
			      (<AND <L? .CHR 58> <G? .CHR 47>>
			       <SET SUM <+ <* .SUM 10> <- .CHR 48>>>)
			      (T <RFALSE>)>
			<SET BPTR <+ .BPTR 1>>)>>
	 <PUT ,P-LEXV .PTR ,W?INTNUM>
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
	 ,W?INTNUM>

<GLOBAL P-NUMBER 0>
<GLOBAL P-EXCHANGE 0>


<ROUTINE ORPHAN-MERGE ("AUX" (CNT -1) TEMP VERB BEG END (ADJ <>) WRD) 
   <SETG P-OFLAG <>>
   <COND (<WT? <SET WRD <GET <GET ,P-ITBL ,P-VERBN> 0>>
	       ,PS?ADJECTIVE ,P1?ADJECTIVE>
	  <SET ADJ T>)
	 (<AND <WT? .WRD ,PS?OBJECT ,P1?OBJECT>
	       <EQUAL? ,P-NCN 0>>
	  <PUT ,P-ITBL ,P-VERB 0>
	  <PUT ,P-ITBL ,P-VERBN 0>
	  <PUT ,P-ITBL ,P-NC1 <REST ,P-LEXV 2>>
	  <PUT ,P-ITBL ,P-NC1L <REST ,P-LEXV 6>>
	  <SETG P-NCN 1>)>
   <COND (<AND <NOT <0? <SET VERB <GET ,P-ITBL ,P-VERB>>>>
	       <NOT .ADJ>
	       <NOT <==? .VERB <GET ,P-OTBL ,P-VERB>>>>
	  <RFALSE>)
	 (<==? ,P-NCN 2>
	  <RFALSE>)
	 (<==? <GET ,P-OTBL ,P-NC1> 1>
	  <COND (<OR <==? <SET TEMP <GET ,P-ITBL ,P-PREP1>>
			  <GET ,P-OTBL ,P-PREP1>>
		     <0? .TEMP>>
		 <COND (.ADJ
			<PUT ,P-OTBL ,P-NC1 <REST ,P-LEXV 2>>
			<COND (<0? <GET ,P-ITBL ,P-NC1L>>
			       <PUT ,P-ITBL ,P-NC1L <REST ,P-LEXV 6>>)>
			<COND (<0? ,P-NCN>
			       <SETG P-NCN 1>)>)
		       (T
			<PUT ,P-OTBL ,P-NC1 <GET ,P-ITBL ,P-NC1>>
			;<PUT ,P-OTBL ,P-NC1L <GET ,P-ITBL ,P-NC1L>>)>
		 <PUT ,P-OTBL ,P-NC1L <GET ,P-ITBL ,P-NC1L>>)
		(T
		 <RFALSE>)>)
	 (<==? <GET ,P-OTBL ,P-NC2> 1>
	  <COND (<OR <==? <SET TEMP <GET ,P-ITBL ,P-PREP1>>
			  <GET ,P-OTBL ,P-PREP2>>
		     <0? .TEMP>>
		 <COND (.ADJ
			<PUT ,P-ITBL ,P-NC1 <REST ,P-LEXV 2>>
			<COND (<0? <GET ,P-ITBL ,P-NC1L>>
			       <PUT ,P-ITBL ,P-NC1L <REST ,P-LEXV 6>>)>)>
		 <PUT ,P-OTBL ,P-NC2 <GET ,P-ITBL ,P-NC1>>
		 <PUT ,P-OTBL ,P-NC2L <GET ,P-ITBL ,P-NC1L>>
		 <SETG P-NCN 2>)
		(T
		 <RFALSE>)>)
	 (,P-ACLAUSE
	  <COND (<AND <NOT <==? ,P-NCN 1>> <NOT .ADJ>>
		 <SETG P-ACLAUSE <>>
		 <RFALSE>)
		(T
		 <SET BEG <GET ,P-ITBL ,P-NC1>>
		 <COND (.ADJ <SET BEG <REST ,P-LEXV 2>> <SET ADJ <>>)>
		 <SET END <GET ,P-ITBL ,P-NC1L>>
		 <REPEAT ()
			 <SET WRD <GET .BEG 0>>
			 <COND (<==? .BEG .END>
				<COND (.ADJ
				       <ACLAUSE-WIN .ADJ>
				       <RETURN>)
				      (T
				       <SETG P-ACLAUSE <>> <RFALSE>)>)
			       (<AND <NOT .ADJ>
				     <OR <BTST <GETB .WRD ,P-PSOFF>
					       ,PS?ADJECTIVE> ;"same as WT?"
					 <EQUAL? .WRD ,W?ALL ,W?ONE>>>
				<SET ADJ .WRD>)
			       (<==? .WRD ,W?ONE>
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
   ;<AND <NOT <==? <GET ,P-OTBL ,P-NC2> 0>> <SETG P-NCN 2>>
   <REPEAT ()
	   <COND (<G? <SET CNT <+ .CNT 1>> ,P-ITBLLEN>
		  <SETG P-MERGED T>
		  <RTRUE>)
		 (T
		  <PUT ,P-ITBL .CNT <GET ,P-OTBL .CNT>>)>>
   T>

<ROUTINE ACLAUSE-WIN (ADJ) 
	<PUT ,P-ITBL ,P-VERB <GET ,P-OTBL ,P-VERB>>
	<COND ;(<EQUAL? .ADJ ,W?TEA> ;"special case"
	       <NCLAUSE-WIN>)
	      (T
	       <PUT ,P-CCTBL ,CC-SBPTR ,P-ACLAUSE>
	       <PUT ,P-CCTBL ,CC-SEPTR <+ ,P-ACLAUSE 1>>
	       <PUT ,P-CCTBL ,CC-DBPTR ,P-ACLAUSE>
	       <PUT ,P-CCTBL ,CC-DEPTR <+ ,P-ACLAUSE 1>>
	       <CLAUSE-COPY ,P-OTBL ,P-OTBL .ADJ>)>
	<AND <NOT <==? <GET ,P-OTBL ,P-NC2> 0>> <SETG P-NCN 2>>
	<SETG P-ACLAUSE <>>
	<RTRUE>>

<ROUTINE NCLAUSE-WIN ()
        <PUT ,P-CCTBL ,CC-SBPTR ,P-NC1>
	<PUT ,P-CCTBL ,CC-SEPTR ,P-NC1L>
	<PUT ,P-CCTBL ,CC-DBPTR ,P-ACLAUSE>
	<PUT ,P-CCTBL ,CC-DEPTR <+ ,P-ACLAUSE 1>>
	<CLAUSE-COPY ,P-ITBL ,P-OTBL>
	<AND <NOT <==? <GET ,P-OTBL ,P-NC2> 0>> <SETG P-NCN 2>>
	<SETG P-ACLAUSE <>>
	<RTRUE>>

;"These are pre-Hitchhikers versions; replaced by JW 9/17/84"
;<ROUTINE ORPHAN-MERGE ("AUX" (CNT -1) TEMP VERB BEG END (ADJ <>) WRD) 
   #DECL ((CNT TEMP VERB) FIX (BEG END) <PRIMTYPE VECTOR> (WRD) TABLE)
   <SETG P-OFLAG <>>
   <COND
    (<AND <NOT <0? <SET VERB <GET ,P-ITBL ,P-VERB>>>>
	  <NOT <==? .VERB <GET ,P-OTBL ,P-VERB>>>>
     <RFALSE>)
    (<==? ,P-NCN 2>
     <RFALSE>)
    (<==? <GET ,P-OTBL ,P-NC1> 1>
     <COND (<OR <==? <SET TEMP <GET ,P-ITBL ,P-PREP1>> <GET ,P-OTBL ,P-PREP1>>
		<0? .TEMP>>
	    <PUT ,P-OTBL ,P-NC1 <GET ,P-ITBL ,P-NC1>>
	    <PUT ,P-OTBL ,P-NC1L <GET ,P-ITBL ,P-NC1L>>)
	   (T <RFALSE>)>)
    (<==? <GET ,P-OTBL ,P-NC2> 1>
     <COND (<OR <==? <SET TEMP <GET ,P-ITBL ,P-PREP1>> <GET ,P-OTBL ,P-PREP2>>
		<0? .TEMP>>
	    <PUT ,P-OTBL ,P-NC2 <GET ,P-ITBL ,P-NC1>>
	    <PUT ,P-OTBL ,P-NC2L <GET ,P-ITBL ,P-NC1L>>
	    <SETG P-NCN 2>)
	   (T <RFALSE>)>)
    (,P-ACLAUSE
     <COND
      (<NOT <==? ,P-NCN 1>> <SETG P-ACLAUSE <>> <RFALSE>)
      (T
       <SET BEG <GET ,P-ITBL ,P-NC1>>
       <SET END <GET ,P-ITBL ,P-NC1L>>
       <REPEAT ()
	       <COND (<==? .BEG .END>
		      <COND (.ADJ
			     <ACLAUSE-WIN .ADJ>
			     <RETURN>)
			    (T
			     <SETG P-ACLAUSE <>>
			     <RFALSE>)>)
		     (<AND <NOT .ADJ>
			   <BTST <GETB <SET WRD <GET .BEG 0>> ,P-PSOFF>
			         ,PS?ADJECTIVE>>
		      <SET ADJ .WRD>)
		     (<OR <BTST <GETB .WRD ,P-PSOFF> ,PS?OBJECT>
			  <==? .WRD ,W?ONE>>
		      <COND (<NOT <EQUAL? .WRD ,P-ANAM ,W?ONE>> <RFALSE>)
			    (T
			     <ACLAUSE-WIN .ADJ>
			     <RETURN>)>)>
	       <SET BEG <REST .BEG ,P-WORDLEN>>>)>)>
   <REPEAT ()
	   <COND (<G? <SET CNT <+ .CNT 1>> ,P-ITBLLEN>
		  <SETG P-MERGED T>
		  <RTRUE>)
		 (T <PUT ,P-ITBL .CNT <GET ,P-OTBL .CNT>>)>>
   T>

;<ROUTINE ACLAUSE-WIN (ADJ)
	 <SETG P-CCSRC ,P-OTBL>
	 <CLAUSE-COPY ,P-ACLAUSE <+ ,P-ACLAUSE 1> .ADJ>
	 <AND <NOT <==? <GET ,P-OTBL ,P-NC2> 0>>
	      <SETG P-NCN 2>>
	 <SETG P-ACLAUSE <>>
	 <RTRUE>>

;"Print undefined word in input.
   PTR points to the unknown word in P-LEXV"   

<ROUTINE WORD-PRINT (CNT BUF)
	 <REPEAT ()
		 <COND (<DLESS? CNT 0> <RETURN>)
		       (ELSE
			<PRINTC <GETB ,P-INBUF .BUF>>
			<SET BUF <+ .BUF 1>>)>>>

<ROUTINE UNKNOWN-WORD (PTR "AUX" BUF) 
	 #DECL ((PTR BUF) FIX)
	 <TELL "Sorry, but the word \"">
	 <SET BUF <REST ,P-LEXV <* .PTR 2>>>
	 <WORD-PRINT <GETB .BUF 2> <GETB .BUF 3>>
	 <TELL "\" is not in the vocabulary you can use." CR>
	 <SETG QUOTE-FLAG <>>
	 <SETG P-OFLAG <>>>

<ROUTINE CANT-USE (PTR "AUX" BUF) 
	 #DECL ((PTR BUF) FIX)
	 <TELL "Sorry, but you can't use the word \"">
	 <SET BUF <REST ,P-LEXV <* .PTR 2>>>
	 <WORD-PRINT <GETB .BUF 2> <GETB .BUF 3>>
	 <TELL "\" in that sense." CR>
	 <SETG QUOTE-FLAG <>>
	 <SETG P-OFLAG <>>>

;" Perform syntax matching operations, using P-ITBL as the source of
   the verb and adjectives for this input.  Returns false if no
   syntax matches, and does it's own orphaning.  If return is true,
   the syntax is saved in P-SYNTAX."   
 
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

<ROUTINE SYNTAX-CHECK ("AUX" SYN LEN NUM OBJ (DRIVE1 <>) (DRIVE2 <>)
			     PREP VERB) 
	#DECL ((DRIVE1 DRIVE2) <OR FALSE <PRIMTYPE VECTOR>>
	       (SYN) <PRIMTYPE VECTOR> (LEN NUM VERB PREP) FIX
	       (OBJ) <OR FALSE OBJECT>)
	<COND (<0? <SET VERB <GET ,P-ITBL ,P-VERB>>>
	       <TELL ,SEEMS-TO-BE "no verb in that sentence." CR>
	       <RFALSE>)>
	<SET SYN <GET ,VERBS <- 255 .VERB>>>
	<SET LEN <GETB .SYN 0>>
	<SET SYN <REST .SYN>>
	<REPEAT ()
		<SET NUM <BAND <GETB .SYN ,P-SBITS> ,P-SONUMS>>
		<COND (<G? ,P-NCN .NUM> T) ;"Added 4/27/83"
		      (<AND <NOT <L? .NUM 1>>
			    <0? ,P-NCN>
			    <OR <0? <SET PREP <GET ,P-ITBL ,P-PREP1>>>
				<==? .PREP <GETB .SYN ,P-SPREP1>>>>
		       <SET DRIVE1 .SYN>)
		      (<==? <GETB .SYN ,P-SPREP1> <GET ,P-ITBL ,P-PREP1>>
		       <COND (<AND <==? .NUM 2> <==? ,P-NCN 1>>
			      <SET DRIVE2 .SYN>)
			     (<==? <GETB .SYN ,P-SPREP2>
				   <GET ,P-ITBL ,P-PREP2>>
			      <SYNTAX-FOUND .SYN>
			      <RTRUE>)>)>
		<COND (<DLESS? LEN 1>
		       <COND (<OR .DRIVE1 .DRIVE2> <RETURN>)
			     (T
			      <TELL ,SORRY-I-DONT CR>
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
	      (<EQUAL? .VERB ,ACT?FIND ,ACT?WHAT>
	       <TELL "Sorry, but I can't answer that question." CR>
	       <RFALSE>)
	      (T
	       <COND (<EQUAL? ,WINNER ,PLAYER>
		      <ORPHAN .DRIVE1 .DRIVE2>
		      <TELL "What do you want to ">)
		     (T
		      <TELL 
"Next time, say what you want " D ,WINNER " to ">)>
	       <VERB-PRINT ,P-ITBL>
	       <COND (.DRIVE2
		      <CLAUSE-PRINT ,P-NC1 ,P-NC1L>)>
	       <PREP-PRINT <COND (.DRIVE1 <GETB .DRIVE1 ,P-SPREP1>)
				 (T <GETB .DRIVE2 ,P-SPREP2>)>>
	       <COND (<EQUAL? ,WINNER ,PLAYER>
		      <SETG P-OFLAG T>
		      <TELL "?" CR>)
		     (T
		      <SETG P-OFLAG <>>
		      <TELL "." CR>)>
	       <RFALSE>)>>

<GLOBAL SEEMS-TO-BE "There seems to be ">

<GLOBAL SORRY-I-DONT
"Sorry, I don't understand. Please rephrase that.">

<ROUTINE VERB-PRINT (TBL "AUX" TMP)
	<SET TMP <GET .TBL ,P-VERBN>>
	<COND (<==? .TMP 0> <TELL "tell">)
	      (<0? <GETB ,P-VTBL 2>>
	       <PRINTB <GET .TMP 0>>)
	      (T
	       <WORD-PRINT <GETB .TMP 2> <GETB .TMP 3>>
	       <PUTB ,P-VTBL 2 0>)>>

<ROUTINE ORPHAN (D1 D2 "AUX" (CNT -1)) 
	#DECL ((D1 D2) <OR FALSE <PRIMTYPE VECTOR>>)
	<COND (<NOT ,P-MERGED>
	       <PUT ,P-OCLAUSE ,P-MATCHLEN 0>)>
	<PUT ,P-OVTBL 0 <GET ,P-VTBL 0>>
	<PUTB ,P-OVTBL 2 <GETB ,P-VTBL 2>>
	<PUTB ,P-OVTBL 3 <GETB ,P-VTBL 3>>
	;<SETG P-CCSRC ,P-ITBL>
	<REPEAT ()
		<COND (<IGRTR? CNT ,P-ITBLLEN> <RETURN>)
		      (T <PUT ,P-OTBL .CNT <GET ,P-ITBL .CNT>>)>>
	<COND (<==? ,P-NCN 2>
	       <PUT ,P-CCTBL ,CC-SBPTR ,P-NC2>
	       <PUT ,P-CCTBL ,CC-SEPTR ,P-NC2L>
	       <PUT ,P-CCTBL ,CC-DBPTR ,P-NC2>
	       <PUT ,P-CCTBL ,CC-DEPTR ,P-NC2L>
	       <CLAUSE-COPY ,P-ITBL ,P-OTBL>)>
	<COND (<NOT <L? ,P-NCN 1>>
	       <PUT ,P-CCTBL ,CC-SBPTR ,P-NC1>
	       <PUT ,P-CCTBL ,CC-SEPTR ,P-NC1L>
	       <PUT ,P-CCTBL ,CC-DBPTR ,P-NC1>
	       <PUT ,P-CCTBL ,CC-DEPTR ,P-NC1L>
	       <CLAUSE-COPY ,P-ITBL ,P-OTBL>)>
	<COND (.D1
	       <PUT ,P-OTBL ,P-PREP1 <GETB .D1 ,P-SPREP1>>
	       <PUT ,P-OTBL ,P-NC1 1>)
	      (.D2
	       <PUT ,P-OTBL ,P-PREP2 <GETB .D2 ,P-SPREP2>>
	       <PUT ,P-OTBL ,P-NC2 1>)>> 

<ROUTINE CLAUSE-PRINT (BPTR EPTR "OPTIONAL" (THE? T)) 
	<BUFFER-PRINT <GET ,P-ITBL .BPTR> <GET ,P-ITBL .EPTR> .THE?>>    

<ROUTINE BUFFER-PRINT (BEG END CP "AUX" (NOSP <>) WRD (FIRST?? T) (PN <>))
	 #DECL ((BEG END) <PRIMTYPE VECTOR> (CP) <OR FALSE ATOM>)
	 <REPEAT ()
		<COND (<==? .BEG .END> <RETURN>)
		      (T
		       <COND (.NOSP <SET NOSP <>>)
			     (T <TELL " ">)>
		       <COND (<==? <SET WRD <GET .BEG 0>> ,W?PERIOD>
			      <SET NOSP T>)
			     (<==? .WRD ,W?MRS> <TELL "Mrs."> <SET PN T>)
			     (<==? .WRD ,W?MS> <TELL "Ms."> <SET PN T>)
			     (<==? .WRD ,W?MR> <TELL "Mr."> <SET PN T>)
			     (<==? .WRD ,W?COL> <TELL "Col."> <SET PN T>)
			     (<OR <EQUAL? .WRD ,W?ASHCROFT ,W?WELLMAN ;"ETC">
				  <EQUAL? .WRD ,W?DUFFY>>
			      <CAPITALIZE .BEG>
			      <SET PN T>)
			     (T
			      <COND (<AND .FIRST?? <NOT .PN> .CP>
				     <TELL "the ">)>
			      <COND (<OR ,P-OFLAG ,P-MERGED> <PRINTB .WRD>)
				    (<AND <==? .WRD ,W?IT>
					  <==? ,P-IT-LOC ,HERE>>
				     <TELL D ,P-IT-OBJECT>)
				    (<AND <EQUAL? .WRD ,W?HIM ,W?HER>
					  <==? ,P-HIM-HER-LOC ,HERE>>
				     <TELL D ,P-HIM-HER>)
				    (T
				     <WORD-PRINT <GETB .BEG 2> <GETB .BEG 3>>)>
			      <SET FIRST?? <>>)>)>
		<SET BEG <REST .BEG ,P-WORDLEN>>>>

<ROUTINE CAPITALIZE (PTR)
	 <PRINTC <- <GETB ,P-INBUF <GETB .PTR 3>> 32>>
	 <WORD-PRINT <- <GETB .PTR 2> 1> <+ <GETB .PTR 3> 1>>>

<ROUTINE PREP-PRINT (PREP "AUX" WRD) 
	#DECL ((PREP) FIX)
	<COND (<NOT <0? .PREP>>
	       <TELL " ">
	       <SET WRD <PREP-FIND .PREP>>
	       <COND ;(<==? .WRD ,W?AGAINST> <TELL "against">)
		     (T <PRINTB .WRD>)>
	       <COND (<AND <==? ,W?SIT <GET <GET ,P-ITBL ,P-VERBN> 0>>
			   <==? ,W?DOWN .WRD>>	;"Will it ever work? --SWG"
		      <TELL " on">)>)>>    

<GLOBAL P-CCTBL <TABLE 0 0 0 0>>  

;"pointers used by CLAUSE-COPY (source/destination beginning/end pointers)"
<CONSTANT CC-SBPTR 0>
<CONSTANT CC-SEPTR 1>
<CONSTANT CC-DBPTR 2>
<CONSTANT CC-DEPTR 3>

<ROUTINE CLAUSE-COPY (SRC DEST "OPTIONAL" (INSRT <>) "AUX" BEG END)
	<SET BEG <GET .SRC <GET ,P-CCTBL ,CC-SBPTR>>>
	<SET END <GET .SRC <GET ,P-CCTBL ,CC-SEPTR>>>
	<PUT .DEST
	     <GET ,P-CCTBL ,CC-DBPTR>
	     <REST ,P-OCLAUSE
		   <+ <* <GET ,P-OCLAUSE ,P-MATCHLEN> ,P-LEXELEN> 2>>>
	<REPEAT ()
		<COND (<==? .BEG .END>
		       <PUT .DEST
			    <GET ,P-CCTBL ,CC-DEPTR>
			    <REST ,P-OCLAUSE
				  <+ <* <GET ,P-OCLAUSE ,P-MATCHLEN> ,P-LEXELEN>
				     2>>>
		       <RETURN>)
		      (T
		       <COND (<AND .INSRT <==? ,P-ANAM <GET .BEG 0>>>
			      <CLAUSE-ADD .INSRT>)>
		       <CLAUSE-ADD <GET .BEG 0>>)>
		<SET BEG <REST .BEG ,P-WORDLEN>>>>

;"replaced by above (more general) version 9/17/84 by JW"
;<ROUTINE CLAUSE-COPY (BPTR EPTR "OPTIONAL" (INSERT <>) "AUX" BEG END) 
	#DECL ((BPTR EPTR) FIX (BEG END) <PRIMTYPE VECTOR>
	       (INSERT) <OR FALSE TABLE>)
	<SET BEG <GET ,P-CCSRC .BPTR>>
	<SET END <GET ,P-CCSRC .EPTR>>
	<PUT ,P-OTBL
	     .BPTR
	     <REST ,P-OCLAUSE
		   <+ <* <GET ,P-OCLAUSE ,P-MATCHLEN> ,P-LEXELEN> 2>>>
	<REPEAT ()
		<COND (<==? .BEG .END>
		       <PUT ,P-OTBL
			    .EPTR
			    <REST ,P-OCLAUSE
				  <+ <* <GET ,P-OCLAUSE ,P-MATCHLEN> ,P-LEXELEN>
				     2>>>
		       <RETURN>)
		      (T
		       <COND (<AND .INSERT <==? ,P-ANAM <GET .BEG 0>>>
			      <CLAUSE-ADD .INSERT>)>
		       <CLAUSE-ADD <GET .BEG 0>>)>
		<SET BEG <REST .BEG ,P-WORDLEN>>>>  

<ROUTINE CLAUSE-ADD (WRD "AUX" PTR) 
	#DECL ((WRD) TABLE (PTR) FIX)
	<SET PTR <+ <GET ,P-OCLAUSE ,P-MATCHLEN> 2>>
	<PUT ,P-OCLAUSE <- .PTR 1> .WRD>
	<PUT ,P-OCLAUSE .PTR 0>
	<PUT ,P-OCLAUSE ,P-MATCHLEN .PTR>>   
 
<ROUTINE PREP-FIND (PREP "AUX" (CNT 0) SIZE) 
	#DECL ((PREP CNT SIZE) FIX)
	<SET SIZE <* <GET ,PREPOSITIONS 0> 2>>
	<REPEAT ()
		<COND (<IGRTR? CNT .SIZE> <RFALSE>)
		      (<==? <GET ,PREPOSITIONS .CNT> .PREP>
		       <RETURN <GET ,PREPOSITIONS <- .CNT 1>>>)>>>  
 
<ROUTINE SYNTAX-FOUND (SYN) 
	#DECL ((SYN) <PRIMTYPE VECTOR>)
	<SETG P-SYNTAX .SYN>
	<SETG PRSA <GETB .SYN ,P-SACTION>>>   
 
<GLOBAL P-GWIMBIT 0>
 
<ROUTINE GWIM (GBIT LBIT PREP "AUX" OBJ) 
	#DECL ((GBIT LBIT) FIX (OBJ) OBJECT)
	<COND (<==? .GBIT ,RMUNGBIT>
	       <RETURN ,ROOMS>)>
	<SETG P-GWIMBIT .GBIT>
	<SETG P-SLOCBITS .LBIT>
	<PUT ,P-MERGE ,P-MATCHLEN 0>
	<COND (<GET-OBJECT ,P-MERGE <>>
	       <SETG P-GWIMBIT 0>
	       <COND (<==? <GET ,P-MERGE ,P-MATCHLEN> 1>
		      <SET OBJ <GET ,P-MERGE 1>>
		      <TELL "(">
		      <COND (<NOT <0? .PREP>>
			     <PRINTB <PREP-FIND .PREP>>
			     <COND (<AND <EQUAL? .PREP ,W?DOWN>
					 <FSET? .OBJ ,FURNITURE>>
				    <TELL " on">)>
			     <THE? .OBJ>
			     <TELL " ">)>
		      <TELL D .OBJ ")" CR>
		      .OBJ)>)
	      (T <SETG P-GWIMBIT 0> <RFALSE>)>>   
 
<ROUTINE SNARF-OBJECTS ("AUX" PTR) 
	#DECL ((PTR) <OR FIX <PRIMTYPE VECTOR>>)
	<COND (<NOT <==? <SET PTR <GET ,P-ITBL ,P-NC1>> 0>>
	       <SETG P-SLOCBITS <GETB ,P-SYNTAX ,P-SLOC1>>
	       <OR <SNARFEM .PTR <GET ,P-ITBL ,P-NC1L> ,P-PRSO> <RFALSE>>
	       <OR <0? <GET ,P-BUTS ,P-MATCHLEN>>
		   <SETG P-PRSO <BUT-MERGE ,P-PRSO>>>)>
	<COND (<NOT <==? <SET PTR <GET ,P-ITBL ,P-NC2>> 0>>
	       <SETG P-SLOCBITS <GETB ,P-SYNTAX ,P-SLOC2>>
	       <OR <SNARFEM .PTR <GET ,P-ITBL ,P-NC2L> ,P-PRSI> <RFALSE>>
	       <COND (<NOT <0? <GET ,P-BUTS ,P-MATCHLEN>>>
		      <COND (<==? <GET ,P-PRSI ,P-MATCHLEN> 1>
			     <SETG P-PRSO <BUT-MERGE ,P-PRSO>>)
			    (T <SETG P-PRSI <BUT-MERGE ,P-PRSI>>)>)>)>
	<RTRUE>>  

<ROUTINE BUT-MERGE (TBL "AUX" LEN BUTLEN (CNT 1) (MATCHES 0) OBJ NTBL) 
	#DECL ((TBL NTBL) TABLE (LEN BUTLEN MATCHES) FIX (OBJ) OBJECT)
	<SET LEN <GET .TBL ,P-MATCHLEN>>
	<PUT ,P-MERGE ,P-MATCHLEN 0>
	<REPEAT ()
		<COND (<DLESS? LEN 0> <RETURN>)
		      (<ZMEMQ <SET OBJ <GET .TBL .CNT>> ,P-BUTS>)
		      (T
		       <PUT ,P-MERGE <+ .MATCHES 1> .OBJ>
		       <SET MATCHES <+ .MATCHES 1>>)>
		<SET CNT <+ .CNT 1>>>
	<PUT ,P-MERGE ,P-MATCHLEN .MATCHES>
	<SET NTBL ,P-MERGE>
	<SETG P-MERGE .TBL>
	.NTBL>    
 
<GLOBAL P-NAM <>>   
 
<GLOBAL P-XNAM <>>

<GLOBAL P-ADJ <>>   
 
<GLOBAL P-XADJ <>>

<GLOBAL P-ADJN <>>  
 
<GLOBAL P-XADJN <>>

<GLOBAL P-PRSO <ITABLE NONE 50>>   
 
<GLOBAL P-PRSI <ITABLE NONE 50>>   
 
<GLOBAL P-BUTS <ITABLE NONE 50>>   
 
<GLOBAL P-MERGE <ITABLE NONE 50>>  
 
<GLOBAL P-OCLAUSE <ITABLE NONE 50>>
 
<GLOBAL P-MATCHLEN 0>    
 
<GLOBAL P-GETFLAGS 0>    
 
<CONSTANT P-ALL 1>  
 
<CONSTANT P-ONE 2>  
 
<CONSTANT P-INHIBIT 4>   

<GLOBAL P-CSPTR <>>
<GLOBAL P-CEPTR <>>

<ROUTINE SNARFEM (PTR EPTR TBL "AUX" (AND <>) (BUT <>) LEN WV WORD NW
		  (WAS-ALL <>)) 
   #DECL ((TBL) TABLE (PTR EPTR) <PRIMTYPE VECTOR> (AND) <OR ATOM FALSE>
	  (BUT) <OR FALSE TABLE> (WV) <OR FALSE FIX ATOM>)
   <SETG P-AND <>>
   <COND (<==? ,P-GETFLAGS ,P-ALL> <SET WAS-ALL T>)>
   <SETG P-GETFLAGS 0>
   <SETG P-CSPTR .PTR>
   <SETG P-CEPTR .EPTR>
   <PUT ,P-BUTS ,P-MATCHLEN 0>
   <PUT .TBL ,P-MATCHLEN 0>
   <SET WORD <GET .PTR 0>>
   <REPEAT ()
	   <COND (<==? .PTR .EPTR>
		  <SET WV <GET-OBJECT <OR .BUT .TBL>>>
		  <COND (.WAS-ALL <SETG P-GETFLAGS ,P-ALL>)>
		  <RETURN .WV>)
		 (T
		  <SET NW <GET .PTR ,P-LEXELEN>>
		  <COND (<==? .WORD ,W?ALL>
			 <SETG P-GETFLAGS ,P-ALL>
			 <COND (<==? .NW ,W?OF>
				<SET PTR <REST .PTR ,P-WORDLEN>>)>)
			(<EQUAL? .WORD ,W?BUT ,W?EXCEPT>
			 <OR <GET-OBJECT <OR .BUT .TBL>> <RFALSE>>
			 <SET BUT ,P-BUTS>
			 <PUT .BUT ,P-MATCHLEN 0>)
			(<EQUAL? .WORD ,W?A ,W?ONE>
			 <COND (<NOT ,P-ADJ>
				<SETG P-GETFLAGS ,P-ONE>
				<COND (<==? .NW ,W?OF>
				       <SET PTR <REST .PTR ,P-WORDLEN>>)>)
			       (T
				<SETG P-NAM ,P-ONEOBJ>
				<OR <GET-OBJECT <OR .BUT .TBL>> <RFALSE>>
				<AND <0? .NW> <RTRUE>>)>)
			(<AND <EQUAL? .WORD ,W?AND ,W?COMMA>
			      <NOT <EQUAL? .NW ,W?AND ,W?COMMA>>>
			 <SETG P-AND T>
			 <OR <GET-OBJECT <OR .BUT .TBL>> <RFALSE>>
			 T)
			(<WT? .WORD ,PS?BUZZ-WORD>)
			(<EQUAL? .WORD ,W?AND ,W?COMMA>)
			(<==? .WORD ,W?OF>
			 <COND (<0? ,P-GETFLAGS>
				<SETG P-GETFLAGS ,P-INHIBIT>)>)
			(<AND <SET WV <WT? .WORD ,PS?ADJECTIVE ,P1?ADJECTIVE>>
			      <NOT ,P-ADJ>>
			 <SETG P-ADJ .WV>
			 <SETG P-ADJN .WORD>)
			(<WT? .WORD ,PS?OBJECT ,P1?OBJECT>
			 <SETG P-NAM .WORD>
			 <SETG P-ONEOBJ .WORD>)>)>
	   <COND (<NOT <==? .PTR .EPTR>>
		  <SET PTR <REST .PTR ,P-WORDLEN>>
		  <SET WORD .NW>)>>>   
 
<CONSTANT SH 128> ;"SEARCH HELD"
<CONSTANT SC 64>  ;"SEARCH CARRIED"    
<CONSTANT SIR 32> ;"SEARCH IN-ROOM"   
<CONSTANT SOG 16> ;"SEARCH ON-GROUND"   
<CONSTANT STAKE 8> ;"TRY TAKE"  
<CONSTANT SMANY 4> ;"MANY OKAY"  
<CONSTANT SHAVE 2> ;"MUST HAVE"

<ROUTINE TELL-NO-NOUNS ()
	 <TELL "There aren't enough nouns in that sentence." CR>>



<ROUTINE GET-OBJECT (TBL
		    "OPTIONAL" (VRB T)
		    "AUX" BITS LEN XBITS TLEN (GCHECK <>) (OLEN 0) OBJ)
	#DECL ((TBL) TABLE (XBITS BITS TLEN LEN) FIX (GWIM) <OR FALSE FIX>
	       (VRB GCHECK) <OR ATOM FALSE>)
 <SET XBITS ,P-SLOCBITS>
 <SET TLEN <GET .TBL ,P-MATCHLEN>>
 <COND (<BTST ,P-GETFLAGS ,P-INHIBIT> <RTRUE>)>
 <COND (<AND <NOT ,P-NAM> ,P-ADJ <WT? ,P-ADJN ,PS?OBJECT ,P1?OBJECT>>
	<SETG P-NAM ,P-ADJN>
	<SETG P-ADJ <>>)>
 <COND (<AND <NOT ,P-NAM>
	     <NOT ,P-ADJ>
	     <NOT <==? ,P-GETFLAGS ,P-ALL>>
	     <0? ,P-GWIMBIT>>
	<COND (.VRB
	       <TELL-NO-NOUNS>)>
	<RFALSE>)>
 <COND (<OR <NOT <==? ,P-GETFLAGS ,P-ALL>> <0? ,P-SLOCBITS>>
	<SETG P-SLOCBITS -1>)>
 <SETG P-TABLE .TBL>
 <PROG ()
  <COND (.GCHECK <GLOBAL-CHECK .TBL>)
	(T
	 <FCLEAR ,PLAYER ,TRANSBIT>
	 <DO-SL ,HERE ,SOG ,SIR>
	 <FSET ,PLAYER ,TRANSBIT>
	 <DO-SL ,PLAYER ,SH ,SC>)>
  <SET LEN <- <GET .TBL ,P-MATCHLEN> .TLEN>>
  <COND (<BTST ,P-GETFLAGS ,P-ALL>)
	(<AND <BTST ,P-GETFLAGS ,P-ONE>
	      <NOT <0? .LEN>>>
	 <COND (<NOT <==? .LEN 1>>
		<PUT .TBL 1 <GET .TBL <RANDOM .LEN>>>
		<TELL "How about the " D <GET .TBL 1> "?" CR>)>
	 <PUT .TBL ,P-MATCHLEN 1>)
	(<OR <G? .LEN 1>
	     <AND <0? .LEN> <NOT <==? ,P-SLOCBITS -1>>>>
	 <COND (<==? ,P-SLOCBITS -1>
		<SETG P-SLOCBITS .XBITS>
		<SET OLEN .LEN>
		<PUT .TBL ,P-MATCHLEN <- <GET .TBL ,P-MATCHLEN> .LEN>>
		<AGAIN>)
	       (T
		<COND (<0? .LEN> <SET LEN .OLEN>)>
		<COND (<AND ,P-NAM
			    ;<VERB? ASK-ABOUT ASK-CONTEXT-ABOUT TELL-ME WHAT
				   GIVE SGIVE ASK-FOR ASK-CONTEXT-FOR TAKE
				   FIND SEARCH SEARCH-OBJECT-FOR
				   MAKE DISEMBARK>
			    <SET OBJ <GET .TBL <+ .TLEN 1>>>
			    <SET OBJ
				 <APPLY <GETP .OBJ ,P?GENERIC>
					,P-NAM>>>
		       <COND (<==? .OBJ ,NOT-HERE-OBJECT> <RFALSE>)>
		       <PUT .TBL 1 .OBJ>
		       <PUT .TBL ,P-MATCHLEN 1>
		       <SETG P-NAM <>>
		       <SETG P-ADJ <>>
		       <RTRUE>)
		      (<AND .VRB ,P-NAM>
		       <WHICH-PRINT .TLEN .LEN .TBL>
		       <SETG P-ACLAUSE
			     <COND (<==? .TBL ,P-PRSO> ,P-NC1)
				   (T ,P-NC2)>>
		       <SETG P-AADJ ,P-ADJ>
		       <SETG P-ANAM ,P-NAM>
		       <ORPHAN <> <>>
		       <SETG P-OFLAG T>)
		      (.VRB
		       <TELL-NO-NOUNS>)>
		<SETG P-NAM <>>
		<SETG P-ADJ <>>
		<RFALSE>)>)
	(<AND <0? .LEN> .GCHECK>
	 <SETG P-SLOCBITS .XBITS>
	 <COND (.VRB
		;"Changed 6/10/83 - MARC"
		<OBJ-FOUND ,NOT-HERE-OBJECT .TBL>
		;<PUT .TBL ,P-MATCHLEN 1>
		;<PUT .TBL 1 ,NOT-HERE-OBJECT>
		<SETG P-XNAM ,P-NAM>
		<SETG P-XADJ ,P-ADJ>
		<SETG P-XADJN ,P-ADJN>
		<SETG P-NAM <>>
		<SETG P-ADJ <>>
		<SETG P-ADJN <>>
		<RTRUE>)>
	 <SETG P-NAM <>>
	 <SETG P-ADJ <>>
	 <RFALSE>)
	(<0? .LEN> <SET GCHECK T> <AGAIN>)>
  <SETG P-SLOCBITS .XBITS>
  <SETG P-NAM <>>
  <SETG P-ADJ <>>
  <RTRUE>>>

<ROUTINE MOBY-FIND (TBL "AUX" FOO LEN)
	 <SETG P-MOBY-FLAG T>
	 <SETG P-TABLE .TBL>
	 <SETG P-SLOCBITS -1>
	 <SETG P-NAM ,P-XNAM>
	 <SETG P-ADJ ,P-XADJ>
	 <PUT .TBL ,P-MATCHLEN 0>
	 <SET FOO <FIRST? ,ROOMS>>
	 <REPEAT ()
		 <COND (<NOT .FOO> <RETURN>)
		       (T
			<SEARCH-LIST .FOO .TBL ,P-SRCALL>
			<SET FOO <NEXT? .FOO>>)>>
	 <COND (<EQUAL? <SET LEN <GET .TBL ,P-MATCHLEN>> 0>
		<DO-SL ,LOCAL-GLOBALS 1 1>)>
	 <COND (<EQUAL? <SET LEN <GET .TBL ,P-MATCHLEN>> 0>
		<DO-SL ,ROOMS 1 1>)>
	 <COND (<EQUAL? <SET LEN <GET .TBL ,P-MATCHLEN>> 1>
		<SETG P-MOBY-FOUND <GET .TBL 1>>)>
	 <SETG P-MOBY-FLAG <>>
	 .LEN>

<GLOBAL P-MOBY-FLAG <>>
<GLOBAL P-MOBY-FOUND <>>
<GLOBAL P-AND <>>

<ROUTINE WHICH-PRINT (TLEN LEN TBL "AUX" OBJ RLEN)
	 <SET RLEN .LEN>
	 <COND (<EQUAL? ,WINNER ,PLAYER>
		<TELL "Which">)
	       (ELSE
		<TELL "Tell " THE ,WINNER " which">)>
         <COND (<OR ,P-OFLAG ,P-MERGED ,P-AND> <TELL " "> <PRINTB ,P-NAM>)
	       (<==? .TBL ,P-PRSO>
		<CLAUSE-PRINT ,P-NC1 ,P-NC1L <>>)
	       (T <CLAUSE-PRINT ,P-NC2 ,P-NC2L <>>)>
	 <COND (<EQUAL? ,WINNER ,PLAYER> <TELL " do">)>
	 <TELL " you mean,">
	 <REPEAT ()
		 <SET TLEN <+ .TLEN 1>>
		 <SET OBJ <GET .TBL .TLEN>>
		 <TELL " " THE .OBJ>
		 <COND (<==? .LEN 2>
			<COND (<NOT <==? .RLEN 2>> <TELL ",">)>
			<TELL " or">)
		       (<G? .LEN 2> <TELL ",">)>
		 <COND (<L? <SET LEN <- .LEN 1>> 1>
			<RETURN>)>>
	 <TELL "?" CR>>


<ROUTINE GLOBAL-CHECK (TBL "AUX" LEN RMG RMGL (CNT 0) OBJ OBITS FOO) 
	#DECL ((TBL) TABLE (RMG) <OR FALSE TABLE> (RMGL CNT) FIX (OBJ) OBJECT)
	<SET LEN <GET .TBL ,P-MATCHLEN>>
	<SET OBITS ,P-SLOCBITS>
	<COND (<SET RMG <GETPT ,HERE ,P?GLOBAL>>
	       <SET RMGL <- <PTSIZE .RMG> 1>>
	       <REPEAT ()
		       <COND (<THIS-IT? <SET OBJ <GETB .RMG .CNT>> .TBL>
			      <OBJ-FOUND .OBJ .TBL>)>
		       <COND (<IGRTR? CNT .RMGL> <RETURN>)>>)>
	<COND (<SET RMG <GETPT ,HERE ,P?PSEUDO>>
	       <SET RMGL <- </ <PTSIZE .RMG> 4> 1>>
	       <SET CNT 0>
	       <REPEAT ()
		       <COND (<==? ,P-NAM <GET .RMG <* .CNT 2>>>
			      <PUTP ,PSEUDO-OBJECT
				    ,P?ACTION
				    <GET .RMG <+ <* .CNT 2> 1>>>
			      <SET FOO
				   <BACK <GETPT ,PSEUDO-OBJECT ,P?ACTION> 5>>
			      <PUT .FOO 0 <GET ,P-NAM 0>>
			      <PUT .FOO 1 <GET ,P-NAM 1>>
			      <OBJ-FOUND ,PSEUDO-OBJECT .TBL>
			      <RETURN>)
		             (<IGRTR? CNT .RMGL> <RETURN>)>>)>
	<COND (<==? <GET .TBL ,P-MATCHLEN> .LEN>
	       <SETG P-SLOCBITS -1>
	       <SETG P-TABLE .TBL>
	       <DO-SL ,GLOBAL-OBJECTS 1 1>
	       <SETG P-SLOCBITS .OBITS>)>>

<ROUTINE DO-SL (OBJ BIT1 BIT2 "AUX" BITS) 
	#DECL ((OBJ) OBJECT (BIT1 BIT2 BITS) FIX)
	<COND (<AND <NOT <EQUAL? .OBJ ,ROOMS>>
		    <BTST ,P-SLOCBITS <+ .BIT1 .BIT2>>>
	       <SEARCH-LIST .OBJ ,P-TABLE ,P-SRCALL>)
	      (T
	       <COND (<BTST ,P-SLOCBITS .BIT1>
		      <SEARCH-LIST .OBJ ,P-TABLE ,P-SRCTOP>)
		     (<BTST ,P-SLOCBITS .BIT2>
		      <SEARCH-LIST .OBJ ,P-TABLE ,P-SRCBOT>)
		     (T <RTRUE>)>)>>  

<CONSTANT P-SRCBOT 2>    
 
<CONSTANT P-SRCTOP 0>    
 
<CONSTANT P-SRCALL 1>    
 
<ROUTINE SEARCH-LIST (OBJ TBL LVL "AUX" FLS ;NOBJ) 
	#DECL ((OBJ ;NOBJ) <OR FALSE OBJECT> (TBL) TABLE (LVL) FIX (FLS) ANY)
 <COND (<SET OBJ <FIRST? .OBJ>>
	<REPEAT ()
		<COND (<AND <NOT <==? .LVL ,P-SRCBOT>>
			    <GETPT .OBJ ,P?SYNONYM>
			    <THIS-IT? .OBJ .TBL>>
		       <OBJ-FOUND .OBJ .TBL>)>
		<COND (<AND <OR <NOT <==? .LVL ,P-SRCTOP>>
				<FSET? .OBJ ,SEARCHBIT>
				<FSET? .OBJ ,SURFACEBIT>>
			    <FIRST? .OBJ> ;<SET NOBJ <FIRST? .OBJ>>
			    <NOT <EQUAL? .OBJ ,PLAYER ,LOCAL-GLOBALS>>
			    <OR <FSET? .OBJ ,OPENBIT>
				<FSET? .OBJ ,TRANSBIT>
				,P-MOBY-FLAG>>
		       <SET FLS
		        <SEARCH-LIST .OBJ .TBL
				    <COND (<FSET? .OBJ ,SURFACEBIT> ,P-SRCALL)
					  (<FSET? .OBJ ,SEARCHBIT> ,P-SRCALL)
					  (T ,P-SRCTOP)>>>)>
		<COND (<SET OBJ <NEXT? .OBJ>>) (T <RETURN>)>>)>>

<ROUTINE THIS-IT? (OBJ TBL "AUX" SYNS) 
 <COND (<FSET? .OBJ ,INVISIBLE> <RFALSE>)
       (<AND ,P-NAM
	     <NOT <ZMEMQ ,P-NAM
			 <SET SYNS <GETPT .OBJ ,P?SYNONYM>>
			 <- </ <PTSIZE .SYNS> 2> 1>>>>
	<RFALSE>)
       (<AND ,P-ADJ
	     <OR <NOT <SET SYNS <GETPT .OBJ ,P?ADJECTIVE>>>
		 <NOT <ZMEMQB ,P-ADJ .SYNS <- <PTSIZE .SYNS> 1>>>>>
	<RFALSE>)
       (<AND <NOT <0? ,P-GWIMBIT>> <NOT <FSET? .OBJ ,P-GWIMBIT>>>
	<RFALSE>)>
 <RTRUE>> 

<ROUTINE OBJ-FOUND (OBJ TBL "AUX" PTR) 
	#DECL ((OBJ) OBJECT (TBL) TABLE (PTR) FIX)
	<SET PTR <GET .TBL ,P-MATCHLEN>>
	<PUT .TBL <+ .PTR 1> .OBJ>
	<PUT .TBL ,P-MATCHLEN <+ .PTR 1>>> 
 
<ROUTINE TAKE-CHECK () 
	<AND <ITAKE-CHECK ,P-PRSO <GETB ,P-SYNTAX ,P-SLOC1>>
	     <ITAKE-CHECK ,P-PRSI <GETB ,P-SYNTAX ,P-SLOC2>>>> 

<ROUTINE ITAKE-CHECK (TBL BITS "AUX" PTR OBJ TAKEN) 
	 #DECL ((TBL) TABLE (BITS PTR) FIX (OBJ) OBJECT
		(TAKEN) <OR FALSE FIX ATOM>)
	 <COND (<AND <SET PTR <GET .TBL ,P-MATCHLEN>>
		     <OR <BTST .BITS ,SHAVE>
			 <BTST .BITS ,STAKE>>>
		<REPEAT ()
			<COND (<L? <SET PTR <- .PTR 1>> 0> <RETURN>)
			      (T
			       <SET OBJ <GET .TBL <+ .PTR 1>>>
			       <COND (<==? .OBJ ,IT> <SET OBJ ,P-IT-OBJECT>)
				     (<==? .OBJ ,HIM-HER>
				      <SET OBJ ,P-HIM-HER>)>
			       <COND (<NOT <HELD? .OBJ>>
				      <SETG PRSO .OBJ>
				      <COND (<FSET? .OBJ ,TRYTAKEBIT>
					     <SET TAKEN T>)
					    (<NOT <==? ,WINNER ,PLAYER>>
					     <SET TAKEN <>>)
					    (<AND <BTST .BITS ,STAKE>
						  <==? <ITAKE <>> T>>
					     <SET TAKEN <>>)
					    (T <SET TAKEN T>)>
				      <COND (<AND .TAKEN <BTST .BITS ,SHAVE>>
					     <TELL ,YOU-DONT-HAVE>
					     <COND (<EQUAL? .OBJ
							    ,NOT-HERE-OBJECT>
						    <TELL "that">)
						   (T
						    <THIS-IS-IT .OBJ>
						    <TELL THE .OBJ>)>
					     <TELL ".">
					     <CRLF>
					     <RFALSE>)
					    (<AND <NOT .TAKEN>
						  <==? ,WINNER ,PLAYER>>
				             <TELL "(taking " THE .OBJ
						   " first)" CR>)>)>)>>)
	       (T)>>

<ROUTINE MANY-CHECK ("AUX" (LOSS <>) TMP) 
	#DECL ((LOSS) <OR FALSE FIX>)
	<COND (<AND <G? <GET ,P-PRSO ,P-MATCHLEN> 1>
		    <NOT <BTST <GETB ,P-SYNTAX ,P-SLOC1> ,SMANY>>>
	       <SET LOSS 1>)
	      (<AND <G? <GET ,P-PRSI ,P-MATCHLEN> 1>
		    <NOT <BTST <GETB ,P-SYNTAX ,P-SLOC2> ,SMANY>>>
	       <SET LOSS 2>)>
	<COND (.LOSS
	       <TELL "You can't use multiple ">
	       <COND (<==? .LOSS 2> <TELL "in">)>
	       <TELL "direct objects with \"">
	       <SET TMP <GET ,P-ITBL ,P-VERBN>>
	       <COND (<0? .TMP> <TELL "tell">)
		     (<OR ,P-OFLAG ,P-MERGED>
		      <PRINTB <GET .TMP 0>>)
		     (T
		      <WORD-PRINT <GETB .TMP 2> <GETB .TMP 3>>)>
	       <TELL ".\"" CR>
	       <RFALSE>)
	      (T)>>  
 
<ROUTINE ZMEMQ (ITM TBL "OPTIONAL" (SIZE -1) "AUX" (CNT 1)) 
	<COND (<NOT .TBL> <RFALSE>)>
	<COND (<NOT <L? .SIZE 0>> <SET CNT 0>)
	      (ELSE <SET SIZE <GET .TBL 0>>)>
	<REPEAT ()
		<COND (<==? .ITM <GET .TBL .CNT>> <RTRUE>)
		      (<IGRTR? CNT .SIZE> <RFALSE>)>>>    

<ROUTINE ZMEMQB (ITM TBL SIZE "AUX" (CNT 0)) 
	#DECL ((ITM) ANY (TBL) TABLE (SIZE CNT) FIX)
	<REPEAT ()
		<COND (<==? .ITM <GETB .TBL .CNT>> <RTRUE>)
		      (<IGRTR? CNT .SIZE> <RFALSE>)>>>  
 

