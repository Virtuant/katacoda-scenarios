If we wanted to move the Data Container to another machine then we can export it to a `.tar` file.

`docker export dataContainer > dataContainer.tar`{{execute T1}}

The command:

`docker import dataContainer.tar`{{execute T1}}

will import the Data Container back into Docker.