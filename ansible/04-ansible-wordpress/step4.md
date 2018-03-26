
#### Installing Nginx

1\. Now, let’s install nginx by adding the following to the end of playbook.yml:

```yml
# nginx
- name: Install nginx
  apt: name=nginx state=present

- name: Start nginx
  service: name=nginx state=started
```

2\. Run `vagrant provision` again to install nginx and start it running.

3\. Now, visit `192.168.33.20` in your web browser, you will see the “Welcome to nginx” page.

>Note: This IP is the one you've established in your Vagrantfile. It may vary from the one above, check your Vagrantfile, if needed.

![image](https://user-images.githubusercontent.com/21102559/32392705-0895e2d2-c0ad-11e7-8d23-1bdcf4f379b0.png)

#### Nginx Forwarding Fixes

Pretty cool, huh? But, this isn’t what you want your users to see. You want them to see WordPress!

1\. So, you need to change the default nginx virtual host to receive requests and forward them. Run the following commands in the same directory as your Vagrantfile to create a template file that you’ll use to configure nginx:

```console
$ mkdir provisioning/templates/nginx
$ touch provisioning/templates/nginx/default
```

2\. You’ll also need to copy this file onto your remote machine using the template module. Let’s add a task to your playbook to do this:

```yml
- name: Create nginx config
  template: src=templates/nginx/default dest=/etc/nginx/sites-available/default
```

3\. Edit `provisioning/templates/nginx/default` and make sure that it contains the following content:

```txt
server {
        server_name book.example.com;
        root /var/www/book.example.com;

        index index.php;

        location = /favicon.ico {
                log_not_found off;
                access_log off;
	      }
        location = /robots.txt {
                allow all;
                log_not_found off;
                access_log off;
	      }

	      location ~ /\. {
                deny all;
	      }
 	      location ~* /(?:uploads|files)/.*\.php$ {
                deny all;
	      }

	      location / {
                try_files $uri $uri/ /index.php?$args;
	      }
        rewrite /wp-admin$ $scheme://$host$uri/ permanent;

        location ~*
^.+\.(ogg|ogv|svg|svgz|eot|otf|woff|mp4|ttf|rss|atom|jpg|jpeg|gif|png|ico|zip|tgz|gz|rar|bz2|doc|xls|exe|ppt|tar|mid|midi|wav|bmp|rtf)$ {
                access_log off;
                log_not_found off;
	               expires max;
	      }

	      location ~ [^/]\.php(/|$) {
                 fastcgi_split_path_info ^(.+?\.php)(/.*)$;
                 if (!-f $document_root$fastcgi_script_name) {
			                   return 404;
		             }
		             include fastcgi_params;
		             fastcgi_index index.php;
		             fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
		             fastcgi_pass php;
	      }
}

```

#### Adding Nginx Upstream

1\. Now, you need to create an upstream definition in the configuration file so that nginx knows where to pass the request on to. Add the following at the **top** of your template before the opening server { line }:

```txt
        upstream php {
                server unix:/run/php/php7.2-fpm.sock;
}
```

>Note: Understand that php7.2 made not be right and you'll only know that by doing the next step.

2\. [Important] Remember from the lecture, you'll need to confirm which socket your PHP-FPM pool is listening on. If the results are differ from the code sample above, you will have to update the code. Go ahead an ssh into your machine and run the following commands:

```console
$ vagrant ssh
# ls /etc/php/
# cat /etc/php/7.X/fpm/pool.d/www.conf  | grep "listen ="
# exit
```

>Note: Remember, pay close attention to whether ($) or (#) are used, because they indicate where the code is to be run.

3\. Make sure that you run `vagrant provision` to bring everything up to date.

### Tasks & Handlers

We learned in the lecture that we face a unquie challenge here. Nginx needs to be restarted in order to pick-up changes, but we don't want Nignx to restart everytime we run our playbook. The best way to "handle" things that need to be restarted, only when things change, is to use a *handler*.

#### Handler Configuration

1/. Add the following lines of code to your playbook, putting them on the same level and indentation as `tasks`:

```yml
handlers:
    - name: restart nginx
      service: name=nginx state=restarted
```

2\. You can trigger it whenever your `config` file changes, by updating the "Create nginx config" task, to look like this:

<pre>
- name: Create nginx config
  template: src=templates/nginx/default dest=/etc/nginx/sites-available/default
  <b>notify: restart nginx</b>
</pre>

3\. Be sure to save it! But, this feels like a good opportunity to run `vagrant destroy`, followed by `vagrant up` to confirm that everything is installed and configured correctly.

#### Handler and Configuration Testing

After running vagrant up, your new config should rollout and nginx should be restarted.

1\. To test this, include the IP address and domain that you’ve been using to the bottom of the `/etc/hosts` file, on your host machine (not your VM):

```txt
192.168.33.20 book.example.com
```

2\. Now, as before, log in to the virtual machine with `vagrant ssh`.

3\. Once you've successfully logged in, run the following commands to formulate the test display:

```console
# sudo mkdir -p /var/www/book.example.com
# echo "<?php echo date('H:i:s'); " | sudo tee /var/www/book.example.com/index.php
```

4\. Always remember to exit out of your instances, before running further commands!

```
# exit
```

5\. Finally, visit `http://book.example.com` in your browser. You should see the current time.

Now, that is pretty cool, huh? I hope you're proud of yourself.

### WordPress: Download, Install and Configure

#### Manual Download and Placement

1\. You can download the latest release with a command-line HTTP client named curl:

```console
$ mkdir -p provisioning/files
$ curl https://wordpress.org/latest.zip > provisioning/files/wordpress.zip
```

2\. You’ll copy it into the `/tmp` directory by adding the following to your playbook under the tasks section:

```yml
# Wordpress
- name: Copy wordpress.zip into tmp
  copy: src=files/wordpress.zip dest=/tmp/wordpress.zip
```

#### WordPress Install Configuration

1\. The first thing that you’ll need to do is to extract `wordpress.zip`. Ansible ships with a module named unarchive that knows how to extract several different archive formats:

```yml
- name: Unzip WordPress
  unarchive: src=files/wordpress.zip dest=/tmp copy=no creates=/tmp/wordpress/wp-settings.php
```

2\. Remember from the lecture, unzip doesn't come installed, so add this to your playbook (before you install PHP) to make sure it is:

```yml
- name: Install required tools
  apt: name={{item}} state=present
  with_items:
    - unzip
```

3\. You will also need to add a `creates` argument so that the command is idempotent:

```yml
- name: Create project folder
  file: dest=/var/www/book.example.com state=directory

- name: Copy WordPress files
  command: cp -a /tmp/wordpress/. /var/www/book.example.com creates=/var/www/book.example.com/wp-settings.php
```

4\. Once this has run, visit http://book.example.com in your web browser; you should see a WordPress installation screen.

![image](https://user-images.githubusercontent.com/21102559/32393162-e089e0ca-c0ae-11e7-9cbb-42e37535620e.png)

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
