Gui -Caption +AlwaysOnTop +ToolWindow +LastFound
Gui, Show, x0 y0 w1 h1,  Invisible Dummy AHK GUI
WinSet, Transparent, 1
Gui, Hide
OnMessage( 0x200, "OnMouseMove" )
Return

#C::
  Gui, Show, x0 y0 w%A_ScreenWidth% h%A_ScreenHeight%
  DllCall( "ShowCursor", UInt,0 )
  SendInput !{Esc}
Return

OnMouseMove() {
 Static Counter
        Counter++
  If  ( Counter > 20 ) { ; If mouse is moved more than 20 pixels
        Counter := 0   ,   DllCall( "ShowCursor", UInt,1 )
        Gui, Hide
}}