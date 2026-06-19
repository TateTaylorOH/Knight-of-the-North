;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 24
Scriptname QF_ccMTYSSE001_StartupQuest__0400083C Extends Quest Hidden

;BEGIN ALIAS PROPERTY CrusaderSword
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CrusaderSword Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CrusaderShield
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CrusaderShield Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CrusaderMace
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CrusaderMace Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CrusaderArmor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CrusaderArmor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CrusaderBoots
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CrusaderBoots Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CrusaderGloves
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CrusaderGloves Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CrusaderHelm
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CrusaderHelm Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FalkFirebeard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FalkFirebeard Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
DES_ThalmorNameReplacement.Stop()
DES_InfamyTrackerQuest.Start()
Utility.Wait(3)
ccMTY_DES_BeGood.Show()
IF GetStageDone(26)
   (DES_InfamyTrackerQuest as DES_CrimeValues).modInfamy(3)
ENDIF
IF GetStageDone(66)
   (DES_InfamyTrackerQuest as DES_CrimeValues).modInfamy(3)
ENDIF
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
SetObjectiveCompleted(25)
SetObjectiveFailed(26)
SetObjectiveDisplayed(27)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
;stole the sword
SetObjectiveCompleted(26)
SetObjectiveFailed(25)
SetObjectiveDisplayed(24, abDisplayed = false)
SetObjectiveDisplayed(25, abDisplayed = false)
SetObjectiveDisplayed(26, abDisplayed = false)
SetObjectiveDisplayed(27, abDisplayed = false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
SetObjectiveCompleted(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
SetObjectiveCompleted(57)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
PointerQuest.SetStage(255)
SetObjectiveDisplayed(10)
SetObjectiveDisplayed(20)
SetObjectiveDisplayed(30)
SetObjectiveDisplayed(40)
SetObjectiveDisplayed(50)
SetObjectiveDisplayed(60)
SetObjectiveDisplayed(70)

IF ccMTY_DES_MaceObtained.GetValue() > 0
   SetStage(10)
ENDIF
IF ccMTY_DES_SwordObtained.GetValue() > 0
   SetStage(20)
ENDIF
IF ccMTY_DES_BootsObtained.GetValue() > 0
   SetStage(30)
ENDIF
IF ccMTY_DES_ArmorObtained.GetValue() > 0
   SetStage(40)
ENDIF
IF ccMTY_DES_GlovesObtained.GetValue() > 0
   SetStage(50)
ENDIF
IF ccMTY_DES_HelmObtained.GetValue() > 0
   SetStage(60)
ENDIF
IF ccMTY_DES_ShieldObtained.GetValue() > 0
   SetStage(70)
ENDIF

IF ccMTY_DES_HelmObtained.GetValue() <= 0
	IF !T01.IsRunning()
		IF !T01.GetStageDone(100)
			IF ccMTY_DES_DibellaRead.GetValue() > 0
  				 SetStage(60)
   				SetStage(64)
			ENDIF
		ENDIF
	ELSEIF T01.IsRunning()
		IF T01.GetStageDone(100)
			IF ccMTY_DES_DibellaRead.GetValue() > 0
  				SetStage(60)
   				SetStage(64)
   				SetStage(65)
			ENDIF
		ELSEIF !T01.GetStageDone(100)
			IF ccMTY_DES_DibellaRead.GetValue() > 0
  				SetStage(60)
   				SetStage(64)
			ENDIF
		ENDIF
	ENDIF	
ENDIF

IF ccMTY_DES_SwordObtained.GetValue() <= 0
	IF !MS06.IsRunning()
		IF !MS06.GetStageDone(170) || !MS06.GetStageDone(250)
			IF ccMTY_DES_ArkayRead.GetValue() > 0
  				SetStage(20)
   				SetStage(24)
			ENDIF
		ENDIF
	ELSEIF MS06.IsRunning()
		IF MS06.GetStageDone(170) || MS06.GetStageDone(250)
			IF ccMTY_DES_ArkayRead.GetValue() > 0
  				SetStage(20)
   				SetStage(24)
   				SetStage(25)
			ENDIF
		ELSEIF !MS06.GetStageDone(100)
			IF ccMTY_DES_ArkayRead.GetValue() > 0
  				SetStage(20)
   				SetStage(24)
			ENDIF
		ENDIF
	ENDIF	
ENDIF
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
SetObjectiveCompleted(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SetObjectiveCompleted(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
SetObjectiveCompleted(60)
SetObjectiveDisplayed(65)
SetObjectiveDisplayed(66)
IF IsActive()
   T01.SetActive()
ENDIF
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
;earned the sword
SetObjectiveCompleted(27)
SetObjectiveDisplayed(24, abDisplayed = false)
SetObjectiveDisplayed(25, abDisplayed = false)
SetObjectiveDisplayed(26, abDisplayed = false)
SetObjectiveDisplayed(27, abDisplayed = false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(25)
SetObjectiveDisplayed(26)
IF IsActive()
   MS06Start.SetActive()
   MS06.SetActive()
ENDIF
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
SetObjectiveCompleted(65)
SetObjectiveFailed(66)
SetObjectiveDisplayed(67)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
SetObjectiveCompleted(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;stole the helm
SetObjectiveCompleted(66)
SetObjectiveFailed(65)
SetObjectiveDisplayed(64, abDisplayed = false)
SetObjectiveDisplayed(65, abDisplayed = false)
SetObjectiveDisplayed(66, abDisplayed = false)
SetObjectiveDisplayed(67, abDisplayed = false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
SetObjectiveCompleted(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
;earned the helm
SetObjectiveCompleted(67)
SetObjectiveDisplayed(64, abDisplayed = false)
SetObjectiveDisplayed(65, abDisplayed = false)
SetObjectiveDisplayed(66, abDisplayed = false)
SetObjectiveDisplayed(67, abDisplayed = false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
SetObjectiveCompleted(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
SetObjectiveCompleted(60)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property PointerQuest  Auto  

Quest Property DES_InfamyTrackerQuest  Auto  

GlobalVariable Property ccMTY_DES_HelmObtained Auto  
GlobalVariable Property ccMTY_DES_ArmorObtained Auto  
GlobalVariable Property ccMTY_DES_GlovesObtained Auto  
GlobalVariable Property ccMTY_DES_BootsObtained Auto  
GlobalVariable Property ccMTY_DES_ShieldObtained Auto  
GlobalVariable Property ccMTY_DES_SwordObtained Auto  
GlobalVariable Property ccMTY_DES_MaceObtained Auto  

Key Property ccMTY_DES_HalloftheDeadKey Auto  

Quest Property DES_ThalmorNameReplacement  Auto  

Message Property ccMTY_DES_BeGood  Auto  

GlobalVariable Property ccMTY_DES_ArkayRead  Auto  

GlobalVariable Property ccMTY_DES_DibellaRead  Auto  

Quest Property T01  Auto  

Quest Property MS06  Auto  

Quest Property MS06Start  Auto  
