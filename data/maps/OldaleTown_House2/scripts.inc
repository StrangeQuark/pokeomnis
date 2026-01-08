OldaleTown_House2_MapScripts::
	.byte 0

OldaleTown_House2_EventScript_Woman::
	msgbox OldaleTown_House2_Text_PokemonLovingHusband, MSGBOX_NPC
	end

OldaleTown_House2_EventScript_Man::
	lock
	faceplayer
	goto_if_set FLAG_OLDALE_TOWN_SEEDOT_TRADE_DONE, OldaleTown_House2_EventScript_ManAfterSeedotTrade
	checkpartycontainsmon SPECIES_SEEDOT
	goto_if_eq VAR_RESULT, PARTY_SIZE, OldaleTown_House2_EventScript_ManWantsSeedot
	msgbox OldaleTown_House2_Text_YouHaveASeedot, MSGBOX_YESNO
	goto_if_eq VAR_RESULT, NO, OldaleTown_House2_EventScript_DeclineSeedotTrade
	special ChoosePartyMon
	waitstate
	copyvar VAR_0x800A, VAR_0x8004
	goto_if_eq VAR_0x8004, PARTY_NOTHING_CHOSEN, OldaleTown_House2_EventScript_DeclineSeedotTrade
	copyvar VAR_0x8005, VAR_0x800A
	specialvar VAR_RESULT, GetTradeSpecies
	goto_if_ne VAR_RESULT, SPECIES_SEEDOT, OldaleTown_House2_EventScript_NotRequestedMon
	removemonfromparty
	playfanfare MUS_OBTAIN_ITEM
	msgbox OldaleTown_House2_Text_PlayerGaveSeedot, MSGBOX_DEFAULT
	waitfanfare
	msgbox OldaleTown_House2_Text_ThanksForGivingSeedot, MSGBOX_DEFAULT
	playfanfare MUS_OBTAIN_ITEM
	msgbox OldaleTown_House2_Text_PlayerReceivedMoney, MSGBOX_DEFAULT
	addmoney 10000
	waitfanfare
	msgbox OldaleTown_House2_Text_VisitMyBrother, MSGBOX_DEFAULT
	setflag FLAG_OLDALE_TOWN_SEEDOT_TRADE_DONE
	release
	end

OldaleTown_House2_EventScript_ManAfterSeedotTrade::
	msgbox OldaleTown_House2_Text_AfterSeedotTrade, MSGBOX_NPC
	end

OldaleTown_House2_EventScript_DeclineSeedotTrade::
	msgbox OldaleTown_House2_Text_DeclineSeedotTrade, MSGBOX_NPC
	end

OldaleTown_House2_EventScript_ManWantsSeedot::
	msgbox OldaleTown_House2_Text_WantsSeedot, MSGBOX_NPC
	end

OldaleTown_House2_EventScript_NotRequestedMon::
	msgbox OldaleTown_House2_Text_NotASeedot, MSGBOX_NPC
	release
	end

OldaleTown_House2_Text_PokemonLovingHusband:
	.string "My husband just adores pokémon.\p"
	.string "He talks about them morning, noon,\n"
	.string "and night.\p"
	.string "Sometimes I think he loves them more\n"
	.string "than he loves me!$"

OldaleTown_House2_Text_WantsSeedot:
	.string "I love pokémon more than anything!\p"
	.string "Lately, I've been dreaming of owning\n"
	.string "a Seedot.\p"
	.string "Supposedly found on a nearby route,\n"
	.string "but I can't remember which one.\l"
	.string "Or if it's even true...$"

OldaleTown_House2_Text_YouHaveASeedot:
	.string "Oh! Is that a Seedot you have?\p"
	.string "I've never seen one up close before.\n"
	.string "I love pokémon more than anything,\l"
	.string "and Seedot has always been my favorite.\p"
	.string "If it's not too much to ask...\n"
	.string "would you consider letting me have it?$"

OldaleTown_House2_Text_DeclineSeedotTrade:
	.string "I understand.\n"
	.string "A pokémon like that is precious.\p"
	.string "If you ever change your mind,\n"
	.string "I'll be right here, dreaming of\l"
	.string "the day I have my own Seedot.$"

OldaleTown_House2_Text_NotASeedot:
	.string "Uhh... this is not a Seedot.$"

OldaleTown_House2_Text_PlayerGaveSeedot:
	.string "{PLAYER} gave the man a Seedot!$"

OldaleTown_House2_Text_ThanksForGivingSeedot:
	.string "Wow! I can't believe you gave me\n"
	.string "your Seedot!\l"
	.string "It means more to me than you know..\p"
	.string "Please, take this as thanks!$"

OldaleTown_House2_Text_PlayerReceivedMoney:
	.string "{PLAYER} received ¥10,000!$"

OldaleTown_House2_Text_VisitMyBrother:
	.string "If you pass through Rustboro City,\n"
	.string "you should visit my brother!\p"
	.string "He works there as a chef.\n"
	.string "Tell him I sent you.$"

OldaleTown_House2_Text_AfterSeedotTrade:
	.string "Thanks again for the Seedot!\n"
	.string "It's settled in nicely here.\p"
	.string "It looks really happy,\n"
	.string "and I take great care of it every day.\p"
	.string "If you head to Rustboro City,\n"
	.string "don't forget to visit my brother.\l"
	.string "He's working there as a chef.$"
