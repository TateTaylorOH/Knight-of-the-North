Scriptname DES_CrusaderRelics_QuestFunctions extends Quest
{Shared functions for the Relics of the Crusader Quest.}

Function CheckRelics(int o)
{Sets the relevant objective Completed then checks to see if the Player has gathered all the Relics.}

	SetObjectiveCompleted(o)

	int i = 10
	int s = 0
	While i < 80
		if GetStageDone(i)
			s += 1
		endIf
		i += 10
	endWhile
	if s == 7
		SetStage(255)
 	endIf

endFunction