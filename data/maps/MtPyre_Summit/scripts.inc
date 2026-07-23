.set LOCALID_ARCHIE, 2
.set LOCALID_OLD_LADY, 3
.set LOCALID_MAXIE, 8

MtPyre_Summit_MapScripts::
	.byte 0

MtPyre_Summit_EventScript_OldMan::
	lock
	faceplayer
	release
	end

MtPyre_Summit_EventScript_OldLady::
	lock
	faceplayer
	release
	end
