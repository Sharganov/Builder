if "%main%"=="" goto :EOF

echo Checking build consistency...
for /F "tokens=*" %%i in (files.txt) do if not exist %REPO_PATH%\GUI\bin\Release\%i% set MISSEDFILE=%%i& set CHECK_FAILED=true 
