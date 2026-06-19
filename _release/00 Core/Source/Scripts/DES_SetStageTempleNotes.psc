Scriptname DES_SetStageTempleNotes extends ObjectReference  

int Property RelicsStage  Auto
GlobalVariable Property ccMTY_DES_ArkayRead auto
Quest Property ccMTY_DES_CrusaderPointerQuest  Auto  
Quest Property ccMTYSSE001_DES_RelicsoftheCrusader Auto  
Quest Property T01 auto

event onRead()
	ccMTY_DES_ArkayRead.SetValue(1)
	ccMTY_DES_CrusaderPointerQuest.setStage(10)
	IF ccMTYSSE001_DES_RelicsoftheCrusader.IsRunning()
		ccMTYSSE001_DES_RelicsoftheCrusader.SetStage(RelicsStage)
		IF RelicsStage == 64
			IF ccMTYSSE001_DES_RelicsoftheCrusader.IsActive()
				T01.SetActive()
			ENDIF
		ENDIF 
	ENDIF
endEvent
