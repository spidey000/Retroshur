@echo off
set HOME="%~dp0"
copy /y mandos_handheld.cfg %~dp0\config\gba\mandos_handheld.cfg

CD /D %HOME%\config\gba\
del retroarch-base-GBA.cfg
del retroshur.cfg
copy /y retroarch-base-GBA.cfg.bak retroarch-base-GBA.cfg
echo.>>retroarch-base-GBA.cfg
type mandos_handheld.cfg >>retroarch-base-GBA.cfg
copy /y retroarch-base-GBA.cfg retroshur_listo.cfg
move /y retroshur_listo.cfg retroshur.cfg

exit /b %ERRORLEVEL%
