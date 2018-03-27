
## Creating a New Config File
This is actually quite a lot of work! At this point, your installation is secure, but you’re not quite done. Like we learned, Ansible expects to be able to run database commands without a password, which was fine when you didn’t have a root password, but will fail now that you do. You need to write out a new config file (located at `/root/.my.cnf`) containing the new root password so that the root user can run MySQL commands automatically.

1\. First, you need to create a folder to hold your template and create the file that you are going to copy over. Run these commands from your terminal, in the same directory as your playbook, to create the required folders and files:

`mkdir -p templates/mysql && \
touch provisioning/templates/mysql/my.cnf`{{execute HOST1}}

2\. Once you’ve created `my.cnf`, edit it and make sure that it has the following contents:

<pre class="file" data-filename="my.cnf"><blockquote>

[client]
user=root
password={{ mysql_new_root_pass.stdout }}

</blockquote></pre>

3\. You also need to tell Ansible to copy this template into your environment; this is done using the template module, as discussed in the lecture. Add the following task to your playbook:

<pre class="file" data-filename="playbook.yml"><blockquote>

  - name: Create my.cnf
    template: src=templates/mysql/my.cnf dest=/root/.my.cnf

</blockquote></pre>

This file will contain the username and password for the root MySQL user.

4\. While it’s not a bad thing to rotate root passwords frequently, this may not be the behavior that you are seeking. To disable this behavior, you can tell Ansible not to run certain commands if a specific file exists. Ansible has a special creates option that determines if a file exists before executing a module:

<pre class="file" data-filename="playbook.yml"><blockquote>

  - name: Generate new root password
    command: openssl rand -hex 7 creates=/root/.my.cnf
    register: mysql_new_root_pass

</blockquote></pre>


If the file `/root/.my.cnf` does not exist, `mysql_new_root_pass.changed` will be true, and if it does exist, it'll be set to false.

5\. Here’s a small set of example tasks that show the new root password if `.my.cnf` does not exist and show a message if it already exists:

<pre class="file" data-filename="playbook.yml"><blockquote>

  - name: Generate new root password
    command: openssl rand -hex 7 creates=/root/.my.cnf
    register: mysql_new_root_pass
  # If /root/.my.cnf doesn't exist and the command is run
  - debug: msg="New root password is {{ mysql_new_root_pass.stdout }}"
    when: mysql_new_root_pass.changed
  # If /root/.my.cnf exists and the command is not run
  - debug: msg="No change to root password"
    when: not mysql_new_root_pass.changed

</blockquote></pre>


6\. Once you make the change to add `creates=/root/.my.cnf`, you should add a `when` argument to all of the relevant operations. After making these changes, the MySQL section of your playbook should look like this:

>Note: Make sure you are able to spot the changes we are making and that you understand why they are being made.

<pre class="file" data-filename="playbook.yml"><blockquote>

# MySQL
  - name: Install MySQL
    apt: name={{item}}
    with_items:
      - mysql-server
      - python-mysqldb
  - name: Generate new root password
    command: openssl rand -hex 7 creates=/root/.my.cnf
    register: mysql_new_root_pass
  - name: Remove anonymous users
    mysql_user: name="" state=absent
    when: mysql_new_root_pass.changed
  - name: Remove test database
    mysql_db: name=test state=absent
    when: mysql_new_root_pass.changed
  - name: Output new root password
    debug: msg="New root password is  {{mysql_new_root_pass.stdout}}"
    when: mysql_new_root_pass.changed
  - name: Update root password
    mysql_user: name=root host={{item}} password={{mysql_new_root_pass.stdout}}
    with_items:
      - "{{ ansible_hostname }}"
      - 127.0.0.1
      - ::1
      - localhost
    when: mysql_new_root_pass.changed
  - name: Create my.cnf
    template: src=templates/mysql/my.cnf dest=/root/.my.cnf
    when: mysql_new_root_pass.changed

</blockquote></pre>

# REPLACE
7\. Run Ansible  now to generate a new root password and clean up your MySQL installation. If you run Ansible again, you should see that all of these steps are skipped:

```
...
TASK [Remove anonymous users]
**************************************************
skipping: [default]
...
```
