# Preparing Our Environment

- install Ansible

apt-get install -y software-properties-common &&\
apt-add-repository -y ppa:ansible/ansible &&\
apt-get -y update &&\
apt-get install -y ansible
`{{execute HOST1}}

- create inventory "myhosts" (copy from previous model)
