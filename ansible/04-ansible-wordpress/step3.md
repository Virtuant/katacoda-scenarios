#### [Optional] MySQL Security  
>Note: Do not attempt this section, unless otherwise instructed, or if this is your second time through.

Ansible installs MySQL with an empty root password and leaves some of the test databases accessible to anonymous users.

1\. To change the default password, you need to generate a password to use. To do this, you can use the `openssl` utility to generate a 15-character password. Add the following to your playbook:

<pre class="file" data-filename="playbook.yml"><blockquote>
    - name: Generate new root password
      command: openssl rand -hex 7
      register: mysql_new_root_pass
</blockquote></pre>

> Note: Remember, the register keyword lets you save the return value of commands as a variable for use later in a playbook.

2\. The next thing to do is to remove the anonymous users and test databases. This is very straightforward, thanks to the `mysql_db` and `mysql_user` modules. You need to do this before you change the root password so that Ansible can make the changes. Again, you need to add some tasks to your playbook:

<pre class="file" data-filename="playbook.yml"><blockquote>
    - name: Remove anonymous users
      mysql_user: name="" state=absent
    - name: Remove test database
      mysql_db: name=test state=absent
</blockquote></pre>

3\. To change the root password and output it to the screen, use the special `ansible_hostname` variable that evaluates to the current machine’s hostname and then set the password for the three different formats used to denote localhost:

<pre class="file" data-filename="playbook.yml"><blockquote>
    - name: Update root password
      mysql_user: name=root host={{item}} password={{mysql_new_root_pass.stdout}}
      with_items:
        - "{{ ansible_hostname }}"
        - 127.0.0.1
        - ::1
        - localhost

    - name: Output new root password
      debug: msg="New root password is {{mysql_new_root_pass.stdout}}"
</blockquote></pre>

###### Creating a New Config File

>Note: SKIP THIS PAGE, if you are not doing the security portion of MySQL configuration.

This is actually quite a lot of work! At this point, your installation is secure, but you’re not quite done. Like we learned, Ansible expects to be able to run database commands without a password, which was fine when you didn’t have a root password, but will fail now that you do. You need to write out a new config file (located at `/root/.my.cnf`) containing the new root password so that the root user can run MySQL commands automatically.

1\. First, you need to create a folder to hold your template and create the file that you are going to copy over. Run these commands from your terminal, in the same directory as your playbook, to create the required folders and files:

`mkdir -p templates/mysql && \
touch templates/mysql/my.cnf`{{execute}}

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
    # If `/root/.my.cnf` doesn't exist and the command is run
    - debug: msg="New root password is {{ mysql_new_root_pass.stdout }}"
      when: mysql_new_root_pass.changed
    # If `/root/.my.cnf` exists and the command is not run
    - debug: msg="No change to root password"
      when: not mysql_new_root_pass.changed
</blockquote></pre>


6\. Once you make the change to add `creates=/root/.my.cnf`, you should add a `when` argument to all of the relevant operations. After making these changes, the MySQL section of your playbook should look the one given below. Rather than copying and pasting the whole thing, compare your code to the following and append manually:

>Note: Make sure you are able to spot the changes we are making and that you understand why they are being made. If you are have been instructed not to do the MySQL Security portion, realize you only need to append one line.

<pre><blockquote>
  # MySQL
    - name: Install MySQL
      apt: name={{item}}
      with_items:
        - mysql-server
        - python-mysqldb

  # [OPTIONAL] MySQL Security - Start
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
  # [OPTIONAL] MySQL Security - End
</blockquote></pre>

7\. Run Ansible now to generate a new root password and clean up the MySQL installation:

`ansible-playbook -i 'localhost,' -c local playbook.yml`{{execute}}

8\. If you run Ansible again, you should see that all of these steps are skipped:

`ansible-playbook -i 'localhost,' -c local playbook.yml`{{execute}}

Output *Snippet*:
```
...
TASK [Remove anonymous users]
**************************************************
skipping: [default]
...
```
