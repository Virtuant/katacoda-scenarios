At this point, you can log in to your virtual machine to make sure that everything is installed as you would expect it to be.

Like before, to do this, you run vagrant ssh to log in. Then, you can run a few commands to check whether certain programs are installed:

`which php`{{execute}}

Output:

```
/usr/bin/php
```

`which nginx`{{execute}}

Output:

```
/usr/sbin/nginx
```

`which mysqld`{{execute}}

Output:

```
/usr/sbin/mysqld
```

Before moving forward, be sure to exit the instance by typing exit.

Once you have PHP installed (and Apache removed), you can move on to the next dependency, MySQL. Add the following to your playbook:

```yml
# MySQL
- name: Install MySQL
  apt: name={{item}} state=present
  with_items:
    - mysql-server-5.6
    - python-mysqldb
```

Now, you should run `vagrant provision` now to install all of the PHP and MySQL packages. It may take a few minutes, but it should complete successfully.

#### [Optional] MySQL Security

Ansible installs MySQL with an empty root password and leaves some of the test databases accessible to anonymous users.

To change the default password, you need to generate a password to use. To do this, you can use the `openssl` utility to generate a 15-character password. Add the following to your playbook:

```yml
- name: Generate new root password
  command: openssl rand -hex 7
  register: mysql_new_root_pass
```

> Note: Remember, the register keyword lets you save the return value of commands as a variable for use later in a playbook.

The next thing to do is to remove the anonymous users and test databases. This is very straightforward, thanks to the `mysql_db` and `mysql_user` modules. You need to do this before you change the root password so that Ansible can make the changes. Again, you need to add some tasks to your playbook:

```yml
- name: Remove anonymous users
  mysql_user: name="" state=absent

- name: Remove test database
  mysql_db: name=test state=absent
```

To change the root password and output it to the screen, use the special `ansible_hostname` variable that evaluates to the current machine’s hostname and then set the password for the three different formats used to denote localhost:

```yml
- name: Update root password
  mysql_user: name=root host={{item}} password={{mysql_new_root_pass.stdout}}
  with_items:
    - "{{ ansible_hostname }}"
    - 127.0.0.1
    - ::1
    - localhost

- name: Output new root password
  debug: msg="New root password is {{mysql_new_root_pass.stdout}}"
```

Great job! You're halfway there.
