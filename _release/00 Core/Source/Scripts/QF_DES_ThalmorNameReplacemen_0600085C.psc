;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_DES_ThalmorNameReplacemen_0600085C Extends Quest Hidden

;BEGIN ALIAS PROPERTY RoriksteadThalmor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RoriksteadThalmor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY IcebergThalmor1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_IcebergThalmor1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NorthwatchThalmor01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NorthwatchThalmor01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY IcebergThalmor2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_IcebergThalmor2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StendarrThalmor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StendarrThalmor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NorthwatchThalmor02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NorthwatchThalmor02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CrusaderSword
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CrusaderSword Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CrusaderHelm
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CrusaderHelm Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NorthwatchBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NorthwatchBoss Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Actor Player = Alias_Player.getActorReference()
ObjectReference CrusaderSword = Alias_CrusaderSword.getReference()
Player.Additem(ccMTY_DES_HalloftheDeadKey)
CrusaderSword.SetActorOwner(Player.GetActorBase())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Actor Player = Alias_Player.getActorReference()
ObjectReference CrusaderHelm = Alias_CrusaderHelm.getReference()
CrusaderHelm.SetActorOwner(Player.GetActorBase())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Key Property ccMTY_DES_HalloftheDeadKey  Auto  
