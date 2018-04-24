
What is a play?
A play is a set of tasks mapped to a set of hosts. Plays are organized inside a text file called a playbook. We just learned about playbooks in our last lab.

Running a playbook
This playbook runs one task, on our one host, `host01`. Note the indentation - it's important for how the file gets parsed. Blank lines are ignored, but makes the playbook more readable for humans.

1\. Firstly, create a new folder and title it `playbook.yml`, like this:

`touch playbook.yml`{{execute}}

2\. Now, rather than copying this code into your playbook automatically, copy it in manually, taking time to understand each component. Simply click on `playboook.yml` in your text editor, and begin moving the following code over.

<pre class="file" data-filename="playbook.yml"><blockquote>

---
- hosts: host01
  become: true
  tasks:
    - name: ensure latest sysstat is installed
      apt:
        name: sysstat
        state: latest

</blockquote></pre>

>Note: Katacoda will save the lines of code you add to the file automatically.

3\.Now that the above code is in `playbook.yml`, let's verify the contents just to be sure:

`cat playbook.yml`{{execute}}

4\. Okay! Now, you are ready to run the playbook using the `ansible-playbook` command with the inventory file `myhosts`:

`ansible-playbook -i myhosts playbook.yml`{{execute}}

Ansible should return the result `'Changed=1'`, indicating that the package was installed.

What happened here?

#### Playbook breakdown
- `---` denotes the beginning of a YAML file
- `hosts: host01` tells Ansible to run the tasks on the host host01
- `become: true` makes all your tasks run as sudo
- `- name:` is basically a comment, describing what the task does
- `apt:` specifies the module we want to use
- `name:` is an argument to the apt module, that specifies the name of the package to install.

5\. To see all arguments for a specific module, allowed values, and other details, you can use the CLI documentation that is included with Ansible:

`ansible-doc apt`{{execute}}

To close the documentation, enter `q` in the terminal.
