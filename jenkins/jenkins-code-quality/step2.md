### Visualize the CheckStyle Warnings and Errors to the Developer

Usually Jenkins is not running as a Docker container on the Developer’s PC or Notebook, so he has no access to the above report files. We need to publish the statistics via the Jenkins portal. For that, we need to install the CheckStyle Jenkins plugin:

#### (optional): Install the “Static Analysis Utilities”

>Note: I have not tried it out, but I believe that this step is not necessary, since the next step will automatically install all plugins the Checksytle plug-in depends on.

On Jenkins -> Manage Jenkins -> Manage Plugins -> Available

In the Filter field, type “Static Analysis U”

2016-12-28-22_44_53-update-center-jenkins

Check the checkbox of “Static Analysis Utilities” and Install without restart.

2016-12-28-22_47_06-update-center-jenkins
Step 4.2: Install Checkstyle Plugin

On Jenkins -> Manage Jenkins -> Manage Plugins -> Available

In the Filter field, type “Checkstyle ” (with white space at the end; this will limit the number of hits):

2016-12-28-22_56_26-update-center-jenkins

Check the checkbox of “Checkstyle Plug-in” and Install without restart.

2016-12-28-22_58_22-update-center-jenkins
Step 4.3: Configure Checkstyle Reporting in Jenkins

On Dashboard -> <your Project> -> Configure -> Post-build Actions -> Add post-build action, choose

Publish Checkstyle analysis results

Now add the path, where Gradle is placing its result xml files:

**/build/reports/checkstyle/*.xml

2016-12-28-23_10_57-github-triggered-build-config-jenkins

And click Save.

#### Manually Trigger a New Build

On the Project page, click “Build now”, then click on the build and then “Console output”:

2016-12-28-23_17_16-github-triggered-build-726-console-jenkins

We now can see [CHECKSTYLE] messages after the build, telling us, that the reports were collected. Now, where can we see them?
Step 4.5: Review Checkstyle Statistics

On the Project page, choose Status:

2016-12-28-23_20_31-github-triggered-build-726-jenkins-v2

and click on Checkstyle Warnings on the left, or the warnings link in the center of the page, and we get a graphical representation of the Checkstyle statistics:

2016-12-29-12_27_34-jenkins

When clicking on one of the File Links (MyRouteBuilder.java in this case), we can get an overview of the Warning types for this file:

2016-12-29-12_28_37-jenkins

We choose the category Indentation and get details on the warnings:

2016-12-29-09_03_58-jenkins

and after clicking on one of the links in the Warnings field, we see the java code causing the warning:

2016-12-29-09_05_56-jenkins

Okay, Camel’s Checkstyle configuration does not like my style of grouping each route’s first line with a smaller indent than the rest of the route:

2016-12-29-09_10_26-jenkins

And it does not seem to accept my style of putting the ; in a new line at the end of a route as seen by choosing the Whitespace category and then choosing an occurence:

2016-12-29-12_34_10-jenkins

I either need to change this style, or I need to adapte the checkstyle.xml configuration file to ignore those warnings.
