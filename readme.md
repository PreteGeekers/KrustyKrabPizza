Most of these scripts have been taken from Alum git repos.

# Windows Resources

Scripts
-------
* **FileSystemChecker**
This script watches the directory and its subdirectories for file creation, modification, and deletion.

Other Resources
---------------

# Linux Resources

Scripts
-------
* **check-con**
Retrieves all cron jobs on the system and outputs them to the terminal (as far as I can tell from one read through).
* **audit**
Run general system and user checks.  Use -c to run cron check.
* **immutableChk**
Searches the entire system for immutable files, then asks if you would like to remove the immutable flag.  Should be run as root to avoid permission denied errors.
* **pswd_kill**
Changes the password to all users using the bash shell then offers the option to kill all active connections in case the system has been comprimised.  Must be ran as root.
* **rbusybox**
usage: `./rbusybox <remoteUser> <remoteHost> <command>`  Send busybox to remote host and execute <command> under user <remoteUser>
