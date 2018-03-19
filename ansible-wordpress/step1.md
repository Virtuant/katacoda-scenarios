Create a folder named provisioning and a file inside it named `playbook.yml`, and that'll get us started.


`mkdir provisioning
vi provisioning/playbook.yml`{{execute}}

>Note: Keep Vim open as you move to the next section.


### Writing Your First Playbook

Now, tell Ansible to run on all available hosts by adding - hosts: all to our new playbook. After adding these lines, your playbook should now look like this:

```yaml
---
- hosts: all
```

You'll need to add a section named tasks. Inside tasks, you are going to tell Ansible to just ping your machines to make sure that you can connect to them. In `provisioning/playbook.yml`, we specify on which hosts the playbook should run as well as a set of tasks to run. 
Just implement the `ping` module for now:

```yml
---
- hosts: all
  become: true
  tasks:
    - name: Make sure we can connect
      ping:
```

Thankfully, Ansible lets you add a name to each task to explain its purpose. Let’s do that to our ping action now:

```yaml
---
- hosts: all
  tasks:
    - name: "Your Text Description Here"
      ping:
```

Run it!
