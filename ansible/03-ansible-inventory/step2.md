
To run an ad-hoc task, like the one we saw using a single module, use the `ansible` command.

1\. So, now running the previous command, looks like this:

`ansible all -i 'myhosts,' -c local -m ping`{{execute}}

By using the (`-i`) you indicate to Ansible that you want to run the command via the inventory file. Which in this case, is our `myhosts` file.

>Note: If the above command fails, double check the actually command copied to the terminal, make the needed adjustments and run it again. Sometimes this command doesn't copy over correctly.

2\. When asked to authenticate the host, simply type `yes`, followed by `ENTER`. You should then see something like, this:

```
Output:
host01 | success >> {
    "changed": false,
    "ping": "pong"
}
```

3\. Then, you can check the current date and time of the remote host, like this:

`ansible group1 -i 'myhosts,' -c local -m command -a date`{{execute}}

>Note: If the command fails the first time, try again in few seconds, as the test host may not yet have been provisioned.

##### Let's break down the command, you just ran:
`group1` = group to run against. You can also use the name of an individual host, so `host01` would work just as well for this example.

`myhosts` = name of the inventory file listing all available hosts.

`command` = module to use (the command module returns the result of a bash command).

`date` = argument for the module, in this case a standard shell command date.

When you run the command above, Ansible establishes an SSH connection with the remote host, executes the command, captures the output and returns it.

4\. [Optional ]Now, use this same command structure and run a command of your own!

`ansible group1 -i "inventory" -m "module" -a "module-argument"`

>Hint: When was the last time anybody updated this thing?
