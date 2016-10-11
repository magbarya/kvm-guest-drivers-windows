@echo off

if "%1_%2" neq "_" (
  call :build %1 %2
) else (
  for %%A in (WXp Wnet Wlh Win7 Win8 Win10) do for %%B in (32 64) do call :build %%A %%B
)

goto :eof 

:buildsys
cd sys
call buildOne.bat %1 %2
cd ..
goto :eof

:build
if /i "%1"=="WXp" if "%2"=="64" goto :eof
set BUILD_ARC=%2
set BUILD_ARC=x%BUILD_ARC:32=86%
call :buildsys %1 %BUILD_ARC%
set BUILD_OS=
set BUILD_ARC=
goto :eof
