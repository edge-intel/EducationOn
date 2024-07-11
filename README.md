# **Redirect Folders Script**
## Overview

This script is designed to redirect user folders such as Desktop and Documents to local paths on each machine. It aims to mitigate the need for more sophisticated Active Directory functions by providing a simple, yet effective solution for environments like schools, where students may use the same user accounts on multiple PCs.

## Features
Admin Privileges: Ensures the script runs with elevated privileges.
Multiple Users: Allows the script to be applied to multiple users in one run.
Folder Redirection Options: Choose to redirect Desktop, Documents, or both.
Summary Report: Provides a summary of operations and their success or failure status.

## Usage

### Clone or Download the Repository:
    git clone https://github.com/yourusername/redirect-folders-script.git

Or download the ZIP file from the repository page and extract it.

### Run the Script:
Right-click on the RedirectFolders.bat file and select "Run as administrator".
Follow the on-screen prompts to enter target usernames and redirection choices.

### Follow Prompts:
The script will check for administrative privileges.
The script will list all users on the system.
Enter the usernames of the users you want to apply the script for, separated by spaces.
Choose which folders to redirect: Desktop only, Documents only, or both.

### Review Summary:
After the script completes, a summary of operations will be displayed, indicating success or failure for each user.

## Example

Here is a sample usage scenario:

###     Run as Administrator:
Launch the script with elevated privileges.
The script will verify that it is running with administrative privileges.

###     Enter Target Usernames:
Input the usernames of the users you want to redirect folders for (e.g., user1 user2 user3).

###     Choose Redirection Options:
Select which folders to redirect: Desktop only, Documents only, or both.

###     Script Execution:
The script will create local Desktop and Documents folders for each user if they don't already exist.
It will copy existing contents from the current user folders to the local paths.
The script updates the registry to point the user folders to the new local paths.

###     Summary Report:
A summary of operations will be displayed, showing the status for each user.

## License

**MIT License

Copyright (c) 2024 Edge-Intel.com

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
**
## Disclaimer
**This script is provided as-is without any warranty. Use it at your own risk. The author is not responsible for any damage or data loss that may occur as a result of using this script.**