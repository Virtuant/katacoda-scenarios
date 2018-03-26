STEP03
Running a playbook
Playbook
A playbook is an entirely different way of running Ansible, that is far more powerful.

What is a play?
A play is a set of tasks mapped to a set of hosts. Plays are organised inside a text file called a playbook.

Running a playbook
This playbook runs one task, on our one host, host01. Note the indentation - it's important for how the file gets parsed. Blank lines are ignored, but makes the playbook more readable for humans.

---
- hosts: host02
  become: true
  tasks:
    - name: Install required packages
      apt: name={{item}} state=present update_cache=yes
      with_items:
        - php5-cli
        - nginx
        - mysql-server-5.6

The above code is already in a file called site.yml. Let's check the contents:

cat site.yml

To run the playbook, use the ansible-playbook command with the inventory file myhosts:

ansible-playbook -i myhosts site.yml

Ansible should return the result 'Changed=1', indicating that the package was installed.

Playbook breakdown
What happened here?
