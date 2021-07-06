#!/bin/sh

if [ ! -f /var/www/html/nuconfig.php ]; then
	wget -O /tmp/nubuilder.zip "$NUBUILDER_DOWNLOAD_LINK"
	rm -rf /var/www/html/*
	unzip /tmp/nubuilder.zip -d /var/www/html/
	rm /tmp/nubuilder.zip

	sed -i "s/\$nuConfigDBHost.*;/\$nuConfigDBHost = getenv\('DB_HOST'\);/" /var/www/html/nuconfig.php
	sed -i "s/\$nuConfigDBName.*;/\$nuConfigDBName = getenv\('DB_NAME'\);/" /var/www/html/nuconfig.php
	sed -i "s/\$nuConfigDBUser.*;/\$nuConfigDBUser = getenv\('DB_USER'\);/" /var/www/html/nuconfig.php
	sed -i "s/\$nuConfigDBPassword.*;/\$nuConfigDBPassword = getenv\('DB_PASS'\);/" /var/www/html/nuconfig.php
	sed -i "s/\$nuConfigDBGlobeadminUsername.*;/\$nuConfigDBGlobeadminUsername = getenv\('GLOBE_USER'\);/" /var/www/html/nuconfig.php
	sed -i "s/\$nuConfigDBGlobeadminPassword.*;/\$nuConfigDBGlobeadminPassword = getenv\('GLOBE_PASS'\);/" /var/www/html/nuconfig.php
fi

exec "$@"
