
1\. Go ahead and run Ansible again, but for the last time in this lab:

`ansible-playbook -i 'localhost,' -c local playbook.yml`{{execute}}

Like we learned in the lecture, it isn't ideal to have a task that states *changed* every time Ansible runs. It could cause real trouble! Do you remember which task is causing this issue?

2\. Here’s a simple example of how you can use `changed_when`. List out the contents of the `/tmp` directory and if see the word "wordpress" occurs anywhere in the output. If so, Ansible will report that the task changed something.

<pre class="file" data-filename="playbook.yml"><blockquote>
    - name: Example changed_when
      command: ls /tmp
      register: demo
      changed_when: '"wordpress" in demo.stdout'
</blockquote></pre>

3\. If you edit the task that checks the database so that it looks like the following, your playbook will be fully idempotent again:

<pre class="file" data-filename="playbook.yml"><blockquote>
    - name: Does the database exist?
      command: mysql -u root wordpress -e "SELECT ID FROM wordpress.wp_users
      LIMIT 1;"
      register: db_exist
      ignore_errors: true
      changed_when: false
</blockquote></pre>

4\. Now, run Ansible to complete this lab and ensure your WordPress install is idempotent.

> SUCCESS!
