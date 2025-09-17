# PowerShell script to set the default directory to the ecommerce_mini_app project
# Run this script to automatically navigate to the project directory

Set-Location -Path "C:\Users\shuja\Desktop\Develop.stuff\Mobile-Dev\assignment-stuff\ecommerce_mini_app"

Write-Host "✅ Default directory set to: ecommerce_mini_app" -ForegroundColor Green
Write-Host "📁 Current directory: $(Get-Location)" -ForegroundColor Cyan
Write-Host ""
Write-Host "🚀 Ready to run Flutter commands:" -ForegroundColor Yellow
Write-Host "   flutter run --debug" -ForegroundColor White
Write-Host "   flutter analyze" -ForegroundColor White
Write-Host "   flutter test" -ForegroundColor White
Write-Host ""
