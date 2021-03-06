For this step, leave the secondary terminal window and return to the primary. If that container is not currently active, meaning you are not still logged into it, repeat point #2 of Step 1, or consult with the instructor.

`docker exec Bert /bin/bash`{{execute T1}}

1\. Take a minute and explore the interactive Ubuntu container we’ve spun up. Once done, following along further to insure our container is up to date.

`apt-get update`{{execute T1}}

2\. Now, let’s create a file. We will name it ```hello.py``` and you can fill it up with just about anything you want to. Following along here, and make sure to put the file in your Home directory.

`cd ~`{{execute T1}}

`touch hello.py`{{execute T1}}

3\. Just to be sure, go ahead confirm the file's creation, just like you would normally from your CLI.

`ls -alt`{{execute T1}}

4\. So, we’ve created our file, let’s fill it up with some code. 

`vi hello.py`{{execute T1}}

5\. Now, hit `i` to insert and copy and paste the following line into the file:

`hello-world`{{copy}}

**Vim (`vi`) Basic Instruction:**<br>
To save your text to the `hello.py` doc, hit (`esc`) and then type out (`:qw`) and hit (`enter`). If this is ineffective consult with the instructor.
