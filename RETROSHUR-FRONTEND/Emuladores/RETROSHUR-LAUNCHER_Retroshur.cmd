::script adaptado para RETROSHUR
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
::if "%1"=="doom" goto :DOOMBROLAUNCHER
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
if "%1"=="wonderswancolor" goto RetroArch-WONDERSWANCOLOR


exit /b %ERRORLEVEL%


::ABAJO: codigo para lanzar retroarch por sistemas

:RetroArch-AMIGA
start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\amiga\launching.jpg
call %2 & FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --config "%~dp0%%D\config\amiga\retroshur.cfg" -L "%~dp0%%D\cores\%3" \.uaerc -f)
goto :EXIT

:RetroArch-GAMEGEAR
start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\gamegear\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --config "%~dp0%%D\config\gamegear\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RetroArch-MAME
start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\mame\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\mame\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RetroArch-SEGACD
start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\segacd\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\retroarch\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:DOLPHIN
start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\dolphin\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0dolphin*"') Do (FOR /f "tokens=*" %%A IN ('dir /b "%~dp0%%D\Dolphin.exe"') DO ("%~dp0%%D\%%A" /b /e %2))
goto :EXIT


:PCSX2
start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\pcsx2\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" PCSX2.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0pcsx2*"') Do (FOR /f "tokens=*" %%A IN ('dir /b "%~dp0%%D\PCSX2*.exe"') DO ("%~dp0%%D\%%A" %2 --fullscreen --nogui))
goto :EXIT

:RetroArch-COLECO
start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\coleco\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0bluemsx*"') Do ("%~dp0%%D\blueMSX.exe" /machine "COL - ColecoVision with Opcode Memory Extension" /rom1 %2 /romtype1 "113" /fullscreen)
goto :EXIT

:: comienzo --coolcv
::otro emulador para colecovision si quieres usarlo quita los dos puntos de cada linea NO si antes ponerselos a la opcion de :retroarch-coleco de arriba.
:::RetroArch-COLECO
::start "black screen" /d %AUTOHOTKEY% "BlackScreen.exe"
::start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Cemu.ahk
::FOR /f "tokens=*" %%D IN ('dir /b "%~dp0coolcv*"') Do (FOR /f "tokens=*" %%A IN ('dir /b "%~dp0%%D\CoolCV*.exe"') DO ("%~dp0%%D\%%A" %2))
::goto :EXIT
:: fin --coolcv



:PPSSPP
start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\ppsspp\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" PPSSPP.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0ppsspp*"') Do (FOR /f "tokens=*" %%A IN ('dir /b "%~dp0%%D\ppsspp*64.exe"') DO ("%~dp0%%D\%%A" %2 --escapeexitsemu --fullscreen))
goto :EXIT

:RetroArch-C64
start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\c64\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\c64\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT


:DEMUL
start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\demul\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Demul.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0demul*"') Do (FOR /f "tokens=*" %%A IN ('dir /b "%~dp0%%D\demul*.exe"') DO ("%~dp0%%D\%%A" -run=dc -image=%2))
goto :EXIT


:RetroArch
start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\retroarch\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\wonderswancolor\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RetroArch-ZXSPECTRUM
start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\zxspectrum\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\retroarch\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT


:RetroArch-A7800
start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\atari7800\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\atari7800\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT



:RetroArch-PCENGINE
start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\pcengine\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\pcengine\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RetroArch-NDS
start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\nds\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\nds\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RetroArch-CAPCOM1
start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\capcom\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\cps1\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RetroArch-CAPCOM2
start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\capcom\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\cps2\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RetroArch-CAPCOM3
start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\capcom\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\cps3\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RetroArch-NEOGEO
start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\neogeo\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\neogeo\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RetroArch-A2600
start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\atari2600\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\atari2600\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RETROARCH-ALYNX
start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\atarilynx\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\atarilynx\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT


:RETROARCH-AJAGUAR
start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\atarijaguar\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\atarijaguar\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT


:RetroArch-PSX
start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\psx\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\psx\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RetroArch-N64
start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\n64\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\n64\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RetroArch-NES
start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\nes\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\nes\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RetroArch-SNES
start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\snes\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\snes\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RetroArch-GB
start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\gb\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --config "%~dp0%%D\config\gb\retroshur.cfg"  -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RetroArch-GBA
start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\gba\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --config "%~dp0%%D\config\gba\retroshur.cfg"  -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RetroArch-GBC
start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\gbc\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --config "%~dp0%%D\config\gbc\retroshur.cfg"  -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT



:RetroArch-SEGA32X
start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\sega32x\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --config "%~dp0%%D\config\sega32x\retroshur.cfg"  -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT


:RetroArch-MSX
start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\msx\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\msx\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT


:RetroArch-DOSBOX
start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\dosbox\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --config "%~dp0%%D\config\dosbox\dosbox.conf" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT

:RetroArch-DOOM
start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\doom\launching.jpg
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0DoomBroLauncher*"') Do (FOR /f "tokens=*" %%A IN ('dir /b "%~dp0%%D\DoomBroLauncher\port\gzdoom*.exe"') DO ("%~dp0%%D\%%A" %2))
goto :EXIT


:RetroArch-AMSTRADCPC
start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\amstradcpc\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\amstradcpc\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT


:RetroArch-WONDERSWANCOLOR
start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\wonderswancolor\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Mouse.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0retroarch*"') Do ("%~dp0%%D\retroarch.exe" --appendconfig "%~dp0%%D\config\wonderswancolor\retroshur.cfg" -L "%~dp0%%D\cores\%3" %2 -f)
goto :EXIT




:CEMU
start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\cemu\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Cemu.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0cemu*"') Do (FOR /f "tokens=*" %%A IN ('dir /b "%~dp0%%D\Cemu*.exe"') DO ("%~dp0%%D\%%A" -f -g %2))
goto :EXIT

:XENIA
start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\xenia\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" Xenia.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0xenia*"') Do (FOR /f "tokens=*" %%A IN ('dir /b "%~dp0%%D\Xenia*.exe"') DO ("%~dp0%%D\%%A" %2))
goto :EXIT

:RPCS3
start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\rpcs3\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" RPCS3.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0rpcs3*"') Do (FOR /f "tokens=*" %%A IN ('dir /b "%~dp0%%D\rpcs3*.exe"') DO ("%~dp0%%D\%%A" %2))
goto :EXIT

:CITRA
start "Frameless" /d %BCK% "Frameless.exe" %~dp0Backgrounds\citra\launching.jpg
start "autohotkey" /d %AUTOHOTKEY% "AutoHotkeyU64.exe" CITRA.ahk
FOR /f "tokens=*" %%D IN ('dir /b "%~dp0citra*"') Do (FOR /f "tokens=*" %%A IN ('dir /b "%~dp0%%D\citra-qt*.exe"') DO ("%~dp0%%D\%%A" %2))
goto :EXIT

:EXIT
taskkill /F /IM AutoHotKeyU64.exe /T
taskkill /F /IM Frameless.exe /T
start "nircmd" /d %BCK% "nircmd.exe" killprocess "Frameless.exe"

exit /b %ERRORLEVEL%