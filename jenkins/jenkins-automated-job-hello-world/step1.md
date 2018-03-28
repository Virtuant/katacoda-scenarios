### Create a Job

Either click on “Create new Jobs” or on New Item. Now enter an Item name and click on Freestyle Project and OK:

![2016-12-09-10_55_56-new-item-jenkins](https://user-images.githubusercontent.com/558905/37997764-ff732eb8-31e9-11e8-943e-9263e6e27c44.png)

#### Specify GitHub Project

Check “GitHub project” and add the HTTPS GitHub URL. I have used a small Apache Camel project of mine that provides a simple restful file storage: https://github.com/oveits/simple-restful-file-storage

![2016-12-09-11_02_22-github-triggered-build-config-jenkins](https://user-images.githubusercontent.com/558905/37997765-ff827f76-31e9-11e8-9d34-a2df72fae369.png)

#### Configure Source Code Management

Under Source Code Management, we choose “Git” and specify the GitHub repository a second time. If it is public, we do not enter the credentials for now:

![2016-12-09-14_53_46-github-triggered-build-config-jenkins](https://user-images.githubusercontent.com/558905/37997252-61087310-31e8-11e8-8429-203e9eba9a46.png)

Click Apply

Note also that we have chosen a branch different from the master branch (“jenkinstest”). We have created this new branch in order to keep the master branch clean from any changes that might be needed to test Jenkins.

#### Configure Build Triggers

For now, we will test only manual “build now” triggers, so we do not need to specify any build triggers. Build triggers will be tested in the next stage. You can either build with Maven or Gradle. If you prefer to build via Gradle, go to the Alternative B below.

#### Alternative: Configure Maven Build

Here, we show how to build the project via Maven. If you prefer to build via Gradle, see the next section.

Here, we scroll down to “Build” -> click 2017-01-02-14_54_07-github-triggered-build-config-jenkins -> “Invoke Maven script”

2017-01-03-13_52_27-github-triggered-build-config-jenkins

Choose the Maven version we have prepared in Step 3 and specify the goal “package”:

2017-01-03-14_00_05-github-triggered-build-config-jenkins

    Note that keeping the (Default) Maven version will not work, as long as this Default has not been defined.

The Maven goal “package”will build our JAR file.

-> Click Save at the bottom left.

#### Alternative: Configure Gradle Build

Prerequisite: For creation of an executable JAR, the file build.gradle in the project root directory must be prepared. See e.g.

    this blog post of mine how to create lean JAR files using Gradle
    this blog post of Mkyong how to create a fat JAR file using Gradle (is easier to accomplish)

Here, we show how to build the project via Gradle. 
Here, we scroll down to “Build” -> click 2017-01-02-14_54_07-github-triggered-build-config-jenkins -> “Invoke Gradle script”

![2016-12-09-11_19_14-github-triggered-build-1-console-jenkins](https://user-images.githubusercontent.com/558905/37997767-ff9d55d0-31e9-11e8-9ede-9afeff756247.png)



Choose the Gradle version we have prepared in Step 3 and add the task “jar”:

    Note that keeping the (Default) Gradle version will not work, as long as this Default has not been defined. See Appendix A for details.

The Gradle task “jar” will create our executable JAR file.

-> Click Save at the bottom left.

![2016-12-09-11_11_47-github-triggered-build-config-jenkins](https://user-images.githubusercontent.com/558905/37997766-ff8f7226-31e9-11e8-99cb-5f1bd2cc4093.png)
![2016-12-09-11_34_55-manage-jenkins-jenkins](https://user-images.githubusercontent.com/558905/37997763-ff645992-31e9-11e8-815e-cb8f28e43f9b.png)
![2016-12-09-11_34_55-manage-jenkins-jenkins](https://user-images.githubusercontent.com/558905/37997253-61163144-31e8-11e8-802e-7955d541ba36.png)
![2016-12-09-11_35_26-global-tool-configuration-jenkins](https://user-images.githubusercontent.com/558905/37997254-612332b8-31e8-11e8-8317-76bbaa291e3c.png)
![2016-12-09-11_46_03-dashboard-jenkins](https://user-images.githubusercontent.com/558905/37997255-612f5cb4-31e8-11e8-9b68-33a69cef4ee2.png)
![2017-01-05-01_19_25-github-triggered-build-6-console-jenkins](https://user-images.githubusercontent.com/558905/37997308-7e2ca2d6-31e8-11e8-81cc-d30f146571f7.png)
![2017-01-02-14_27_26-global-tool-configuration-jenkins](https://user-images.githubusercontent.com/558905/37997309-7e37eab0-31e8-11e8-9398-1b12e6fecffc.png)
![2017-01-02-14_32_46-global-tool-configuration-jenkins](https://user-images.githubusercontent.com/558905/37997310-7e44e76a-31e8-11e8-8cfd-0b260a84995c.png)
![2017-01-02-14_56_34-github-triggered-build-config-jenkins](https://user-images.githubusercontent.com/558905/37997311-7e53bde4-31e8-11e8-87cd-eb03fbb87127.png)
![2017-01-02-14_59_15-github-triggered-build-jenkins-v2](https://user-images.githubusercontent.com/558905/37997312-7e763054-31e8-11e8-8c91-8badaba0e606.png)
![2017-01-02-15_02_46-github-triggered-build-1-jenkins-v2](https://user-images.githubusercontent.com/558905/37997313-7e84dc76-31e8-11e8-9663-fbded1ae4aa4.png)
![2017-01-02-15_04_25-github-triggered-build-1-console-jenkins](https://user-images.githubusercontent.com/558905/37997314-7e955236-31e8-11e8-8f25-6bb3c793d86d.png)
![2017-01-02-15_48_17-github-triggered-build-1-console-jenkins](https://user-images.githubusercontent.com/558905/37997315-7ea48620-31e8-11e8-95e5-b0b7204e78c4.png)
![2017-01-02-16_00_27-github-triggered-build-config-jenkins](https://user-images.githubusercontent.com/558905/37997316-7eb44cd6-31e8-11e8-9894-9e52074144f8.png)
![2017-01-02-16_01_49-github-triggered-build-jenkins](https://user-images.githubusercontent.com/558905/37997318-7ec3f73a-31e8-11e8-9cd4-c402f3bb4932.png)
![2017-01-02-16_03_16-github-triggered-build-3-console-jenkins](https://user-images.githubusercontent.com/558905/37997319-7ed18eae-31e8-11e8-92af-81a197c170d0.png)
![2017-01-03-00_17_19-ubuntu-trusty64-docker_openshift-install](https://user-images.githubusercontent.com/558905/37997320-7edddfd8-31e8-11e8-825e-b0926f897bd6.png)
![2017-01-03-13_52_27-github-triggered-build-config-jenkins](https://user-images.githubusercontent.com/558905/37997322-7ee9d3ce-31e8-11e8-8723-0860b435c463.png)
![2017-01-03-14_00_05-github-triggered-build-config-jenkins](https://user-images.githubusercontent.com/558905/37997323-7ef84c38-31e8-11e8-97c1-062f7b538e79.png)
![2017-01-03-14_05_03-github-triggered-build-4-console-jenkins](https://user-images.githubusercontent.com/558905/37997324-7f03fca4-31e8-11e8-9708-7229e7f6a322.png)
![2017-01-03-14_42_22-github-triggered-build-4-console-jenkins](https://user-images.githubusercontent.com/558905/37997325-7f110e9e-31e8-11e8-96b5-a2dab68f1e2b.png)
![2017-01-05-01_15_51-github-triggered-build-jenkins](https://user-images.githubusercontent.com/558905/37997326-7f1c72d4-31e8-11e8-9530-9bb9391bca25.png)
![2017-01-05-01_18_33-github-triggered-build-6-console-jenkins](https://user-images.githubusercontent.com/558905/37997327-7f279088-31e8-11e8-9d8c-fdeb24124d3f.png)

