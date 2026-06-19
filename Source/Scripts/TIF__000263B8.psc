;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__000263B8 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
GetOwningQuest().SetStage(100)
Quest CrusaderQuest = Game.GetFormFromFile(0x83C, "ccmtysse001-knightsofthenine.esl") As Quest
Quest TrackingQuest = Game.GetFormFromFile(0x85C, "Knight of the North.esp") As Quest
IF CrusaderQuest.IsRunning()
   CrusaderQuest.SetStage(65)
ENDIF
TrackingQuest.SetStage(65)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
