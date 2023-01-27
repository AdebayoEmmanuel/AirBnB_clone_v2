#!/usr/bin/env bash
# this script prepares our machine for deploying static

sudo apt-get update
sudo apt-get install net-tools -y

if ! [ -x "$(command -v nginx)" ]; then
	echo 'Nginx is not installed. Instaling...'
	sudo apt-get install -y nginx
fi

# creates neccessary dirs if they don't exist
if [ ! -d "/data" ]; then
	sudo mkdir /data
	sudo chown -R ubuntu:ubuntu /data/
	sudo chmod -R 755 /data/
fi

if [ ! -d "/data/web_static" ]; then
	sudo mkdir /data/web_static
fi

if [ ! -d "/data/web_static/releases" ]; then
	sudo mkdir /data/web_static/releases
fi

if [ ! -d "/data/web_static/shared" ]; then
	sudo mkdir /data/web_static/shared/
fi

if [ ! -d "/data/web_static/releases/test" ]; then
	sudo mkdir /data/web_static/releases/test
fi

# create test HTML
sudo touch /data/web_static/releases/test/index.html
echo '<html> I am serving... </html>' > /data/web_static/releases/test/index.html

# create required symlink
if [ -L "/data/web_static/current" ]; then
	sudo rm /data/web_static/current
fi
sudo ln -s /data/web_static/releases/test/ /data/web_static/current

# update Nginx config
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default.bak
sudo tee /etc/nginx/sites-available/default <<EOF
server {
	listen 80 default_server;
	listen [::]:80 default_server;

	root /data/webstatic/current;
	index index.html;

	server_name _;

	location /hbnb_static {
		alias /data/web_static/current;
	}
}
EOF

# restart nginx
sudo service nginx restart

#exit successfully
exit 0
