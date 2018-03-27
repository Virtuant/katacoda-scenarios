## WordPress: Download, Install and Configure

#### Manual Download and Placement

1\. You can download the latest release with a command-line HTTP client named curl:

`mkdir -p provisioning/files && \
curl https://wordpress.org/latest.zip > provisioning/files/wordpress.zip`{{execute}}

2\. You’ll copy it into the `/tmp` directory by adding the following to your playbook under the tasks section:

<pre class="file" data-filename="playbook.yml"><blockquote>

# Wordpress
- name: Copy wordpress.zip into tmp
  copy: src=files/wordpress.zip dest=/tmp/wordpress.zip

</blockquote></pre>
