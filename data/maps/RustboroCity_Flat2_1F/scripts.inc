RustboroCity_Flat2_1F_MapScripts::
	.byte 0

RustboroCity_Flat2_1F_EventScript_Chef::
	goto_if_set FLAG_RUSTBORO_CITY_CHEF_LEFTOVERS_OBTAINED, RustboroCity_Flat2_1F_EventScript_ThanksAgain
	goto_if_set FLAG_OLDALE_TOWN_SEEDOT_TRADE_DONE, RustboroCity_Flat2_1F_EventScript_HelpedBrotherInOldale
	msgbox RustboroCity_Flat2_1F_Text_DevonWorkersLiveHere, MSGBOX_NPC
	end

RustboroCity_Flat2_1F_EventScript_HelpedBrotherInOldale::
	lock
	faceplayer
	msgbox RustboroCity_Flat2_1F_Text_HelpedBrotherInOldale, MSGBOX_DEFAULT
	giveitem ITEM_LEFTOVERS
	goto_if_eq VAR_RESULT, 0, Common_EventScript_BagIsFull
	msgbox RustboroCity_Flat2_1F_Text_LeftoversComeInHandy, MSGBOX_DEFAULT
	setflag FLAG_RUSTBORO_CITY_CHEF_LEFTOVERS_OBTAINED
	release
	end

RustboroCity_Flat2_1F_EventScript_ThanksAgain::
	lock
	faceplayer
	msgbox RustboroCity_Flat2_1F_Text_ThanksAgain, MSGBOX_DEFAULT
	release
	end

RustboroCity_Flat2_1F_EventScript_Skitty::
	lock
	faceplayer
	waitse
	playmoncry SPECIES_SKITTY, CRY_MODE_NORMAL
	msgbox RustboroCity_Flat2_1F_Text_Skitty, MSGBOX_DEFAULT
	waitmoncry
	release
	end

RustboroCity_Flat2_1F_Text_DevonWorkersLiveHere:
	.string "Devon Corporation's workers live in\n"
	.string "this building. I am Devon's head chef.$"

RustboroCity_Flat2_1F_Text_HelpedBrotherInOldale:
	.string "Oh! You're the one who helped\n"
	.string "my brother back in Oldale Town.\p"
	.string "I heard all about the Seedot,\n"
	.string "thank you for doing that for him.\p"
	.string "I don't have much to offer,\n"
	.string "but please, take these!$"

RustboroCity_Flat2_1F_Text_LeftoversComeInHandy:
	.string "Leftovers can always come in handy.\p"
	.string "Let one of your pokémon hold it\n"
	.string "to restore some HP after each turn\l"
	.string "in battle!$"

RustboroCity_Flat2_1F_Text_ThanksAgain:
	.string "Thanks again for helping my brother\n"
	.string "finally get his Seedot.\p"
	.string "He won't stop talking about it!$"

RustboroCity_Flat2_1F_Text_Skitty:
	.string "SKITTY: Gyaaaah!$"

