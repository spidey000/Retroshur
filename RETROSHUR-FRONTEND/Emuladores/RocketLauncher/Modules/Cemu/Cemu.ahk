MEmu = Cemu
MEmuV = v1.5.2
MURL = http://cemu.info/
MAuthor = djvj
MVersion = 1.0.3
MCRC = 2EF49C0F
iCRC = 317C6C8
mId = 635803743205902402
MSystem = "Nintendo Wii U"
;----------------------------------------------------------------------------
; Notes:
; Make sure the keys.txt in the emu root folder contains a Wii U common key.
; Do not ask where to get this, it's your job to figure this out.
;----------------------------------------------------------------------------
StartModule()
BezelGUI()
FadeInStart()

primaryExe := new Emulator(emuPath . "\" . executable)					; instantiate emulator executable object
emuPrimaryWindow := new Window(new WindowTitle("CEMU","wxWindowNR"))	; instantiate primary emulator window object

Fullscreen := moduleIni.Read("Settings", "Fullscreen","true","",1)

; dialogOpen := i18n("dialog.open")	; Looking up local translation
hideEmuObj := Object(emuPrimaryWindow,1)
7z(romPath, romName, romExtension, sevenZExtractPath)

BezelStart("FixResMode")
HideAppStart(hideEmuObj,hideEmu)

primaryExe.Run(" """ . romPath . "\" . romName . romExtension . """")

emuPrimaryWindow.Wait()
emuPrimaryWindow.WaitActive()

If (fullscreen = "true")
	emuPrimaryWindow.MenuSelectItem("Options","Fullscreen")

; Load image
; emuPrimaryWindow.WinMenuSelectItem("File","Load")
; OpenROM("Open file to launch", romPath . "\" . romName . romExtension)
; emuPrimaryWindow.WaitActive()

BezelDraw()
HideAppEnd(hideEmuObj,hideEmu)
FadeInExit()
primaryExe.Process("WaitClose")
7zCleanUp()
BezelExit()
FadeOutExit()
ExitModule()


CloseProcess:
	FadeOutStart()
	emuPrimaryWindow.Close()
Return
