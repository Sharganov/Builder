@echo off
if "%main%"=="" goto :EOF

set GIT="D:\Git\bin\git"
set GIT_URL="https://github.com/MaKToff/Geometry"
set MSBUILD="C:\Windows\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe"
set NUNIT="D:\NUnit-2.6.4\bin\nunit-console.exe"
set REPO_PATH=D:\repositories\Geometry
set MAILSEND="D:\email\mailsend1.18.exe"
set MISSEDFILE=

set SOLUTION_NAME=Geometry.sln
set FILELIST=files.txt

set CLONE_FAILED=false
set BUILD_FAILED=false
set CHECK_FAILED=false
set TEST_FAILED=false

set MAILRECIVER=pro-builder1@mail.ru
set USER=pro-builder1
set PASS="builder123"
