@echo off
set HOME="%~dp0"
copy /y mandos_handheld.cfg %~dp0\config\dosbox\mandos_handheld.cfg

CD /D %HOME%\config\dosbox\
del retroarch-base-DOSBOX.cfg
del retroshur.cfg
copy /y retroarch-base-DOSBOX.cfg.bak retroarch-base-DOSBOX.cfg
echo.>>retroarch-base-DOSBOX.cfg
type mandos_handheld.cfg >>retroarch-base-DOSBOX.cfg
copy /y retroarch-base-DOSBOX.cfg retroshur_listo.cfg
move /y retroshur_listo.cfg retroshur.cfg

exit /b %ERRORLEVEL%