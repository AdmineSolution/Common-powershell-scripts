# Test-FileManager.ps1

# This file contains unit tests for the FileManager class, ensuring that all file operations work as expected.

# Import the necessary modules
Import-Module ../src/Classes/FileManager.ps1

# Define the test suite for FileManager
Describe "FileManager Tests" {
    $sourcePath = "C:\TestSource"
    $destinationPath = "C:\TestDestination"
    $fileManager = [FileManager]::new($sourcePath, $destinationPath)

    BeforeAll {
        # Setup code to create test files and directories
        New-Item -ItemType Directory -Path $sourcePath -Force | Out-Null
        New-Item -ItemType File -Path (Join-Path -Path $sourcePath -ChildPath "testfile.txt") -Force | Out-Null
    }

    AfterAll {
        # Cleanup code to remove test files and directories
        Remove-Item -Path $sourcePath -Recurse -Force -ErrorAction SilentlyContinue
        Remove-Item -Path $destinationPath -Recurse -Force -ErrorAction SilentlyContinue
    }

    It "Should copy files from source to destination" {
        $fileManager.CopyFiles()
        Test-Path (Join-Path -Path $destinationPath -ChildPath "testfile.txt") | Should -Be $true
    }

    It "Should move files from source to destination" {
        $fileManager.MoveFiles()
        Test-Path (Join-Path -Path $sourcePath -ChildPath "testfile.txt") | Should -Be $false
        Test-Path (Join-Path -Path $destinationPath -ChildPath "testfile.txt") | Should -Be $true
    }

    It "Should delete files from source" {
        $fileManager.DeleteFiles()
        Test-Path (Join-Path -Path $sourcePath -ChildPath "testfile.txt") | Should -Be $false
    }
}