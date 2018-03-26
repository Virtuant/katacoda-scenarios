Go ahead and run `vagrant provision`, again.

Like you learned, it isn't ideal to have a task that states *changed* every time Ansible runs. It could cause real trouble! Do you remember which task is causing this issue?

Here’s a simple example of how you can use `changed_when`. List out the contents of the `/tmp` directory and if see the word "wordpress" occurs anywhere in the output. If so, Ansible will report that the task changed something.

```yml
- name: Example changed_when
  command: ls /tmp
  register: demo
  changed_when: '"wordpress" in demo.stdout'
```  

If you edit the task that checks the database so that it looks like the following, your playbook will be fully idempotent again:

```yml
- name: Does the database exist?
  command: mysql -u root wordpress -e "SELECT ID FROM wordpress.wp_users
  LIMIT 1;"
  register: db_exist
  ignore_errors: true
  changed_when: false
```
