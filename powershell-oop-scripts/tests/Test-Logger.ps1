# Test-Logger.ps1

# This file contains unit tests for the Logger class, ensuring that logging functionality behaves as expected.

# Import the Logger class
Import-Module ../src/Classes/Logger.ps1

# Define the test function
function Test-Logger {
    # Create an instance of the Logger class
    $logger = [Logger]::new("C:\Logs\test.log")

    # Test logging an info message
    $logger.LogInfo("This is an info message.")
    $logContents = Get-Content "C:\Logs\test.log"
    if ($logContents -notcontains "INFO: This is an info message.") {
        Write-Error "Info message not logged correctly."
    }

    # Test logging a warning message
    $logger.LogWarning("This is a warning message.")
    $logContents = Get-Content "C:\Logs\test.log"
    if ($logContents -notcontains "WARNING: This is a warning message.") {
        Write-Error "Warning message not logged correctly."
    }

    # Test logging an error message
    $logger.LogError("This is an error message.")
    $logContents = Get-Content "C:\Logs\test.log"
    if ($logContents -notcontains "ERROR: This is an error message.") {
        Write-Error "Error message not logged correctly."
    }

    # Clean up the log file after testing
    Remove-Item "C:\Logs\test.log" -Force
}

# Run the test function
Test-Logger