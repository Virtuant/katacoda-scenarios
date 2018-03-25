#### Playbook Simplification
1\. The first thing to do is to delete the `ping` task. Go to your playbook in the editor now, highlight, then and erase the `ping` task entirely. Be careful not to erase, or cripple the syntax of remaining code.

2\. Now, let's pull out the `with_items` module and combine it with the special `{{item}}` notation, so can compress our `apt` module installs. Try to put this into place without looking down at the code snippet, but the following is the end result of this implementation:

<pre class="file" data-filename="playbook.yml" data-target="replace"><blockquote>

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

</blockquote></pre>

3\. Now, run the playbook yet again, and see that it will collapse all output for that one task into one block.

`$ ansible-playbook -i 'localhost,' -c local playbook.yml`{{execute HOST1}}

Output:

```
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
```

> SUCCESS!
