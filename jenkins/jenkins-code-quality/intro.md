This exercise will 

Today, we will show how to use Checkstyle for improving the style of Java code. First, we will add Checkstyle to Gradle in order to create XML reports for a single build. Jenkins allows us to visualize the results of more than one test/build run into historic reports. After that, we will show, how a developer can use the Eclipse Checkstyle plugin in order to create better code:

A typical workflow is visualized above: a developer checks in the code changes into the repository. Jenkins will detect the change, build (compile) the software, test it and prepare to deploy it on a system. Depending on the configuration, the deployment is triggered by a human person, or automatically performed by Jenkins.
