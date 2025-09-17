# GitHub Deployment Script for E-commerce Mini App
# This script will help you deploy your Flutter app to GitHub

Write-Host "🚀 Starting GitHub Deployment Process..." -ForegroundColor Green

# Check if git is initialized
if (-not (Test-Path ".git")) {
    Write-Host "❌ Git repository not initialized. Please run 'git init' first." -ForegroundColor Red
    exit 1
}

# Check current branch
$currentBranch = git branch --show-current
Write-Host "📍 Current branch: $currentBranch" -ForegroundColor Yellow

# Check if there are uncommitted changes
$gitStatus = git status --porcelain
if ($gitStatus) {
    Write-Host "⚠️  Uncommitted changes detected. Committing them now..." -ForegroundColor Yellow
    git add .
    git commit -m "Deployment preparation - $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
}

# Check if remote origin exists
$remoteUrl = git remote get-url origin 2>$null
if ($remoteUrl) {
    Write-Host "📍 Remote origin found: $remoteUrl" -ForegroundColor Yellow
    
    # Test if repository exists
    Write-Host "🔍 Testing repository access..." -ForegroundColor Yellow
    $testResult = git ls-remote origin 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✅ Repository exists and is accessible" -ForegroundColor Green
    } else {
        Write-Host "❌ Repository not found or not accessible" -ForegroundColor Red
        Write-Host "Please create the repository at: https://github.com/shujaatsunasra/ecommerce-mini-app" -ForegroundColor Yellow
        Write-Host "Repository name: ecommerce-mini-app" -ForegroundColor Yellow
        Write-Host "Description: A production-ready Flutter e-commerce mini-app with clean architecture, comprehensive testing, and CI/CD pipeline" -ForegroundColor Yellow
        Write-Host "Visibility: Public" -ForegroundColor Yellow
        Write-Host "Initialize: Don't check any boxes (we already have files)" -ForegroundColor Yellow
        Write-Host ""
        Write-Host "After creating the repository, run this script again." -ForegroundColor Cyan
        exit 1
    }
} else {
    Write-Host "❌ No remote origin found. Adding remote..." -ForegroundColor Red
    git remote add origin https://github.com/shujaatsunasra/ecommerce-mini-app.git
    Write-Host "✅ Remote origin added" -ForegroundColor Green
}

# Push to GitHub
Write-Host "🚀 Pushing code to GitHub..." -ForegroundColor Green
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Code successfully pushed to GitHub!" -ForegroundColor Green
    Write-Host ""
    Write-Host "🎉 Deployment Complete!" -ForegroundColor Green
    Write-Host "📍 Repository URL: https://github.com/shujaatsunasra/ecommerce-mini-app" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "📋 Next Steps:" -ForegroundColor Yellow
    Write-Host "1. Go to your repository: https://github.com/shujaatsunasra/ecommerce-mini-app" -ForegroundColor White
    Write-Host "2. Click on the Actions tab" -ForegroundColor White
    Write-Host "3. Click I understand my workflows, go ahead and enable them" -ForegroundColor White
    Write-Host "4. Monitor the CI/CD pipeline running" -ForegroundColor White
    Write-Host "5. Create your first release with: git tag v1.0.0 && git push origin v1.0.0" -ForegroundColor White
    Write-Host ""
    Write-Host "🔧 CI/CD Features:" -ForegroundColor Yellow
    Write-Host "• Automated testing (Unit, Integration, Widget tests)" -ForegroundColor White
    Write-Host "• Multi-platform builds (Android, iOS, Web)" -ForegroundColor White
    Write-Host "• Security scanning and vulnerability detection" -ForegroundColor White
    Write-Host "• Code quality checks and formatting" -ForegroundColor White
    Write-Host "• Automated releases with artifacts" -ForegroundColor White
} else {
    Write-Host "❌ Failed to push to GitHub. Please check your credentials and try again." -ForegroundColor Red
    Write-Host "You may need to:" -ForegroundColor Yellow
    Write-Host "1. Set up GitHub authentication" -ForegroundColor White
    Write-Host "2. Create the repository manually at https://github.com/new" -ForegroundColor White
    Write-Host "3. Check your internet connection" -ForegroundColor White
}

Write-Host ""
Write-Host "📚 For detailed instructions, see DEPLOYMENT_INSTRUCTIONS.md" -ForegroundColor Cyan