@echo off
echo 🚀 Deploying E-commerce Mini App to GitHub
echo ==========================================

echo.
echo 📋 Step 1: Create GitHub Repository
echo 1. Go to https://github.com/new
echo 2. Repository name: ecommerce-mini-app
echo 3. Description: A production-ready Flutter e-commerce mini-app with clean architecture, comprehensive testing, and CI/CD pipeline
echo 4. Make it Public
echo 5. Don't initialize with README
echo.

set /p username="Enter your GitHub username: "

if "%username%"=="" (
    echo ❌ GitHub username cannot be empty.
    pause
    exit /b 1
)

echo.
echo 📝 Repository details:
echo    Username: %username%
echo    Repository: ecommerce-mini-app
echo    URL: https://github.com/%username%/ecommerce-mini-app.git
echo.

set /p continue="Press Enter when you've created the repository on GitHub, or 'q' to quit: "

if /i "%continue%"=="q" (
    echo 👋 Deployment cancelled. Run this script again when ready.
    pause
    exit /b 0
)

echo.
echo 🚀 Pushing code to GitHub...

git remote add origin https://github.com/%username%/ecommerce-mini-app.git
git push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo 🎉 SUCCESS! Your E-commerce Mini App has been deployed to GitHub!
    echo ================================================================
    echo Repository URL: https://github.com/%username%/ecommerce-mini-app
    echo.
    echo 📱 What's included:
    echo ✅ Complete CI/CD pipeline with GitHub Actions
    echo ✅ Multi-platform builds (Android APK, AAB, iOS, Web)
    echo ✅ Automated testing and security scanning
    echo ✅ Automated releases with downloadable artifacts
    echo ✅ Production-ready Flutter e-commerce app
    echo.
    echo 🔗 Next steps:
    echo 1. Go to your repository: https://github.com/%username%/ecommerce-mini-app
    echo 2. Check the Actions tab to see the CI/CD pipeline running
    echo 3. Create your first release: git tag v1.0.0 ^&^& git push origin v1.0.0
    echo.
    echo 🎯 Your app is now live and ready for production! 🚀
) else (
    echo.
    echo ❌ Failed to push to GitHub.
    echo Please check:
    echo 1. Repository exists on GitHub
    echo 2. You have access to push to the repository
    echo 3. Your GitHub credentials are correct
    echo.
    echo Repository URL: https://github.com/%username%/ecommerce-mini-app
)

echo.
pause
