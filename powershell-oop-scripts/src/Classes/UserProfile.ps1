# File: /powershell-oop-scripts/powershell-oop-scripts/src/Classes/UserProfile.ps1

class UserProfile {
    [string]$UserName
    [string]$Email
    [string]$PhoneNumber
    [string]$Address

    UserProfile([string]$userName, [string]$email, [string]$phoneNumber, [string]$address) {
        $this.UserName = $userName
        $this.Email = $email
        $this.PhoneNumber = $phoneNumber
        $this.Address = $address
    }

    [void] LoadProfile([string]$filePath) {
        if (Test-Path $filePath) {
            $profileData = Get-Content $filePath | ConvertFrom-Json
            $this.UserName = $profileData.UserName
            $this.Email = $profileData.Email
            $this.PhoneNumber = $profileData.PhoneNumber
            $this.Address = $profileData.Address
        } else {
            throw "Profile file not found: $filePath"
        }
    }

    [void] SaveProfile([string]$filePath) {
        $profileData = @{
            UserName = $this.UserName
            Email = $this.Email
            PhoneNumber = $this.PhoneNumber
            Address = $this.Address
        } | ConvertTo-Json

        Set-Content -Path $filePath -Value $profileData
    }
}