#!/bin/sh

if [ ${NUBUILDER_INSTALL_DIR: -1} != '/' ]; then
	export NUBUILDER_INSTALL_DIR=${NUBUILDER_INSTALL_DIR}/

fi

if [ ! -f "${NUBUILDER_INSTALL_DIR}/nuconfig.php" ]; then
	wget -O /tmp/nubuilder.zip "$NUBUILDER_DOWNLOAD_LINK"
	rm -rf "${NUBUILDER_INSTALL_DIR}*"
	unzip /tmp/nubuilder.zip -d ${NUBUILDER_INSTALL_DIR}
	rm /tmp/nubuilder.zip
	mv "${NUBUILDER_INSTALL_DIR}nuconfig-sample.php" "${NUBUILDER_INSTALL_DIR}nuconfig.php"
	sed -i "s/\$nuConfigDBHost.*;/\$nuConfigDBHost = getenv\('DB_HOST'\);/" "${NUBUILDER_INSTALL_DIR}nuconfig.php"
	sed -i "s/\$nuConfigDBName.*;/\$nuConfigDBName = getenv\('DB_NAME'\);/" "${NUBUILDER_INSTALL_DIR}nuconfig.php"
	sed -i "s/\$nuConfigDBUser.*;/\$nuConfigDBUser = getenv\('DB_USER'\);/" "${NUBUILDER_INSTALL_DIR}nuconfig.php"
	sed -i "s/\$nuConfigDBPassword.*;/\$nuConfigDBPassword = getenv\('DB_PASS'\);/" "${NUBUILDER_INSTALL_DIR}nuconfig.php"
	sed -i "s/\$nuConfigDBGlobeadminUsername.*;/\$nuConfigDBGlobeadminUsername = getenv\('GLOBE_USER'\);/" "${NUBUILDER_INSTALL_DIR}nuconfig.php"
	sed -i "s/\$nuConfigDBGlobeadminPassword.*;/\$nuConfigDBGlobeadminPassword = getenv\('GLOBE_PASS'\);/" "${NUBUILDER_INSTALL_DIR}nuconfig.php"

fi

exec "$@"
