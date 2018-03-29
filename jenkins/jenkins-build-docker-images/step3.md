### Plugins & Security

Once the plugins have been installed, you can configure how they launch the Docker Containers. The configuration will tell the plugin which Docker Image to use for the agent and which Docker daemon to run the containers and builds on.

The plugin treats Docker as a cloud provider, spinning up containers as and when the build requires them.

#### Task: Configure Security

1. Click on Credentials (on the left side)

![image](https://user-images.githubusercontent.com/558905/37984825-53a50ac6-31c5-11e8-8d88-76610aa7426e.png)

2. Select the `global` option, then the `This credential domain is empty. How about *adding some credentials*?` prompt.
3. Jenkins uses SSH to communicate with agents. Add a new set of "Credentials". The username is **jenkins** and the password is **jenkins**:

![image](https://user-images.githubusercontent.com/558905/37985129-fd391d84-31c5-11e8-8954-44a13e2c98c3.png)

4. Click the `OK` button
5. The, click the `Back to credential domains` hyperlink.

#### Task: Configure Plugin

This step configures the plugin to communicate with a Docker host/daemon.

1. Once again, select **Manage Jenkins**.
2. Select **Configure System** to access the main Jenkins settings.
3. At the bottom, there is a dropdown called **Add a new cloud**. Select **Docker** from the list.
4. You can now configure the container options. Set the name of the agent to **docker-agent**.
5. The "Docker URL" is where Jenkins launches the agent container. In this case, we'll use the same daemon as running Jenkins, but you could split the two for scaling. Enter the URL **[tcp://[[HOST_IP]]:2345](tcp://[[HOST_IP]]:2345)**
6. Use **Test Connection** to verify Jenkins can talk to the Docker Daemon. You should see the Docker version number returned.

#### Task: Configure Image

Our plugin can now communicate with Docker. In this step, we'll configure how to launch the Docker Image for the agent.

1. Using the Images dropdown, select **Add Docker Template** dropdown.
2. For the Docker Image, use **benhall/dind-jenkins-agent**. This image is configured with a Docker client and available at https://hub.docker.com/r/benhall/dind-jenkins-agent/
3. To enable builds to specify Docker as a build agent, set a label of **docker-agent**.
4. Select the previously created credentials ID in the drop-down list left of the "Add" button.
6. Finally, expand the Container Settings section by clicking the button. In the "Volumes" text box enter **/var/run/docker.sock:/var/run/docker.sock**
7. Click **Save**.

Jenkins can now start a Build Agent as a container when required.
