#### Create MySQL User Credentials

1\. You will not want to give WordPress root access to your database, so let’s create a dedicated MySQL user to use by adding the following tasks to your playbook:

```yml
- name: Create WordPress MySQL database
  mysql_db: name=wordpress state=present

- name: Create WordPress MySQL user
  mysql_user: name=wordpress host=localhost password=bananas priv=wordpress.*:ALL
```

Like we learned in the lecture, this will create a database called wordpress and a user called wordpress, with the password bananas.

>Note: Okay, so your password doesn't have to be "bananas" but you get the point!

2\. After running Ansible to create the database and user, go back to your web browser and continue the installation process from the GUI.

3\. Create `provisioning/templates/wordpress/wp-config.php` and paste your config file into it.

4\. Once that’s done, add a task in your playbook to copy this file into the correct place:

```yml
- name: Create wp-config
  template: src=templates/wordpress/wp-config.php dest=/var/www/book.example.com/wp-config.php
```

5\. After adding this task, run Ansible again by running the `vagrant provision` command in your terminal. And voilà!

>Note: Wait, no voilà? When you run Ansible, you may get an error message similar to the following:
`AnsibleError: ERROR! template error while templating string`<br>
If you get this error message, take a look at the contents your wp-config.php file. Do you see any place that has either `{{ or }}` in a string? Unfortunately, WordPress can generate this string as part of its secret keys. However, as you’re using Ansible’s template module, those characters have a special meaning. If your `wp-config` file contains them, feel free to edit the file and change them to any other character.

6\. Once Ansible has run successfully, go back to your web browser and click “Run the install.” It will ask you a few questions. Answer these questions and click on “Install WordPress.”

7\. If you visit http://book.example.com now in your browser, you should see a WordPress install up and running with a “Hello World” post waiting to greet you.

>Note: If your browser shows an error message relating to timeouts, make sure that you have added book.example.com to your hosts file, as discussed earlier in this chapter.

Okay, now voilà? Great job! We are almost there, so let's finish strong.

#### Making a Backup

Now, you'll need to make a backup, so that if you were to destroy this instance you could bring it back up at 100%. As it is right now, you would be 90 percent of the way to a WordPress install. You would end up at that final screen where you need to provide details about your website. All of that information is stored in the database, so let’s make a backup and have Ansible automatically import it.

1\. Log in to the environment with `vagrant ssh` and continue on to the next step.

2\. Run the following commands to create a backup SQL file to be used by your playbook:

```console
# sudo su -
# mysqldump wordpress > /vagrant/provisioning/files/wp-database.sql
# exit
# exit
```

>Note: Again, note that we've used (#) here, because these commands are to be run inside our machine.

3\. We’re going to use a new feature we discussed in the lecture, `ignore_errors`. Like we learned, when a command fails with a non-zero exit code, Ansible throws the error back to you. Using `ignore_ errors` on a command tells Ansible that it’s OK for that command to fail:

```yml
- name: Does the database exist?
  command: mysql -u root wordpress -e "SELECT ID FROM wordpress.wp_users LIMIT 1;"
  register: db_exist
  ignore_errors: true
```

4\. If you need to import the database, you’ll need to copy your database to the remote environment before you import it, so you will need two tasks to perform the import:

```yml
- name: Copy WordPress DB
  copy: src=files/wp-database.sql dest=/tmp/wp-database.sql
  when: db_exist.rc > 0

- name: Import WordPress DB
  mysql_db: target=/tmp/wp-database.sql state=import name=wordpress
  when: db_exist.rc > 0
```

5\. Make sure to add the above lines of code to your playbook, but once you're done, run `vagrant provision` to finialize our changes. Pay close attention to which tasks are skipped!


#### Making It Idempotent

1\. Go ahead and run `vagrant provision`, again.

Like we learned in the lecture, it isn't ideal to have a task that states *changed* every time Ansible runs. It could cause real trouble! Do you remember which task is causing this issue?

2\. Here’s a simple example of how you can use `changed_when`. List out the contents of the `/tmp` directory and if see the word "wordpress" occurs anywhere in the output. If so, Ansible will report that the task changed something.

```yml
- name: Example changed_when
  command: ls /tmp
  register: demo
  changed_when: '"wordpress" in demo.stdout'
```  

3\. If you edit the task that checks the database so that it looks like the following, your playbook will be fully idempotent again:

```yml
- name: Does the database exist?
  command: mysql -u root wordpress -e "SELECT ID FROM wordpress.wp_users
  LIMIT 1;"
  register: db_exist
  ignore_errors: true
  changed_when: false
```
#### Conclusion

At this point, you can run `vagrant destroy` and then `vagrant up` to destroy your environment and spin it up as an empty box. Ansible will run and automatically provision your WordPress install for you. It may take a few minutes, as it’s installing all of your dependencies as well as configuring WordPress.
