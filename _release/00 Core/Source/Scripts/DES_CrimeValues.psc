Scriptname DES_CrimeValues extends Quest  

GlobalVariable Property ccMTYSSE001_CrusaderGlobalInfamy auto
Quest Property ccMTYSSE001_Quest auto
Message Property ccMTYSSE001_CrusaderRelicsShrine auto
GlobalVariable Property ccMTYSSE001_CrusaderGlobalMessageShown auto
Message Property ccMTY_DES_HonorIncreaseMsg auto
Message Property ccMTY_DES_HonorDecreaseMsg auto
Message Property ccMTY_DES_FinalWarning auto
Formlist Property ccMTY_DES_CrusaderRelics auto
Actor Property PlayerRef auto

Function modInfamy(int i)
	IF !ccMTYSSE001_Quest.IsRunning()
		float oldInfamy = ccMTYSSE001_CrusaderGlobalInfamy.GetValueInt()
		ccMTYSSE001_CrusaderGlobalInfamy.Mod(i)
		float newInfamy = ccMTYSSE001_CrusaderGlobalInfamy.GetValueInt()
		IF ccMTYSSE001_CrusaderGlobalInfamy.GetValueInt() > 15
			IF !ccMTYSSE001_Quest.IsRunning()
				ccMTYSSE001_CrusaderRelicsShrine.Show()
				ccMTYSSE001_CrusaderGlobalMessageShown.SetValueInt(2)
				ccMTYSSE001_Quest.SetStage(10)
			ENDIF
		ENDIF
		InfamyMessages(oldInfamy, newInfamy)
	ENDIF
endFunction

Function InfamyMessages(float oldInfamy, float newInfamy)
	IF newInfamy >= 15 && newInfamy < 16 
		ccMTY_DES_FinalWarning.Show()
	ENDIF
	IF !ccMTYSSE001_Quest.IsRunning()
		IF (PlayerRef.GetItemCount(ccMTY_DES_CrusaderRelics) > 0)
			IF newInfamy < oldInfamy
				IF newInfamy <= 0 && oldInfamy >0
					ccMTY_DES_HonorIncreaseMsg.Show()
				ELSEIF newInfamy <= 6 && oldInfamy >= 5
					ccMTY_DES_HonorIncreaseMsg.Show()
				ELSEIF newInfamy <= 11 && oldInfamy >= 10
					ccMTY_DES_HonorIncreaseMsg.Show()
				ENDIF
			ELSEIF newInfamy > oldInfamy
				IF newInfamy > 0 && oldInfamy <=0
					ccMTY_DES_HonorDecreaseMsg.Show()
				ELSEIF newInfamy >= 6 && oldInfamy <= 5
					ccMTY_DES_HonorDecreaseMsg.Show()
				ELSEIF newInfamy >= 11 && oldInfamy <= 10
					ccMTY_DES_HonorDecreaseMsg.Show()
				ENDIF
			ENDIF
		ENDIF
	ENDIF
endFunction