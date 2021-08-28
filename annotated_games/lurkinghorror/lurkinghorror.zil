"H for
			   The Lurking Horror
	(c) Copyright 1986 Infocom, Inc. All Rights Reserved."

<CONSTANT RELEASEID 1>

<VERSION 3>		;"maybe ezip or xzip someday"
<FREQUENT-WORDS?>	;"include frequent words"
;<LONG-WORDS?>		;"make a table of long words"
<SETG ZDEBUGGING? <>>	;"don't include debugging code"
<SETG NEW-VOC? T>	;"allows words to be adj/noun/verb all at once!"
<SETG SOUND-EFFECTS? <>>	;"include sound effects?"

<DEFINE IFSOUND ("ARGS" FOO)
	<COND (,SOUND-EFFECTS?
	       <FORM PROG () !.FOO>)
	      (ELSE T)>>

<INSERT-FILE "annotation_utils">

<INSERT-FILE "misc">
<INSERT-FILE "parser">
<INSERT-FILE "syntax">
<INSERT-FILE "debug">
<INSERT-FILE "record">
<INSERT-FILE "interrupts">
<INSERT-FILE "desc">
<INSERT-FILE "verbs">
<INSERT-FILE "globals">
<INSERT-FILE "cs">
<INSERT-FILE "hacker">
<INSERT-FILE "pc">
<INSERT-FILE "yuggoth">
<INSERT-FILE "green">
<INSERT-FILE "frob">

<PROPDEF SIZE 5>
<PROPDEF CAPACITY 0>
