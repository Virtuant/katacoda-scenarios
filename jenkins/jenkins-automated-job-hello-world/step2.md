Step 5: Test manually triggered Build

We can trigger a build manually via Jenkins -> drop-down right of “GitHub Triggered Build” -> Build Now.

![2016-12-09-11_46_03-dashboard-jenkins](https://user-images.githubusercontent.com/558905/37997255-612f5cb4-31e8-11e8-9b68-33a69cef4ee2.png)

Click on #1 of the build history:

![2017-01-02-14_59_15-github-triggered-build-jenkins-v2](https://user-images.githubusercontent.com/558905/37997312-7e763054-31e8-11e8-8c91-8badaba0e606.png)

then on Console Output:

![2017-01-02-15_02_46-github-triggered-build-1-jenkins-v2](https://user-images.githubusercontent.com/558905/37997313-7e84dc76-31e8-11e8-9663-fbded1ae4aa4.png)

 

We can observe the console output e.g. by clicking on the build link in the build history, then clicking Console:
Output for step 5 in case of Gradle:

2017-01-02-15_04_25-github-triggered-build-1-console-jenkins

This may take a while (~11 min in my case with a 100Mbps Internet connection):

2017-01-02-15_48_17-github-triggered-build-1-console-jenkins

thumps_up_3

This was the first successful Jenkins triggered Git download and Gradle build.
Output for step 5 in case of Maven:

2017-01-03-14_05_03-github-triggered-build-4-console-jenkins

This may take a while (~8 min in my case with a 100Mbps Internet connection):

2017-01-03-14_42_22-github-triggered-build-4-console-jenkins

We can see in the output, that the JAR file was placed to

/var/jenkins_home_local/workspace/GitHub Triggered Build/target/camel-spring4-0.0.1-SNAPSHOT.jar

thumps_up_3

This was the first successful Jenkins triggered Git download and Maven build.
Step 5.2 (Optional): Measure Time Consumption for Gradle clean Build

Let us test again, whether the build is quicker the second time:

-> Back to Project

-> Configure

-> Add “clean” Gradle task before “jar” Gradle task:

2017-01-02-16_00_27-github-triggered-build-config-jenkins

-> Save

-> Build Now

-> Build Histrory -> current build

-> Console Output

Clean Build - Console Ouptut

This is showing that a clean build takes only ~6.4 sec, if all SW is downloaded already.


![2016-12-09-11_19_14-github-triggered-build-1-console-jenkins](https://user-images.githubusercontent.com/558905/37997767-ff9d55d0-31e9-11e8-9ede-9afeff756247.png)
![2016-12-09-11_34_55-manage-jenkins-jenkins](https://user-images.githubusercontent.com/558905/37997763-ff645992-31e9-11e8-815e-cb8f28e43f9b.png)
![2016-12-09-11_34_55-manage-jenkins-jenkins](https://user-images.githubusercontent.com/558905/37997253-61163144-31e8-11e8-802e-7955d541ba36.png)
![2016-12-09-11_35_26-global-tool-configuration-jenkins](https://user-images.githubusercontent.com/558905/37997254-612332b8-31e8-11e8-8317-76bbaa291e3c.png)

![2017-01-05-01_19_25-github-triggered-build-6-console-jenkins](https://user-images.githubusercontent.com/558905/37997308-7e2ca2d6-31e8-11e8-81cc-d30f146571f7.png)
![2017-01-02-14_27_26-global-tool-configuration-jenkins](https://user-images.githubusercontent.com/558905/37997309-7e37eab0-31e8-11e8-9398-1b12e6fecffc.png)
![2017-01-02-14_32_46-global-tool-configuration-jenkins](https://user-images.githubusercontent.com/558905/37997310-7e44e76a-31e8-11e8-8cfd-0b260a84995c.png)


![2017-01-02-15_04_25-github-triggered-build-1-console-jenkins](https://user-images.githubusercontent.com/558905/37997314-7e955236-31e8-11e8-8f25-6bb3c793d86d.png)
![2017-01-02-15_48_17-github-triggered-build-1-console-jenkins](https://user-images.githubusercontent.com/558905/37997315-7ea48620-31e8-11e8-95e5-b0b7204e78c4.png)
![2017-01-02-16_00_27-github-triggered-build-config-jenkins](https://user-images.githubusercontent.com/558905/37997316-7eb44cd6-31e8-11e8-9894-9e52074144f8.png)
![2017-01-02-16_01_49-github-triggered-build-jenkins](https://user-images.githubusercontent.com/558905/37997318-7ec3f73a-31e8-11e8-9cd4-c402f3bb4932.png)
![2017-01-02-16_03_16-github-triggered-build-3-console-jenkins](https://user-images.githubusercontent.com/558905/37997319-7ed18eae-31e8-11e8-92af-81a197c170d0.png)
![2017-01-03-00_17_19-ubuntu-trusty64-docker_openshift-install](https://user-images.githubusercontent.com/558905/37997320-7edddfd8-31e8-11e8-825e-b0926f897bd6.png)


![2017-01-03-14_05_03-github-triggered-build-4-console-jenkins](https://user-images.githubusercontent.com/558905/37997324-7f03fca4-31e8-11e8-9708-7229e7f6a322.png)
![2017-01-03-14_42_22-github-triggered-build-4-console-jenkins](https://user-images.githubusercontent.com/558905/37997325-7f110e9e-31e8-11e8-96b5-a2dab68f1e2b.png)
![2017-01-05-01_15_51-github-triggered-build-jenkins](https://user-images.githubusercontent.com/558905/37997326-7f1c72d4-31e8-11e8-9530-9bb9391bca25.png)
![2017-01-05-01_18_33-github-triggered-build-6-console-jenkins](https://user-images.githubusercontent.com/558905/37997327-7f279088-31e8-11e8-9d8c-fdeb24124d3f.png)

