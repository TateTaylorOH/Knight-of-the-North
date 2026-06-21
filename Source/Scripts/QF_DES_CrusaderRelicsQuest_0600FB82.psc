;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 14
Scriptname QF_DES_CrusaderRelicsQuest_0600FB82 Extends Quest Hidden

;BEGIN ALIAS PROPERTY boots
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_boots Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Cuirass
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Cuirass Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Mace
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Mace Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Gauntlets
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Gauntlets Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Sword
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Sword Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SHIELD
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SHIELD Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Helm
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Helm Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Gauntlets Obtained
QuestFunctions.CheckRelics(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Cuirass Obtained
QuestFunctions.CheckRelics(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Sword Obtained
QuestFunctions.CheckRelics(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Helm Obtained
QuestFunctions.CheckRelics(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
SetStage(300)
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

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
DES_CrusaderRelics_InfamyTracker.Start()
DES_CrusaderRelics_QuestPointer.Stop()
Stop()
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

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Mace Obtained
QuestFunctions.CheckRelics(10)
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
While i < 80
     if DES_CrusaderRelics_QuestPointer.GetStageDone(i)
          SetStage(i)
     endIf
     i += 10
endWhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DES_CrusaderRelics_QuestFunctions Property QuestFunctions auto

Quest Property DES_CrusaderRelics_QuestPointer  Auto  

Quest Property DES_CrusaderRelics_InfamyTracker  Auto  
