# Fix GitHub Deployment Script
Write-Host "🔧 Fixing GitHub Deployment Issues..." -ForegroundColor Yellow

# Check if repository exists
Write-Host "🔍 Checking repository status..." -ForegroundColor Cyan
$testResult = git ls-remote origin 2>&1

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Repository exists and is accessible" -ForegroundColor Green
    Write-Host "🚀 Pushing code to GitHub..." -ForegroundColor Green
    git push -u origin main
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✅ Code successfully pushed to GitHub!" -ForegroundColor Green
        Write-Host "📍 Repository URL: https://github.com/shujaatsunasra/ecommerce-mini-app" -ForegroundColor Cyan
    } else {
        Write-Host "❌ Failed to push. Please check your credentials." -ForegroundColor Red
    }
} else {
    Write-Host "❌ Repository not found. Please create it first:" -ForegroundColor Red
    Write-Host "1. Go to: https://github.com/new" -ForegroundColor Yellow
    Write-Host "2. Repository name: ecommerce-mini-app" -ForegroundColor Yellow
    Write-Host "3. Description: A production-ready Flutter e-commerce mini-app with clean architecture, comprehensive testing, and CI/CD pipeline" -ForegroundColor Yellow
    Write-Host "4. Visibility: Public" -ForegroundColor Yellow
    Write-Host "5. Initialize: Don't check any boxes" -ForegroundColor Yellow
    Write-Host "6. Click: Create repository" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "After creating the repository, run this script again." -ForegroundColor Cyan
}

Write-Host ""
Write-Host "📚 For detailed instructions, see DEPLOY_NOW.md" -ForegroundColor Cyan
