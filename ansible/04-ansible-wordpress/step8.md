## Handler and Configuration Testing

After running Ansible, your new config should rollout and nginx should be restarted.

1\. To test this, `cd` into your `/etc/hosts` file, and add `book.example.com`, such that the first line in your `hosts` file should resemble the following:

<pre>
127.0.0.01  localhost  book.example.com
</pre>

2\. Once you've added that, run the following commands to create the appropriate folder:

`sudo mkdir -p /var/www/book.example.com`{{execute}}

3\. Then, run the following to formulate the test display:

`echo "<?php echo date('H:i:s'); " | sudo tee /var/www/book.example.com/index.php`{{execute}}

4\. You should now verify that, the command was successful in copying to the file.

`cat /var/www/book.example.com/index.php`{{execute}}

5\. Now, before you move to the next step, check the status of the `php7.2-fpm` package. This is very important! Follow along closely:

`service php7.2-fpm status`{{execute}}

If it's running, move on to the next step, however if it is currently not running, start the service:

`service php7.2-fpm start`{{execute}}

6\. Finally, `curl` our `http://book.example.com` URL in your terminal. You should see the current time:

`curl http://book.example.com`{{execute}}

Now, that is pretty cool, huh?

>Note: If you've come to this point and you've been unable to render the appropriate results, don't worry! It happens to the best of us. Go back to your `default` nginx folder and check for syntax errors. Also, check the indentation of code in your playbook. You'll get it!
