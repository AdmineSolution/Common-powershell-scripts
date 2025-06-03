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

        $fileManager = [FileManager]::new($SourcePath, $DestinationPath)
        $backupFolder = $fileManager.CreateBackupFolder()

        $fileManager.CopyFilesToBackup()

        Write-Output "Backup of '$SourcePath' completed to '$backupFolder'."
    }
    catch {
        Write-Error "Failed to backup folder: $_"
    }
}