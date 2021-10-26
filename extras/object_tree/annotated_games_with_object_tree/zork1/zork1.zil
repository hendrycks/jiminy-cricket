;"ZORK1 for
	        Zork I: The Great Underground Empire
	(c) Copyright 1983 Infocom, Inc.  All Rights Reserved."

;"Settings"

<CONSTANT RELEASEID 1>
<VERSION ZIP>
<FREQUENT-WORDS?>
<SETG ZORK-NUMBER 1>

;"Default Property Values"

<PROPDEF SIZE 5>
<PROPDEF CAPACITY 0>
<PROPDEF VALUE 0>
<PROPDEF TVALUE 0>

;"Substrate"

<INSERT-FILE "../zork-substrate1/main">
<INSERT-FILE "../zork-substrate1/clock">
<INSERT-FILE "../zork-substrate1/parser">
<INSERT-FILE "../zork-substrate1/syntax">
<INSERT-FILE "../zork-substrate1/macros">
<INSERT-FILE "../zork-substrate1/verbs">
<INSERT-FILE "../zork-substrate1/globals">

;"Script"

<INSERT-FILE "objtree_utils">
<INSERT-FILE "annotation_utils">
<INSERT-FILE "dungeon">
<INSERT-FILE "actions">
