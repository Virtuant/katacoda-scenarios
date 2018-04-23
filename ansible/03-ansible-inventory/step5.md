
The apt module allows you to specify the state you wish the package to be in.

1\. If you want a specific version, you append it to the package name, for example:

<pre class="file" data-filename="playbook.yml" data-target="replace"><blockquote>

---
- hosts: host01
  become: true
  tasks:
    - name: Install required packages
      apt: name={{item}} state=present update_cache=yes
      with_items:
        - php-cli
        - nginx
        - mysql-server-5.6

</blockquote></pre>


If you want to ensure that the package is not installed, you can declare that with `state: absent`, and Ansible will ensure it.

2\. Update the playbook to remove `mysql-server-5.6`.

`sed -i -e 's/state: present/state: absent/' -e 's/ensure.*/ensure mysql-server-5.6 is removed/' playbook.yml`{{execute HOST1}}

3\. Then re-run the playbook:

`ansible-playbook -i myhosts playbook.yml`{{execute}}

Pretty cool, huh?

>SUCCESS!
