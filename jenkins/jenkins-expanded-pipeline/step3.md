In this section, we’ll add in some testing stages to our pipeline. We’ll also see how to run items in parallel.

In the previous Compile stage, we specifically told Gradle not to run the unit tests that it found by specifying the
“-x test” target. Now we want to add in processing of several unit tests. Additionally, we want to run these in
parallel. First, create a new stage for the unit testing. Also go ahead and create a stage for the integration testing.

If still in the Stage View, click Configure in the upper left menu. Add the lines in bold below to the configuration for your pipeline.
 

For our unit tests, we are going to execute them in parallel. So, within the Unit Test stage, add a Parallel step (block).

Do this by adding the lines below in bold. (Note that parallel is lower-cased and those are parentheses after parallel, NOT brackets.)


The parallel step takes a set of mappings with a key (name) and a value (code to execute in that parallel piece). To simplify setting this up, the code for the body of the parallel step (that runs the unit tests) is already done for you. It is in a text file on the VM desktop named Parallel.

Open that file and copy and paste the contents between the opening and closing parentheses in the parallel step in the Unit Test stage.
 

Take a look at the code in the parallel step. For each of the keys in the map (tester1, tester2, and tester3), we have a corresponding map value that consists of a block of code. The block of code has a node to run on (based on a selection by label), a step to clean the workspace, a step to “unstash”, and a call to the shared library Gradle command to run the particular test(s). The reason for the unstash command here is to get copies of the code onto this node for testing without having to pull it down again from source control (since we already did that.) This implies something was stashed. We’ll setup the stash next.

For purposes of having the necessary code to run the unit tests, we need to have the following pieces of our workshop project present on the testing nodes. Subprojects api, dataaccess, and util
 
Project files build.gradle and settings.gradle

So we want to create a stash with them using the DSL’s stash command. To figure out the syntax, we’ll use the
built-in Snippet Generator tool.

Click on the Pipeline Syntax link underneath the editing window on the configuration page in Jenkins.

You’ll now be in the Snippet Generator. ACTION: In the drop-down list of Sample Steps, find and select the stash command. A set of fields for the different named parameters associated with the stash command will pop up. You can click on the blue (with a ?) help button for any of the parameters to get more help for that one.
Type in the values for Name and Includes as follows:

Name: ws-src
Includes:  api/**, dataaccess/**, util/**, build.gradle, settings.gradle

(The ** is a way to say all directories and all files under this area.)
Now, click the Generate Pipeline Script button. The generated code that you can use in your pipeline is shown in the box at the bottom of the screen.


Select and copy the text in the Generate Pipeline Script window. Switch back to the configure page for the pipe1 job and paste the copied text directly under the git step in the Source stage.

Finally, we’ll add the commands to run the integration tests. We’ll add a line to setup the test database we use for the integration testing using credentials we have already setup in Jenkins (mysql-access). Then we will invoke Gradle to run the integrationTest task that we have defined in our build.gradle file.

Enter or copy and paste the lines in bold below into the Integration Test stage in the pipeline code. The withCredentials closure can be copied from the file “Integration” on the desktop.

>Note: Those are brackets (curly braces) {} around env.DBUSER and env.DBPASS.

Save your changes and select Build Now to execute a build of all the stages with the current code. In the
Stage View, you’ll see the builds of our new stages.
 
Take a look at the console output for this run. ACTION: In the Build History window to the left of the stage view, click on the blue ball next to the latest run. Scroll down and look at the execution of the unit testing processes in parallel. This will be the lines starting with [tester 1], [tester 2], and [tester 3]. Th
