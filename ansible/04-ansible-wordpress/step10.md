#### Manual Download and Placement

You can download the latest release with a command-line HTTP client named curl:

`mkdir -p provisioning/files
curl https://wordpress.org/latest.zip > provisioning/files/wordpress.zip`{{example}}

You’ll copy it into the `/tmp` directory by adding the following to your playbook under the tasks section:

```yml
# Wordpress
- name: Copy wordpress.zip into tmp
  copy: src=files/wordpress.zip dest=/tmp/wordpress.zip
```

#### WordPress Install Configuration

The first thing that you’ll need to do is to extract `wordpress.zip`. Ansible ships with a module named unarchive that knows how to extract several different archive formats:

```yml
- name: Unzip WordPress
  unarchive: src=files/wordpress.zip dest=/tmp copy=no creates=/tmp/wordpress/wp-settings.php
```

Remember unzip doesn't come installed, so add this to your playbook (before you install PHP) to make sure it is:

```yml
- name: Install required tools
  apt: name={{item}} state=present
  with_items:
    - unzip
```

You will also need to add a `creates` argument so that the command is idempotent:

```yml
- name: Create project folder
  file: dest=/var/www/book.example.com state=directory

- name: Copy WordPress files
  command: cp -a /tmp/wordpress/. /var/www/book.example.com creates=/var/www/book.example.com/wp-settings.php
```

Once this has run, visit http://book.example.com in your web browser; you should see a WordPress installation screen.

![image](https://user-images.githubusercontent.com/21102559/32393162-e089e0ca-c0ae-11e7-9cbb-42e37535620e.png)
