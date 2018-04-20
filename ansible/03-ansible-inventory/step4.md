
A fundamental principle of Ansible is that it ensures a desired state.

From the previous example:

<pre class="file" data-filename="playbook.yml"><blockquote>

---
- hosts: host01
  become: true
  tasks:
    - name: Install required packages
      apt: name={{item}} state=present update_cache=yes
      with_items:
        - php5-cli
        - nginx
        - mysql-server

</blockquote></pre>


>Note: If for some reason you've gotten to this point and you've notice that your playbook.yml file does not resemble the one given, please copy and paste the code given into your editor.

This tells Ansible to check if the items listed using `with_items` are present. If they are, Ansible will do nothing more, since the state is already achieved. However, if the items are not present, or if it's an older version, Ansible will ensure the items are present by installing the latest version.

If you run the playbook again, Ansible does the former, and instead of `"Changed: 1"`, you will get `"OK: 2, Changed 0"`.

1\. Try it out:

`ansible-playbook -i myhosts site.yml`{{execute}}

This is a simple example that conveys a powerful truth about Ansible.
