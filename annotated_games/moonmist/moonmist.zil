"COMPILE/LOAD FILE for MOONMIST
Copyright (C) 1986 Infocom, Inc.  All rights reserved."

<CONSTANT RELEASEID 1> <VERSION ZIP TIME>

<FREQUENT-WORDS?>

<GLOBAL PLUS-MODE T>
<GLOBAL FILLER "">

<SETG ZDEBUGGING? <>>
<DEFINE DEBUG-CODE ('X "OPTIONAL" ('Y T))
	<COND (,ZDEBUGGING? .X) (ELSE .Y)>>

<DIRECTIONS ;"Do not change the order of the first eight
	      without consulting Marc! -- per ENCHANTER"
 	    NORTH NE EAST SE SOUTH SW WEST NW UP DOWN IN OUT>

<INSERT-FILE "annotation_utils.zil">

<INSERT-FILE "macros">
<INSERT-FILE "misc">
<INSERT-FILE "parser">

<INSERT-FILE "syntax">
<INSERT-FILE "verbs">

<PROPDEF SIZE 5>

<INSERT-FILE "goal">
<INSERT-FILE "people">
<INSERT-FILE "castle">
<INSERT-FILE "tower">
<INSERT-FILE "things">
<INSERT-FILE "places">
<INSERT-FILE "global">
<INSERT-FILE "colors">
