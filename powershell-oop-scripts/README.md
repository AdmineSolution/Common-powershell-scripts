# PowerShell OOP Scripts

## Overview
This project is a collection of PowerShell scripts that utilize object-oriented programming principles to manage files, user profiles, and logging functionality. The scripts are designed to be safe and easy to use for public consumption.

## Project Structure
```
powershell-oop-scripts
├── src
│   ├── Classes
│   │   ├── FileManager.ps1
│   │   ├── UserProfile.ps1
│   │   └── Logger.ps1
│   ├── Scripts
│   │   ├── BackupFolder.ps1
│   │   ├── ManageProfiles.ps1
│   │   └── LogHandler.ps1
│   └── Utils
│       └── Helpers.ps1
├── tests
│   ├── Test-FileManager.ps1
│   ├── Test-UserProfile.ps1
│   └── Test-Logger.ps1
├── README.md
└── LICENSE
```

## Installation
To use the scripts in this project, clone the repository to your local machine:

```bash
git clone <repository-url>
```

Navigate to the project directory:

```bash
cd powershell-oop-scripts
```

## Usage
### FileManager
The `FileManager` class provides methods for file operations. You can use it to copy, move, or delete files. 

### UserProfile
The `UserProfile` class manages user profile information. It allows you to create, update, and delete user profiles.

### Logger
The `Logger` class handles logging functionality. It can log messages with different severity levels and manage log file paths.

### Scripts
- **BackupFolder.ps1**: This script creates backups of specified folders using the `FileManager` class.
- **ManageProfiles.ps1**: This script manages user profiles using the `UserProfile` class.
- **LogHandler.ps1**: This script demonstrates logging events and errors using the `Logger` class.

## Testing
Unit tests are provided for each class to ensure functionality:
- `Test-FileManager.ps1`: Tests for the `FileManager` class.
- `Test-UserProfile.ps1`: Tests for the `UserProfile` class.
- `Test-Logger.ps1`: Tests for the `Logger` class.

## Contribution
Contributions are welcome! Please fork the repository and submit a pull request with your changes. Ensure that your code adheres to the project's coding standards and includes appropriate tests.

## License
This project is licensed under the MIT License. See the LICENSE file for more details.