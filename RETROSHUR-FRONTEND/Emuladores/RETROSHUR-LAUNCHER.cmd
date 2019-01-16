::script adaptado para RETROSHUR
:: Modo Rocket-Launcher OFF
:: Modo Normal ON
@echo off
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0AutoHotKey*"') Do (set AUTOHOTKEY="%~dp0%%D")
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
::if "%1"=="doom" goto :DOOMBROLAUNCHER
if "%1"=="dosbox" goto :RETROARCH-DOSBOX
if "%1"=="dreamcast" goto :DEMUL
if "%1"=="gamegear" goto :RETROARCH-GAMEGEAR
if "%1"=="gb" goto :RETROARCH-GB
if "%1"=="gba" goto :RETROARCH-GBA
if "%1"=="gbc" goto :RETROARCH-GBC
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
if "%1"=="vectrex" goto :RETROARCH-VECTREX
if "%1"=="wonderswan" goto :RetroArch-WONDERSWAN
if "%1"=="wonderswancolor" goto RetroArch-WONDERSWANCOLOR
if "%1"=="gameandwatch" goto :RETROARCH-GW
if "%1"=="zxspectrum" goto :RETROARCH-ZXSPECTRUM
exit /b %ERRORLEVEL%


::ABAJO: codigo para lanzar retroarch por sistemas

:RetroArch-AMIGA
call %2 & FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --config "%~dp0%%D\config\amiga\retroshur.cfg" -L "%~dp0%%D\cores\%3" \.uaerc -f)
goto :EXIT

:RetroArch-GAMEGEAR
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --config "%~dp0%%D\config\gamegear\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RetroArch-MAME
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\mame\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RetroArch-SEGACD
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\retroarch\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:DOLPHIN
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0dolphin*"') Do (FOR /f "tokens=*" %%A IN ('dir /b "%~dp0%%D\Dolphin.exe"') DO ("%~dp0%%D\%%A" /b /e %2))
goto :EXIT


:PCSX2
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" PCSX2.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0pcsx2*"') Do (FOR /f "tokens=*" %%A IN ('dir /b "%~dp0%%D\PCSX2*.exe"') DO ("%~dp0%%D\%%A" %2 --fullscreen --nogui))
goto :EXIT

:RetroArch-COLECO
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0bluemsx*"') Do ("%~dp0%%D\blueMSX.exe" /machine "COL - ColecoVision with Opcode Memory Extension" /rom1 %2 /romtype1 "113" /fullscreen)
goto :EXIT


:PPSSPP
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" PPSSPP.ahk
::FOR /f "tokens=*" %%D IN ('dir /b "%~dp0ppsspp*"') Do (FOR /f "tokens=*" %%A IN ('dir /b "%~dp0%%D\ppsspp*64.exe"') DO ("%~dp0%%D\%%A" %2 --escapeexitsemu --fullscreen))
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\psp\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RetroArch-C64
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\c64\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT


:DOOMBROLAUNCHER
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0DoomBroLauncher*"') Do (FOR /f "tokens=*" %%A IN ('dir /b "%~dp0%%D\DoomBroLauncher\port\gzdoom*.exe"') DO ("%~dp0%%D\%%A" %2))
goto :EXIT

:DEMUL
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Demul.ahk
::FOR /f "tokens=*" %%D IN ('dir /b "%~dp0demul*"') Do (FOR /f "tokens=*" %%A IN ('dir /b "%~dp0%%D\demul*.exe"') DO ("%~dp0%%D\%%A" -run=dc -image=%2))
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\Dreamcast\retroshur.cfg" -L "%~dp0%%D\cores\reicast_libretro.dll" %2 -f)
goto :EXIT


:RETROARCH-MASTERSYSTEM
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\mastersystem\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RETROARCH-MEGADRIVE
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\megadrive\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RetroArch-ZXSPECTRUM
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\zxspectrum\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
::FOR /f "tokens=*" %%D IN ('dir /b "%~dp0Zxspectrum*"') Do (FOR /f "tokens=*" %%A IN ('dir /b "%~dp0%%D\Spectaculator*.exe"') DO ("%~dp0%%D\%%A" %2))
goto :EXIT


:RetroArch-A7800
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\atari7800\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT



:RetroArch-PCENGINE
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\pcengine\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RetroArch-NDS
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\nds\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RetroArch-CAPCOM1
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\cps1\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RetroArch-CAPCOM2
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\cps2\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RetroArch-CAPCOM3
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\cps3\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RetroArch-NEOGEO
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\neogeo\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RetroArch-A2600
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\atari2600\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RETROARCH-ALYNX
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\atarilynx\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT


:RETROARCH-AJAGUAR
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\atarijaguar\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT


:RetroArch-PSX
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\psx\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RetroArch-N64
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\n64\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RetroArch-NES
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\nes\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RetroArch-SNES
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\snes\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RETROARCH-VECTREX
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\vectrex\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RetroArch-GB
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --config "%~dp0%%D\config\gb\retroshur.cfg"  -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RetroArch-GBA
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --config "%~dp0%%D\config\gba\retroshur.cfg"  -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RetroArch-GBC
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --config "%~dp0%%D\config\gbc\retroshur.cfg"  -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT



:RetroArch-SEGA32X
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --config "%~dp0%%D\config\sega32x\retroshur.cfg"  -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT


:RetroArch-MSX
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\msx\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT


:RetroArch-DOSBOX
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --config "%~dp0%%D\config\dosbox\dosbox.conf" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RetroArch-DOOM
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0DoomBroLauncher*"') Do (FOR /f "tokens=*" %%A IN ('dir /b "%~dp0%%D\DoomBroLauncher\port\gzdoom*.exe"') DO ("%~dp0%%D\%%A" %2))
goto :EXIT


:RetroArch-AMSTRADCPC
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\amstradcpc\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT


:RetroArch-WONDERSWAN
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\wonderswan\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RetroArch-WONDERSWANCOLOR
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\wonderswancolor\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RETROARCH-GW
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\gameandwatch\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:CEMU
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Cemu.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0cemu*"') Do (FOR /f "tokens=*" %%A IN ('dir /b "%~dp0%%D\Cemu*.exe"') DO ("%~dp0%%D\%%A" -f -g %2))
goto :EXIT

:XENIA
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Xenia.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0xenia*"') Do (FOR /f "tokens=*" %%A IN ('dir /b "%~dp0%%D\Xenia*.exe"') DO ("%~dp0%%D\%%A" %2))
goto :EXIT

:RPCS3
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" RPCS3.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0rpcs3*"') Do (FOR /f "tokens=*" %%A IN ('dir /b "%~dp0%%D\rpcs3*.exe"') DO ("%~dp0%%D\%%A" %2))
goto :EXIT

:CITRA
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" CITRA.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0citra*"') Do (FOR /f "tokens=*" %%A IN ('dir /b "%~dp0%%D\citra-qt*.exe"') DO ("%~dp0%%D\%%A" %2))
goto :EXIT

:EXIT
taskkill /F /IM AutoHotKeyU64.exe /T
exit /b %ERRORLEVEL%