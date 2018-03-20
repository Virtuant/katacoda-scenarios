apt install update

docker pull jenkins:2.46.1

docker run --name myjenkins -p 8080:8080 -p 50000:50000 -v /var/jenkins_home jenkins
