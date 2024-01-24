# Secondary Logging 

FROM=$(who am i | awk '{print $1}') #This variable will show the name of the user that has written the command.
AS=$(whoami) #This variable will show the name of the effective user that the user is operating as.
TERMINAL=$(who am i | awk '{print $2}') #This variable will show the terminal where the user is operating.
IP=$(who am i | awk '{print $5}') #This variable will show the IP of the user.
## THIS OPTION IS NOW DEPRECATED: IP=$(who --ips | grep $TERMINAL | awk '{print $5}') #This variable will show the IP of the user.
HISTORY=$(history 1 | tr -s " " | cut -f 3- -d " " -s)


export PROMPT_COMMAND='logger -p local0.notice $(date "+%Y-%m-%d.%H:%M:%S") $FROM $AS $TERMINAL $IP $(pwd) $HISTORY' 
##export PROMPT_COMMAND='logger -n XX -P 514 -p local0.notice --tcp $(date "+%Y-%m-%d.%H:%M:%S") $FROM $AS $TERMINAL $IP $(pwd) $(history 1)'


