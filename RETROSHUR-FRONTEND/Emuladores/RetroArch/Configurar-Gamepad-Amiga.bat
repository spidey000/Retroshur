@echo off
pushd %~dp0
set HOME="%~dp0"
findstr "input_" retroarch.cfg > retroarch-pre.cfg
findstr /v "input_overlay" retroarch-pre.cfg > retroarch-input.cfg
move retroarch-input.cfg %HOME%\config\Amiga\
copy %HOME%\config\Amiga\retroarch-base-Amiga.cfg + %HOME%\config\Amiga\retroarch-input.cfg %HOME%\config\Amiga\retroshur.cfg 
exit /b %ERRORLEVEL%


