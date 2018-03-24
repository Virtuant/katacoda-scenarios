Now that you know Ansible will run, let’s install PHP. Add the following to your playbook in the tasks section:

ONDREJ, or GENERALIZED? - DAVID

```yml
# PHP
- name: Add the ondrej PHP PPA
  apt_repository: repo='ppa:ondrej/php'
```
OR

```yaml
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
```

>Note: Remember, PPA stands for Personal Package Archive and it's what's used to assist the installation process.

Once that’s installed, the next step is to install PHP. As you’ve added a PPA, you’ll want to update the apt package cache:

```yml
- name: Update the apt cache
  apt: update_cache=yes cache_valid_time=3600
  
- name: Install PHP
  apt: name=php state=present
```

Once you’re logged in, run `which php` and make sure that it yields something similar to the following:

```console
$ which php
```

Output:

```console
/usr/bin/php
```

>Note: Once that runs, go ahead and exit out of the VM.

Looks good, so let’s continue and install all of the other PHP packages that you’ll need. Let’s use `with_items` to make the playbook easier to read.

```yml
- name: Install PHP
  apt: name={{item}} state=installed
  with_items:
    - php
    - php-fpm
    - php-mysql
    - php-xml
```

>Note: You're only to change the "Install PHP" section.

Unfortunately, installing PHP also installs Apache2. You don’t want to use that in this exercise. 
There’s no way around this, but you can remove it as soon as it’s installed by adding the following task to your playbook:

```yml
- name: Remove apache2
  apt: name=apache2 state=absent
```

Great job!