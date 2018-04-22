apt-get -y update
apt-get install -y software-properties-common
apt-add-repository -y ppa:ansible/ansible
# apt-get -y update
# apt-get install -y ansible git
# cd /home/scrapbook/tutorial
# mkdir shared_volume
# docker pull virtuant/ansible-host-node:plus
# docker pull ubuntu:14.04
# docker network create mynetwork
# cd shared_volume
# docker run -d --name ansible --rm --network mynetwork -v $(pwd):/shared_volume virtuant/ansible-host-node:plus bash -c 'while true; do sleep 60; echo keepalive; done'
# docker run -d --name target -p 8080 --rm --network mynetwork -v $(pwd):/shared_volume ubuntu:14.04 bash -c 'apt-get update; apt-get install -y openssh-server; service ssh start; while true; do sleep 60; echo keepalive; done'
# a() { docker exec -it ansible bash -c "echo 'PS1='\''ansible# '\' >> /root/.bashrc; bash"; }
# t() {  docker exec -it target bash -c "echo 'PS1='\''target# '\' >> /root/.bashrc; bash";  }
echo "Ready!"
