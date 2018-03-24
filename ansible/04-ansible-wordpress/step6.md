Now, let’s install nginx by adding the following to the end of playbook.yml:

```yml
# nginx
- name: Install nginx
  apt: name=nginx state=present
  
- name: Start nginx
  service: name=nginx state=started
```

Run `vagrant provision` again to install nginx and start it running.

Now, visit `192.168.33.20` in your web browser, you will see the “Welcome to nginx” page.

>Note: This IP is the one you've established in your Vagrantfile. It may vary from the one above, check your Vagrantfile, if needed.

![image](https://user-images.githubusercontent.com/21102559/32392705-0895e2d2-c0ad-11e7-8d23-1bdcf4f379b0.png)