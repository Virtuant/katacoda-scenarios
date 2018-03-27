### Create a Job

Either click on “create new jobs” or on New Item.

Now enter an Item name and click on Freestyle Project and OK:

2016-12-09-10_55_56-new-item-jenkins

#### Specify GitHub Project

Check “GitHub project” and add the HTTPS GitHub URL. I have used a small Apache Camel project of mine that provides a simple restful file storage:

https://github.com/oveits/simple-restful-file-storage

2016-12-09-11_02_22-github-triggered-build-config-jenkins
Step 4.3 Configure Source Code Management

Under Source Code Management, we choose “Git” and specify the GitHub repository a second time. If it is public, we do not enter the credentials for now:

2016-12-09-14_53_46-github-triggered-build-config-jenkins

-> Click Apply

Note also that I have chosen a branch different from the master branch (“jenkinstest”). I have created this new branch in order to keep the master branch clean from any changes that might be needed to test Jenkins.
Step 4.4 Configure Build Triggers (postponed to part 3 of this blog post series)

For now, we will test only manual “build now” triggers, so we do not need to specify any build triggers. Build triggers will be tested in the next blog post.
Step 4.5: Alternative (a): Configure Gradle Build

Prerequisite: For creation of an executable JAR, the file build.gradle in the project root directory must be prepared. See e.g.

    this blog post of mine how to create lean JAR files using Gradle.
    this blog post of Mkyong how to create a fat JAR file using Gradle (is easier to accomplish).

Here, we show how to build the project via Gradle. If you prefer to build via Maven, seee Step 4.5: Alternative (b): Configure Maven Build below.

Here, we scroll down to “Build” -> click 2017-01-02-14_54_07-github-triggered-build-config-jenkins -> “Invoke Gradle script”

2016-12-09-11_11_47-github-triggered-build-config-jenkins

Choose the Gradle version we have prepared in Step 3 and add the task “jar”:

2017-01-02-14_56_34-github-triggered-build-config-jenkins

    Note that keeping the (Default) Gradle version will not work, as long as this Default has not been defined. See Appendix A for details.

The Gradle task “jar” will create our executable JAR file.

-> Click Save at the bottom left.

Step 4.5: Alternative (b): Configure Maven Build

Here, we show how to build the project via Maven. If you prefer to build via Gradle, seee Step 4.5: Alternative (a): Configure Graven Build above.

Here, we scroll down to “Build” -> click 2017-01-02-14_54_07-github-triggered-build-config-jenkins -> “Invoke Maven script”

2017-01-03-13_52_27-github-triggered-build-config-jenkins

Choose the Maven version we have prepared in Step 3 and specify the goal “package”:

2017-01-03-14_00_05-github-triggered-build-config-jenkins

    Note that keeping the (Default) Maven version will not work, as long as this Default has not been defined.

The Maven goal “package”will build our JAR file.

-> Click Save at the bottom left.

