Scriptname DES_CrusaderRelicsQuestFunctions extends Quest  

Function CheckRelics()
	int i = 10
	int s
	While i < 80
		if GetStageDone(i)
			s = i
		endIf
		i += 10
	endWhile
	if s == 70
		SetStage(255)
 	endIf
endFunction