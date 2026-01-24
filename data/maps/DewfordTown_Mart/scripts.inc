DewfordTown_Mart_MapScripts::
	.byte 0

DewfordTown_Mart_EventScript_Clerk::
	lock
	faceplayer
	message gText_HowMayIServeYou
	waitmessage
	pokemart DewfordTown_Mart_Pokemart
	msgbox gText_PleaseComeAgain, MSGBOX_DEFAULT
	release
	end

	.align 2
DewfordTown_Mart_Pokemart:
	.2byte ITEM_POKE_BALL
	.2byte ITEM_GREAT_BALL
	.2byte ITEM_NET_BALL
	.2byte ITEM_POTION
	.2byte ITEM_ANTIDOTE
	.2byte ITEM_PARALYZE_HEAL
	.2byte ITEM_AWAKENING
	.2byte ITEM_NONE
	release
	end
