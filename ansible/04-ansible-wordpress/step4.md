
## Installing Nginx

1\. Now, let’s install `nginx` by adding the following to the end of `playbook.yml`:

<pre class="file" data-filename="playbook.yml"><blockquote>
  # nginx
  - name: Install nginx
    apt: name=nginx state=present
  - name: Start nginx
    service: name=nginx state=started
</blockquote></pre>


2\. Run Ansible now to install `nginx` and start it running.

`ansible-playbook -i 'localhost,' -c local playbook.yml`{{execute HOST1}}

3\. You can now visit `localhost` in your web browser, you will see the “Welcome to nginx” page.

![image](https://user-images.githubusercontent.com/21102559/32392705-0895e2d2-c0ad-11e7-8d23-1bdcf4f379b0.png)
