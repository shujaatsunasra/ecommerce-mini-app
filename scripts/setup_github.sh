#!/bin/bash

# GitHub Repository Setup Script for E-commerce Mini App
# This script helps set up the GitHub repository with proper configuration

set -e

echo "🚀 Setting up GitHub repository for E-commerce Mini App..."

# Check if git is initialized
if [ ! -d ".git" ]; then
    echo "📁 Initializing Git repository..."
    git init
fi

# Add all files
echo "📦 Adding files to Git..."
git add .

# Create initial commit
echo "💾 Creating initial commit..."
git commit -m "Initial commit: E-commerce Mini App with comprehensive testing and CI/CD"

# Set up remote repository
echo "🔗 Setting up remote repository..."
read -p "Enter your GitHub username: " GITHUB_USERNAME
read -p "Enter repository name (default: ecommerce-mini-app): " REPO_NAME
REPO_NAME=${REPO_NAME:-ecommerce-mini-app}

# Create repository on GitHub (requires GitHub CLI)
if command -v gh &> /dev/null; then
    echo "📤 Creating repository on GitHub..."
    gh repo create $REPO_NAME --public --description "A production-ready Flutter e-commerce mini-app with clean architecture, comprehensive testing, and CI/CD pipeline"
    
    # Add remote origin
    git remote add origin https://github.com/$GITHUB_USERNAME/$REPO_NAME.git
    
    # Push to GitHub
    echo "⬆️ Pushing to GitHub..."
    git branch -M main
    git push -u origin main
    
    echo "✅ Repository created successfully!"
    echo "🔗 Repository URL: https://github.com/$GITHUB_USERNAME/$REPO_NAME"
else
    echo "⚠️ GitHub CLI not found. Please install it and run:"
    echo "   gh repo create $REPO_NAME --public"
    echo "   git remote add origin https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"
    echo "   git push -u origin main"
fi

# Set up branch protection rules
echo "🛡️ Setting up branch protection rules..."
if command -v gh &> /dev/null; then
    gh api repos/$GITHUB_USERNAME/$REPO_NAME/branches/main/protection \
        --method PUT \
        --field required_status_checks='{"strict":true,"contexts":["test","build-android","build-ios"]}' \
        --field enforce_admins=true \
        --field required_pull_request_reviews='{"required_approving_review_count":1}' \
        --field restrictions=null
fi

# Set up repository secrets (manual step)
echo "🔐 Repository secrets to configure:"
echo "   - GITHUB_TOKEN (automatically provided)"
echo "   - CODECOV_TOKEN (for coverage reporting)"
echo "   - FIREBASE_TOKEN (for deployment, if using Firebase)"

# Set up repository topics
echo "🏷️ Setting up repository topics..."
if command -v gh &> /dev/null; then
    gh api repos/$GITHUB_USERNAME/$REPO_NAME/topics \
        --method PUT \
        --field names='["flutter","ecommerce","mobile","dart","bloc","testing","ci-cd","clean-architecture"]'
fi

# Set up repository description
echo "📝 Setting up repository description..."
if command -v gh &> /dev/null; then
    gh api repos/$GITHUB_USERNAME/$REPO_NAME \
        --method PATCH \
        --field description="A production-ready Flutter e-commerce mini-app with clean architecture, comprehensive testing, and CI/CD pipeline" \
        --field homepage="https://github.com/$GITHUB_USERNAME/$REPO_NAME" \
        --field has_issues=true \
        --field has_projects=true \
        --field has_wiki=true
fi

echo "🎉 GitHub repository setup complete!"
echo ""
echo "📋 Next steps:"
echo "1. Configure repository secrets in GitHub Settings"
echo "2. Enable GitHub Actions in repository Settings"
echo "3. Set up branch protection rules"
echo "4. Configure code coverage reporting"
echo "5. Set up automated releases"
echo ""
echo "🔗 Repository URL: https://github.com/$GITHUB_USERNAME/$REPO_NAME"
echo "📊 Actions URL: https://github.com/$GITHUB_USERNAME/$REPO_NAME/actions"
echo "🔒 Settings URL: https://github.com/$GITHUB_USERNAME/$REPO_NAME/settings"
