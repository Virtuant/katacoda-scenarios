Now, you need to create an upstream definition in the configuration file so that nginx knows where to pass the request on to. Add the following at the **top** of your template before the opening server { line }:

```nginx
   upstream php {
       server unix:/run/php/php7.2-fpm.sock;
   }
```

>Note: Understand that php7.2 made not be right and you'll only know that by doing the next step.

[Important] Remember you'll need to confirm which socket your PHP-FPM pool is listening on. If the results are differ from the code sample above, you will have to update the code. Go ahead an ssh into your machine and run the following commands:

```console
$ vagrant ssh
# ls /etc/php/
# cat /etc/php/7.X/fpm/pool.d/www.conf  | grep "listen ="
# exit
```

>Note: Remember, pay close attention to whether ($) or (#) are used, because they indicate where the code is to be run.

Make sure that you run `vagrant provision` to bring everything up to date.
