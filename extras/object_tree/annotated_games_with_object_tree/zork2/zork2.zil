"ZORK2 for
	        Zork II: The Wizard of Frobozz
	(c) Copyright 1983 Infocom, Inc.  All Rights Reserved."

;"Settings"

<CONSTANT RELEASEID 1>
<VERSION ZIP>
<FREQUENT-WORDS?>
<SETG ZORK-NUMBER 2>

;"Default Property Values"

<PROPDEF SIZE 5>
<PROPDEF CAPACITY 0>
<PROPDEF VALUE 0>

;"Substrate"

<INSERT-FILE "../zork-substrate2/main">
<INSERT-FILE "../zork-substrate2/clock">
<INSERT-FILE "../zork-substrate2/parser">
<INSERT-FILE "../zork-substrate2/syntax">
<INSERT-FILE "../zork-substrate2/macros">
<INSERT-FILE "../zork-substrate2/verbs">
<INSERT-FILE "../zork-substrate2/globals">

;"Script"

<INSERT-FILE "objtree_utils">
<INSERT-FILE "annotation_utils">
<INSERT-FILE "dungeon">
<INSERT-FILE "actions">
