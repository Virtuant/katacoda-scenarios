### Setup Maven or Gradle

If you later prefer to use Maven instead of (or in addition to) Gradle, you need to prepare its first usage. For Gradle preparation, after going to the menu pic, see the Gradle Alternative below.

First, go to Jenkins -> Manage Jenkins -> Global Tool Configuration (available for Jenkins >2.0):

![2016-12-09-11_34_55-manage-jenkins-jenkins](https://user-images.githubusercontent.com/558905/37997763-ff645992-31e9-11e8-815e-cb8f28e43f9b.png)

![2016-12-09-11_35_26-global-tool-configuration-jenkins](https://user-images.githubusercontent.com/558905/37997254-612332b8-31e8-11e8-8317-76bbaa291e3c.png)


![2017-01-02-14_27_26-global-tool-configuration-jenkins](https://user-images.githubusercontent.com/558905/37997309-7e37eab0-31e8-11e8-9398-1b12e6fecffc.png)
![2017-01-02-14_32_46-global-tool-configuration-jenkins](https://user-images.githubusercontent.com/558905/37997310-7e44e76a-31e8-11e8-8cfd-0b260a84995c.png)


#### Alternative: Prepare Maven Usage

Scroll down to Maven -> Add Maven

2017-01-02-14_32_46-global-tool-configuration-jenkins

-> choose Version (3.3.9 in my case)

-> Add a name (“Maven 3.3.9” in my case)

-> Save

Since we have checked “Install automatically” above, I expect that it will be installed automatically on first usage.

----

#### Alternative: Prepare Gradle Usage

If you later prefer to use Gradle instead of (or in addition to) Maven, you need to prepare its first usage. For Maven preparation, see Step 3, Alternative (b) below.

On this wiki page about the Gradle plugin we find that we need to configure Gradle first:

Goto Jenkins -> Manage Jenkins -> Global Tool Configuration (available for Jenkins >2.0)

2016-12-09-11_34_55-manage-jenkins-jenkins

2016-12-09-11_35_26-global-tool-configuration-jenkins

Scroll down to Gradle -> Add Gradle

2017-01-02-14_27_26-global-tool-configuration-jenkins

-> choose Version (Gradle 3.2.1 in my case)

-> Add a name (“Gradle 3.2.1” in my case)

-> Save

Since we have checked “Install automatically” above, I expect that it will be installed automatically on first usage.
