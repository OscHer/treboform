# Backlog managing


## Methodological Description
All the collaborators in this project are trained in whenever they detect a task
that must be done but doing it now would interrupt at all they current task, or 
is a task they left incomplete for any reason, they must add a comment tag in the
code, either in the same document where it will be finally placed or in the 
document they are working now that calls for the incomplete work. 

That comment tag must have the exact format of:

    TODO-{User}: {Task}

Where {User} is the person who has to do the work,if there is someone who has to do
it specifically, and {Task} the description of the mentioned work. 

With this procedure all the pending task will be easily found and then listed in a 
.txt file This way is far more efficient than creating a 'to-do list' file that 
collaborators should fullfil with detected task, stoping their work to open a new 
document in a different directory, or even creating it if it does not exists yet.

## Use of grep
For the purpose of organizing, grep will be use to filter all the coincidences and
the result will be saved in a file readable for everyone to know all the pending 
tasks.

    grep -Rns TODO /{project-folder} > {project-folder}/meta/backlog.txt

Where {project-folder} is the main folder which contains every file.

Each collaborator, in turn, can filter this file to see which are their tasks.

## Export of Backlog
TODO: WIP


