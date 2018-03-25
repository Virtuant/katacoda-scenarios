#### Testing Installed Additions

# REPLACE
At this point, you can log in to your virtual machine to make sure that everything is installed as you would expect it to be.

# REPLACE
1\. Like before, to do this, you run `vagrant ssh` to log in. Then, you can run a few commands to check whether certain programs are installed:

`
# which php
`{{execute HOST1}}

Output:

```
/usr/bin/php
```

`
# which nginx
`{{execute HOST1}}

Output:

```
/usr/sbin/nginx
```

`
# which mysqld
`{{execute HOST1}}

Output:

```
/usr/sbin/mysqld
```

2\. Before moving forward, be sure to exit the instance by issuing the following:

`
exit
`{{execute HOST1}}
