STEP02
Running Ansible
Ad-hoc Tasks
To run an ad-hoc task, using a single module, use ansible.

For example, to check the current date and time of the remote host:

ansible group1 -i myhosts -m command -a date

(if the command fails the first time, try again in few seconds, as the test host may not yet have been provisioned)

group1 = group to run against. You can also use the name of an individual host, so host01 would work just as well for this example.

myhosts = name of the inventory file listing all available hosts

command = module to use (the command module returns the result of a bash command)

date = argument for the module, in this case a standard shell command date.

When you run the command above, Ansible establishes an SSH connection with the remote host, executes the command, captures the output and returns it.
