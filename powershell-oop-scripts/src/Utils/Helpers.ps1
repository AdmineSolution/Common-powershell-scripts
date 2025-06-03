function Validate-Path {
    param (
        [string]$Path
    )
    if (-not (Test-Path -Path $Path)) {
        throw "Invalid path: $Path"
    }
}

function Format-Output {
    param (
        [string]$Message,
        [string]$Prefix = "[INFO]"
    )
    return "$Prefix $Message"
}

function Get-CurrentTimestamp {
    return (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
}