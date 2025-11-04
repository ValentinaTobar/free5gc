# Lab 7 Setup Script
# This script helps you complete Lab 7 tasks

Write-Host "=== Lab 7: CI/CD Setup Script ===" -ForegroundColor Cyan
Write-Host ""

# Step 1: Initialize submodules
Write-Host "[Step 1/5] Initializing Git submodules..." -ForegroundColor Yellow
try {
    git submodule init
    git submodule update --recursive
    Write-Host "✓ Submodules initialized successfully!" -ForegroundColor Green
} catch {
    Write-Host "✗ Error initializing submodules: $_" -ForegroundColor Red
    exit 1
}

Write-Host ""

# Step 2: Check modified files
Write-Host "[Step 2/5] Checking modified files..." -ForegroundColor Yellow
git status
Write-Host ""

# Step 3: Add changes to git
Write-Host "[Step 3/5] Adding changes to git..." -ForegroundColor Yellow
$response = Read-Host "Do you want to add all changes? (y/n)"
if ($response -eq 'y' -or $response -eq 'Y') {
    git add .github/workflows/ci.yml
    git add .golangci.yml
    git add LAB7_GUIDE.md
    Write-Host "✓ Changes staged!" -ForegroundColor Green
} else {
    Write-Host "Skipping git add. You can do it manually later." -ForegroundColor Yellow
}

Write-Host ""

# Step 4: Commit changes
Write-Host "[Step 4/5] Creating commit..." -ForegroundColor Yellow
$response = Read-Host "Do you want to commit the changes? (y/n)"
if ($response -eq 'y' -or $response -eq 'Y') {
    $commitMessage = @"
fix: Update CI/CD pipeline for Lab 7

- Fix working directory from ./src to ./test
- Update Go version to 1.21
- Add recursive submodule checkout
- Add system dependencies installation
- Add proper build process with make
- Add lint job with golangci-lint
- Add unit tests execution
- Add golangci-lint configuration
- Add comprehensive Lab 7 guide
"@
    git commit -m $commitMessage
    Write-Host "✓ Changes committed!" -ForegroundColor Green
} else {
    Write-Host "Skipping commit. You can do it manually later." -ForegroundColor Yellow
}

Write-Host ""

# Step 5: Push to GitHub
Write-Host "[Step 5/5] Pushing to GitHub..." -ForegroundColor Yellow
$response = Read-Host "Do you want to push to GitHub? (y/n)"
if ($response -eq 'y' -or $response -eq 'Y') {
    try {
        git push origin main
        Write-Host "✓ Changes pushed to GitHub!" -ForegroundColor Green
    } catch {
        Write-Host "✗ Error pushing to GitHub: $_" -ForegroundColor Red
        Write-Host "You may need to authenticate or check your remote URL." -ForegroundColor Yellow
    }
} else {
    Write-Host "Skipping push. You can do it manually later." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "=== Setup Complete! ===" -ForegroundColor Cyan
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "1. Go to GitHub.com and check your repository" -ForegroundColor White
Write-Host "2. Click on 'Actions' tab to see your CI pipeline" -ForegroundColor White
Write-Host "3. Review the LAB7_GUIDE.md for detailed information" -ForegroundColor White
Write-Host ""
Write-Host "If you skipped any steps, here are the manual commands:" -ForegroundColor Yellow
Write-Host "  git add .github/workflows/ci.yml .golangci.yml LAB7_GUIDE.md" -ForegroundColor Gray
Write-Host '  git commit -m "fix: Update CI/CD pipeline for Lab 7"' -ForegroundColor Gray
Write-Host "  git push origin main" -ForegroundColor Gray
Write-Host ""
