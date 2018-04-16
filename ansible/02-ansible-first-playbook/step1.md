## Installing Ansible

1\. Install Ansible on our host machine

`apt-get update && \
apt-get install -y software-properties-common && \
apt-add-repository -y ppa:ansible/ansible && \
apt-get install -y ansible`{{execute HOST1}}


2\. Verifying Ansible installation on the host machine

`ansible --version`{{execute HOST1}}


3\. Verifying Ansible plugin documentation tool, by typing the following into your terminal and entering TAB twice:

`ansible-` <!-- TAB twice -->

Output:

```
ansible-doc       ansible-playbook  ansible-vault
ansible-galaxy    ansible-pull
```
