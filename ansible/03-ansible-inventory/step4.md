
A fundamental principle of Ansible is that it ensures a desired state.

From the previous example:

```
- name: ensure latest sysstat is installed
  apt:
    name: sysstat
    state: latest
```

This tells Ansible to check if the items listed using `with_items` are present. If they are, Ansible will do nothing more, since the state is already achieved. However, if the items are not present, or if it's an older version, Ansible will ensure the items are present by installing the latest version.

If you run the playbook again, Ansible does the former, and instead of `"Changed: 1"`, you will get `"OK: 2, Changed 0"`.

1\. Try it out:

`ansible-playbook -i myhosts playbook.yml`{{execute}}

This is a simple example that conveys a powerful truth about Ansible.
