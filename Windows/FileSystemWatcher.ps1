﻿#Majority of script scraped from old script by BigTeddy

#This script uses the .NET FileSystemWatcher class to monitor file events in folder(s).
#The -Action parameter can contain any valid Powershell commands.  I have just included two for example.
#The script can be set to a wildcard filter, and IncludeSubdirectories can be changed to $true.

$folder = 'c:' # Enter the root path you want to monitor.
$filter = '*.*'  # You can enter a wildcard filter here.

# In the following line, you can change 'IncludeSubdirectories to $false if required.                          
$fsw = New-Object IO.FileSystemWatcher $folder, $filter -Property @{IncludeSubdirectories = $true;NotifyFilter = [IO.NotifyFilters]'FileName, LastWrite'}

# Here, all three events are registered.

Register-ObjectEvent $fsw Created -SourceIdentifier FileCreated -Action {
$name = $Event.SourceEventArgs.Name
$changeType = $Event.SourceEventArgs.ChangeType
$timeStamp = $Event.TimeGenerated
Write-Host "The file '$name' was $changeType at $timeStamp" -fore green
Out-File -FilePath c:\scripts\filechange\outlog.txt -Append -InputObject "The file '$name' was $changeType at $timeStamp"}

Register-ObjectEvent $fsw Deleted -SourceIdentifier FileDeleted -Action {
$name = $Event.SourceEventArgs.Name
$changeType = $Event.SourceEventArgs.ChangeType
$timeStamp = $Event.TimeGenerated
Write-Host "The file '$name' was $changeType at $timeStamp" -fore red
Out-File -FilePath c:\scripts\filechange\outlog.txt -Append -InputObject "The file '$name' was $changeType at $timeStamp"}

Register-ObjectEvent $fsw Changed -SourceIdentifier FileChanged -Action {
$name = $Event.SourceEventArgs.Name
$changeType = $Event.SourceEventArgs.ChangeType
$timeStamp = $Event.TimeGenerated
Write-Host "The file '$name' was $changeType at $timeStamp" -fore white
Out-File -FilePath c:\scripts\filechange\outlog.txt -Append -InputObject "The file '$name' was $changeType at $timeStamp"}

# To stop the monitoring, run the following commands:
# Unregister-Event FileDeleted
# Unregister-Event FileCreated
# Unregister-Event FileChanged
