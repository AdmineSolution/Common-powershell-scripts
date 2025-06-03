# LogHandler.ps1

<#
.SYNOPSIS
    Handles logging of events and errors during script execution.
.DESCRIPTION
    This script utilizes the Logger class to log messages with different severity levels.
.EXAMPLE
    .\LogHandler.ps1 -Message "This is an info message" -LogLevel "Info"
#>

# Import the Logger class
Import-Module "$PSScriptRoot\..\Classes\Logger.ps1"

# Create an instance of the Logger class
$logger = [Logger]::new()

# Function to log messages
function Log-Event {
    param (
        [string]$Message,
        [string]$LogLevel = "Info"
    )

    switch ($LogLevel) {
        "Info" { $logger.LogInfo($Message) }
        "Warning" { $logger.LogWarning($Message) }
        "Error" { $logger.LogError($Message) }
        default { $logger.LogInfo($Message) }
    }
}

# Example usage
Log-Event -Message "Script execution started." -LogLevel "Info"

try {
    # Your script logic here
    # Log an info message
    Log-Event -Message "Performing some operations..." -LogLevel "Info"

    # Simulate an operation
    # If an error occurs, catch it and log it
    throw "An example error occurred."

} catch {
    Log-Event -Message $_.Exception.Message -LogLevel "Error"
}

Log-Event -Message "Script execution completed." -LogLevel "Info"