if "%main%"=="" goto :EOF

echo Removing the old repository...
if exist %REPO_PATH% rmdir /s /q %REPO_PATH%
