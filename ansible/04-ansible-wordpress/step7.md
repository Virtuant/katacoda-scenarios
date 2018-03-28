## Tasks & Handlers

We learned in the lecture that we face a unquie challenge here. Nginx needs to be restarted in order to pick-up changes, but we don't want Nignx to restart everytime we run our playbook. The best way to "handle" things that need to be restarted, only when things change, is to use a *handler*.

#### Handler Configuration

1/. Add the following lines of code to the bottom of your playbook, putting `handler` on the same indentation line as `tasks`:

<pre class="file" data-filename="playbook.yml"><blockquote>
  handlers:
    - name: restart nginx
      service: name=nginx state=restarted
</blockquote></pre>

2\. You can trigger it whenever your `config` file changes, by updating the "Create nginx config" task. Just copy and paste the following code in it's place:

```
    - name: Create nginx config
      template: src=templates/nginx/default dest=/etc/nginx/sites-available/default
      notify: restart nginx
```

3\. Be sure to save it! Go ahead and run Ansible again to ensure our playbook is fully functional.

`ansible-playbook -i 'localhost,' -c local playbook.yml`{{execute HOST1}}
