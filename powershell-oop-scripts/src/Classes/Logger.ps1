# Logger.ps1

class Logger {
    [string]$LogFilePath

    Logger([string]$logFilePath) {
        $this.LogFilePath = $logFilePath
    }

    [void]LogInfo([string]$message) {
        $this.Log("INFO", $message)
    }

    [void]LogWarning([string]$message) {
        $this.Log("WARNING", $message)
    }

    [void]LogError([string]$message) {
        $this.Log("ERROR", $message)
    }

    [void]Log([string]$level, [string]$message) {
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        $logEntry = "$timestamp [$level] $message"
        Add-Content -Path $this.LogFilePath -Value $logEntry
    }
}