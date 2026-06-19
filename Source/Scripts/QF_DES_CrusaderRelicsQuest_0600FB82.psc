;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname QF_DES_CrusaderRelicsQuest_0600FB82 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Thalmor01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thalmor01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Cuirass
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Cuirass Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thalmor02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thalmor02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY boots
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_boots Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SHIELD
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SHIELD Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Mace
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Mace Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Sword
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Sword Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Gauntlets
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Gauntlets Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Helm
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Helm Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thalmor03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thalmor03 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
KOTNQuestFunctions.CheckRelics()
DES_CrusaderRelicsPointerQuest.Stop()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
SetObjectiveCompleted(50)
KOTNQuestFunctions.CheckRelics()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
DES_CrusaderRelicsPointerQuest.SetObjectiveCompleted(1)

int i = 10
while i < 80
     SetObjectiveDisplayed(i)
     i +=10
endWhile

i = 10
While i < 80
     if DES_CrusaderRelicsPointerQuest.GetStageDone(i)
          SetStage(i)
     endIf
     i += 10
endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SetObjectiveCompleted(10)
KOTNQuestFunctions.CheckRelics()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
SetObjectiveCompleted(60)
KOTNQuestFunctions.CheckRelics()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
SetObjectiveCompleted(30)
KOTNQuestFunctions.CheckRelics()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
SetObjectiveCompleted(70)
KOTNQuestFunctions.CheckRelics()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveCompleted(20)
KOTNQuestFunctions.CheckRelics()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SetObjectiveCompleted(40)
KOTNQuestFunctions.CheckRelics()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DES_CrusaderRelicsPointerQuest  Auto  

DES_CrusaderRelicsQuestFunctions Property KOTNQuestFunctions auto
