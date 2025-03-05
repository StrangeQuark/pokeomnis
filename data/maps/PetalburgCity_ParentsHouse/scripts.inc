PetalburgCity_ParentsHouse_MapScripts::
	.byte 0

PetalburgCity_ParentsHouse_EventScript_GreetMom::
	lock
	faceplayer
	msgbox PetalburgCity_ParentsHouse_Text_MomGreetsPlayer, MSGBOX_DEFAULT
	release
	end

PetalburgCity_ParentsHouse_Text_MomGreetsPlayer:
	.string "Oh {PLAYER}! I'm so glad to see you!\p"
	.string "How are things going for you in\n"
	.string "Littleroot Town?\p"
	.string "...\n"
	.string "...\p"
	.string "I see! Well I'm glad that you were\n"
	.string "able to meet Professor Birch and\l"
	.string "make a new friend!\p"
	.string "Have you been to see your father\n"
    .string "at the gym next door yet?\p"
    .string "I'm sure he'd love to know how\n"
    .string "you're getting along on your journey!\p"
    .string "Anyway, I'm just so happy you're\n"
    .string "doing well. Come visit any time\l"
    .string "you need a break, okay? A mother's\l"
    .string "door is always open.$"
