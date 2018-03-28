### Improve Code Style

For the developer, it is very inconvenient to use the Jenkins Checkstyle messages from the console and match them with the code. We need something better than that: the Eclipse Checkstyle plugin.

#### Install Eclipse Checkstyle Plugin via local Installation

Since the recommended installation via Marketplace did not work in my case (see Appendix A), I have followed some hints about a local installation found on StackOverflow:

Download Checkstyle from Sourceforge.

2016-12-30-13_54_36-add-repository

2016-12-30-13_55_14-install

In the next window, you are asked to specify some credentials we do not have. However, you can just ignore the window and click Cancel:

2016-12-30-14_01_54-login-required

->Cancel

Then the installation proceeds:

2016-12-30-14_04_17-install

2016-12-30-14_04_26-install

2016-12-30-14_04_33-installing-software

Now I had to klick OK on security warnings twice:

2016-12-29-19_55_50-security-warning

At the end, I had to restart Eclipse:

2016-12-30-19_09_15-software-updates

Now, the Checkstyle plugin is installed on Eclipse.
Step 5.2: Configure Project for Checkstyle Usage

The project in question must be enabled for Checkstyle usage by editing the Project Properties:

2017-01-07-23_14_44

Choosing the Checkstyle style. For now, let us choose the Google Checks in the drop-down list:

2017-01-07-23_18_41-properties-for-simple-restful-file-storage

Then confirm that the project is being re-built:

2017-01-07-23_18_50-rebuild-suggested

Now the code is more yellow than white, with many hints how to improve the code:

2017-01-07-23_28_00-java-ee-simple-restful-file-storage_src_main_java_de_oveits_simplerestfulfiles

However, the hints do not go away, if you correct the code. Do we need to rebuild again? Let us test:

2017-01-07-23_30_36-java-ee-simple-restful-file-storage_src_main_java_de_oveits_simplerestfulfiles

Google style does not like that there is no empty line before the package line (sorry, in German):

2017-01-07-23_29_57-java-ee-simple-restful-file-storage_src_main_java_de_oveits_simplerestfulfiles

So, let us add an empty line and save the file. However, the style warning does not change:

2017-01-07-23_31_53-java-ee-simple-restful-file-storage_src_main_java_de_oveits_simplerestfulfiles

Let us rebuild the project:

2017-01-07-23_33_05

Yes, after the re-build: the warning has disappeared:

2017-01-07-23_43_01-java-ee-simple-restful-file-storage_src_main_java_de_oveits_simplerestfulfiles

#### Download and Create Custom Checkstyle Profile in Eclipse

In the Jenkins Checkstyle tests above, we have used following custom Checkstyle configuration file:

$ curl https://raw.githubusercontent.com/apache/camel/master/buildingtools/src/main/resources/camel-checkstyle.xml > <yourprojectDir>/config/checkstyle/checkstyle.xml

I.e. the Checkstyle file is found on <yourprojectDir>/config/checkstyle/checkstyle.xml

Correct:

2017-01-07-23_49_13-java-ee-simple-restful-file-storage_src_main_java_de_oveits_simplerestfulfiles

2017-01-07-23_52_04-java-ee-simple-restful-file-storage_src_main_java_de_oveits_simplerestfulfiles

2017-01-07-23_52_57-preferences

2017-01-07-23_55_39-check-configuration-properties
Step 5.4: Assign Custom Checkstyle Profile to the Project

To assign the new Checkstyle profile to the project, we change the project’s Checkstyle properties by

Project->Properties -> Checkstyle

2017-01-07-23_14_44

-> Choose new Checkstyle profile -> OK

2017-01-08-00_01_13-properties-for-simple-restful-file-storage

On the Rebuild suggested window -> Yes

2017-01-08-00_01_18-rebuild-suggested

This works fine:

2017-01-18-02_29_51-java-ee-simple-restful-file-storage_src_main_java_de_oveits_simplerestfulfiles-v2

In the code, we can see the Checkstyle warnings. To get more information on the specific Checkstyle warning, the warning text can be retrieved via the mouse over function on the left of the code line, or on the markers tab on the lower pane of Eclipse.

Step 5.5: Improve Code Style

Step 5.5.1: Change Code

In order to test, how the developer can improve the code style, let us replace some of the tabs by four spaces here:

2017-01-18-02_48_39-java-ee-simple-restful-file-storage_src_main_java_de_oveits_simplerestfulfiles

Save the file now.
Step 5.5.2: Update Maven

Unfortunately, the Checkstyle warnings update process is a little cumbersome for custom Checkstyle profiles, it seems: we need to

    save the changed file,
    update Maven and
    rebuild the project.

Let us update Maven first:

right-click the project folder in the left pane -> Maven -> Update Project -> OK

2017-01-18-02_54_032017-01-18-02_58_21-update-maven-project

Then all Checkstyle markers are gone (although I have not changed all occurrences of a tab):

2017-01-18-02_59_32-java-ee-simple-restful-file-storage_src_main_java_de_oveits_simplerestfulfiles

#### Rebuild the Project

To get the Checkstyle warnings back, we need to rebuild the project:

Project -> Build Project

2017-01-18-03_02_56

Now we can see that some of the Checkstyle warnings are gone:

2017-01-18-03_04_05-java-ee-simple-restful-file-storage_src_main_java_de_oveits_simplerestfulfiles

Next time, you check in the code to the Gir repository, you will see that the number of Checkstyle warnings we get from Jenkins via Gradle will decrease…
