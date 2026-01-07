OldaleTown_House2_MapScripts::
	.byte 0

OldaleTown_House2_EventScript_Woman::
	msgbox OldaleTown_House2_Text_Woman_PokemonLovingHusband, MSGBOX_NPC
	end

OldaleTown_House2_EventScript_Man::
	msgbox OldaleTown_House2_Text_Man_WantsSeedot, MSGBOX_NPC
	end

OldaleTown_House2_Text_Woman_PokemonLovingHusband:
	.string "My husband just adores pokémon.\p"
	.string "He talks about them morning, noon,\n"
	.string "and night.\p"
	.string "Sometimes I think he loves them more\n"
	.string "than he loves me!$"


OldaleTown_House2_Text_Man_WantsSeedot:
	.string "I love pokémon more than anything!\p"
	.string "Lately, I've been dreaming of owning\n"
	.string "a Seedot.\p"
	.string "Supposedly found on a nearby route,\n"
	.string "but I can't remember which one.\l"
	.string "Or if it's even true...$"
