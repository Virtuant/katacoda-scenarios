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
