;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 26
Scriptname QF_DES_CrusaderRelicsPointer_0600FB7F Extends Quest Hidden

;BEGIN ALIAS PROPERTY WindhelmNote
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WindhelmNote Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DibellaNote
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DibellaNote Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RiftenNote
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RiftenNote Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Mace
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Mace Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Journal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Journal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thalmor02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thalmor02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StendarrNote
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StendarrNote Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY boots
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_boots Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SolitudeNote
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SolitudeNote Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Sword
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Sword Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SHIELD
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SHIELD Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thalmor03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thalmor03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MarkarthNote
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MarkarthNote Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Helm
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Helm Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Gauntlets
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Gauntlets Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WhiterunNote
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WhiterunNote Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KnightCuirass
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KnightCuirass Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Cuirass
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Cuirass Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thalmor01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thalmor01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KyneNote
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KyneNote Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ArkayNote
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ArkayNote Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KnightGauntlets
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KnightGauntlets Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KnightBoots
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KnightBoots Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KnightHelmet
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KnightHelmet Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThalmorEvidenceChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThalmorEvidenceChest Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
;Read Dossier
setStage(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;Read Dibella Note
SetStage(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Mace Obtained
SetStage(2)
QuestFunctions.CheckRelics(10)
Alias_Mace.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
;Sword Earned
Actor Player = Alias_Player.getActorReference()
ObjectReference Sword = Alias_Sword.getReference()
Player.Additem(DES_HalloftheDeadKey)
Sword.SetActorOwner(Player.GetActorBase())
if DES_CrusaderRelics_Quest.IsRunning()
     DES_CrusaderRelics_Quest.setstage(25)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
IF !DES_CrusaderRelics_Quest.IsRunning()
     if !IsObjectiveDisplayed(3)
          setObjectiveCompleted(1)
          setObjectiveDisplayed(2)
     endif
endIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Shield Obtained
SetStage(2)
QuestFunctions.CheckRelics(70)
Alias_Shield.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
;Sword Stolen
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Cuirass Obtained
SetStage(2)
QuestFunctions.CheckRelics(40)
Alias_Cuirass.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Helm Obtained
Actor Player = Alias_Player.getActorRef()
IF Alias_Helm.GetRef().GetFactionOwner()
     SetStage(67)
endIf
Player.RemoveItem(Alias_Helm.GetRef(), 1, true)
Player.AddItem(ccMTYSSE001_ArmorKOTNHelmet, 1, true)
SetObjectiveCompleted(68)
SetStage(2)
QuestFunctions.CheckRelics(60)
Alias_Helm.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Boots Obtained
SetStage(2)
QuestFunctions.CheckRelics(30)
Alias_Boots.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Gauntlets Obtained
SetStage(2)
QuestFunctions.CheckRelics(50)
Alias_Gauntlets.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
IF !DES_CrusaderRelics_Quest.IsRunning()
     if !IsObjectiveDisplayed(2) && !IsObjectiveDisplayed(3)
          setObjectiveDisplayed(1)
     endif
endIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
;Helm Earned
Actor Player = Alias_Player.getActorReference()
ObjectReference Helm = Alias_Helm.getReference()
Helm.SetActorOwner(Player.GetActorBase())
if DES_CrusaderRelics_Quest.IsRunning()
     DES_CrusaderRelics_Quest.setstage(65)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
;Read Arkay Note
SetStage(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;KnightCuirass Obtained
Alias_KnightCuirass.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;KnightGauntlets Obtained
Actor Player = Alias_Player.getActorRef()
Player.RemoveItem(Alias_KnightGauntlets.GetRef(), 1, true)
Player.AddItem(ccMTYSSE001_ArmorKOTNGauntletsReforged, 1, true)
Alias_KnightGauntlets.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;KnightBoots Obtained
Alias_KnightBoots.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
;Helm Stolen
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;KnightHelmet Obtained
Alias_KnightHelmet.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
;Read Note
IF !DES_CrusaderRelics_Quest.IsRunning()
     setObjectiveCompleted(1)
     setObjectiveCompleted(2)
     setObjectiveDisplayed(3)
     setObjectiveDisplayed(4)
endIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Sword Obtained
Actor Player = Alias_Player.getActorRef()
IF Alias_Sword.GetRef().GetFactionOwner()
     SetStage(27)
endIf
Player.RemoveItem(Alias_Sword.GetRef(), 1, true)
Player.AddItem(ccMTYSSE001_KOTNSword, 1, true)
SetObjectiveCompleted(28)
SetStage(2)
QuestFunctions.CheckRelics(20)
Alias_Sword.Clear()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Armor Property ccMTYSSE001_ArmorKOTNGauntletsReforged  Auto  

Quest Property DES_CrusaderRelics_Quest  Auto  

DES_CrusaderRelics_QuestFunctions Property QuestFunctions auto

Armor Property ccMTYSSE001_ArmorKOTNHelmet  Auto  

WEAPON Property ccMTYSSE001_KOTNSword  Auto  

Key Property DES_HalloftheDeadKey  Auto  

ActorBase Property PlayerBase  Auto  
