"ZORK3 for
		     Zork III: The Dungeon Master
	(c) Copyright 1982 Infocom, Inc.  All Rights Reserved."

;"Settings"

<CONSTANT RELEASEID 1>
<VERSION ZIP>
<FREQUENT-WORDS?>
<SETG ZORK-NUMBER 3>

;"Default Property Values"

<PROPDEF SIZE 5>
<PROPDEF CAPACITY 0>
<PROPDEF VALUE 0>

;"Substrate"

<INSERT-FILE "../zork-substrate3/main">
<INSERT-FILE "../zork-substrate3/clock">
<INSERT-FILE "../zork-substrate3/parser">
<INSERT-FILE "../zork-substrate3/syntax">
<INSERT-FILE "../zork-substrate3/macros">
<INSERT-FILE "../zork-substrate3/verbs">
<INSERT-FILE "../zork-substrate3/globals">

;"Script"

<INSERT-FILE "objtree_utils">
<INSERT-FILE "annotation_utils">

<INSERT-FILE "dungeon">
<INSERT-FILE "actions">
