Scriptname DES_CrusaderRelicsQuestFunctions extends Quest

Function CheckRelics()
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