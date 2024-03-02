# Secondary Logging

## Index

- Description 
 - Snap-in Files
    - Server's Snap-in Files
    - Clients' Snap-in Files
  - Output Descriptor
  - Last Update
  - Author
    
## Description

The secondary logging purpose is to keep a log of all the actions taken in all the nodes within our environment in a single collector node. This feature will provide us a detailed track of what has been done, by whom and when; a very useful tool for debuggin and monitoring all of our work.

## Snap-in Files

The secondary logging feature works with 3 snap-in files, one for the server and two for the client

### Server's Snap-in Files

    /etc/rsyslog.d/rsys.conf

This *.conf* file opens port 514 for tcp connection, waiting the node's logs to be classified by node's hostname and then separated files will be created in their correspondig folder(created automatically ad hoc) for each day with a YYYY-MM-DD format to ease organization.

### Clients' Snap-in Files

    /etc/profile.d/sl.sh
    
This script collects all the relevant information for the monitoring purpose of the secondary logging and then it calls for logger to create a log with a specific priority, using *local0* facility and *notice* level. More detailed description of the output will be given at **Output Description** section.

    /etc/rsyslog.d/local0.conf
    
This *.conf* file sends all local0.notice priority logs to the 514 port of the collector Node ip via TCP.


## Output Descriptor

The information collected in the log message will be, in order:

            User logged - Effective user - Terminal - IP - Working directory - Command
            
Year, month, day, hour, minute and second are included in the logger message, so they are not collected by the command itself.


## Last Update

2024-02-06


## Author

Written by Oriol Fernández 

