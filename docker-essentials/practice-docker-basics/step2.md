For this step, leave the secondary terminal window and return to the primary. If that container is not currently active, meaning you are not still logged into it, repeat point #2 of Step 1, or consult with the instructor.

1\. Take a minute and explore the interactive Ubuntu container we’ve spun up. Once done, following along further to insure our container is up to date.

`sudo apt-get update`{{copy}}

2\. Now, let’s create a file. We will name it ```hello.py``` and you can fill it up with just about anything you want to. Following along here, and make sure to put the file in your Home directory.

`cd ~  \
touch hello.py`{{copy}}

3\. Just to be sure, go ahead confirm the file's creation, just like you would normally from your CLI.

`ls`{{copy}}


4\. So, we’ve created our file, let’s go in and fill it up with our code. 

`vi hello.py`{{copy}}

5\. Now, copy and paste the following line into the file:

`hello-world`{{copy}}

**Vim (`vi`) Basic Instruction:**<br>
Before writing any text you must press (`i`). To save your text to the `hello.py` doc, hit (`esc`) and then type out (`:qw`) and hit (`enter`). If this is uneffective consult with the instructor.