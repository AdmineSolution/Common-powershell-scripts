# filepath: /powershell-oop-scripts/powershell-oop-scripts/src/Scripts/ManageProfiles.ps1
<#
.SYNOPSIS
    Manages user profiles by creating, updating, and deleting profiles.
.DESCRIPTION
    This script provides a user interface for managing user profiles using the UserProfile class.
.EXAMPLE
    .\ManageProfiles.ps1
#>

# Import the UserProfile class
Import-Module "$PSScriptRoot\..\Classes\UserProfile.ps1"

function Show-Menu {
    param (
        [string]$title
    )
    Clear-Host
    Write-Host "=== $title ===" -ForegroundColor Cyan
    Write-Host "1. Create Profile"
    Write-Host "2. Update Profile"
    Write-Host "3. Delete Profile"
    Write-Host "4. Exit"
}

function Create-Profile {
    $userProfile = New-Object UserProfile
    $userProfile.Name = Read-Host "Enter user name"
    $userProfile.Email = Read-Host "Enter user email"
    $userProfile.Save()
    Write-Host "Profile created successfully." -ForegroundColor Green
}

function Update-Profile {
    $userProfile = New-Object UserProfile
    $userProfile.Name = Read-Host "Enter user name to update"
    if ($userProfile.Load()) {
        $userProfile.Email = Read-Host "Enter new email"
        $userProfile.Save()
        Write-Host "Profile updated successfully." -ForegroundColor Green
    } else {
        Write-Host "Profile not found." -ForegroundColor Red
    }
}

function Delete-Profile {
    $userProfile = New-Object UserProfile
    $userProfile.Name = Read-Host "Enter user name to delete"
    if ($userProfile.Load()) {
        $userProfile.Delete()
        Write-Host "Profile deleted successfully." -ForegroundColor Green
    } else {
        Write-Host "Profile not found." -ForegroundColor Red
    }
}

do {
    Show-Menu -title "User Profile Management"
    $choice = Read-Host "Select an option"
    switch ($choice) {
        1 { Create-Profile }
        2 { Update-Profile }
        3 { Delete-Profile }
        4 { Write-Host "Exiting..." -ForegroundColor Yellow }
        default { Write-Host "Invalid option. Please try again." -ForegroundColor Red }
    }
} while ($choice -ne 4)