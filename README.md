# nuBuilder Docker image

[nuBuilder](https://www.nubuilder.com/) is an Open Source browser-based tool for
developing web-based database applications. It is written in
PHP/MySQL/JavaScript/jQuery.

This repository contains a Docker image of nuBuilder for an easy deployment.

## How to use this image

To use this image you need an additional web server that can proxy http-request
to the fpm-port of the container.
For fpm connection this container exposes port 9000.

The easiest way is to use the included `docker-compose.yml`:

 * download this repo somewhere
 * edit `docker-compose.yml`, changing:
   - the default passwords (`DB_PASSWORD`, `DB_ROOT_PASSWORD` and `NUBUILDER_PASSWORD`)
   - `/path/to/nginx.conf`
 * run `docker-compose up -d`

nuBuilder should now be available on the port 80.

## How to update nuBuilder

The nuBuilder code is stored in the `nubuilder` volume: to download it again (or
update it) simply delete the volume and restart the container.
