## Installing Dependencies
1\. Like we've already seen, you start by creating a simple playbook that shows that Ansible can run against your Vagrant machine:

```console
$ mkdir provisioning
$ vi provisioning/playbook.yml
```

2\. In `provisioning/playbook.yml`, we specify on which hosts the playbook should run as well as a set of tasks to run. Just implement the `ping` module for now, like before:

<pre class="files" data-filename="playbook.yml"><blockquote>

---
- hosts: all
  become: true
  tasks:
    - name: Make sure we can connect
      ping:

</blockquote></pre>

3\. At this point, you should run `vagrant provision` again to prove that you can connect to it.

## Installation

#### Installing PHP

1\. Now that you know Ansible will run, let’s install PHP. Add the following to your playbook in the tasks section:

<pre class="files" data-filename="playbook.yml"><blockquote>

# PHP
- name: Add the ondrej PHP PPA
  apt_repository: repo='ppa:ondrej/php'

</blockquote></pre>

>Note: Remmeber, PPA stands for Personal Package Archive and it's what's used to assist the installation process.

2\. Once that’s installed, the next step is to install PHP. As you’ve added a PPA, you’ll want to update the apt package cache:

<pre class="files" data-filename="playbook.yml"><blockquote>

- name: Update the apt cache
  apt: update_cache=yes cache_valid_time=3600

- name: Install PHP
  apt: name=php state=present

</blockquote></pre>

# REPLACE
3\. Run `vagrant provision` again after adding these tasks, make sure it is completed successfully.

# REPLACE
4\. To make sure that things are working correctly, you can run `vagrant ssh` and log in to the machine, like you've done before.

5\. Once you’re logged in, run `which php` and make sure that it yields something similar to the following:

```
$ which php
```

Output:

```
/usr/bin/php
```

>Note: Once that runs, go ahead and exit out of the VM.

6\. That looks good, so let’s continue and install all of the other PHP packages that you’ll need. Let’s use `with_items` to make the playbook easier to read.

<pre class="files" data-filename="playbook.yml"><blockquote>

- name: Install PHP
  apt: name={{item}} state=installed
  with_items:
    - php
    - php-fpm
    - php-mysql
    - php-xml

</blockquote></pre>

>Note: You're only to change the "Install PHP" section.

7\. Unfortunately, installing PHP also installs Apache2. You don’t want to use that in this exercise. There’s no way around this, but you can remove it as soon as it’s installed by adding the following task to your playbook:

<pre class="files" data-filename="playbook.yml"><blockquote>

- name: Remove apache2
  apt: name=apache2 state=absent

</blockquote></pre>

# REPLACE
8\. Run `vagrant provision` to check functionality.

Great job!
