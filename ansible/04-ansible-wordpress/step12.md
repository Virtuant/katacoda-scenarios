
Now, you'll need to make a backup, so that if you were to destroy this instance you could bring it back up at 100%. As it is right now, you would be 90 percent of the way to a WordPress install. You would end up at that final screen where you need to provide details about your website. All of that information is stored in the database, so let’s make a backup and have Ansible automatically import it.


1\. Run the following commands to create a backup SQL file to be used by your playbook:

`sudo su - && \
mysqldump wordpress > /files/wp-database.sql && \
exit && \
exit`{{execute}}

>Note: Again, note that we've used (#) here, because these commands are to be run inside our machine.

2\. We’re going to use a new feature we discussed in the lecture, `ignore_errors`. Like we learned, when a command fails with a non-zero exit code, Ansible throws the error back to you. Using `ignore_ errors` on a command tells Ansible that it’s OK for that command to fail:

<pre class="file" data-filename="playbook.yml"><blockquote>
    - name: Does the database exist?
      command: mysql -u root wordpress -e "SELECT ID FROM wordpress.wp_users LIMIT 1;"
      register: db_exist
      ignore_errors: true
</blockquote></pre>


3\. If you need to import the database, you’ll need to copy your database to the remote environment before you import it, so you will need two tasks to perform the import:

<pre class="files" data-filename="playbook.yml"><blockquote>
    - name: Copy WordPress DB
      copy: src=files/wp-database.sql dest=/tmp/wp-database.sql
      when: db_exist.rc > 0
    - name: Import WordPress DB
      mysql_db: target=/tmp/wp-database.sql state=import name=wordpress
      when: db_exist.rc > 0
</blockquote></pre>

4\. Make sure to add the above lines of code to your playbook, but once you're done, run Ansible to finialize our changes. Pay close attention to which tasks are skipped!

`ansible-playbook -i 'localhost,' -c local playbook.yml`{{execute}}
