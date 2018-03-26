STOP05
Ensure a package is removed
The apt module allows you to specify the state you wish the package to be in. If you want a specific version, you append it to the package name, for example:

- name: ensure sysstat is installed at version 10.2.0-1
  apt:
    name: sysstat=10.2.0-1
    state: installed
If you want to ensure that the package is not installed, you can declare that with state: absent, and Ansible will ensure it.

Update the playbook to remove sysstat.

sed -i -e 's/state: latest/state: absent/' -e 's/ensure.*/ensure sysstat is removed/' playbook.yml

Then re-run the playbook:

ansible-playbook -i myhosts playbook.yml

In summary, the same playbook should always be able to run on a host and - assuming there are no errors - produce exactly the desired state, regardless of what state the host started in. For example, should your playbook halt halfway through due to a network error, it would still finish successfully when you re-run it.
