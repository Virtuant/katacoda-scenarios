#### Introduction

- install Ansible

`apt-get install -y software-properties-common &&\
apt-add-repository -y ppa:ansible/ansible &&\
apt-get -y update &&\
apt-get install -y ansible`{{execute HOST1}}

- create inventory "myhosts" (copy from previous model)

Creating an inventory
In this tutorial you have access to one host named host01. To let Ansible know about it, put its hostname in an inventory file. Let's call our inventory myhosts, with one group called group1.

`echo "[group1]" > myhosts`{{execute HOST1}}

Then add the host to the group:

`echo "host01 ansible_ssh_user=ubuntu" >> myhosts`{{execute HOST1}}

Here we're also passing the username to use for SSH access, as an inventory parameter.
