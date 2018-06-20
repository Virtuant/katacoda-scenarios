
<img alt="Docker Banner" height="25%" width="100%" src="https://user-images.githubusercontent.com/21102559/41428354-d2fd1052-6fd7-11e8-8824-d4873955d89c.png">

## Docker Data Containers 

There are two ways of approaching stateful Containers, that is containers are store and persistent data for future use. This could be the container creating and storing data, for example, a database. Alternatively, it could be data requiring additional for instance the configuration or SSL certifications. This approach can also be used to backup data or debug containers.

One approach we've discussed is using the -v <host-dir>:<container-dir> option to map directories. The other approach is to use Data Containers. This scenario will introduce the advantages of using Data Containers.
