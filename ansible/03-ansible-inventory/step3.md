
What is a play?
A play is a set of tasks mapped to a set of hosts. Plays are organised inside a text file called a playbook. We just learned about playbooks in our last lab.

Running a playbook
This playbook runs one task, on our one host, `host01`. Note the indentation - it's important for how the file gets parsed. Blank lines are ignored, but makes the playbook more readable for humans.

1\. Firstly, create a new folder and title it `playbook.yml`, like this:

`touch playbook.yml`{{execute}}

2\. Now, rather than copying this code into your playbook automatically, copy it in manually, taking time to understand each component. Simply click on the `playboook.yml` tab above your text editor and begin moving the following code over.

>Note: Katacoda will save the lines of code you add to the file automatically.

<pre class="file" data-filename="playbook.yml"><blockquote>

---
- hosts: host01
  become: true
  tasks:
    - name: Install required packages
      apt: name={{item}} state=present update_cache=yes
      with_items:
        - php-cli
        - nginx
        - mysql-server

</blockquote></pre>

3\.Now that the above code is in `playbook.yml`, let's verify the contents:

`cat playbook.yml`{{execute}}

4\. To run the playbook, use the `ansible-playbook` command with the inventory file `myhosts`:

`ansible-playbook -i myhosts playbook.yml`{{execute}}

Ansible should return the result `'Changed=1'`, indicating that the package was installed.

What happened here?
