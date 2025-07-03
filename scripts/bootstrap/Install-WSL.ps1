<#
    This script may need more error catching in case of a computer where
    something like VTd or KVM virt is disabled in BIOS.
#>
param (
    [string]$WslDistroName = 'Ubuntu'
)

# Check if WSL is installed
$WslFeature = Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
$VmPlatform = Get-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform

if ($WslFeature.State -ne "Enabled" -or $VmPlatform.State -ne "Enabled") {
    Write-Host "Enabling WSL and Virtual Machine Platform..." -ForegroundColor Yellow
    # Enable WSL Windows Optional Feature
    dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
    # Enable VM Windows Optional Feature 
    dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
    Write-Host "Restart your computer and run the script again." -ForegroundColor Green
    exit
}

# Check if the WSL distro in $WslDistroName is installed
$WslDistros = wsl --list --quiet
if ($WslDistros -contains $WslDistroName) {
    Write-Host "$WslDistroName is already installed." -ForegroundColor Green
} else {
    Write-Host "Installing $WslDistroName..." -ForegroundColor Yellow
    wsl --install -d $WslDistroName
    Write-Host "$WslDistroName installation complete." -ForegroundColor Green
}