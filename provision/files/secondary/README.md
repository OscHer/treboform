# Secondary Logging

## Index

    Description
    Snap-in Files
        Server's Snap-in Files
        Clients' Snap-in Files
    Output Descriptor
    Last Update
    Author
    
## Description

The secondary logging purpose is to keep a log with all the actions taken in all the terminals within our network. This feature will provide us a detailed track of what has been done, by whom and when, a very useful tool for debuggin and monitoring all of our work.

## Snap-in Files

The secondary logging feature works with 3 snap-in files, one for the server and two for the client

### Server's Snap-in Files

    rsys.conf

located at /etc/rsyslog.d/

### Clients' Snap-in Files

    sl.sh
located at /etc/profile.d/

    local0.conf

located at /etc/rsyslog.d/

## Output Descriptor

Year, month, day, hour, minute and second are included in the logger message, so are not collected by the command.

The information in the log message will be, in order:

            User logged - Effective user - Terminal - IP - Working directory - Command

## Last Update

2024-02-01


## Author

Written by Oriol Fernández 

