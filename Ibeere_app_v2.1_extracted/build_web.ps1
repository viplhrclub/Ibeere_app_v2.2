# Ibeere App v2 - Web Build Script (PowerShell)
# This script builds the Flutter app for web deployment

Write-Host "===========================================" -ForegroundColor Cyan
Write-Host "Ibeere App v2 - Web Build Process" -ForegroundColor Cyan
Write-Host "===========================================" -ForegroundColor Cyan
Write-Host ""

$PROJECT_DIR = "D:\Clients Projects\Mobile Application Flutter\Files to upload\Uploads\screens dart\Ibeere_app_v2"

try {
    # Step 1: Clean
    Write-Host "[1/4] Cleaning project..." -ForegroundColor Yellow
    Set-Location $PROJECT_DIR
    flutter clean
    Write-Host "✅ Project cleaned" -ForegroundColor Green
    Write-Host ""
    
    # Step 2: Get dependencies
    Write-Host "[2/4] Getting dependencies..." -ForegroundColor Yellow
    flutter pub get
    Write-Host "✅ Dependencies installed" -ForegroundColor Green
    Write-Host ""
    
    # Step 3: Code generation (optional)
    Write-Host "[3/4] Running code generation..." -ForegroundColor Yellow
    flutter pub run build_runner build --delete-conflicting-outputs 2>$null
    Write-Host "✅ Code generation complete" -ForegroundColor Green
    Write-Host ""
    
    # Step 4: Build for web
    Write-Host "[4/4] Building for web..." -ForegroundColor Yellow
    Write-Host "This may take 5-15 minutes..." -ForegroundColor Gray
    flutter build web --release
    
    Write-Host ""
    Write-Host "===========================================" -ForegroundColor Cyan
    Write-Host "✅ Web build completed successfully!" -ForegroundColor Green
    Write-Host "===========================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Build Output Location:" -ForegroundColor Yellow
    Write-Host "$PROJECT_DIR\build\web\" -ForegroundColor White
    Write-Host ""
    Write-Host "Next Steps:" -ForegroundColor Yellow
    Write-Host "1. Upload contents of build\web\ to your server" -ForegroundColor White
    Write-Host "2. Configure web server to serve index.html for all routes" -ForegroundColor White
    Write-Host "3. Test in browser at your domain" -ForegroundColor White
    Write-Host ""
    
} catch {
    Write-Host "❌ Error during build: $_" -ForegroundColor Red
    exit 1
}
