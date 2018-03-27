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


STEP03
Running a playbook
Playbook
A playbook is an entirely different way of running Ansible, that is far more powerful.

What is a play?
A play is a set of tasks mapped to a set of hosts. Plays are organised inside a text file called a playbook.

Running a playbook
This playbook runs one task, on our one host, host01. Note the indentation - it's important for how the file gets parsed. Blank lines are ignored, but makes the playbook more readable for humans.

---
- hosts: host01
  become: true
  tasks:
    - name: Install required packages
      apt: name={{item}} state=present update_cache=yes
      with_items:
        - php5-cli
        - nginx
        - mysql-server-5.6

The above code is already in a file called site.yml. Let's check the contents:

cat site.yml

To run the playbook, use the ansible-playbook command with the inventory file myhosts:

ansible-playbook -i myhosts site.yml

Ansible should return the result 'Changed=1', indicating that the package was installed.

Playbook breakdown
What happened here?



STEP04
Ansible ensures
A fundamental principle of Ansible is that it ensures a desired state.

From the previous example:

- name: ensure latest sysstat is installed
  apt:
    name: sysstat
    state: latest
This tells Ansible to check if the latest version of sysstat is installed. If it is, Ansible will do nothing more, since the "latest" state is already achieved. If sysstat is not already there, or of an older version than what is available, Ansible installs the latest version.

If you run the playbook again, Ansible does the former, and instead of "Changed: 1", you will get "OK: 2, Changed 0". Try it out:

ansible-playbook -i myhosts site.yml



STOP05
Ensure a package is removed
The apt module allows you to specify the state you wish the package to be in. If you want a specific version, you append it to the package name, for example:

- name: ensure sysstat is installed at version 10.2.0-1
  apt:
    name: sysstat=10.2.0-1
    state: installed
If you want to ensure that the package is not installed, you can declare that with state: absent, and Ansible will ensure it.

Update the playbook to remove sysstat.

sed -i -e 's/state: latest/state: absent/' -e 's/ensure.*/ensure sysstat is removed/' playbook.yml

Then re-run the playbook:

ansible-playbook -i myhosts playbook.yml

In summary, the same playbook should always be able to run on a host and - assuming there are no errors - produce exactly the desired state, regardless of what state the host started in. For example, should your playbook halt halfway through due to a network error, it would still finish successfully when you re-run it.
