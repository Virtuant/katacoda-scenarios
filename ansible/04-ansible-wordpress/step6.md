## Adding Nginx Upstream

1\. Now, you need to create an upstream definition in the configuration file so that nginx knows where to pass the request on to. Add the following at the **top** of your template before the opening server { line }:

<pre class="file" data-filename="default.yml" data-target="prepend"><blockquote>
upstream php {
      server unix:/run/php/php7.2-fpm.sock;
}
</blockquote></pre>

*[Important]* You'll need to confirm which socket your PHP-FPM pool is listening on. If the results are differ from the code sample above, you will have to update the code.

2\. Go ahead and confirm the version of PHP currently running:

`ls /etc/php/`{{execute HOST1}}

3\. Once you have that number, which at the time of writing this is 7.2,

`cat /etc/php/7.X/fpm/pool.d/www.conf  | grep "listen ="`{{execute HOST1}}

>Note: Remember, pay close attention to whether ($) or (#) are used, because they indicate where the code is to be run.

3\. Make sure that you run Ansible, to bring everything up to date.

`ansible-playbook -i 'localhost,' -c local playbook.yml`{{execute HOST1}}
