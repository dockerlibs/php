
_current_tags="7.2-fpm-stretch-0 7.2.28-fpm-stretch-0"

build_71:
	docker build -f 7.1/stretch/fpm/Dockerfile -t dot1024/docker-php:7.1-testing .

php-72:
	docker build -f 7.2/stretch/fpm/Dockerfile -t dot1024/docker-php:7.2-testing .

tag:
	{ \
		set -e ;\
		for v in "$(_current_tags)"; do \
			echo $${v}; \
			git tag -d $${v}; \
			git push --delete origin $${v}; \
			git tag -a $${v} -m "tag $${v}"; \
		done; \
	}
