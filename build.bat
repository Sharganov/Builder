if "%main%"=="" goto :EOF

echo Build...
%MSBUILD% %REPO_PATH%\%SOLUTION_NAME% /p:Configuration=Release;VisualStudioVersion=12.0 >msbuild.log
if ERRORLEVEL 1 (
  set BUILD_FAILED=true
  echo Build failed
) else (
  set BUILD_FAILED=false
  echo Build successfull
)
