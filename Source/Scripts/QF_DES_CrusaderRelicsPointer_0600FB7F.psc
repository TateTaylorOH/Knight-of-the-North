;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 16
Scriptname QF_DES_CrusaderRelicsPointer_0600FB7F Extends Quest Hidden

;BEGIN ALIAS PROPERTY Gauntlets
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Gauntlets Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thalmor01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thalmor01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thalmor03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thalmor03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Journal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Journal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thalmor02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thalmor02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KnightGauntlets
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KnightGauntlets Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Helm
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Helm Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KnightHelmet
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KnightHelmet Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SHIELD
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SHIELD Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KnightCuirass
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KnightCuirass Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Mace
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Mace Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Sword
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Sword Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY boots
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_boots Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KnightBoots
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KnightBoots Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Cuirass
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Cuirass Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;KnightBoots Obtained
Alias_KnightBoots.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Helm Obtained
SetStage(1)
Alias_Helm.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Mace Obtained
SetStage(1)
Alias_Boots.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;KnightGauntlets Obtained
Alias_KnightGauntlets.Clear()
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

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Sword Obtained
SetStage(1)
Alias_Sword.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Shield Obtained
SetStage(1)
Alias_Shield.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Cuirass Obtained
SetStage(1)
Alias_Cuirass.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
setObjectiveDisplayed(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Boots Obtained
SetStage(1)
Alias_Boots.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Gauntlets Obtained
SetStage(1)
Alias_Gauntlets.Clear()
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

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
