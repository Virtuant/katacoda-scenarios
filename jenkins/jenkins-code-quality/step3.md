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


![2017-02-01-04_43_16-github-triggered-build-jenkins](https://user-images.githubusercontent.com/558905/38051154-7241f828-329b-11e8-9732-48d15d74027d.png)
![2017-02-01-04_43_16-github-triggered-build-jenkins](https://user-images.githubusercontent.com/558905/38052765-4d579b76-32a0-11e8-862d-3247a79eeb93.png)
![2016-12-28-15_39_37-github-triggered-build-725-console-jenki](https://user-images.githubusercontent.com/558905/38052766-4d713ffe-32a0-11e8-9fa0-e8fc8a7cc0f1.png)
![2016-12-28-15_40_08-github-triggered-build-725-console-jenki](https://user-images.githubusercontent.com/558905/38052767-4d90bec4-32a0-11e8-90cf-ac54e32867e9.png)

![2016-12-28-23_05_10-github-triggered-build-config-jenkins](https://user-images.githubusercontent.com/558905/38052775-4e0d2248-32a0-11e8-910c-ab96a3bcb37b.png)
![2016-12-28-23_06_47-github-triggered-build-config-jenkins](https://user-images.githubusercontent.com/558905/38052776-4e48f4e4-32a0-11e8-9d68-f90e9a3d2a3b.png)

![2016-12-29-09_16_30-java-ee-simple-restful-file-storage_src_](https://user-images.githubusercontent.com/558905/38052783-4f058c6c-32a0-11e8-9e08-5bf9a1d7890c.png)

![2016-12-29-19_55_50-security-warning](https://user-images.githubusercontent.com/558905/38052788-4f7c8c18-32a0-11e8-9654-5dfddb268cd5.png)
![2016-12-30-13_54_36-add-repository](https://user-images.githubusercontent.com/558905/38052789-4f8bbc42-32a0-11e8-9bad-9110e449e29a.png)
![2016-12-30-13_55_14-install](https://user-images.githubusercontent.com/558905/38052790-4f9d8454-32a0-11e8-8910-698fdf9bd277.png)
![2016-12-30-14_01_54-login-required](https://user-images.githubusercontent.com/558905/38052791-4fac44d0-32a0-11e8-8e23-a4b4cf7fdf66.png)
![2016-12-30-14_04_17-install](https://user-images.githubusercontent.com/558905/38052793-4fd2c7cc-32a0-11e8-9674-9c34e783c03c.png)
![2016-12-30-14_04_26-install](https://user-images.githubusercontent.com/558905/38052794-4fe32356-32a0-11e8-92b7-29124bee1382.png)
![2016-12-30-14_04_33-installing-software](https://user-images.githubusercontent.com/558905/38052795-4fef3ac4-32a0-11e8-899e-7db8d964ff25.png)
![2016-12-30-19_09_15-software-updates](https://user-images.githubusercontent.com/558905/38052796-4ffb4896-32a0-11e8-95c2-758302d54a9d.png)
![2017-01-07-23_14_44](https://user-images.githubusercontent.com/558905/38052797-500728be-32a0-11e8-814c-cfe955cdeb73.png)
![2017-01-07-23_18_41-properties-for-simple-restful-file-stora](https://user-images.githubusercontent.com/558905/38052798-503a982a-32a0-11e8-8127-68c58d309b76.png)
![2017-01-07-23_18_50-rebuild-suggested](https://user-images.githubusercontent.com/558905/38052800-50494154-32a0-11e8-86e1-efc7a35f590c.png)
![2017-01-07-23_28_00-java-ee-simple-restful-file-storage_src_](https://user-images.githubusercontent.com/558905/38052802-505730ca-32a0-11e8-9599-06ba1cf8cd17.png)
![2017-01-07-23_29_57-java-ee-simple-restful-file-storage_src_](https://user-images.githubusercontent.com/558905/38052803-5064e08a-32a0-11e8-83ea-b9bfbc0aaf60.png)
![2017-01-07-23_30_36-java-ee-simple-restful-file-storage_src_](https://user-images.githubusercontent.com/558905/38052804-5072a0a8-32a0-11e8-908f-4f2679097a8e.png)
![2017-01-07-23_31_53-java-ee-simple-restful-file-storage_src_](https://user-images.githubusercontent.com/558905/38052805-50853ce0-32a0-11e8-83b9-cf2d8685f9d8.png)
![2017-01-07-23_33_05](https://user-images.githubusercontent.com/558905/38052807-5106da5c-32a0-11e8-9a48-ed9cb1572d20.png)
![2017-01-07-23_43_01-java-ee-simple-restful-file-storage_src_](https://user-images.githubusercontent.com/558905/38052808-51633a22-32a0-11e8-8023-ec37782b4d13.png)
![2017-01-07-23_49_13-java-ee-simple-restful-file-storage_src_](https://user-images.githubusercontent.com/558905/38052809-51760bb6-32a0-11e8-8155-8f94490cb310.png)
![2017-01-07-23_52_04-java-ee-simple-restful-file-storage_src_](https://user-images.githubusercontent.com/558905/38052810-5185c042-32a0-11e8-8ecc-89c207677293.png)
![2017-01-07-23_52_57-preferences](https://user-images.githubusercontent.com/558905/38052811-51989546-32a0-11e8-88ba-df37e04c90fe.png)
![2017-01-07-23_55_39-check-configuration-properties](https://user-images.githubusercontent.com/558905/38052812-51ab0186-32a0-11e8-8e8e-9120973dd5ea.png)
![2017-01-08-00_01_13-properties-for-simple-restful-file-stora](https://user-images.githubusercontent.com/558905/38052813-51bfc4b8-32a0-11e8-9cda-d74dc61995c2.png)
![2017-01-08-00_01_18-rebuild-suggested](https://user-images.githubusercontent.com/558905/38052814-51cdd8d2-32a0-11e8-9906-efc2a151fa4e.png)
![2017-01-18-02_29_51-java-ee-simple-restful-file-storage_src_](https://user-images.githubusercontent.com/558905/38052815-51dce426-32a0-11e8-831e-d69cee8c56f4.png)
![2017-01-18-02_48_39-java-ee-simple-restful-file-storage_src_](https://user-images.githubusercontent.com/558905/38052816-51eb3cec-32a0-11e8-8ba3-a900205c32f4.png)
![2017-01-18-02_54_03](https://user-images.githubusercontent.com/558905/38052817-51fd73bc-32a0-11e8-842c-c317e1a66fb9.png)
![2017-01-18-02_58_21-update-maven-project](https://user-images.githubusercontent.com/558905/38052818-52145aaa-32a0-11e8-88d6-679ba5e72d14.png)
![2017-01-18-02_59_32-java-ee-simple-restful-file-storage_src_](https://user-images.githubusercontent.com/558905/38052819-52211664-32a0-11e8-8a56-c45571506b8c.png)
![2017-01-18-03_02_56](https://user-images.githubusercontent.com/558905/38052820-522e174c-32a0-11e8-9c99-7ac0b68abba9.png)
![2017-01-18-03_04_05-java-ee-simple-restful-file-storage_src_](https://user-images.githubusercontent.com/558905/38052821-523b1b5e-32a0-11e8-8887-921ae9a215dd.png)
![2017-01-18-04_37_06-github-triggered-build-jenkins-v2](https://user-images.githubusercontent.com/558905/38052822-52471652-32a0-11e8-8549-09ce7d8d180c.png)
![2017-01-19-22_51_58-github-triggered-build-jenkins-v2](https://user-images.githubusercontent.com/558905/38052823-5257790c-32a0-11e8-9b31-66d6789fb136.png)
