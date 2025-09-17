# GitHub Repository Setup Script for E-commerce Mini App

Write-Host "🚀 Setting up GitHub repository for E-commerce Mini App" -ForegroundColor Green
Write-Host "=================================================" -ForegroundColor Green

# Check if git is initialized
if (-not (Test-Path ".git")) {
    Write-Host "❌ Git repository not initialized. Please run 'git init' first." -ForegroundColor Red
    exit 1
}

# Get GitHub username
$username = Read-Host "Enter your GitHub username"

if ([string]::IsNullOrEmpty($username)) {
    Write-Host "❌ GitHub username cannot be empty." -ForegroundColor Red
    exit 1
}

$repoName = "ecommerce-mini-app"
$repoUrl = "https://github.com/$username/$repoName.git"

Write-Host "📝 Repository details:" -ForegroundColor Yellow
Write-Host "   Username: $username" -ForegroundColor White
Write-Host "   Repository: $repoName" -ForegroundColor White
Write-Host "   URL: $repoUrl" -ForegroundColor White
Write-Host ""

# Check if remote already exists
$existingRemote = git remote get-url origin 2>$null
if ($existingRemote) {
    Write-Host "⚠️  Remote 'origin' already exists: $existingRemote" -ForegroundColor Yellow
    $update = Read-Host "Do you want to update it? (y/n)"
    if ($update -eq "y" -or $update -eq "Y") {
        git remote set-url origin $repoUrl
        Write-Host "✅ Remote updated to: $repoUrl" -ForegroundColor Green
    } else {
        Write-Host "ℹ️  Keeping existing remote: $existingRemote" -ForegroundColor Blue
    }
} else {
    git remote add origin $repoUrl
    Write-Host "✅ Remote added: $repoUrl" -ForegroundColor Green
}

Write-Host ""
Write-Host "📋 Next steps:" -ForegroundColor Yellow
Write-Host "1. Create the repository on GitHub:" -ForegroundColor White
Write-Host "   - Go to https://github.com/new" -ForegroundColor Gray
Write-Host "   - Repository name: $repoName" -ForegroundColor Gray
Write-Host "   - Description: A production-ready Flutter e-commerce mini-app with clean architecture, comprehensive testing, and CI/CD pipeline" -ForegroundColor Gray
Write-Host "   - Make it Public" -ForegroundColor Gray
Write-Host "   - Don't initialize with README" -ForegroundColor Gray
Write-Host ""
Write-Host "2. After creating the repository, run:" -ForegroundColor White
Write-Host "   git push -u origin main" -ForegroundColor Gray
Write-Host ""
Write-Host "3. Enable GitHub Actions:" -ForegroundColor White
Write-Host "   - Go to your repository → Actions tab" -ForegroundColor Gray
Write-Host "   - Click 'I understand my workflows, go ahead and enable them'" -ForegroundColor Gray
Write-Host ""

$continue = Read-Host "Press Enter when you've created the repository on GitHub, or 'q' to quit"
if ($continue -eq "q" -or $continue -eq "Q") {
    Write-Host "👋 Setup cancelled. Run this script again when ready." -ForegroundColor Yellow
    exit 0
}

Write-Host "🚀 Pushing code to GitHub..." -ForegroundColor Green
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "🎉 SUCCESS! Your E-commerce Mini App has been deployed to GitHub!" -ForegroundColor Green
    Write-Host "================================================================" -ForegroundColor Green
    Write-Host "Repository URL: $repoUrl" -ForegroundColor White
    Write-Host ""
    Write-Host "📱 What's included:" -ForegroundColor Yellow
    Write-Host "✅ Complete CI/CD pipeline with GitHub Actions" -ForegroundColor Green
    Write-Host "✅ Multi-platform builds (Android APK, AAB, iOS, Web)" -ForegroundColor Green
    Write-Host "✅ Automated testing and security scanning" -ForegroundColor Green
    Write-Host "✅ Automated releases with downloadable artifacts" -ForegroundColor Green
    Write-Host "✅ Production-ready Flutter e-commerce app" -ForegroundColor Green
    Write-Host ""
    Write-Host "🔗 Next steps:" -ForegroundColor Yellow
    Write-Host "1. Go to your repository: $repoUrl" -ForegroundColor White
    Write-Host "2. Check the Actions tab to see the CI/CD pipeline running" -ForegroundColor White
    Write-Host "3. Create your first release: git tag v1.0.0; git push origin v1.0.0" -ForegroundColor White
    Write-Host ""
    Write-Host "🎯 Your app is now live and ready for production! 🚀" -ForegroundColor Green
} else {
    Write-Host ""
    Write-Host "❌ Failed to push to GitHub." -ForegroundColor Red
    Write-Host "Please check:" -ForegroundColor Yellow
    Write-Host "1. Repository exists on GitHub" -ForegroundColor White
    Write-Host "2. You have access to push to the repository" -ForegroundColor White
    Write-Host "3. Your GitHub credentials are correct" -ForegroundColor White
    Write-Host ""
    Write-Host "Repository URL: $repoUrl" -ForegroundColor White
}
