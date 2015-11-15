if "%main%"=="" goto :EOF

echo Cloning...
%GIT% clone %GIT_URL% %REPO_PATH% >nul 2> clone.log
if ERRORLEVEL 1 (
  set CLONE_FAILED=true
  echo Clone failed
) else (
  echo Clone successfull
)
