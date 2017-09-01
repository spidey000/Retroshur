::script adaptado para RETROSHUR
@echo off
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0AutoHotKey*"') Do (set AUTOHOTKEY="%~dp0%%D")
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0Backgrounds*"') Do (set BCK="%~dp0%%D")
::ARRIBA: aqui se pone el codigo que se llama desde es_systems.cfg y que con el "goto" lanza ABAJO los comandos para lazar Retroarch

if "%1"=="amiga" goto :RETROARCH-AMIGA
if "%1"=="atari2600" goto :RETROARCH-A2600
if "%1"=="atari7800" goto :RETROARCH-A7800
if "%1"=="amstradcpc" goto :RETROARCH-AMSTRADCPC
if "%1"=="c64" goto :RETROARCH-C64
if "%1"=="coleco" goto :RETROARCH-COLECO
if "%1"=="cps1" goto :RETROARCH-CAPCOM
if "%1"=="cps2" goto :RETROARCH-CAPCOM2
if "%1"=="cps3" goto :RETROARCH-CAPCOM3
if "%1"=="doom" goto :DOOMBROLAUNCHER
if "%1"=="dosbox" goto :RETROARCH-DOSBOX
if "%1"=="dreamcast" goto :DEMUL
if "%1"=="gamegear" goto :RETROARCH-GAMEGEAR
if "%1"=="gb" goto :RETROARCH-GB
if "%1"=="gba" goto :RETROARCH-GBA
if "%1"=="gbc" goto :RETROARCH-GBC
if "%1"=="gc" goto :DOLPHIN
if "%1"=="mame" goto :RETROARCH-MAME
if "%1"=="mastersystem" goto :RETROARCH
if "%1"=="megadrive" goto :RETROARCH
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

exit /b %ERRORLEVEL%


::ABAJO: codigo para lanzar retroarch por sistemas

:RetroArch-AMIGA
::start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\amiga\launching.jpg
call %2 & FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --config "%~dp0%%D\config\amiga\retroshur.cfg" -L "%~dp0%%D\cores\%3" \.uaerc -f)
goto :EXIT


:RetroArch-A2600
::start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\atari2600\launching.jpg
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Atari 2600" -r %2)
goto :EXIT

:RetroArch-A7800
::start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\atari7800\launching.jpg
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Atari 7800" -r %2)
goto :EXIT

:RetroArch-C64
::start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\c64\launching.jpg
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Commodore 64" -r %2)
goto :EXIT

:RetroArch-COLECO
::start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\coleco\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0bluemsx*"') Do ("%~dp0%%D\blueMSX.exe" /machine "COL - ColecoVision with Opcode Memory Extension" /rom1 %2 /romtype1 "113" /fullscreen)
goto :EXIT

:RetroArch-CAPCOM
::start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\arcade\launching.jpg
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Capcom Play System" -r %2)
goto :EXIT

:RetroArch-CAPCOM2
::start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\arcade\launching.jpg
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Capcom Play System II" -r %2)
goto :EXIT

:RetroArch-CAPCOM3
::start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\arcade\launching.jpg
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Capcom Play System III" -r %2)
goto :EXIT



:DOOMBROLAUNCHER
::start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\doom\launching.jpg
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0DoomBroLauncher*"') Do (FOR /f "tokens=*" %%A IN ('dir /b "%~dp0%%D\DoomBroLauncher\port\gzdoom*.exe"') DO ("%~dp0%%D\%%A" %2))
goto :EXIT

:RetroArch-DOSBOX
::start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\dosbox\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --config "%~dp0%%D\config\dosbox\dosbox.conf" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RetroArch-GAMEGEAR
::start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\gamegear\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --config "%~dp0%%D\config\gamegear\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RetroArch-GB
::start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\gb\launching.jpg
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Nintendo Game Boy" -r %2)
goto :EXIT

:RetroArch-GBA
::start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\gba\launching.jpg
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Nintendo Game Boy Advance" -r %2)
goto :EXIT

:RetroArch-GBC
::start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\gbc\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Nintendo Game Boy Color" -r %2)
goto :EXIT


:RetroArch-MAME
::start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\mame\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\mame\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RetroArch-SEGACD
::start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\segacd\launching.jpg
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "sega CD" -r %2)
goto :EXIT

:DOLPHIN
::start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\dolphin\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0dolphin*"') Do (FOR /f "tokens=*" %%A IN ('dir /b "%~dp0%%D\Dolphin.exe"') DO ("%~dp0%%D\%%A" /b /e %2))
goto :EXIT


:PCSX2
::start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\pcsx2\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" PCSX2.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0pcsx2*"') Do (FOR /f "tokens=*" %%A IN ('dir /b "%~dp0%%D\PCSX2*.exe"') DO ("%~dp0%%D\%%A" %2 --fullscreen --nogui))
goto :EXIT



:PPSSPP
::start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\ppsspp\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" PPSSPP.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0ppsspp*"') Do (FOR /f "tokens=*" %%A IN ('dir /b "%~dp0%%D\ppsspp*64.exe"') DO ("%~dp0%%D\%%A" %2 --escapeexitsemu --fullscreen))
goto :EXIT

:DEMUL
::start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\demul\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Demul.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0demul*"') Do (FOR /f "tokens=*" %%A IN ('dir /b "%~dp0%%D\demul*.exe"') DO ("%~dp0%%D\%%A" -run=dc -image=%2))
goto :EXIT


:RetroArch
::start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\retroarch\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\retroarch\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RetroArch-ZXSPECTRUM
::start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\zxspectrum\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\retroarch\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RetroArch-PCENGINE
::start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\pcengine\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\pcengine\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RetroArch-NDS
::start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\nds\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\nds\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT


:RetroArch-NEOGEO
::start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\neogeo\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\neogeo\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RetroArch-PSX
::start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\psx\launching.jpg
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Sony Playstation" -r %2)
goto :EXIT

:RetroArch-N64
::start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\n64\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Nintendo 64" -r %2)
goto :EXIT

:RetroArch-NES
::start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\nes\launching.jpg
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Nintendo Entertainment System" -r %2)
goto :EXIT

:RetroArch-SNES
::start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\snes\launching.jpg
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Super Nintendo Entertainment System" -r %2)
goto :EXIT

:RetroArch-SEGA32X
::start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\sega32x\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Sega 32X" -r %2)
goto :EXIT

:RetroArch-MSX
::start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\msx\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\msx\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RetroArch-AMSTRADCPC
::start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\amstradcpc\launching.jpg
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0RocketLauncher*"') Do ("%~dp0%%D\RocketLauncher.exe" -s "Amstrad CPC" -r %2)
goto :EXIT


:CEMU
::start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\cemu\launching.jpg
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

:EXIT
taskkill /F /IM AutoHotKeyU64.exe /T
::taskkill /F /IM Frameless.exe /T
::start "Frameless" /d %BCK% "nircmd.exe" killprocess "Frameless.exe"

exit /b %ERRORLEVEL%