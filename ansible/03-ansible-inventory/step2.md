## Running Ad-hoc Tasks
To run an ad-hoc task, like the one we saw using a single module, use the ansible command.

1\. So, now running the previous command, looks like this:

`ansible all –i myhosts –m ping`{{execute HOST1}}

2\. Check the current date and time of the remote host, like this:

`ansible group1 -i myhosts -m command -a date`{{execute HOST1}}

>Note: If the command fails the first time, try again in few seconds, as the test host may not yet have been provisioned.

##### Let's break down the command, you just ran:
`group1` = group to run against. You can also use the name of an individual host, so `host01` would work just as well for this example.

`myhosts` = name of the inventory file listing all available hosts.

`command` = module to use (the command module returns the result of a bash command).

`date` = argument for the module, in this case a standard shell command date.

When you run the command above, Ansible establishes an SSH connection with the remote host, executes the command, captures the output and returns it.

3\. Now, use this same command structure and run a command of your own!

`ansible group1 -i "inventory" -m "module" -a "module-argument"`

>Hint: When was the last time anybody updated this thing?
