;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 28
Scriptname QF_DES_CrusaderRelicsQuest_0600FB82 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Gauntlets
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Gauntlets Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Cuirass
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Cuirass Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Mace
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Mace Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Sword
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Sword Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Helm
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Helm Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ArkayNote
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ArkayNote Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SHIELD
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SHIELD Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DibellaNote
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DibellaNote Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RoriksteadThalmor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RoriksteadThalmor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY boots
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_boots Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Cuirass Obtained
SetObjectiveDisplayed(45, false)
QuestFunctions.CheckRelics(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Helm Obtained
IF Alias_Helm.GetRef().GetFactionOwner()
     SetStage(67)
else
     SetStage(66)
endIf
QuestFunctions.CheckRelics(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
DES_CrusaderRelics_QuestPointer.SetObjectiveCompleted(1)

int i = 10
while i < 80
     SetObjectiveDisplayed(i)
     i +=10
endWhile

i = 10
While i <= 70
     if DES_CrusaderRelics_QuestPointer.GetStageDone(i)
          SetStage(i)
     endIf
     i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
SetObjectiveCompleted(27)
SetObjectiveDisplayed(26, false)
SetObjectiveDisplayed(27, false)
SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
SetObjectiveCompleted(67)
SetObjectiveDisplayed(66, false)
SetObjectiveDisplayed(67, false)
SetStage(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Mace Obtained
QuestFunctions.CheckRelics(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
;At Rorikstead
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Sword Obtained

IF Alias_Sword.GetRef().GetFactionOwner()
     SetStage(27)
else
     SetStage(26)
endIf
QuestFunctions.CheckRelics(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
DES_StendarrsBeaconMassacreMarker.Disable()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
SetObjectiveCompleted(26)
SetObjectiveDisplayed(26, false)
SetObjectiveDisplayed(27, false)
SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
SetObjectiveCompleted(45)
SetObjectiveDisplayed(45, false)
SetObjectiveDisplayed(40, abForce = true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
if !GetStageDone(20)
     SetObjectiveCompleted(20)
     SetObjectiveDisplayed(26)
     SetObjectiveDisplayed(27)
endIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
DES_CrusaderRelics_InfamyTracker.Start()
if GetStageDone(27)
     InfamyFunctions.modInfamy(5, false)
endif
if GetStageDone(67)
     InfamyFunctions.modInfamy(5, false)
endif
DES_CrusaderRelics_QuestPointer.Stop()
QuestFunctions.RefreshMagicEffects()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
if !GetStageDone(60)
     SetObjectiveCompleted(60)
     SetObjectiveDisplayed(66)
     SetObjectiveDisplayed(67)
endIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
SetObjectiveCompleted(66)
SetObjectiveDisplayed(66, false)
SetObjectiveDisplayed(67, false)
SetStage(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Boots Obtained
QuestFunctions.CheckRelics(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Gauntlets Obtained
QuestFunctions.CheckRelics(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Shield Obtained
QuestFunctions.CheckRelics(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
If !GetStageDone(40)
     SetObjectiveFailed(40)
     SetObjectiveDisplayed(45)
     SetStage(46)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DES_CrusaderRelics_QuestFunctions Property QuestFunctions auto

Quest Property DES_CrusaderRelics_QuestPointer  Auto  

Quest Property DES_CrusaderRelics_InfamyTracker  Auto  

DES_CrusaderRelics_InfamyFunctions Property InfamyFunctions auto

DES_CrusaderRelics_InfamyIncrementor Property CrimeValues auto

ObjectReference Property DES_StendarrsBeaconMassacreMarker auto
