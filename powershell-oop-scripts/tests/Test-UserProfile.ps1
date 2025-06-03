# Test-UserProfile.ps1

# This file contains unit tests for the UserProfile class, verifying that user profile management functions correctly.

# Import the necessary modules
Import-Module ../src/Classes/UserProfile.ps1

# Define the test suite for UserProfile
Describe "UserProfile Class Tests" {
    
    # Test case for creating a new user profile
    It "Should create a new user profile" {
        $userProfile = [UserProfile]::new("JohnDoe", "john.doe@example.com")
        $userProfile.Username | Should -Be "JohnDoe"
        $userProfile.Email | Should -Be "john.doe@example.com"
    }

    # Test case for loading a user profile
    It "Should load a user profile from a file" {
        $userProfile = [UserProfile]::new("JohnDoe", "john.doe@example.com")
        $userProfile.Save("JohnDoeProfile.json")
        
        $loadedProfile = [UserProfile]::Load("JohnDoeProfile.json")
        $loadedProfile.Username | Should -Be "JohnDoe"
        $loadedProfile.Email | Should -Be "john.doe@example.com"
    }

    # Test case for saving a user profile
    It "Should save the user profile to a file" {
        $userProfile = [UserProfile]::new("JaneDoe", "jane.doe@example.com")
        $userProfile.Save("JaneDoeProfile.json")
        
        $loadedProfile = [UserProfile]::Load("JaneDoeProfile.json")
        $loadedProfile.Username | Should -Be "JaneDoe"
        $loadedProfile.Email | Should -Be "jane.doe@example.com"
    }

    # Test case for updating a user profile
    It "Should update the user profile information" {
        $userProfile = [UserProfile]::new("JohnDoe", "john.doe@example.com")
        $userProfile.UpdateEmail("john.new@example.com")
        
        $userProfile.Email | Should -Be "john.new@example.com"
    }

    # Test case for deleting a user profile
    It "Should delete the user profile" {
        $userProfile = [UserProfile]::new("JohnDoe", "john.doe@example.com")
        $userProfile.Save("JohnDoeProfile.json")
        
        $userProfile.Delete("JohnDoeProfile.json")
        { [UserProfile]::Load("JohnDoeProfile.json") } | Should -Throw
    }
}