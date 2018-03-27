In this scenario you'll learn how to configure Jenkins to build Docker Images based on a Dockerfile. The scenario is designed to demostrate how you can use Docker within a CI/CD pipeline, using Images as a build artefact that can be promoted to different environments and finally production.

In this scenario, we will perform our first automated job within Jenkins, the most popular open source tool for Continuous Integration and Continuous Deployment. Like in part 1 of this blog series, we will start Jenkins in a Docker container and define and run a first task:

    Download source code from GitHub
    Create a fat  executable JAR file via Maven

At the end of this session, we will have learned how to download GitHub code and build a Java program (executable JAR file) on a push of a button.
