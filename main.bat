@echo off
set main=true

echo Starting...

call settings.bat
call remove.bat
call clone.bat
if %CLONE_FAILED%==true goto :sending
call build.bat
if %BUILD_FAILED%==true goto :sending
call check.bat
if %CHECK_FAILED%==true goto :sending
call  test.bat

:sending
call email.bat
