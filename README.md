Overview

This script is designed to redirect user folders such as Desktop and Documents to local paths on each machine. It aims to mitigate the need for more sophisticated Active Directory functions by providing a simple, yet effective solution for environments like schools, where students may use the same user accounts on multiple PCs.
Features

Verbose Mode: Provides detailed output of each step.
Admin Privileges: Prompts for admin credentials to run the script with elevated privileges.
Multiple Users: Allows the script to be applied to multiple users in one run.
Folder Redirection: Redirects Desktop and Documents folders to local paths on each PC.
Summary Report: Provides a summary of operations and their success or failure status.

Usage

Clone or Download the Repository:

    sh

    git clone https://github.com/yourusername/redirect-folders-script.git

Or download the ZIP file from the repository page and extract it.

Run the Script:
Right-click on the RedirectFolders.bat file and select "Run as administrator".
Follow the on-screen prompts to enter admin credentials and target usernames.

Follow Prompts:
The script will prompt for an administrator username.
Enter the target usernames for which you want to apply the script, separated by spaces.

Review Summary:
After the script completes, a summary of operations will be displayed, indicating success or failure for each user.

Example
Here is a sample usage scenario:

Run as Administrator:
Launch the script with elevated privileges.
Enter the admin username when prompted.

Enter Target Usernames:
Input the usernames of the users you want to redirect folders for (e.g., user1 user2 user3).

Script Execution:
The script will create local Desktop and Documents folders for each user if they don't already exist.
It will copy existing contents from the current user folders to the local paths.
The script updates the registry to point the user folders to the new local paths.

Summary Report:
A summary of operations will be displayed, showing the status for each user.
