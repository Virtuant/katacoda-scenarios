Step 5: Test manually triggered Build

We can trigger a build manually via Jenkins -> drop-down right of “GitHub Triggered Build” -> Build Now.

2016-12-09-11_46_03-dashboard-jenkins

Click on #1 of the build history:

2017-01-02-14_59_15-github-triggered-build-jenkins-v2

then on Console Output:

2017-01-02-15_02_46-github-triggered-build-1-jenkins-v2

 

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

