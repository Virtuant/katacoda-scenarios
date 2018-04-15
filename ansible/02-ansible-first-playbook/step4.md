#### Testing Installed Additions
At this point, you can begin to test your instance, to make sure that everything is installed as it should be. We've used Ansible to install each service on the localhost, so that won't be hard at all, but nevertheless important. As a result of installing everything on localhost, the following commands will all be preformed from your current working directory.

1\. First, test to ensure that PHP has been installed correctly:

`which php`{{execute HOST1}}

Output:

```
/usr/bin/php
```

2\. Secondly, look to make sure Nginx has been installed accordingly:

`which nginx`{{execute HOST1}}

Output:

```
/usr/sbin/nginx
```

3\. Lastly, run the same command to check MySQL installation:

`which mysqld`{{execute HOST1}}

Output:

```
/usr/sbin/mysqld
```
