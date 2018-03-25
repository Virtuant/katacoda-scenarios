#### Installation Additions

1\. Let’s add PHP by adding another module entry, like `ping:` to the `playbook.yml` file, so that it looks like the following:

<pre class="file" data-filename="playbook.yml">
---
- hosts: all
  tasks:
    - name: Make sure that we can connect to the machine
      ping:
    - name: Install PHP
      apt: name=php5-cli state=present update_cache=yes
</pre>

Previously, you used the `ping` module to connect to your machine. This time, you’ll be using the `apt` module.

2\. If you run `vagrant provision` again, it should attempt to install the `php5` package. Unfortunately, it will fail, giving a message such as the following:

# REPLACE
```
$ vagrant provision
$ ansible-playbook...
```

Output:

```
...

TASK [Make sure that we can connect to the machine] ****************************
ok: [default]

TASK [Install PHP] *************************************************************
fatal: [default]: FAILED! => {"changed": false, "failed": true, "msg": "Failed to lock apt for exclusive operation"}
	to retry, use: --limit @path/to/playbook.retry

PLAY RECAP *********************************************************************
default                    : ok=2    changed=0    unreachable=0    failed=1   

Ansible failed to complete successfully. Any error output should be
visible above. Please fix these errors and try again.
```

3\. Ansible basically needs to sudo this command! However, let's add it to the playbook in such a way that the permission granted, can be reused by other commands. You'll do that by adding `become: true` to our playbook, like this:

<pre class="file" data-filename="playbook.yml">
---
- hosts: all
  become: true
  tasks:
    - name: Make sure that we can connect to the machine
      ping:
    - name: Install PHP
      apt: name=php5-cli state=present update_cache=yes
</pre>

4\. Once you’ve saved this change, run `vagrant provision` again. Ansible should tell you that PHP was installed successfully:

# REPLACE
```
$ vagrant provision
$ ansible-playbook...
```

5\. You can add more steps to install nginx and mySQL by adding more calls to the `apt` module saying that you expect nginx and `mysql-server-5.6` to be present.

<pre class="file" data-filename="playbook.yml">
---
- hosts: all
  become: true
  tasks:
    - name: Make sure that we can connect to the machine
      ping:
    - name: Install PHP
      apt: name=php5-cli state=present update_cache=yes
    - name: Install nginx
      apt: name=nginx state=present
    - name: Install mySQL
      apt: name=mysql-server-5.6 state=present
</pre>

6\. As with the `php5-cli` package, this should show up in your Ansible output when you run `vagrant provision` again:

# REPLACE
```
$ vagrant provision
$ ansible-playbook...
```

Output:

```
...

TASK [Install PHP] *************************************************************
ok: [default]

TASK [Install nginx] ***********************************************************
changed: [default]

TASK [Install mySQL] ***********************************************************
changed: [default]

PLAY RECAP *********************************************************************
default        : ok=5    changed=2    unreachable=0    failed=0
```
