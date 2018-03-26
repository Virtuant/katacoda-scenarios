# Preparing Our Environment
c

### Lab Outline

STEP0O ---



STEP01
By default, Ansible will read /etc/ansible/hosts as its default inventory file. Using this file is not recommended, though. You should maintain a different inventory file
for each project that you have and pass it to both the ansible and ansible-playbook commands using the –i option. Here is an example of passing a custom inventory file to ansible before running the ping module:

ansible all –i /path/to/inventory –m ping

- create inventory "myhosts" (copy from previous model)

Creating an inventory
In this tutorial you have access to one host named host01. To let Ansible know about it, put its hostname in an inventory file. Let's call our inventory myhosts, with one group called group1.

echo "[group1]" > myhosts

Then add the host to the group:

echo "host01 ansible_ssh_user=ubuntu" >> myhosts

Here we're also passing the username to use for SSH access, as an inventory parameter.



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
