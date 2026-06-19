Scriptname ccMTY_DES_WinQuest extends ReferenceAlias  

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	IF ccMTY_DES_HelmObtained.GetValue() >0 && ccMTY_DES_ArmorObtained.GetValue() >0 && ccMTY_DES_GlovesObtained.GetValue() >0  && ccMTY_DES_BootsObtained.GetValue() >0 && ccMTY_DES_ShieldObtained.GetValue() >0 && ccMTY_DES_SwordObtained.GetValue() >0 && ccMTY_DES_MaceObtained.GetValue() >0
		MyQST.SetStage(75)
	endif
EndEvent

GlobalVariable Property ccMTY_DES_HelmObtained Auto  
GlobalVariable Property ccMTY_DES_ArmorObtained Auto  
GlobalVariable Property ccMTY_DES_GlovesObtained Auto  
GlobalVariable Property ccMTY_DES_BootsObtained Auto  
GlobalVariable Property ccMTY_DES_ShieldObtained Auto  
GlobalVariable Property ccMTY_DES_SwordObtained Auto  
GlobalVariable Property ccMTY_DES_MaceObtained Auto  

Quest Property MyQST Auto