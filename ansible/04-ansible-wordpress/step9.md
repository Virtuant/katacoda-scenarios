We learned in the lecture that we face a unquie challenge here. Nginx needs to be restarted in order to pick-up changes, but we don't want Nignx to restart everytime we run our playbook. The best way to "handle" things that need to be restarted, only when things change, is to use a *handler*. 

#### Handler Configuration

Add the following lines of code to your playbook, putting them on the same level and indentation as `tasks`:

```yml
handlers:
    - name: restart nginx
      service: name=nginx state=restarted
```

You can trigger it whenever your `config` file changes, by updating the "Create nginx config" task, to look like this:

```yaml
<pre>
- name: Create nginx config
  template: src=templates/nginx/default dest=/etc/nginx/sites-available/default
  <b>notify: restart nginx</b>
</pre>
```

Be sure to save it! But, this feels like a good opportunity to run `vagrant destroy`, followed by `vagrant up` to confirm that everything is installed and configured correctly.

#### Handler and Configuration Testing

After running vagrant up, your new config should rollout and nginx should be restarted.

To test this, include the IP address and domain that you’ve been using to the bottom of the `/etc/hosts` file, on your host machine (not your VM):

```console
[your ip] book.example.com
```

Now, as before, log in to the virtual machine with `vagrant ssh`.

Once you've successfully logged in, run the following commands to formulate the test display:

`sudo mkdir -p /var/www/book.example.com
echo "<?php echo date('H:i:s'); " | sudo tee /var/www/book.example.com/index.php'{{execute}}

Always remember to exit out of your instances, before running further commands!

```
# exit
```

Finally, visit `http://book.example.com` in your browser. You should see the current time.

Now, that is pretty cool, huh? I hope you're proud of yourself
