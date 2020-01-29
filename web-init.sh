#!/bin/bash

apt update && apt install -y apache2
systemctl enable apache2
#systemctl start apache2

echo "<h2>You are @ "$HOSTNAME"</h2>" > /var/www/html/index.html


