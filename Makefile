
build_71:
	docker build -f 7.1/stretch/fpm/Dockerfile -t dot1024/docker-php:7.1-testing .

php-72:
	docker build -f 7.2/stretch/fpm/Dockerfile -t dot1024/docker-php:7.2-testing .
