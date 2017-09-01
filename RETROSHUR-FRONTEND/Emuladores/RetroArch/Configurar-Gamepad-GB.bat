@echo off
set HOME="%~dp0"
copy mandos_handheld.cfg %~dp0\config\gb\mandos_handheld.cfg
CD /D %HOME%\config\gb\
del retroarch-base-GB.cfg
del retroshur.cfg
copy retroarch-base-GB.cfg.bak retroarch-base-GB.cfg
echo.>>retroarch-base-GB.cfg
type mandos_handheld.cfg >>retroarch-base-GB.cfg
copy retroarch-base-GB.cfg retroshur_listo.cfg
move /y retroshur_listo.cfg retroshur.cfg

exit /b 


