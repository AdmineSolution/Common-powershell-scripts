# FileManager.ps1

class FileManager {
    [string]$SourcePath
    [string]$DestinationPath

    FileManager([string]$sourcePath, [string]$destinationPath) {
        $this.SourcePath = $sourcePath
        $this.DestinationPath = $destinationPath
    }

    [void] CopyFiles() {
        if (-Not (Test-Path $this.SourcePath)) {
            throw "Source path does not exist: $($this.SourcePath)"
        }

        $destination = Join-Path -Path $this.DestinationPath -ChildPath (Get-Date -Format "yyyyMMdd_HHmmss")
        New-Item -ItemType Directory -Path $destination -Force | Out-Null
        Copy-Item -Path "$($this.SourcePath)\*" -Destination $destination -Recurse -Force
    }

    [void] MoveFiles() {
        if (-Not (Test-Path $this.SourcePath)) {
            throw "Source path does not exist: $($this.SourcePath)"
        }

        Move-Item -Path $this.SourcePath -Destination $this.DestinationPath -Force
    }

    [void] DeleteFiles() {
        if (-Not (Test-Path $this.SourcePath)) {
            throw "Source path does not exist: $($this.SourcePath)"
        }

        Remove-Item -Path $this.SourcePath -Recurse -Force
    }
}