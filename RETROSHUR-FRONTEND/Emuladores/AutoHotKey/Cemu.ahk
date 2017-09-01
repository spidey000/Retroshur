#NoTrayIcon

#IfWinExist, CEMU
sleep 5000 ; 5 Seconds
WinActivate, CEMU
return

joy9::
; Increase the following value to make the mouse cursor move faster:
JoyMultiplier = 0.20

; Decrease the following value to require less joystick displacement-from-center
; to start moving the mouse.  However, you may need to calibrate your joystick
; -- ensuring it's properly centered -- to avoid cursor drift. A perfectly tight
; and centered joystick could use a value of 1:
JoyThreshold = 4

; Change the following to true to invert the R-axis, which causes the mouse to
; move vertically in the direction opposite the stick:
InvertRAxis := false

; Change these values to use joystick button numbers other than 1, 2, and 3 for
; the left, right, and middle mouse buttons.  Available numbers are 1 through 32.
; Use the Joystick Test Script to find out your joystick's numbers more easily.
ButtonLeft = 10
ButtonRight = 1

; If your system has more than one joystick, increase this value to use a joystick
; other than the first:
JoystickNumber = 1

; END OF CONFIG SECTION -- Don't change anything below this point unless you want
; to alter the basic nature of the script.

#SingleInstance

JoystickPrefix = %JoystickNumber%Joy
Hotkey, %JoystickPrefix%%ButtonLeft%, ButtonLeft
Hotkey, %JoystickPrefix%%ButtonRight%, ButtonRight

; Calculate the axis displacements that are needed to start moving the cursor:
JoyThresholdUpper := 50 + JoyThreshold
JoyThresholdLower := 50 - JoyThreshold
if InvertRAxis
	RAxisMultiplier = -1
else
	RAxisMultiplier = 1

SetTimer, WatchJoystick, 10  ; Monitor the movement of the joystick.

return  ; End of auto-execute section.


; The subroutines below do not use KeyWait because that would sometimes trap the
; WatchJoystick quasi-thread beneath the wait-for-button-up thread, which would
; effectively prevent mouse-dragging with the joystick.

ButtonLeft:
SetMouseDelay, -1  ; Makes movement smoother.
MouseClick, left,,, 1, 0, D  ; Hold down the left mouse button.
SetTimer, WaitForLeftButtonUp, 10
return

ButtonRight:
SetMouseDelay, -1  ; Makes movement smoother.
MouseClick, right,,, 1, 0, D  ; Hold down the right mouse button.
SetTimer, WaitForRightButtonUp, 10
return

WaitForLeftButtonUp:
if not GetKeyState("Joy9")
{
	SetTimer, WaitForLeftButtonUp, off
}
if GetKeyState(JoystickPrefix . ButtonLeft)
	return  ; The button is still, down, so keep waiting.
; Otherwise, the button has been released.
SetTimer, WaitForLeftButtonUp, off
SetMouseDelay, -1  ; Makes movement smoother.
MouseClick, left,,, 1, 0, U  ; Release the mouse button.
return

WaitForRightButtonUp:
if not GetKeyState("Joy9")
{
	SetTimer, WaitForRightButtonUp, off
}
if GetKeyState(JoystickPrefix . ButtonRight)
	return  ; The button is still, down, so keep waiting.
; Otherwise, the button has been released.
SetTimer, WaitForRightButtonUp, off
MouseClick, right,,, 1, 0, U  ; Release the mouse button.
return

WatchJoystick:
MouseNeedsToBeMoved := false  ; Set default.
SetFormat, float, 03
GetKeyState, joyu, %JoystickNumber%JoyU
GetKeyState, joyr, %JoystickNumber%JoyR
if joyu > %JoyThresholdUpper%
{
	MouseNeedsToBeMoved := true
	DeltaU := joyu - JoyThresholdUpper
}
else if joyu < %JoyThresholdLower%
{
	MouseNeedsToBeMoved := true
	DeltaU := joyu - JoyThresholdLower
}
else
	DeltaU = 0
if joyr > %JoyThresholdUpper%
{
	MouseNeedsToBeMoved := true
	DeltaR := joyr - JoyThresholdUpper
}
else if joyr < %JoyThresholdLower%
{
	MouseNeedsToBeMoved := true
	DeltaR := joyr - JoyThresholdLower
}
else
	DeltaR = 0
if MouseNeedsToBeMoved
{
	SetMouseDelay, -1  ; Makes movement smoother.
	MouseMove, DeltaU * JoyMultiplier, DeltaR * JoyMultiplier * RAxisMultiplier, 0, R
}
if not GetKeyState("Joy9")
{
	SetTimer, WatchJoystick, OFF
}
return

Hotkey, %JoystickPrefix%%ButtonLeft%, off
Hotkey, %JoystickPrefix%%ButtonRight%, off

Joy8::
If GetKeyState("Joy9", "p")
WinClose, CEMU
return

Joy4::
If GetKeyState("Joy9", "p")
send ^{TAB}
return