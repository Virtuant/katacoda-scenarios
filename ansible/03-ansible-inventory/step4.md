
A fundamental principle of Ansible is that it ensures a desired state.

From the previous example:

```
- name: ensure latest sysstat is installed
  apt:
    name: sysstat
    state: latest
```

This tells Ansible to check if the latest version of sysstat is installed. If it is, Ansible will do nothing more, since the "latest" state is already achieved. If sysstat is not already there, or of an older version than what is available, Ansible installs the latest version.

1\. If you run the playbook again, Ansible does the former, and instead of `"Changed: 1"`, you will get `"OK: 2, Changed 0"`:

`ansible-playbook -i myhosts playbook.yml`{{execute}}

This is a simple example that conveys a powerful truth about Ansible.
