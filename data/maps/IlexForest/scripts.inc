.set LOCALID_CELEBI, 1

IlexForest_MapScripts::
	.byte 0

IlexForest_EventScript_Sign::
	msgbox IlexForest_Text_Sign, MSGBOX_SIGN
	end

IlexForest_EventScript_Shrine::
	goto_if_unset FLAG_CAUGHT_OR_DEFEATED_CELEBI, IlexForest_EventScript_Celebi
	msgbox IlexForest_Text_Shrine, MSGBOX_SIGN
	end

IlexForest_EventScript_Celebi::
	lock
	faceplayer
	clearflag FLAG_HIDE_ILEX_FOREST_CELEBI
	applymovement LOCALID_CELEBI, IlexForest_Movement_Celebi
	waitmovement 0
	playmoncry SPECIES_CELEBI, CRY_MODE_ENCOUNTER
	waitmoncry
	seteventmon SPECIES_CELEBI, 30
	setflag FLAG_SYS_CTRL_OBJ_DELETE
	setflag FLAG_HIDE_ILEX_FOREST_CELEBI
	special BattleSetup_StartLegendaryBattle
	waitstate
	clearflag FLAG_SYS_CTRL_OBJ_DELETE
	specialvar VAR_RESULT, GetBattleOutcome
	goto_if_eq VAR_RESULT, B_OUTCOME_WON, IlexForest_EventScript_CelebiDefeated
	goto_if_eq VAR_RESULT, B_OUTCOME_RAN, IlexForest_EventScript_PlayerOrCelebiRan
	goto_if_eq VAR_RESULT, B_OUTCOME_PLAYER_TELEPORTED, IlexForest_EventScript_PlayerOrCelebiRan
	goto_if_eq VAR_RESULT, B_OUTCOME_MON_TELEPORTED, IlexForest_EventScript_PlayerOrCelebiRan
	setflag FLAG_CAUGHT_OR_DEFEATED_CELEBI
	release
	end

IlexForest_EventScript_CelebiDefeated::
	setflag FLAG_CAUGHT_OR_DEFEATED_CELEBI
	setvar VAR_0x8004, SPECIES_CELEBI
	goto Common_EventScript_LegendaryFlewAway
	end

IlexForest_EventScript_PlayerOrCelebiRan::
	setvar VAR_0x8004, SPECIES_CELEBI
	goto Common_EventScript_LegendaryFlewAway
	end

IlexForest_Movement_Celebi:
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	step_end

IlexForest_Text_Sign:
	.string "ILEX FOREST is so overgrown with\n"
	.string "trees that you can't see the sky.\p"
	.string "Please watch out for items\n"
	.string "that may have been dropped.$"

IlexForest_Text_Shrine:
	.string "ILEX FOREST SHRINE\p"
	.string "It's in honor of the\n"
	.string "forest's protector...$"
