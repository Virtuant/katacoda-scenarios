## Handler and Configuration Testing

After running Ansible, your new config should rollout and Nginx should be restarted.

1\. To test this, include the IP address and domain that you’ve been using to the bottom of the `/etc/hosts` file, on your host machine (not your VM):

<pre class="file" data-filename="/etc/hosts"><blockquote>

192.168.33.20 book.example.com

</blockquote></pre>

2\. Now, as before, log in to the virtual machine with `vagrant ssh`.

3\. Once you've successfully logged in, run the following commands to formulate the test display:

`sudo mkdir -p /var/www/book.example.com`{{execute}}

`echo "<?php echo date('H:i:s'); " | sudo tee /var/www/book.example.com/index.php`{{execute}}

4\. Always remember to exit out of your instances, before running further commands!

`exit`{{execute HOST1}}

5\. Finally, visit `http://book.example.com` in your browser. You should see the current time.

Now, that is pretty cool, huh? I hope you're proud of yourself.
