;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__0009E00D Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akSpeaker.modfavorpoints(50)
GetOwningQuest().Setstage(250)
Quest CrusaderQuest = Game.GetFormFromFile(0x83C, "ccmtysse001-knightsofthenine.esl") As Quest
Quest TrackingQuest = Game.GetFormFromFile(0x85C, "Knight of the North.esp") As Quest
IF CrusaderQuest.IsRunning()
   CrusaderQuest.SetStage(25)
ENDIF
TrackingQuest.SetStage(25)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
