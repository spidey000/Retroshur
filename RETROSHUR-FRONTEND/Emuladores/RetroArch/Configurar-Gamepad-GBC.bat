@echo off
set HOME="%~dp0"
copy mandos_handheld.cfg %~dp0\config\gbc\mandos_handheld.cfg

CD /D %HOME%\config\gbc\
del retroarch-base-GBC.cfg
del retroshur.cfg
copy retroarch-base-GBC.cfg.bak retroarch-base-GBC.cfg
echo.>>retroarch-base-GBC.cfg
type mandos_handheld.cfg >>retroarch-base-GBC.cfg
copy retroarch-base-GBC.cfg retroshur_listo.cfg
move /y retroshur_listo.cfg retroshur.cfg

exit /b %ERRORLEVEL%

