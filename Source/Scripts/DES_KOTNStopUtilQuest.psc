Scriptname DES_KOTNStopUtilQuest extends ReferenceAlias

Quest Property ccMTYSSE001_DES_RelicsoftheCrusader auto

Event OnPlayerLoadGame()
	if ccMTYSSE001_DES_RelicsoftheCrusader.GetStageDone(75)
		Getowningquest().Stop()
	ENDIF
endEvent