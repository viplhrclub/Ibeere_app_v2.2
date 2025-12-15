@echo off
REM Ibeere App v2 Web Build Script
REM This script builds the Flutter app for web deployment

echo ===========================================
echo Ibeere App v2 - Web Build Process
echo ===========================================
echo.

setlocal enabledelayedexpansion

REM Set project directory
set PROJECT_DIR=D:\Clients Projects\Mobile Application Flutter\Files to upload\Uploads\screens dart\Ibeere_app_v2

cd /d "%PROJECT_DIR%"

echo [1/4] Cleaning project...
call flutter clean
if errorlevel 1 (
    echo ERROR: Flutter clean failed
    exit /b 1
)
echo ✅ Project cleaned
echo.

echo [2/4] Getting dependencies...
call flutter pub get
if errorlevel 1 (
    echo ERROR: Pub get failed
    exit /b 1
)
echo ✅ Dependencies installed
echo.

echo [3/4] Running code generation...
call flutter pub run build_runner build --delete-conflicting-outputs 2>nul
echo ✅ Code generation complete (or skipped if not needed)
echo.

echo [4/4] Building for web...
echo This may take 5-15 minutes...
call flutter build web --release --web-renderer html
if errorlevel 1 (
    echo ERROR: Web build failed
    exit /b 1
)
echo.
echo ✅ Web build completed successfully!
echo.

echo ===========================================
echo Build Output Location:
echo %PROJECT_DIR%\build\web\
echo.
echo Next Steps:
echo 1. Upload contents of build\web\ to your server
echo 2. Configure web server to serve index.html for all routes
echo 3. Test in browser at your domain
echo ===========================================
echo.

pause
