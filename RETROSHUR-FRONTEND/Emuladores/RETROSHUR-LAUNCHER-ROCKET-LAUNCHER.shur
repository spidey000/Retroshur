::script adaptado para RETROSHUR
:: Modo Rocket-Launcher ON
:: Modo Normal off
@echo off
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0AutoHotKey*"') Do (set AUTOHOTKEY="%~dp0%%D")
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0Backgrounds*"') Do (set BCK="%~dp0%%D")
::ARRIBA: aqui se pone el codigo que se llama desde es_systems.cfg y que con el "goto" lanza ABAJO los comandos para lazar Retroarch

if "%1"=="amiga" goto :RETROARCH-AMIGA
if "%1"=="atari2600" goto :RETROARCH-A2600
if "%1"=="atari7800" goto :RETROARCH-A7800
if "%1"=="atarilynx" goto :RETROARCH-ALYNX
if "%1"=="atarijaguar" goto :RETROARCH-AJAGUAR
if "%1"=="amstradcpc" goto :RETROARCH-AMSTRADCPC
if "%1"=="c64" goto :RETROARCH-C64
if "%1"=="coleco" goto :RETROARCH-COLECO
if "%1"=="cps1" goto :RETROARCH-CAPCOM1
if "%1"=="cps2" goto :RETROARCH-CAPCOM2
if "%1"=="cps3" goto :RETROARCH-CAPCOM3
if "%1"=="dosbox" goto :RETROARCH-DOSBOX
if "%1"=="dreamcast" goto :DEMUL
if "%1"=="gamegear" goto :RETROARCH-GAMEGEAR
if "%1"=="gb" goto :RETROARCH-GB
if "%1"=="gba" goto :RETROARCH-GBA
if "%1"=="gbc" goto :RetroArch-GBC
if "%1"=="gc" goto :DOLPHIN
if "%1"=="mame" goto :RETROARCH-MAME
if "%1"=="mastersystem" goto :RETROARCH-MASTERSYSTEM
if "%1"=="megadrive" goto :RETROARCH-MEGADRIVE
if "%1"=="msx" goto :RETROARCH-MSX
if "%1"=="n3ds" goto :CITRA
if "%1"=="n64" goto :RETROARCH-N64
if "%1"=="nds" goto :RETROARCH-NDS
if "%1"=="neogeo" goto :RETROARCH-NEOGEO
if "%1"=="nes" goto :RETROARCH-NES
if "%1"=="pcengine" goto :RETROARCH-PCENGINE
if "%1"=="ps2" goto :PCSX2
if "%1"=="ps3" goto :RPCS3
if "%1"=="psp" goto :PPSSPP
if "%1"=="psx" goto :RETROARCH-PSX
if "%1"=="sega32x" goto :RETROARCH-SEGA32X
if "%1"=="segacd" goto :RETROARCH-SEGACD
if "%1"=="snes" goto :RETROARCH-SNES
if "%1"=="wii" goto :DOLPHIN
if "%1"=="wiiu" goto :CEMU
if "%1"=="xbox360" goto :XENIA
::if "%1"=="wonderswan" goto :RetroArch-WONDERSWAN
if "%1"=="wonderswancolor" goto RetroArch-WONDERSWANCOLOR
if "%1"=="gameandwatch" goto :RETROARCH-GW
if "%1"=="zxspectrum" goto :RETROARCH-ZXSPECTRUM
exit /b %ERRORLEVEL%


::ABAJO: codigo para lanzar retroarch por sistemas



:RetroArch-AMIGA
::start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\amiga\launching.jpg
call %2 & FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --config "%~dp0%%D\config\amiga\retroshur.cfg" -L "%~dp0%%D\cores\%3" \.uaerc -f)
goto :EXIT


:RetroArch-A2600
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Atari 2600" -r %2)
goto :EXIT

:RetroArch-A7800
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Atari 7800" -r %2)
goto :EXIT

:RETROARCH-ALYNX
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Atari Lynx" -r %2)
goto :EXIT


:RETROARCH-AJAGUAR
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Atari Jaguar" -r %2)
goto :EXIT

:RetroArch-C64
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Commodore 64" -r %2)
goto :EXIT

:RetroArch-CAPCOM1
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Capcom Play System" -r %2)
goto :EXIT

:RetroArch-CAPCOM2
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Capcom Play System II" -r %2)
goto :EXIT

:RetroArch-CAPCOM3
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Capcom Play System III" -r %2)
goto :EXIT


