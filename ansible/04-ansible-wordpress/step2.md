
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

`ansible-playbook -i 'localhost,' -c local playbook.yml`{{execute}}

>Note: Don't be discouraged if it doesn't run successfully the first time. Go back, check your code, run it again, and if you still can't get it, alert your instructor.
