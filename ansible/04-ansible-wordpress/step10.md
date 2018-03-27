
#### WordPress Install Configuration

1\. The first thing that you’ll need to do is to extract `wordpress.zip`. Ansible ships with a module named unarchive that knows how to extract several different archive formats:

<pre class="file" data-filename="playbook.yml"><blockquote>
  - name: Unzip WordPress
    unarchive: src=files/wordpress.zip dest=/tmp copy=no creates=/tmp/wordpress/wp-settings.php
</blockquote></pre>


2\. Remember from the lecture, unzip doesn't come installed, so add this to your playbook (before you install PHP) to make sure it is:

<pre class="file" data-filename="playbook.yml"><blockquote>
  - name: Install required tools
    apt: name={{item}} state=present
    with_items:
      - unzip
</blockquote><pre>


3\. You will also need to add a `creates` argument so that the command is idempotent:

<pre class="file" data-filename="playbook.yml"><blockquote>
  - name: Create project folder
    file: dest=/var/www/book.example.com state=directory
  - name: Copy WordPress files
    command: cp -a /tmp/wordpress/. /var/www/book.example.com
    creates=/var/www/book.example.com/wp-settings.php
</blockquote></pre>


4\. Once this has run, visit http://book.example.com in your web browser; you should see a WordPress installation screen.

![image](https://user-images.githubusercontent.com/21102559/32393162-e089e0ca-c0ae-11e7-9cbb-42e37535620e.png)
