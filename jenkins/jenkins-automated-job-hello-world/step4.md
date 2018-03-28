Step 7: How to get the JAR file from the Jenkins Container to the Docker Host in case you have mapped the jenkins_home

In case, you have taken the alternative (A) way or starting Jenkins with your own jenkins_home directory on the Docker host on step 1.2, you can retrieve the JAR file from the project file without copying the file from the container to the Docker host. In my case, the project folder is located on

<jenkins_home>/workspace/GitHub Triggered Build

2016-12-09-15_49_11-github-triggered-build

And from there, the default location for Gradle to place the created JAR file is on ‘build/libs’ as discussed here:
2016-12-09-15_50_27-libs
Step 7: Alternative (B) Retrieve JAR File in case jenkins_home is located on the Container only

In case, you have taken the alternative (B) way or starting Jenkins with the jenkins_home directory on the Docker container on step 1.2, you need to copy the JAR file from the container to another location. The easiest way to do so is to copy it via

(dockerhost) $ docker cp <containerId>:/file/path/within/container /host/path/target

The container ID can be seen via docker ps:

(dockerhost) $ docker ps | grep jenkins
9159bedefbee        oveits/jenkins_tutorial:part2_step1   "/start.sh"              9 hours ago         Up 9 hours          0.0.0.0:8080->8080/tcp, 0.0.0.0:50000->50000/tcp   jenkins

Now we can copy the jar file to the Docker host via:

(dockerhost) $ docker cp '9159bedefbee:/var/jenkins_home_local/workspace/GitHub Triggered Build/build/libs/GitHub Triggered Build-0.0.1-SNAPSHOT.jar' '/vagrant/GitHub Triggered Build-0.0.1-SNAPSHOT.jar'

Since our Docker host is a Vagrant virtual machine, we have chosen a destination on the /vagrant folder, since this folder is synchronized with the Vagrant host machine per default. This way, we can get access to the JAR file on the host machine without further ado:
2017-01-03-00_17_19-ubuntu-trusty64-docker_openshift-installer


![2016-12-09-11_19_14-github-triggered-build-1-console-jenkins](https://user-images.githubusercontent.com/558905/37997767-ff9d55d0-31e9-11e8-9ede-9afeff756247.png)
![2016-12-09-11_34_55-manage-jenkins-jenkins](https://user-images.githubusercontent.com/558905/37997763-ff645992-31e9-11e8-815e-cb8f28e43f9b.png)
![2016-12-09-11_34_55-manage-jenkins-jenkins](https://user-images.githubusercontent.com/558905/37997253-61163144-31e8-11e8-802e-7955d541ba36.png)
![2016-12-09-11_35_26-global-tool-configuration-jenkins](https://user-images.githubusercontent.com/558905/37997254-612332b8-31e8-11e8-8317-76bbaa291e3c.png)

![2017-01-05-01_19_25-github-triggered-build-6-console-jenkins](https://user-images.githubusercontent.com/558905/37997308-7e2ca2d6-31e8-11e8-81cc-d30f146571f7.png)
![2017-01-02-14_27_26-global-tool-configuration-jenkins](https://user-images.githubusercontent.com/558905/37997309-7e37eab0-31e8-11e8-9398-1b12e6fecffc.png)
![2017-01-02-14_32_46-global-tool-configuration-jenkins](https://user-images.githubusercontent.com/558905/37997310-7e44e76a-31e8-11e8-8cfd-0b260a84995c.png)



![2017-01-02-16_01_49-github-triggered-build-jenkins](https://user-images.githubusercontent.com/558905/37997318-7ec3f73a-31e8-11e8-9cd4-c402f3bb4932.png)
![2017-01-02-16_03_16-github-triggered-build-3-console-jenkins](https://user-images.githubusercontent.com/558905/37997319-7ed18eae-31e8-11e8-92af-81a197c170d0.png)
![2017-01-03-00_17_19-ubuntu-trusty64-docker_openshift-install](https://user-images.githubusercontent.com/558905/37997320-7edddfd8-31e8-11e8-825e-b0926f897bd6.png)



![2017-01-05-01_15_51-github-triggered-build-jenkins](https://user-images.githubusercontent.com/558905/37997326-7f1c72d4-31e8-11e8-9530-9bb9391bca25.png)
![2017-01-05-01_18_33-github-triggered-build-6-console-jenkins](https://user-images.githubusercontent.com/558905/37997327-7f279088-31e8-11e8-9d8c-fdeb24124d3f.png)

