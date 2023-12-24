# Secondary Logging 

export HISTSIZE=5000
FROM= $(who am i | awk '{print $1}')
AS= $(whoami)
TERMINAL= $(who am i | awk '{print $2}')
IP= $(who am i | awk '{print $5}')

[ -d /var/log/history/SecondaryLogging ] || mkdir -p /var/log/secondarylogging
chmod 700 /var/log/secondarylogging

export PROMPT_COMMAND= echo "$(date "+%Y-%m-%d.%H:%M:%S") $FROM $AS $TERMINAL $IP $(pwd) $(history 1)" >> /var/log/secondarylogging/$(date "+%Y-%m-%d")


