
### Create a Job

>Note: you may need to first go to the Manage Plugins and add the Github plugin as before.

Now, either click on “Create new Jobs” or on New Item. Now enter an Item name and click on Freestyle Project and OK:

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

For now, we will test only manual “build now” triggers, so we do not need to specify any build triggers. Build triggers will be tested in the next stage. You can either build with Maven or Gradle. If you prefer to build via Gradle, go to the Alternative below.

#### Alternative: Configure Maven Build

Here, we show how to build the project via Maven. If you prefer to build via Gradle, see the next section.

Here, we scroll down to “Build” -> click -> “Invoke Maven script”

![2017-01-03-13_52_27-github-triggered-build-config-jenkins](https://user-images.githubusercontent.com/558905/37997322-7ee9d3ce-31e8-11e8-8723-0860b435c463.png)

Choose the Maven version we have prepared in Step 3 and specify the goal “package”:

![2017-01-03-14_00_05-github-triggered-build-config-jenkins](https://user-images.githubusercontent.com/558905/37997323-7ef84c38-31e8-11e8-97c1-062f7b538e79.png)

>Note that keeping the (Default) Maven version will not work, as long as this Default has not been defined.

The Maven goal “package” will build our JAR file.

-> Click Save at the bottom left.

#### Alternative: Configure Gradle Build

Prerequisite: For creation of an executable JAR, the file `build.gradle` in the project root directory must be prepared.

Here, we show how to build the project via Gradle. 

Here, we scroll down to “Build” -> click “Invoke Gradle script”

![2016-12-09-11_11_47-github-triggered-build-config-jenkins](https://user-images.githubusercontent.com/558905/37997766-ff8f7226-31e9-11e8-99cb-5f1bd2cc4093.png)

Choose the Gradle version we have prepared in Step 3 and add the task “jar”:

![2017-01-02-14_56_34-github-triggered-build-config-jenkins](https://user-images.githubusercontent.com/558905/37997311-7e53bde4-31e8-11e8-87cd-eb03fbb87127.png)

>Note that keeping the (Default) Gradle version will not work, as long as this Default has not been defined.

The Gradle task “jar” will create our executable JAR file.

-> Click Save at the bottom left.
