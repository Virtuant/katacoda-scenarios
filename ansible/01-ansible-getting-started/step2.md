## Check Ansible Version

1\. As soon as the ansible container are seen in the docker ps command, we should be able to connect to the Ansible container using our definition from the previous step:

`a`{{execute HOST1}}

2\. Let us verify the Ansible installation by running the command:

`ansible --version`{{execute HOST1}}

The output should look similar to:

<pre>
ansible 2.3.0.0
  config file = /etc/ansible/ansible.cfg
  configured module search path = Default w/o overrides
  python version = 2.7.6 (default, Oct 26 2016, 20:30:19) [GCC 4.8.4]
</pre>

#### Check Local Execution

We now can "ping" our local machine:

`ansible all -i 'localhost,' -c local -m ping`{{execute HOST1}}

> Note that an ansible ping is not an ICMP request, as you might expect. Instead, it is a test of the SSH connection. However, above we have used an Ansible command with `-c local` option. This option tells Ansible to bypass the network, so the Ansible client can execute local commands without the need of any SSH connection.

#### Check Remote Connections
The same Ansible ping will fail, if run it without the `-c local` flag:

`ansible all -i 'localhost,' -m ping`{{execute HOST1}}

This will lead to following error:

<pre style="color: red">

localhost | UNREACHABLE! => {
    "changed": false,
    "msg": "Failed to connect to the host via ssh: ssh: connect to host localhost port 22: Connection refused\r\n",
    "unreachable": true
}

</pre>

The same will occur, when we specify our remote target instead of 'localhost ...

`ansible all -i 'target,' -m ping`{{execute HOST1}}

...and accept the SSH fingerprint with `yes`{{execute HOST1}}

So, how do we resolve these issues and why are they happening?

The neat things about Ansible is that you don't have to install an Ansible agent on your target hosts, like with Puppet or Chef. However, this means that Ansible is using SSH to connect and execute tasks on target host. We've got a target host, but we haven't installed an SSH server, much less started it up!

That's what you're going to do next...
