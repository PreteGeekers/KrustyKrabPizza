Most of these scripts have been taken from Alum git repos.

# Services
| Server                    | Internal IP  | Ports           |
| ------------------------- | ------------ | --------------- |
| Windows Domain Controller | 192.168.x.10 | 88, 3389, 445   |
| Gitlab                    | 192.168.x.11 | 80, 443, 22     |
| Windows Tomcat Server     | 192.168.x.12 | 3389, 8080      |
| Windows WSUS              | 192.168.x.13 | 445, 3389, 8530 |
| Jenkins                   | 192.168.x.14 | 80, 22          |
| phpBB                     | 192.168.x.15 | 80, 22          |
| Custom WebApp             | 192.168.x.16 | 80, 22          |
| Password Reset Page       | 192.168.x.17 | 80              |
| Node JS                   | 192.168.x.18 | 80              |

# Windows Resources

Scripts
-------
* **FileSystemChecker**
This script watches the directory and its subdirectories for file creation, modification, and deletion.
* **computercheck.bat**
Looks for suspicious files on file system. Taken from https://github.com/mike-bailey
* **generatereports.bat**
Generates reports about general system info. Taken from https://github.com/mike-bailey
* **legacy.bat**
Not sure what this does yet, the code is messy.  https://github.com/mike-bailey

Other Resources
---------------
[Custom View In Event Viewer](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc709635%28v%3dws.10%29)

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
* **linux.sh**
Someone on Linux read through this.  Looks super useful. Taken from https://github.com/mike-bailey
* **mdc3bash.sh**
Same as linux.sh.
