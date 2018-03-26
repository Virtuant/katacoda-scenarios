## Ansible Ensures
A fundamental principle of Ansible is that it ensures a desired state.

From the previous example:

```
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
```

>Note: If for some reason you've gotten to this point and you've notice your playbook.yml files is 

This tells Ansible to check if the items listed using `with_items` are present. If they are, Ansible will do nothing more, since the state is already achieved. However, if the items are not present, or if it's an older version, Ansible will ensure the items are present by installing the latest version.

If you run the playbook again, Ansible does the former, and instead of `"Changed: 1"`, you will get `"OK: 2, Changed 0"`.

1\. Try it out:

`ansible-playbook -i myhosts site.yml`{{execute HOST1}}

This is a simple example that conveys a powerful truth about Ansible.
