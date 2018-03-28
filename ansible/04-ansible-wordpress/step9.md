## WordPress: Download, Install and Configure

#### Manual Download and Placement

1\. You can download the latest release with a command-line HTTP client named curl:

`mkdir files  && \
curl https://wordpress.org/latest.zip > files/wordpress.zip`{{execute}}

2\. You’ll copy it into the `/tmp` directory by copying and pasting the following to your playbook under the tasks section, above the `hanlder` section:

<pre class="file" data-filename="playbook.yml"><blockquote>
    # Wordpress
    - name: Copy wordpress.zip into tmp
      copy: src=files/wordpress.zip dest=/tmp/wordpress.zip
</blockquote></pre>
