# 🚀 CI/CD Pipeline Setup Guide

This guide will help you set up a comprehensive CI/CD pipeline for the E-commerce Mini App using GitHub Actions.

## 📋 Prerequisites

- GitHub account
- Flutter SDK installed locally
- Git repository initialized
- GitHub CLI installed (optional but recommended)

## 🔧 Setup Steps

### 1. Initialize Git Repository

```bash
# Initialize git if not already done
git init

# Add all files
git add .

# Create initial commit
git commit -m "Initial commit: E-commerce Mini App with comprehensive testing and CI/CD"
```

### 2. Create GitHub Repository

#### Option A: Using GitHub CLI (Recommended)
```bash
# Install GitHub CLI first
# Windows: winget install GitHub.cli
# macOS: brew install gh
# Linux: curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg

# Login to GitHub
gh auth login

# Create repository
gh repo create ecommerce-mini-app --public --description "A production-ready Flutter e-commerce mini-app with clean architecture, comprehensive testing, and CI/CD pipeline"

# Add remote origin
git remote add origin https://github.com/YOUR_USERNAME/ecommerce-mini-app.git

# Push to GitHub
git branch -M main
git push -u origin main
```

#### Option B: Using GitHub Web Interface
1. Go to [GitHub](https://github.com)
2. Click "New repository"
3. Name it `ecommerce-mini-app`
4. Make it public
5. Add description: "A production-ready Flutter e-commerce mini-app with clean architecture, comprehensive testing, and CI/CD pipeline"
6. Don't initialize with README (we already have one)
7. Click "Create repository"
8. Follow the instructions to push your existing repository

### 3. Configure Repository Settings

#### Enable GitHub Actions
1. Go to your repository on GitHub
2. Click on "Actions" tab
3. Click "I understand my workflows, go ahead and enable them"

#### Set up Branch Protection Rules
1. Go to Settings → Branches
2. Click "Add rule"
3. Set branch name pattern to `main`
4. Enable:
   - ✅ Require a pull request before merging
   - ✅ Require status checks to pass before merging
   - ✅ Require branches to be up to date before merging
   - ✅ Require linear history
5. In "Restrict pushes that create files", select "Restrict pushes that create files"
6. Click "Create"

#### Configure Repository Secrets (Optional)
1. Go to Settings → Secrets and variables → Actions
2. Add the following secrets if needed:
   - `CODECOV_TOKEN`: For code coverage reporting
   - `FIREBASE_TOKEN`: For Firebase deployment
   - `ANDROID_KEYSTORE`: For Android app signing
   - `ANDROID_KEYSTORE_PASSWORD`: For Android app signing
   - `ANDROID_KEY_ALIAS`: For Android app signing
   - `ANDROID_KEY_PASSWORD`: For Android app signing

### 4. Verify CI/CD Pipeline

#### Check Workflow Files
The following workflow files should be present in `.github/workflows/`:

- `ci.yml`: Main CI pipeline
- `code-quality.yml`: Code quality checks
- `release.yml`: Automated releases

#### Test the Pipeline
1. Make a small change to any file
2. Commit and push the changes
3. Go to the "Actions" tab in your repository
4. Verify that the workflows are running
5. Check that all tests pass

### 5. Set up Code Coverage

#### Install Codecov (Optional)
1. Go to [Codecov](https://codecov.io)
2. Sign in with GitHub
3. Add your repository
4. Get the token and add it as `CODECOV_TOKEN` secret

#### Local Coverage Testing
```bash
# Run tests with coverage
flutter test --coverage

# Generate HTML coverage report
genhtml coverage/lcov.info -o coverage/html

# Open coverage report
open coverage/html/index.html  # macOS
start coverage/html/index.html  # Windows
```

## 🔄 Workflow Overview

### Main CI Pipeline (`ci.yml`)
- **Triggers**: Push to main/develop, Pull requests
- **Jobs**:
  - Test: Run unit tests, integration tests, widget tests
  - Build Android: Build APK and AAB
  - Build iOS: Build iOS app (macOS only)
  - Integration Test: Run end-to-end tests
  - Security Scan: Run security vulnerability scan
  - Deploy: Deploy to GitHub Releases (main branch only)

### Code Quality Pipeline (`code-quality.yml`)
- **Triggers**: Push to main/develop, Pull requests, Weekly schedule
- **Jobs**:
  - Code Quality: Format check, linting, analysis
  - Dependency Check: Check for unused dependencies
  - Security Audit: Check for vulnerabilities
  - Coverage Report: Generate and upload coverage

### Release Pipeline (`release.yml`)
- **Triggers**: Git tags (v*), Manual dispatch
- **Jobs**:
  - Release: Create GitHub release with artifacts
  - Upload Assets: Upload APK, AAB, and iOS build

## 📊 Monitoring and Metrics

### GitHub Actions Dashboard
- Go to your repository → Actions tab
- View workflow runs and their status
- Check logs for failed runs
- Monitor build times and success rates

### Code Coverage
- View coverage reports in the Actions tab
- Set up Codecov for detailed coverage tracking
- Monitor coverage trends over time

### Security Scanning
- Check security alerts in the Security tab
- Review dependency vulnerabilities
- Monitor for security issues in dependencies

## 🚀 Deployment

### Automatic Deployment
- **Main Branch**: Automatically deploys to GitHub Releases
- **Develop Branch**: Runs tests and builds but doesn't deploy
- **Feature Branches**: Run tests only

### Manual Deployment
1. Create a new release:
   - Go to Releases → Create a new release
   - Tag version: `v1.0.0`
   - Release title: `Release v1.0.0`
   - Description: Add release notes
   - Click "Publish release"

2. Or use GitHub CLI:
   ```bash
   gh release create v1.0.0 --title "Release v1.0.0" --notes "Release notes"
   ```

### Release Artifacts
Each release includes:
- Android APK (`ecommerce-mini-app-v1.0.0.apk`)
- Android App Bundle (`ecommerce-mini-app-v1.0.0.aab`)
- iOS Build (`ecommerce-mini-app-v1.0.0.app`)

## 🔧 Troubleshooting

### Common Issues

#### Workflow Fails
1. Check the Actions tab for error details
2. Look at the logs for specific error messages
3. Verify all dependencies are correctly specified
4. Check if any secrets are missing

#### Tests Fail
1. Run tests locally first: `flutter test`
2. Check for missing dependencies
3. Verify test files are in the correct location
4. Check for syntax errors in test files

#### Build Fails
1. Verify Flutter version compatibility
2. Check for missing platform-specific dependencies
3. Verify signing configuration (for release builds)
4. Check for code analysis issues

#### Coverage Issues
1. Ensure tests are running with coverage: `flutter test --coverage`
2. Check if coverage files are being generated
3. Verify Codecov token is correctly set
4. Check coverage file format and location

### Getting Help
1. Check GitHub Actions documentation
2. Review Flutter CI/CD best practices
3. Check the repository Issues tab
4. Ask questions in the Discussions tab

## 📈 Best Practices

### Code Quality
- Write comprehensive tests
- Maintain high test coverage
- Use proper linting and formatting
- Follow Flutter best practices

### CI/CD
- Keep workflows fast and efficient
- Use caching for dependencies
- Run tests in parallel when possible
- Monitor build times and optimize

### Security
- Keep dependencies updated
- Use security scanning tools
- Follow secure coding practices
- Regularly review security alerts

### Monitoring
- Monitor build success rates
- Track test coverage trends
- Watch for performance regressions
- Set up notifications for failures

## 🎉 Success Metrics

### Pipeline Health
- ✅ All tests pass consistently
- ✅ Builds complete within 10 minutes
- ✅ Zero security vulnerabilities
- ✅ 90%+ code coverage

### Deployment
- ✅ Automated releases work
- ✅ Artifacts are properly generated
- ✅ Release notes are comprehensive
- ✅ Versioning follows semantic versioning

### Code Quality
- ✅ No linting errors
- ✅ Code formatting is consistent
- ✅ Dependencies are up to date
- ✅ Security scans pass

---

**Congratulations! 🎉 Your CI/CD pipeline is now set up and ready to go!**

For any questions or issues, please check the repository's Issues tab or create a new discussion.
