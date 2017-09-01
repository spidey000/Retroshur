@echo off
set HOME="%~dp0"
copy /y mandos_handheld.cfg %~dp0\config\gamegear\mandos_handheld.cfg

CD /D %HOME%\config\gamegear\
del retroarch-base-GG.cfg
del retroshur.cfg
copy /y retroarch-base-GG.cfg.bak retroarch-base-GG.cfg
echo.>>retroarch-base-GG.cfg
type mandos_handheld.cfg >>retroarch-base-GG.cfg
copy /y retroarch-base-GG.cfg retroshur_listo.cfg
move /y retroshur_listo.cfg retroshur.cfg

exit /b %ERRORLEVEL%





