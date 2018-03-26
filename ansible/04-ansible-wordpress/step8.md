## Handler and Configuration Testing

After running vagrant up, your new config should rollout and nginx should be restarted.

1\. To test this, include the IP address and domain that you’ve been using to the bottom of the `/etc/hosts` file, on your host machine (not your VM):

```yaml
192.168.33.20 book.example.com
```

2\. Now, as before, log in to the virtual machine with `vagrant ssh`.

3\. Once you've successfully logged in, run the following commands to formulate the test display:

```console
# sudo mkdir -p /var/www/book.example.com
# echo "<?php echo date('H:i:s'); " | sudo tee /var/www/book.example.com/index.php
```

4\. Always remember to exit out of your instances, before running further commands!

```
# exit
```

5\. Finally, visit `http://book.example.com` in your browser. You should see the current time.

Now, that is pretty cool, huh? I hope you're proud of yourself.
