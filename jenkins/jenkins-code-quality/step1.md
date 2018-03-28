### Code Analysis: Checkstyle

With Gradle, we can invoke the Checkstyle plugin as follows:

#### Prepare Gradle for Performing Checkstyle

Add to build.gradle:

apply plugin: 'checkstyle'

tasks.withType(Checkstyle) {
 ignoreFailures = true
 reports {
 html.enabled = true
 }
}

We have set ignoreFailures to true, since we do not want the Gradle build to fail for now. We are just interested in the Checkstyle reports for now.

We can download an example Checkstyle configuration file from the Apache Camel repository, for example:

git clone <yourprojectURL>
mkdir -p <yourprojectDir>/config/checkstyle/
curl https://raw.githubusercontent.com/apache/camel/master/buildingtools/src/main/resources/camel-checkstyle.xml > <yourprojectDir>/config/checkstyle/checkstyle.xml

Step 3.2 (optional): Test Checkstyle locally

If you have no Git and/or no Gradle installed, you may want to skip this step and directly proceed to the next step, so Jenkins is performing this task for you.

We can locally invoke CheckStyle as follows:

gradle check

Step 3.3: Configure Jenkins to invoke Checkstyle

Adding Gradle Checkstyle tests to be performed before each build is as simple as performing Step 4.1 and then adding “check” as a goal to the list of Jenkins Build Gradle Tasks:

On Dashboard -> Click on Project name -> Configure -> Build, add “check” before the jar task:

2016-12-28-15_33_58-github-triggered-build-config-jenkins

Click Save.

Now we verify the setting by either checking changed code into the SW repository (now is a good time to commit and push the changes performed in Step 4.1) or by clicking “Build now” -> Click on Build Link in Build History -> Console Output in the Project home:

2016-12-28-15_39_37-github-triggered-build-725-console-jenkins2016-12-28-15_40_08-github-triggered-build-725-console-jenkins

We have received a very long list of CheckStyle Errors, but, as configured, the build does not fail nevertheless.

At the same time, CheckStyle Reports should be available on Jenkins now:

The Links specified in the output are only available on Jenkins, but since Jenkins is running as a Docker container on Vagrant VM residing in

D:\veits\Vagrant\ubuntu-trusty64-docker_openshift-installer\jenkins_home

I need to access the files on

file:///D:/veits/Vagrant/ubuntu-trusty64-docker_openshift-installer/jenkins_home/workspace/GitHub%20Triggered%20Build/build/reports/checkstyle/

2016-12-28-15_48_11-index-von-d__veits_vagrant_ubuntu-trusty64-docker_openshift-installer_jenkins_ho

And on main.html we find:

2016-12-28-15_49_04-main-html

Wow, it seems like I really need to clean the code…
