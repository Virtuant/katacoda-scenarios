## Ensure a Package is Removed
The apt module allows you to specify the state you wish the package to be in.

If you want a specific version, you append it to the package name, for example:

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

If you want to ensure that the package is not installed, you can declare that with state: absent, and Ansible will ensure it.

Update the playbook to remove sysstat.

sed -i -e 's/state: present/state: absent/' -e 's/ensure.*/ensure item is removed/' playbook.yml

Then re-run the playbook:

`ansible-playbook -i myhosts playbook.yml`{{execute HOST1}}

In summary, the same playbook should always be able to run on a host and - assuming there are no errors - produce exactly the desired state, regardless of what state the host started in. For example, should your playbook halt halfway through due to a network error, it would still finish successfully when you re-run it.
