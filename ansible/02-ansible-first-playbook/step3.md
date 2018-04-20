
1\. Previously, you used the `ping` module to connect to your machine. This time, you’ll be using the `apt` module to install something on that machine:

<pre class="file" data-filename="playbook.yml" data-target="replace"><blockquote>

---
- hosts: all
  tasks:
    - name: Make sure that we can connect to the machine
      ping:
    - name: Install PHP
      apt: name=php-cli state=present update_cache=yes

</blockquote></pre>

2\. If you provision this changes again, it should attempt to install the `php-cli` package.

`ansible-playbook -i 'localhost,' -c local playbook.yml`{{execute HOST1}}

Unfortunately, it fails, giving a message such as the following:

```bash
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

3\. Ansible basically needs to `sudo` this command! However, let's add it to the playbook in such a way that the permission granted can be reused by other commands. You'll do that by adding `become: true` to our playbook, like this:

<pre class="file" data-filename="playbook.yml" data-target="replace"><blockquote>

---
- hosts: all
  become: true
  tasks:
    - name: Make sure that we can connect to the machine
      ping:
    - name: Install PHP
      apt: name=php-cli state=present update_cache=yes

</blockquote></pre>

4\. Once you’ve entered this change, run the playbook again. This time, Ansible should tell you that PHP has been installed successfully:

`ansible-playbook -i 'localhost,' -c local playbook.yml`{{execute HOST1}}

>Note: This installation process may take up to a minute, so please be patient.

5\. You can add more steps to install Nginx and MySQL by adding more calls to the `apt` module saying that you expect `nginx` and `mysql-server` to be present.

<pre class="file" data-filename="playbook.yml" data-target="replace"><blockquote>

---
- hosts: all
  become: true
  tasks:
    - name: Make sure that we can connect to the machine
      ping:
    - name: Install PHP
      apt: name=php-cli state=present update_cache=yes
    - name: Install nginx
      apt: name=nginx state=present
    - name: Install mySQL
      apt: name=mysql-server state=present

</blockquote></pre>

6\. As with the `php-cli` package, this should show up in your Ansible output when you run the playbook once again:

`ansible-playbook -i 'localhost,' -c local playbook.yml`{{execute HOST1}}

Output:

```bash
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
