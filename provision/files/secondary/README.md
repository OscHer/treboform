# Secondary Logging

Secondary Logging is a simple but quite effective strategy to
log every command is executed from a login terminal.


## Appendix

### Good practices and other musts
* Avoid setuid root spoofing attacks: See Bash Cookbook 14.2
* Secure $PATH: Bash Cookbook 14.3
* Clear aliases: Bash Cookbook 14.4
* Clear Command Hash: Bash Cookbook 14.5
* Setting a Secure $IFS: Bash Cookbook 14.7

### Milestones
* Integrate it with rsyslog

### Improvements
* Use auditd (Still don't know full features)
