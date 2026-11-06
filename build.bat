@echo off
cd /d "%~dp0"
where node >nul 2>nul || (echo Node.js is not installed. Get the LTS version from https://nodejs.org, install it, then run this file again. & pause & exit /b 1)
if not exist three.min.js powershell -NoProfile -Command "Invoke-WebRequest https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js -OutFile three.min.js"
if not exist three.min.js (echo Could not download three.min.js - check your internet. & pause & exit /b 1)
call npm install
call npm run build
echo.
echo Finished. Your game is in the "dist" folder: ProStriker3D.exe
pause
