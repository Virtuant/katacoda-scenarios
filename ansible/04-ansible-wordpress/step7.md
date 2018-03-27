## Tasks & Handlers

We learned in the lecture that we face a unquie challenge here. Nginx needs to be restarted in order to pick-up changes, but we don't want Nignx to restart everytime we run our playbook. The best way to "handle" things that need to be restarted, only when things change, is to use a *handler*.

#### Handler Configuration

1/. Add the following lines of code to your playbook, putting them on the same level and indentation as `tasks`:

<pre class="file" data-filename="playbook.yml"><blockquote>
handlers:
    - name: restart nginx
      service: name=nginx state=restarted
</blockquote></pre>

2\. You can trigger it whenever your `config` file changes, by updating the "Create nginx config" task, to look like this:

<pre class="file" data-filename="playbook.yml"><blockquote>
      notify: restart nginx
</blockquote></pre>

# REPLACE
3\. Be sure to save it! But, this feels like a good opportunity to run `vagrant destroy`, followed by `vagrant up` to confirm that everything is installed and configured correctly.

`ansible-playbook -i 'localhost,' -c local playbook.yml`{{execute HOST1}}
