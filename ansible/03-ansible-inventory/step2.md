
To run an ad-hoc task, like the one we saw using a single module, use the `ansible` command.

1\. We can always run our ad-hoc commands off the localhost, like this:

`ansible all -i 'localhost,' -c local -m ping`{{execute}}

Output:

```
Output:
localhost | success >> {
    "changed": false,
    "ping": "pong"
}
```
But that's not very realistic! Besides, why did we go to all that trouble to create an inventory file, if we weren't going to use it?

3\. So, run another ad-hoc command, but this time run it using the inventory file you created:

`ansible group1 -i myhosts -m command -a date`{{execute}}

>Note: You may be asked to authenticate the host; simply type `yes` and hit `[ENTER]`.

Output:
```
The authenticity of host 'host01 (172.17.0.43)' can't be established.
ECDSA key fingerprint is 4f:91:e8:e4:cb:de:63:15:f9:c9:b6:a8:96:43:84:ea.
Are you sure you want to continue connecting (yes/no)? yes

host01 | success | rc=0 >>
Mon Jan 01 00:00:00 UTC 2018
```

##### Let's break down the command, you just ran:
- `group1` group to run against. You can also use the name of an individual host, so `host01` would work just as well for this example.
- `myhosts` name of the inventory file listing all available hosts.
- `command` module to use (the command module returns the result of a bash command).
- `date` argument for the module, in this case a standard shell command date.

When you run the command above, Ansible establishes an SSH connection with the remote host, executes the command, captures the output and returns it.

4\. [Optional ]Now, use this same command structure and run a command of your own!

`ansible group1 -i "inventory" -m "module" -a "module-argument"`
