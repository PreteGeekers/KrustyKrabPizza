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
| Node JS                   | 192.168.x.18 | 80, 22          |

* [Windows Domain Controller](https://technet.microsoft.com/en-us/library/cc977987.aspx)
  * Windows DCs are the central control point for Windows Domains. Policies, Users, Groups, and Security settings are centrally
managed from these systems
* [Gitlab](https://docs.gitlab.com/)
  * Git repository manager with a wiki, issue tracking, CI and CD. It is a great way to manage Git repositories on a centralized server. GitLab gives you complete control over your repositories or projects and allows you to decide whether they are public or private.
* [Windows Tomcat Server](https://tomcat.apache.org/tomcat-9.0-doc/index.html)
  * Tomcat is an open-source Java Servlet Container developed by the Apache Software Foundation (ASF). Tomcat implements several Java EE specifications including Java Servlet, JavaServer Pages (JSP), Java EL, and WebSocket, and provides a "pure Java" HTTP web server environment in which Java code can run.
* [Windows WSUS](https://docs.microsoft.com/en-us/windows-server/administration/windows-server-update-services/get-started/windows-server-update-services-wsus)
  * Windows Update Service
* [Jenkins](https://jenkins.io/doc/)
  * Jenkins is a self-contained, open source automation server which can be used to automate all sorts of tasks such as building, testing, and deploying software. Jenkins can be installed through native system packages, Docker, or even run standalone by any machine with the Java Runtime Environment installed.
* [phpBB](https://www.phpbb.com/support/docs/en/)
  * phpBB is an Internet forum package in the PHP scripting language. Features include support for multiple database engines (PostgreSQL, SQLite, MySQL, Oracle Database, Microsoft SQL Server), flat message structure (as opposed to threaded), hierarchical subforums, topic split/merge/lock, user groups, multiple attachments per post, full-text search, plugins and various notification options (e-mail, Jabber instant messaging, ATOM feeds).
* [Custom WebApp](https://www.owasp.org/index.php/Top_10-2017_Top_10)
  * This web app was created by and needed to be supported by the developers of your company. What it’s used for and why it exists is not apparent, but it’s legacy and management says it must stay and operate how it is. 
* Password Reset Page
  * This is how users in your organization change their passwords.
* [Node JS](https://nodejs.org/en/docs/)
  * Node.js is an open-source, cross-platform JavaScript run-time environment for executing JavaScript code server-side. It enables JavaScript to be used for server-side scripting, and runs scripts server-side to produce dynamic web page content before the page is sent to the user's web browser

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
