Go ahead and open up your playbook. The first thing to do is to delete the ping task.

Now, let's pull out our with_items construct and combine it with the special {{item}} notation, so can compress our apt module installs. Try to put this into place without looking down at the code snippet, but the following is the end result of this emplementation:

---
- hosts: all
  become: true
  tasks:
    - name: Install required packages
      apt: name={{item}} state=present update_cache=yes
      with_items:
        - php5-cli
        - nginx
        - mysql-server-5.6

Run vagrant provision again, see that it will collapse all output for that one task into one block.

$ vagrant provision

Output:

==> default: Running provisioner: ansible...
PLAY [all]
********************************************************************

GATHERING FACTS
***************************************************************
ok: [default]

TASK: [Install required packages]
*********************************************
ok: [default] => (item=php5-cli,nginx,mysql-server-5.6)

PLAY RECAP
********************************************************************

default                    : ok=2    changed=0    unreachable=0    failed=0