
1\. You will not want to give WordPress root access to your database, so let’s create a dedicated MySQL user to use by adding the following tasks to your playbook:

<pre class="file" data-filename="playbook.yml"><blockquote>
    - name: Create WordPress MySQL database
      mysql_db: name=wordpress state=present
    - name: Create WordPress MySQL user
      mysql_user: name=wordpress host=localhost password=bananas priv=wordpress.\*:ALL
</blockquote></pre>

Like we learned in the lecture, this will create a database called `wordpress` and a user called `wordpress`, with the password `bananas`.

>Note: Okay, so your password doesn't have to be "bananas" but you get the point!

2\. After running Ansible to create the database and user, go back to your web browser and continue the installation process from the GUI.

3\. Create `templates/wordpress/wp-config.php` and paste your config file into it.

4\. Once that’s done, add a task in your playbook to copy this file into the correct place:

<pre class="file" data-filename="wp-config.php"><blockquote>
    - name: Create wp-config
      template: src=templates/wordpress/wp-config.php dest=/var/www/book.example.com/wp-config.php
</blockquote></pre>

5\. After adding this task, run Ansible again in your terminal. And voilà!

`ansible-playbook -i 'localhost,' -c local playbook.yml`{{execute}}

>Note: Wait, no voilà? When you run Ansible, you may get an error message similar to the following:
`AnsibleError: ERROR! template error while templating string`<br>
If you get this error message, take a look at the contents your `wp-config.php` file. Do you see any place that has either `{{ or }}` in a string? Unfortunately, WordPress can generate this string as part of its secret keys. However, as you’re using Ansible’s template module, those characters have a special meaning. If your `wp-config` file contains them, feel free to edit the file and change them to any other character.

6\. Once Ansible has run successfully, go back to your web browser and click “Run the install.” It will ask you a few questions. Answer these questions and click on “Install WordPress.”

7\. If you visit http://book.example.com now in your browser, you should see a WordPress install up and running with a “Hello World” post waiting to greet you.

>Note: If your browser shows an error message relating to timeouts, make sure that you have added book.example.com to your hosts file, as discussed earlier in this chapter.

Okay, now voilà? Great job!

> SUCCESS!
