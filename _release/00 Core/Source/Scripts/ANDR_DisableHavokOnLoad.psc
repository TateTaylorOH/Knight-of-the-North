scriptName ANDR_DisableHavokOnLoad extends ObjectReference
{This is a modified version of defaultDisableHavokOnLoad, with some extra lines to make sure havok stays off, thanks to icecreamassassin for the extra lines.}

Bool Property havokOnHit = False Auto
{Start Havok Sim when hit? Default: True --> set to False by AndrealphusVIII}

Bool Property havokOnActivate = False Auto
{Start Havok Sim when activated? Default: False}

Bool Property havokOnZKey = False Auto
{Start Havok Sim when grabbed by player? Default: False}

Keyword Property linkHavokPartner Auto
{Link with this keyword and that ref will also sim with myself}

Bool Property beenSimmed Auto hidden
{prevent an object that has been havok'd in-game from going static}

Bool Property havokOnTelekinesis = True Auto
{Start Havok Sim when grabbed targetted by Telekinesis? Default: True}

Event OnCellAttach()
	If (beenSimmed == False && Self.Is3DLoaded()) 		
;		setMotionType(Motion_Keyframed, True) 		; edit by ANDR
		setMotionType(Motion_Keyframed, False) 		; edit by ANDR
; 		;debug.trace("havok disabled on: " + self)		
		Self.MoveToMyEditorLocation()				; edit by ANDR	-> this has the object reset its position. Failsafe if the script loads too late.	
	EndIf	
EndEvent

Event OnLoad()
	If (beenSimmed == False && Self.Is3DLoaded())		
;		setMotionType(Motion_Keyframed, True) 		; edit by ANDR
		setMotionType(Motion_Keyframed, False) 		; edit by ANDR
; 		;debug.trace("havok disabled on: " + self)
;		Self.MoveToMyEditorLocation()				; edit by ANDR	-> this has the object reset its position. Failsafe if the script loads too late.	
	EndIf												
EndEvent

Event OnActivate(ObjectReference triggerRef)
	If havokonActivate == True && beenSimmed == False
		ReleaseToHavok()
	EndIf
EndEvent

Event OnHit(ObjectReference var1, Form var2, Projectile var3, Bool var4, Bool var5, Bool var6, Bool var7)
	If havokOnHit == True && beenSimmed == False 
		ReleaseToHavok()
	EndIf
EndEvent

Event OnGrab()
	If havokOnZkey == True && beenSimmed == False
		ReleaseToHavok()
	EndIf
EndEvent

; start edit by ANDR

; not an actual event. This was hinted at in this thread, but doesn't actually seem to do anything: https://forums.nexusmods.com/index.php?/topic/3082689-havok-disable-scripts-that-actually-works-here-it-is/
;Event OnLoadGame()																	; Disable havok on Load Game.
;    If (beenSimmed == False && Self.Is3DLoaded())
;;		setMotionType(Motion_Keyframed, True) 		
;		setMotionType(Motion_Keyframed, False)	
;    EndIf
;EndEvent

; this doesn't always work. Not sure how to actually make it work?
Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)			; new Event to disable havok when telekinesis spell is used on object
	If akEffect.HasKeyword(Game.GetFormFromFile(0x0007F404, "Skyrim.esm") as Keyword)		; 7F404 in Skyrim.esm refers to the MagicTelekinesis keyword.
		If havokOnTelekinesis == True && beenSimmed == False
			ReleaseToHavok()		
		EndIf
	EndIf
EndEvent

; end edit by ANDR

;USKP 2.0.1 - Added Event to deal with Papyrus spam caused by the player picking these things up since the game cannot process that properly.
Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	If( akNewContainer != None )
		;Stops the OnLoad Event from generating errors.
		beenSimmed = True
	Else
		;No container, means it's being dropped in the open. Let it loose now.
		ReleaseToHavok()
	EndIf
EndEvent

Function ReleaseToHavok()
		beenSimmed = True
		objectReference myLink = getLinkedRef(linkHavokPartner)
		If myLink != NONE
			DefaultDisableHavokOnLoad linkScript = myLink as DefaultDisableHavokOnLoad
			If (linkScript)  && (linkScript.beenSimmed == False)
				linkScript.ReleaseToHavok()
			EndIf
		EndIf
		setMotionType(Motion_Dynamic, True)
		Self.ApplyHavokImpulse(0, 0, 1, 5)
; 		Debug.Trace("Released Havok.")
EndFunction