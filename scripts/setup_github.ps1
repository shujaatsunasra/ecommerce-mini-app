# GitHub Repository Setup Script for E-commerce Mini App
# This script helps set up the GitHub repository with proper configuration

Write-Host "🚀 Setting up GitHub repository for E-commerce Mini App..." -ForegroundColor Green

# Check if git is initialized
if (-not (Test-Path ".git")) {
    Write-Host "📁 Initializing Git repository..." -ForegroundColor Yellow
    git init
}

# Add all files
Write-Host "📦 Adding files to Git..." -ForegroundColor Yellow
git add .

# Create initial commit
Write-Host "💾 Creating initial commit..." -ForegroundColor Yellow
git commit -m "Initial commit: E-commerce Mini App with comprehensive testing and CI/CD"

# Set up remote repository
Write-Host "🔗 Setting up remote repository..." -ForegroundColor Yellow
$GITHUB_USERNAME = Read-Host "Enter your GitHub username"
$REPO_NAME = Read-Host "Enter repository name (default: ecommerce-mini-app)"
if ([string]::IsNullOrEmpty($REPO_NAME)) {
    $REPO_NAME = "ecommerce-mini-app"
}

# Create repository on GitHub (requires GitHub CLI)
if (Get-Command gh -ErrorAction SilentlyContinue) {
    Write-Host "📤 Creating repository on GitHub..." -ForegroundColor Yellow
    gh repo create $REPO_NAME --public --description "A production-ready Flutter e-commerce mini-app with clean architecture, comprehensive testing, and CI/CD pipeline"
    
    # Add remote origin
    git remote add origin "https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"
    
    # Push to GitHub
    Write-Host "⬆️ Pushing to GitHub..." -ForegroundColor Yellow
    git branch -M main
    git push -u origin main
    
    Write-Host "✅ Repository created successfully!" -ForegroundColor Green
    Write-Host "🔗 Repository URL: https://github.com/$GITHUB_USERNAME/$REPO_NAME" -ForegroundColor Cyan
} else {
    Write-Host "⚠️ GitHub CLI not found. Please install it and run:" -ForegroundColor Red
    Write-Host "   gh repo create $REPO_NAME --public" -ForegroundColor White
    Write-Host "   git remote add origin https://github.com/$GITHUB_USERNAME/$REPO_NAME.git" -ForegroundColor White
    Write-Host "   git push -u origin main" -ForegroundColor White
}

# Set up branch protection rules
Write-Host "🛡️ Setting up branch protection rules..." -ForegroundColor Yellow
if (Get-Command gh -ErrorAction SilentlyContinue) {
    gh api "repos/$GITHUB_USERNAME/$REPO_NAME/branches/main/protection" --method PUT --field required_status_checks='{"strict":true,"contexts":["test","build-android","build-ios"]}' --field enforce_admins=true --field required_pull_request_reviews='{"required_approving_review_count":1}' --field restrictions=null
}

# Set up repository secrets (manual step)
Write-Host "🔐 Repository secrets to configure:" -ForegroundColor Yellow
Write-Host "   - GITHUB_TOKEN (automatically provided)" -ForegroundColor White
Write-Host "   - CODECOV_TOKEN (for coverage reporting)" -ForegroundColor White
Write-Host "   - FIREBASE_TOKEN (for deployment, if using Firebase)" -ForegroundColor White

# Set up repository topics
Write-Host "🏷️ Setting up repository topics..." -ForegroundColor Yellow
if (Get-Command gh -ErrorAction SilentlyContinue) {
    gh api "repos/$GITHUB_USERNAME/$REPO_NAME/topics" --method PUT --field names='["flutter","ecommerce","mobile","dart","bloc","testing","ci-cd","clean-architecture"]'
}

# Set up repository description
Write-Host "📝 Setting up repository description..." -ForegroundColor Yellow
if (Get-Command gh -ErrorAction SilentlyContinue) {
    gh api "repos/$GITHUB_USERNAME/$REPO_NAME" --method PATCH --field description="A production-ready Flutter e-commerce mini-app with clean architecture, comprehensive testing, and CI/CD pipeline" --field homepage="https://github.com/$GITHUB_USERNAME/$REPO_NAME" --field has_issues=true --field has_projects=true --field has_wiki=true
}

Write-Host "🎉 GitHub repository setup complete!" -ForegroundColor Green
Write-Host ""
Write-Host "📋 Next steps:" -ForegroundColor Yellow
Write-Host "1. Configure repository secrets in GitHub Settings" -ForegroundColor White
Write-Host "2. Enable GitHub Actions in repository Settings" -ForegroundColor White
Write-Host "3. Set up branch protection rules" -ForegroundColor White
Write-Host "4. Configure code coverage reporting" -ForegroundColor White
Write-Host "5. Set up automated releases" -ForegroundColor White
Write-Host ""
Write-Host "🔗 Repository URL: https://github.com/$GITHUB_USERNAME/$REPO_NAME" -ForegroundColor Cyan
Write-Host "📊 Actions URL: https://github.com/$GITHUB_USERNAME/$REPO_NAME/actions" -ForegroundColor Cyan
Write-Host "🔒 Settings URL: https://github.com/$GITHUB_USERNAME/$REPO_NAME/settings" -ForegroundColor Cyan
