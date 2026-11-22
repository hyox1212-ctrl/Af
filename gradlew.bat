@echo off
setlocal
set VERSION=8.9
set BASE=%USERPROFILE%\.gradle\habit-tracker-gradle
set DIST=%BASE%\gradle-%VERSION%
if not exist "%DIST%\bin\gradle.bat" (
  if not exist "%BASE%" mkdir "%BASE%"
  powershell -NoProfile -ExecutionPolicy Bypass -Command "$u='https://services.gradle.org/distributions/gradle-%VERSION%-bin.zip'; $z='%BASE%\gradle-%VERSION%-bin.zip'; Invoke-WebRequest -Uri $u -OutFile $z; Expand-Archive -Path $z -DestinationPath '%BASE%' -Force"
  if errorlevel 1 exit /b 1
)
call "%DIST%\bin\gradle.bat" %*
