#NoTrayIcon

#IfWinExist, Citra
WinMaximize, Citra
return

#Persistent  ; Keep this script running until the user explicitly exits it.
SetTimer, WatchAxis, 5
SetTimer, WatchPOV, 5
return

; Joy8::
; If GetKeyState("Joy9", "p")
; WinClose, Citra
; return

; Joy4::
; If GetKeyState("Joy9", "p")
; send ^{TAB}
; return

Joy2::
send A ; 3DS A
return

Joy1::
send S ; 3DS B
return

Joy4::
send X ; 3DS Y
If GetKeyState("Joy9", "p")
send ^{TAB}
return

Joy3::
send Z ; 3DS X
return

Joy5::
send Q ; 3DS L
return

Joy6::
send W ; 3DS R
return

Joy8::
send M ; 3DS Start
If GetKeyState("Joy9", "p")
WinClose, Citra
return

Joy7::
send N ; 3DS Select
return

Joy10::
send B ; 3DS Home
return

WatchAxis:

GetKeyState, JoyX, JoyX  ; Get position of X axis.
GetKeyState, JoyY, JoyY  ; Get position of Y axis.
GetKeyState, JoyR, JoyR  ; Get position of X axis.
GetKeyState, JoyU, JoyU  ; Get position of Y axis.
KeyToHoldDownPrev = %KeyToHoldDown%  ; Prev now holds the key that was down before (if any).

if JoyX > 70
    KeyToHoldDown = Right
else if JoyX < 30
    KeyToHoldDown = Left
else if JoyY > 70
    KeyToHoldDown = Down
else if JoyY < 30
    KeyToHoldDown = Up
else if JoyR > 70
    KeyToHoldDown = L
else if JoyR < 30
    KeyToHoldDown = J
else if JoyU > 70
    KeyToHoldDown = K
else if JoyU < 30
    KeyToHoldDown = I
else
    KeyToHoldDown =

if KeyToHoldDown = %KeyToHoldDownPrev%  ; The correct key is already down (or no key is needed).
    return  ; Do nothing.

; Otherwise, release the previous key and press down the new key:
SetKeyDelay -1  ; Avoid delays between keystrokes.
if KeyToHoldDownPrev   ; There is a previous key to release.
    Send, {%KeyToHoldDownPrev% up}  ; Release it.
if KeyToHoldDown   ; There is a key to press down.
    Send, {%KeyToHoldDown% down}  ; Press it down.
return

WatchPOV:
GetKeyState, POV, JoyPOV  ; Get position of the POV control.
KeyToHoldDownPrev = %KeyToHoldDown%  ; Prev now holds the key that was down before (if any).

; Some joysticks might have a smooth/continous POV rather than one in fixed increments.
; To support them all, use a range:
if POV < 0   ; No angle to report
    KeyToHoldDown =
else if POV > 31500                 ; 315 to 360 degrees: Forward
    KeyToHoldDown = T
else if POV between 0 and 4500      ; 0 to 45 degrees: Forward
    KeyToHoldDown = T
else if POV between 4501 and 13500  ; 45 to 135 degrees: Right
    KeyToHoldDown = H
else if POV between 13501 and 22500 ; 135 to 225 degrees: Down
    KeyToHoldDown = G
else                                ; 225 to 315 degrees: Left
    KeyToHoldDown = F

if KeyToHoldDown = %KeyToHoldDownPrev%  ; The correct key is already down (or no key is needed).
    return  ; Do nothing.

; Otherwise, release the previous key and press down the new key:
SetKeyDelay -1  ; Avoid delays between keystrokes.
if KeyToHoldDownPrev   ; There is a previous key to release.
    Send, {%KeyToHoldDownPrev% up}  ; Release it.
if KeyToHoldDown   ; There is a key to press down.
    Send, {%KeyToHoldDown% down}  ; Press it down.
return
