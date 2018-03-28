### Setup Maven or Gradle

#### Alternative: Prepare Maven Usage

If you later prefer to use Maven instead of (or in addition to) Gradle, you need to prepare its first usage. For Gradle preparation, see Step 3, Alternative (a) above.

Goto Jenkins -> Manage Jenkins -> Global Tool Configuration (available for Jenkins >2.0)

2016-12-09-11_34_55-manage-jenkins-jenkins

2016-12-09-11_35_26-global-tool-configuration-jenkins

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
