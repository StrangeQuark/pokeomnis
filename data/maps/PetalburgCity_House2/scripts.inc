PetalburgCity_House2_MapScripts::
	.byte 0

PetalburgCity_House2_EventScript_Woman::
    lockall
	checkplayerregion
	goto_if_eq VAR_RESULT, HOENN, PetalburgCity_House2_EventScript_Woman_HoennPlayer
	msgbox PetalburgCity_House2_Text_NormanBeenGymLeader, MSGBOX_NPC
	end

PetalburgCity_House2_EventScript_Woman_HoennPlayer::
    msgbox PetalburgCity_House2_Text_YourFatherGymLeader, MSGBOX_NPC
	end

PetalburgCity_House2_EventScript_SchoolKid::
    lockall
	checkplayerregion
	goto_if_eq VAR_RESULT, HOENN, PetalburgCity_House2_EventScript_SchoolKid_HoennPlayer
	msgbox PetalburgCity_House2_Text_BattledNormanOnce, MSGBOX_NPC
	end

PetalburgCity_House2_EventScript_SchoolKid_HoennPlayer::
    msgbox PetalburgCity_House2_Text_BattledYourDadOnce, MSGBOX_NPC
	end

PetalburgCity_House2_Text_NormanBeenGymLeader:
    .string "Norman has been our town's\n"
    .string "gym leader for so many years now.\p"
    .string "I still recall when his family\n"
    .string "moved in all those years ago.$"

PetalburgCity_House2_Text_YourFatherGymLeader:
    .string "Your father has been our town's\n"
    .string "gym leader for so many years now.\p"
    .string "I still recall when you and your\n"
    .string "family moved in all those years ago.$"

PetalburgCity_House2_Text_BattledNormanOnce:
    .string "I battled Norman once, but, whew,\n"
    .string "he was way too strong.\p"
    .string "How would I put it?\p"
    .string "I just got the feeling that he\n"
    .string "lives for pokémon.$"

PetalburgCity_House2_Text_BattledYourDadOnce:
    .string "I battled your dad once, but, whew,\n"
    .string "he was way too strong.\p"
    .string "How would I put it?\p"
    .string "I just got the feeling that he\n"
    .string "lives for pokémon.$"
