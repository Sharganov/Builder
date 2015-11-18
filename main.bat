@echo off
set main=true

echo Starting...

call settings.bat
call remove.bat
call clone.bat
if %CLONE_FAILED%==true goto :notify
call build.bat
if %BUILD_FAILED%==true goto :notify
call check.bat
if %CHECK_FAILED%==true goto :notify
call  test.bat

:notify
call notify.bat