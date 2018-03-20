apt-get -y update
apt install -y git
cd /home/scrapbook/tutorial
mkdir shared_volume  
docker pull virtuant/ansible-node-ubuntu14.04:v1  
docker pull ubuntu:14.04  
docker network create mynetwork  
cd shared_volume
docker run --rm virtuant/ansible-node-ubuntu14.04:v1 echo hallo  
docker run --rm ubuntu:14.04 echo hallo  
docker run -d --name ansible --rm --network mynetwork -v $(pwd):/shared_volume virtuant/ansible-node-ubuntu14.04:v1 /bin/bash -c 'while true; do sleep 60; echo keepalive; done'  
docker run -d --name target --rm --network mynetwork -v $(pwd):/shared_volume ubuntu:14.04 /bin/bash -c 'apt-get update; apt-get install -y openssh-server;service ssh start; while true; do sleep 60; echo keepalive; done'  


