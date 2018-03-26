<img style="float: left;" src="https://user-images.githubusercontent.com/21102559/37915472-9f254882-30e7-11e8-979b-aad02f818e60.png">

## Introduction

In configuration management, the tool that you’re using needs to know which machines it should run on. This is known as an inventory. Without an inventory, you would have
a set of playbooks that define your desired system state, but you wouldn’t know which machines you needed to run them against.

With Puppet and Chef, this information is stored on a central server. As there is no central server in Ansible, we will need another way to get all of this information to the code that runs to enforce the desired state. This is where the inventory file comes in.
