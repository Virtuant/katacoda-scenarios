# DevNotes

- Add Inventory File
  - possibly use from 03

YOU MUST SET UP SSH IF YOU RUN (t)
## Target Host Instructions
In our case, the target is an Ubuntu machine with no SSH server installed. Let us do that now:

`apt-get update; apt-get install -y openssh-server; service ssh start`{{execute HOST1}}

Now, an ssh server is not only installed, but it's running. You can verify that by running:

`service ssh status`{{execute HOST1}}


## Ansible Host Instructions
On the ansible system, let us generate a SSH key pair like follows:
`ssh-keygen -t rsa`{{execute HOST1}}

Just keep the defaults, click into the Terminal and press return three times.

This will generate ~/.ssh/id_rsa.pub and ~/.ssh/id_rsa on the ~/.ssh directory:

`ls -ltr ~/.ssh`{{execute HOST1}}

Let us copy the public key of the Ansible host to a shared folder, we have prepared beforehand.

`cp ~/.ssh/id_rsa.pub /shared_volume/ansible_id_rsa.pub`{{execute HOST1}}

> In situations, where no shared_volume is available, it is sufficient to copy the content of the file to the clipboard, so we can paste it to the appropriate file on the target.

## Target Host Instructions
#### Append public key to target's authorized_keys file

In order to inform the target about the ansible host's public SSH key, we need to connect to the target again:

`exit`{{execute HOST1}}


`t`{{execute HOST1}}

The public SSH key of the Ansible host needs to be appended to the list of authorized_keys:

`[ ! -d ~/.ssh ] && mkdir ~/.ssh; cat /shared_volume/ansible_id_rsa.pub >> ~/.ssh/authorized_keys`{{execute HOST1}}

Let us review the resulting file:

`cat ~/.ssh/authorized_keys`{{execute HOST1}}

It should contain a line similar to following:

<pre>
ssh-rsa AAAAB3NzaC1yc2EAA...TtW8ZK5RCND/CR root@9c476c271d4f
</pre>
