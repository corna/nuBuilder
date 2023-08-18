FROM php:7.4-fpm-alpine3.14

RUN apk update && apk add --no-cache \
	aspell-dev \
	autoconf \
	bzip2-dev \
	icu-dev \
	libjpeg-turbo-dev \
	libpng-dev \
	libxml2-dev \
	libzip-dev \
	tidyhtml-dev \
	unzip \
	wget

RUN docker-php-ext-install  \
	mysqli \
	pdo_mysql \
	zip \
	gd \
	bcmath \
	intl \
	bz2 \
	soap \
	opcache \
	pspell \
	xmlrpc \
	tidy

ENV NUBUILDER_DOWNLOAD_LINK "https://sourceforge.net/projects/nubuilder/files/nuBuilder%204.5/nubuilder4.5.zip"
ENV NUBUILDER_INSTALL_DIR "/var/www/html/"

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["php-fpm"]
