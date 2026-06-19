Scriptname DES_StartPointerQuest extends ReferenceAlias  

GlobalVariable Property RelicGlobal Auto
Quest Property ccMTY_DES_CrusaderPointerQuest auto

Event OnActivate(ObjectReference akActionRef)
	IF RelicGlobal.GetValue() < 1
		RelicGlobal.SetValue(1)
	ENDIF
	IF !ccMTY_DES_CrusaderPointerQuest.IsStageDone(10)
		ccMTY_DES_CrusaderPointerQuest.SetStage(10)
	ENDIF
	Clear()
EndEvent