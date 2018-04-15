#### Bare Essentials Playbook

1\. Now, tell Ansible to run on all available hosts by adding - hosts: all to our new playbook. After adding these lines, your playbook should now look like this:

<pre class="file" data-filename="playbook.yml" data-target="replace"><blockquote>

---
- hosts: all

</blockquote></pre>

2\. You'll need to add a section named tasks. Try to remember how from the lecture, but if you need help, peek ahead.

3\. Inside tasks, you are going to tell Ansible to just ping your machines to make sure that you can connect to them:

<pre class="file" data-filename="playbook.yml" data-target="replace"><blockquote>

---
- hosts: all
  tasks:
    - ping:

</blockquote></pre>

4\. Now, "provision" your newest changes to Ansible on the machine by executing:

`ansible-playbook -i 'localhost,' -c local playbook.yml`{{execute HOST1}}

You should see output that looks like the following:

```bash
==> default: Running provisioner: ansible...

PLAY [all]
********************************************************************

GATHERING FACTS
***************************************************************
ok: [default]

TASK: [ping ]
*****************************************************************
ok: [default]

PLAY RECAP
********************************************************************

default         : ok=2    changed=0    unreachable=0    failed=0
```

5\. Thankfully, Ansible lets you add a name to each task to explain its purpose. Let’s do that to our ping action now:

<pre class="file" data-filename="playbook.yml" data-target="replace"><blockquote>

---
- hosts: all
  tasks:
    - name: "Your Text Description Here"
      ping:

</blockquote></pre>

6\. Now, inside the text editor provided, replace "Your Text Description Here" with a description you feel fitting for the task.

7\. Run it! It will no longer say `TASK: [ping ]`. Instead, it will show the description that you provided.

`ansible-playbook -i 'localhost,' -c local playbook.yml`{{execute HOST1}}
