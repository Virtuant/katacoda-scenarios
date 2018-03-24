Let us exit from the ansible container:

`exit`{{execute HOST1}}

Enter the target host container:

`t`{{execute HOST1}}

In our case, the target is an Ubuntu machine with no SSH server installed. Let us do that now:

`apt-get update; apt-get install -y openssh-server; service ssh start`{{execute HOST1}}

Now, an ssh server is not only installed, but it's running. You can verify that by running:

`service --status-all`{{execute HOST1}}

Do you see it?

Okay, so now what? Well, we're one step closer, but now we need to introduce a few changes on the Ansible host container. So, click "Continue" and get started!
