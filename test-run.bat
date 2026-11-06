@echo off
cd /d "%~dp0"
if not exist three.min.js powershell -NoProfile -Command "Invoke-WebRequest https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js -OutFile three.min.js"
if not exist node_modules call npm install
call npm start
