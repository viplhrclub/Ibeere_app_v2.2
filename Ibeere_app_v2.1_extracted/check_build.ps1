$maxWait = 600  # 10 minutes
$checkInterval = 10  # Check every 10 seconds
$elapsed = 0

while ($elapsed -lt $maxWait) {
    if (Test-Path "build/web/index.html") {
        Write-Host "✅ BUILD COMPLETE!"
        Get-Item "build/web/index.html" | Select-Object FullName
        $webFiles = Get-ChildItem "build/web" -Recurse -File
        Write-Host "Total files: $($webFiles.Count)"
        Write-Host "Total size: $([Math]::Round(($webFiles | Measure-Object -Sum Length).Sum / 1MB, 2)) MB"
        exit 0
    }
    
    $processes = @(Get-Process | Where-Object { $_.ProcessName -like "*dart*" })
    if ($processes.Count -eq 0) {
        Write-Host "❌ Build failed - dart processes stopped"
        Get-Content "build_errors.txt" -ErrorAction SilentlyContinue
        exit 1
    }
    
    Write-Host "⏳ Building... ($elapsed seconds elapsed)"
    Start-Sleep -Seconds $checkInterval
    $elapsed += $checkInterval
}

Write-Host "❌ Build timeout after 10 minutes"
exit 1
