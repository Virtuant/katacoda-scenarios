
## Installing MySQL
1\. Once you have PHP installed (and Apache removed), you can move on to the next dependency, MySQL. Add the following to your playbook:

<pre class="file" data-filename="playbook.yml"><blockquote>
# MySQL
  - name: Install MySQL
    apt: name={{item}} state=present
    with_items:
      - mysql-server
      - python-mysqldb
</blockquote></pre>

2\. Now, you should run Ansible now, to install all of the PHP and MySQL packages. It may take a few minutes, but it should complete successfully.

`ansible-playbook -i 'localhost,' -c local playbook.yml`{{execute HOST1}}

>Note: Don't be discouraged if it doesn't run successfully the first time. Gi back, check your code, run it again, and if you still can't get it, alert your instructor.

#### [Optional] MySQL Security  
Ansible installs MySQL with an empty root password and leaves some of the test databases accessible to anonymous users.

>Note: Do not attempt this section, unless otherwise instructed, or this is your second time through.

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


Great job! You're halfway there.
