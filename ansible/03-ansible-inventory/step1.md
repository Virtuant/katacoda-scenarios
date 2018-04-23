
By default, Ansible will read `/etc/ansible/hosts` as its default inventory file. Using this file is not recommended, though. You should maintain a different inventory file for each project that you have and pass it to both the `ansible` and `ansible-playbook` commands using the `–i` option.

Here is an example of passing a custom inventory file to `ansible` before running the `ping` module:

```
ansible all –i /path/to/inventory -c local –m ping
```
>Note: The `-c local` option, tells Ansible to running the playbook via the inventory file, but locally.

We can run that command ourselves, but first we gotta create an inventory file. In this tutorial you have access to one host named `host01`. To let Ansible know about it, put its hostname in an inventory file.

1\. We'll call our inventory file `myhosts`, and you'll add one group called `group1`:

`echo "[group1]" > myhosts`{{execute HOST1}}

2\. Then, add the host to the group, while also passing the username to use for SSH access, as an inventory parameter.

`echo "host01 ansible_ssh_user=ubuntu" >> myhosts`{{execute}}

3\. You can obviously look at the editor, but of course, you can also use your terminal to verify that `myhosts` has been modified correctly, also:

`cat myhosts`{{execute}}

So, now we can move on to running that command!
