"Z6 for
				MAGE
	(c) Copyright 1985 Infocom, Inc. All Rights Reserved."

<CONSTANT RELEASEID 1> <VERSION ZIP>

<SETG ZDEBUGGING? <>>

<DEFINE DEBUG-CODE ('X "OPTIONAL" ('Y T))
	<COND (,ZDEBUGGING? .X)(ELSE .Y)>>

<INSERT-FILE "debug" T>
<INSERT-FILE "record" T>

<INSERT-FILE "misc" T>
<INSERT-FILE "parser" T>

<INSERT-FILE "globals" T>
<INSERT-FILE "syntax" T>
<INSERT-FILE "verbs" T>

<PROPDEF SIZE 5>
<PROPDEF CAPACITY 0>

<INSERT-FILE "annotation_utils" T>

<INSERT-FILE "interrupts" T>
<INSERT-FILE "magic" T>
<INSERT-FILE "guild" T>
<INSERT-FILE "c1" T>
<INSERT-FILE "c2" T>
<INSERT-FILE "c3" T>
<INSERT-FILE "c4" T>
