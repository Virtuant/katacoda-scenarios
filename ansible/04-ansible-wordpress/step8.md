## Handler and Configuration Testing

After running Ansible, your new config should rollout and Nginx should be restarted.

1\. To test this, include the IP address and domain that you’ve been using to the bottom of the `/etc/hosts` file, on your host machine:

<pre class="file" data-filename="/etc/hosts"><blockquote>
"hostIP" book.example.com
</blockquote></pre>


2\. Once you've added that, run the following commands to create the appropriate folder:

`sudo mkdir -p /var/www/book.example.com`{{execute}}

3\. Then, run the following to formulate the test display:

`echo "<?php echo date('H:i:s'); " | sudo tee /var/www/book.example.com/index.php`{{execute}}

4\. You should now verify that, the command was successful in copying to the file.

`cat /var/www/book.example.com/index.php`{{execute}}

5\. Finally, ping `http://book.example.com` in your terminal, using curl. You should see the current time:

`curl http://book.example.com`{{execute}}

Now, that is pretty cool, huh?

>Note: If you've come to this point and you've been unable to render the appropriate results, don't worry! It happens to the best of us. Go back to your `default` Nginx folder and check for syntax errors. Also, check the indentation of code in your playbook. You'll get it!
