## Running a Playbook

What is a play?
A play is a set of tasks mapped to a set of hosts. Plays are organised inside a text file called a playbook. We just learned about playbooks in our last lab.

Running a playbook
This playbook runs one task, on our one host, `host01`. Note the indentation - it's important for how the file gets parsed. Blank lines are ignored, but makes the playbook more readable for humans.

<pre class="file" data-filename="playbook.yml"><blockquote>

---
- hosts: host01
  become: true
  tasks:
    - name: Install required packages
      apt: name={{item}} state=present update_cache=yes
      with_items:
        - php5-cli
        - nginx
        - mysql-server

</blockquote></pre>

The above code is already in a file called `playbook.yml`. Let's check the contents:

`cat playbook.yml`{{execute HOST1}}

To run the playbook, use the `ansible-playbook` command with the inventory file `myhosts`:

`ansible-playbook -i myhosts playbook.yml`{{execute HOST1}}

Ansible should return the result `'Changed=1'`, indicating that the package was installed.

What happened here?
