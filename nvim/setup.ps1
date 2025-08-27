# Neovim Configuration Setup Script for Windows
# This script helps install the required dependencies for the Neovim configuration

Write-Host "Setting up Neovim configuration dependencies..." -ForegroundColor Green

# Check if Node.js is installed
Write-Host "Checking Node.js installation..." -ForegroundColor Yellow
try {
    $nodeVersion = node --version
    Write-Host "Node.js version: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "Node.js not found. Please install Node.js from https://nodejs.org/" -ForegroundColor Red
    exit 1
}

# Check if npm is available
Write-Host "Checking npm installation..." -ForegroundColor Yellow
try {
    $npmVersion = npm --version
    Write-Host "npm version: $npmVersion" -ForegroundColor Green
} catch {
    Write-Host "npm not found. Please install npm." -ForegroundColor Red
    exit 1
}

# Install global npm packages
Write-Host "Installing global npm packages..." -ForegroundColor Yellow

$packages = @(
    "typescript",
    "typescript-language-server",
    "@eslint/js",
    "@tailwindcss/language-server"
)

foreach ($package in $packages) {
    Write-Host "Installing $package..." -ForegroundColor Cyan
    try {
        npm install -g $package
        Write-Host "$package installed successfully" -ForegroundColor Green
    } catch {
        Write-Host "Failed to install $package" -ForegroundColor Red
    }
}

# Check if Neovim is installed
Write-Host "Checking Neovim installation..." -ForegroundColor Yellow
try {
    $nvimVersion = nvim --version
    Write-Host "Neovim is installed" -ForegroundColor Green
} catch {
    Write-Host "Neovim not found. Installing via Chocolatey..." -ForegroundColor Yellow
    
    # Check if Chocolatey is installed
    try {
        choco --version | Out-Null
        Write-Host "Installing Neovim via Chocolatey..." -ForegroundColor Cyan
        choco install neovim -y
        Write-Host "Neovim installed successfully" -ForegroundColor Green
    } catch {
        Write-Host "Chocolatey not found. Please install Neovim manually from https://github.com/neovim/neovim/releases" -ForegroundColor Red
        Write-Host "Or install Chocolatey from https://chocolatey.org/install" -ForegroundColor Yellow
    }
}

Write-Host "`nSetup complete!" -ForegroundColor Green
Write-Host "You can now start Neovim with: nvim" -ForegroundColor Cyan
Write-Host "The configuration will automatically install plugins on first run." -ForegroundColor Cyan
