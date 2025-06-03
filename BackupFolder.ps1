<#
.SYNOPSIS
    Creates a timestamped backup of a folder.
.DESCRIPTION
    This function copies the contents of a source folder to a destination folder with the current date and time appended.
.PARAMETER SourcePath
    The path to the folder to back up.
.PARAMETER DestinationPath
    The base path for storing the backup. A timestamped subfolder will be created.
.EXAMPLE
    Backup-Folder -SourcePath "C:\Data" -DestinationPath "D:\Backups\DataBackup"
#>
function Backup-Folder {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string] $SourcePath,

        [Parameter(Mandatory = $true)]
        [string] $DestinationPath
    )

    try {
        if (!(Test-Path -Path $SourcePath)) {
            throw "Source path not found: $SourcePath"
        }

        $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
        $backupFolder = Join-Path -Path $DestinationPath -ChildPath $timestamp

        New-Item -ItemType Directory -Path $backupFolder -Force | Out-Null
        Copy-Item -Path "$SourcePath\*" -Destination $backupFolder -Recurse -Force

        Write-Output "Backup of '$SourcePath' completed to '$backupFolder'."
    }
    catch {
        Write-Error "Failed to backup folder: $_"
    }
}