### Code Analysis: Checkstyle

With Gradle, we can invoke the Checkstyle plugin as follows:

#### Prepare Gradle for Performing Checkstyle

<pre class="file" data-filename="build.gradle" data-target="replace"><blockquote>
apply plugin: 'checkstyle'

tasks.withType(Checkstyle) {
 ignoreFailures = true
 reports {
 html.enabled = true
 }
}
</blockquote></pre>

We have set ignoreFailures to true, since we do not want the Gradle build to fail for now. We are just interested in the Checkstyle reports for now.

We can download an example Checkstyle configuration file from the Apache Camel repository, for example:

```
git clone <yourprojectURL>
mkdir -p <yourprojectDir>/config/checkstyle/
curl https://raw.githubusercontent.com/apache/camel/master/buildingtools/src/main/resources/camel-checkstyle.xml > <yourprojectDir>/config/checkstyle/checkstyle.xml
```

#### (optional): Test Checkstyle locally

If you have no Git and/or no Gradle installed, you may want to skip this step and directly proceed to the next step, so Jenkins is performing this task for you.

We can locally invoke CheckStyle as follows:

`gradle check`{{execute}}

#### Configure Jenkins to invoke Checkstyle

Adding Gradle Checkstyle tests to be performed before each build is as simple as performing this and then adding “check” as a goal to the list of Jenkins **Build Gradle** Tasks:

On Dashboard -> Click on Project name -> Configure -> Build, add “check” before the jar task:

![2016-12-28-15_33_58-github-triggered-build-config-jenkins](https://user-images.githubusercontent.com/558905/38052009-ed39b58c-329d-11e8-9b38-0a6fbf8e7e3c.png)

Click Save.

Now we verify the setting by either checking changed code into the SW repository (now is a good time to commit and push the changes performed in Step 4.1) or by clicking “Build now” -> Click on Build Link in Build History -> Console Output in the Project home:

2016-12-28-15_39_37-github-triggered-build-725-console-jenkins
2016-12-28-15_40_08-github-triggered-build-725-console-jenkins

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


![2016-12-28-22_47_06-update-center-jenkins](https://user-images.githubusercontent.com/558905/38052008-ed296fce-329d-11e8-99ec-248d7f5129a6.png)

![2016-12-28-15_39_37-github-triggered-build-725-console-jenki](https://user-images.githubusercontent.com/558905/38052010-ed48593e-329d-11e8-809a-ac8325d15f90.png)
![2016-12-28-15_40_08-github-triggered-build-725-console-jenki](https://user-images.githubusercontent.com/558905/38052013-ed832154-329d-11e8-877b-d1e0aa71d0f7.png)
![2016-12-28-15_48_11-index-von-d__veits_vagrant_ubuntu-trusty](https://user-images.githubusercontent.com/558905/38052015-edc0513c-329d-11e8-8df2-136a308eab49.png)
![2016-12-28-15_49_04-main-html](https://user-images.githubusercontent.com/558905/38052017-edde386e-329d-11e8-9120-f29446c18c7c.png)
![2016-12-28-22_44_53-update-center-jenkins](https://user-images.githubusercontent.com/558905/38052018-ee0161c2-329d-11e8-94ac-868da5a0d0b2.png)
![2017-02-01-04_43_16-github-triggered-build-jenkins](https://user-images.githubusercontent.com/558905/38051154-7241f828-329b-11e8-9732-48d15d74027d.png)
![2017-02-01-04_43_16-github-triggered-build-jenkins](https://user-images.githubusercontent.com/558905/38052765-4d579b76-32a0-11e8-862d-3247a79eeb93.png)
![2016-12-28-15_39_37-github-triggered-build-725-console-jenki](https://user-images.githubusercontent.com/558905/38052766-4d713ffe-32a0-11e8-9fa0-e8fc8a7cc0f1.png)
![2016-12-28-15_40_08-github-triggered-build-725-console-jenki](https://user-images.githubusercontent.com/558905/38052767-4d90bec4-32a0-11e8-90cf-ac54e32867e9.png)
![2016-12-28-15_48_11-index-von-d__veits_vagrant_ubuntu-trusty](https://user-images.githubusercontent.com/558905/38052768-4d9d79a2-32a0-11e8-9f2d-f2c6665423ac.png)
![2016-12-28-15_49_04-main-html](https://user-images.githubusercontent.com/558905/38052769-4dbf0392-32a0-11e8-8b35-e810fe265585.png)
![2016-12-28-22_44_53-update-center-jenkins](https://user-images.githubusercontent.com/558905/38052770-4dd3b404-32a0-11e8-8ce9-0837b75b73a7.png)
![2016-12-28-22_47_06-update-center-jenkins](https://user-images.githubusercontent.com/558905/38052771-4de09520-32a0-11e8-823c-6d561013a648.png)
![2016-12-28-22_56_26-update-center-jenkins](https://user-images.githubusercontent.com/558905/38052772-4df0e47a-32a0-11e8-852c-1cd374b03f05.png)
![2016-12-28-22_58_22-update-center-jenkins](https://user-images.githubusercontent.com/558905/38052774-4dfef3bc-32a0-11e8-99b7-bf99a89a5719.png)
![2016-12-28-23_05_10-github-triggered-build-config-jenkins](https://user-images.githubusercontent.com/558905/38052775-4e0d2248-32a0-11e8-910c-ab96a3bcb37b.png)
![2016-12-28-23_06_47-github-triggered-build-config-jenkins](https://user-images.githubusercontent.com/558905/38052776-4e48f4e4-32a0-11e8-9d68-f90e9a3d2a3b.png)
![2016-12-28-23_10_57-github-triggered-build-config-jenkins](https://user-images.githubusercontent.com/558905/38052777-4e57a35e-32a0-11e8-97bb-ac5aa8f7741d.png)
![2016-12-28-23_17_16-github-triggered-build-726-console-jenki](https://user-images.githubusercontent.com/558905/38052778-4e8652f8-32a0-11e8-932d-c7f8ca8c5930.png)
![2016-12-28-23_20_31-github-triggered-build-726-jenkins-v21](https://user-images.githubusercontent.com/558905/38052779-4ebc99bc-32a0-11e8-8ec7-bfad354f66e6.png)
![2016-12-29-09_03_58-jenkins](https://user-images.githubusercontent.com/558905/38052780-4ec997a2-32a0-11e8-8507-8a6e054e634c.png)
![2016-12-29-09_05_56-jenkins](https://user-images.githubusercontent.com/558905/38052781-4ee425a4-32a0-11e8-9237-6b22c30a222c.png)
![2016-12-29-09_10_26-jenkins](https://user-images.githubusercontent.com/558905/38052782-4ef75fc0-32a0-11e8-9e49-09c8d6d78564.png)
![2016-12-29-09_16_30-java-ee-simple-restful-file-storage_src_](https://user-images.githubusercontent.com/558905/38052783-4f058c6c-32a0-11e8-9e08-5bf9a1d7890c.png)
![2016-12-29-12_27_34-jenkins](https://user-images.githubusercontent.com/558905/38052784-4f1bfefc-32a0-11e8-891d-3f366be5b01b.png)
![2016-12-29-12_28_37-jenkins](https://user-images.githubusercontent.com/558905/38052785-4f31518a-32a0-11e8-9cce-2ad6275b7698.png)
![2016-12-29-12_34_10-jenkins](https://user-images.githubusercontent.com/558905/38052786-4f4421b6-32a0-11e8-8c40-8b805a09a77e.png)
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
