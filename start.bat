@echo off
cd /d "%~dp0"

echo Starting Collage Maker on http://localhost:8080

:: Kill existing server on port 8080 (ignore errors)
for /f "tokens=5" %%a in ('netstat -aon ^| findstr ":8080 "') do (
  taskkill /F /PID %%a >nul 2>&1
)

timeout /t 1 /nobreak >nul

start /b python -m http.server 8080

timeout /t 1 /nobreak >nul
start http://localhost:8080

echo.
echo Collage Maker is running at http://localhost:8080
echo Close this window to stop the server.
echo To install as a desktop app: open Chrome, look for Install icon in address bar.
pause
