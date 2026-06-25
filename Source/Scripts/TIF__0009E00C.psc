;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__0009E00C Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akSpeaker.modfavorpoints(50)
GetOwningQuest().Setstage(170)
Quest DES_CrusaderRelics_QuestPointer = Game.GetFormFromFile(0x810, "Knight of the North.esp") As Quest
DES_CrusaderRelics_QuestPointer.SetStage(28)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