:RetroArch-DOSBOX
::start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\dosbox\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --config "%~dp0%%D\config\dosbox\dosbox.conf" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT


:RetroArch-MAME
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "MAME" -r %2)
goto :EXIT

:RetroArch-SEGACD
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "sega CD" -r %2)
goto :EXIT

:DOLPHIN
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Nintendo Gamecube" -r %2)
goto :EXIT

:PCSX2
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Sony Playstation 2" -r %2)
goto :EXIT

:PPSSPP
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Sony PSP" -r %2)
goto :EXIT

:DEMUL
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Sega Dreamcast" -r %2)
goto :EXIT


:RETROARCH-MASTERSYSTEM
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Sega Master System" -r %2)
goto :EXIT

:RETROARCH-MEGADRIVE
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Sega Mega Drive" -r %2)
goto :EXIT


:RETROARCH-ZXSPECTRUM
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Sinclair ZX Spectrum" -r %2)
goto :EXIT

:RetroArch-NDS
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Nintendo DS" -r %2)
goto :EXIT


:RetroArch-PSX
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Sony Playstation" -r %2)
goto :EXIT

:RetroArch-N64
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Nintendo 64" -r %2)
goto :EXIT

:RetroArch-NES
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Nintendo Entertainment System" -r %2)
goto :EXIT

:RetroArch-SNES
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Super Nintendo Entertainment System" -r %2)
goto :EXIT

:RetroArch-SEGA32X
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Sega 32X" -r %2)
goto :EXIT

:RetroArch-MSX
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Microsoft MSX" -r %2)
goto :EXIT

:CEMU
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Cemu.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0cemu*"') Do (FOR /f "tokens=*" %%A IN ('dir /b "%~dp0%%D\Cemu*.exe"') DO ("%~dp0%%D\%%A" -f -g %2))
goto :EXIT

:XENIA
::start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\xenia\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Xenia.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0xenia*"') Do (FOR /f "tokens=*" %%A IN ('dir /b "%~dp0%%D\Xenia*.exe"') DO ("%~dp0%%D\%%A" %2))
goto :EXIT

:RPCS3
::start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\rpcs3\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" RPCS3.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0rpcs3*"') Do (FOR /f "tokens=*" %%A IN ('dir /b "%~dp0%%D\rpcs3*.exe"') DO ("%~dp0%%D\%%A" %2))
goto :EXIT

:CITRA
::start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\citra\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" CITRA.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0citra*"') Do (FOR /f "tokens=*" %%A IN ('dir /b "%~dp0%%D\citra-qt*.exe"') DO ("%~dp0%%D\%%A" %2))
goto :EXIT

::RetroArch-WONDERSWAN
::FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Bandai Wonderswan" -r %2)
::goto :EXIT

:RetroArch-WONDERSWANCOLOR
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Bandai Wonderswan Color" -r %2)
goto :EXIT

:RetroArch-GW
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Nintendo Game & Watch" -r %2)
goto :EXIT

:RetroArch-GBA
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Nintendo Game Boy Advance" -r %2)
goto :EXIT

:RetroArch-COLECO
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0bluemsx*"') Do ("%~dp0%%D\blueMSX.exe" /machine "COL - ColecoVision with Opcode Memory Extension" /rom1 %2 /romtype1 "113" /fullscreen)
taskkill /F /IM RocketLauncher.exe /T
goto :EXIT

:RetroArch-GB
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Nintendo Game Boy" -r %2)
goto :EXIT

:RetroArch-GAMEGEAR
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Sega Game Gear" -r %2)
goto :EXIT

:RETROARCH-GBC
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Nintendo Game Boy Color" -r %2)
goto :EXIT

:RetroArch-PCENGINE
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "NEC PC Engine" -r %2)
goto :EXIT

:RetroArch-NEOGEO
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "SNK Neo Geo" -r %2)
goto :EXIT

:RetroArch-AMSTRADCPC
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Amstrad CPC" -r %2)
goto :EXIT

:EXIT
::tasklist /FI "IMAGENAME eq Frameless.exe" 2>NUL | find /I /N "Frameless.exe">NUL
::if "%ERRORLEVEL%"=="0" taskkill /f /im Frameless.exe
taskkill /F /IM AutoHotKeyU64.exe /T
::taskkill /F /IM RocketLauncher.exe /T
::taskkill /F /IM Frameless.exe /T
::start "Frameless" /d %BCK% "nircmd.exe" killprocess "Frameless.exe"

exit /b %ERRORLEVEL%