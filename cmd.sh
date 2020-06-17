#!/bin/sh

__DIR__=$(cd "$(dirname "$0")"; pwd)


__fn_git() {
  case "$1" in
    save)
      tag=$2

      if [ -z "${tag}" ]; then 
        echo "tag invalid"
        exit 1
      fi

      echo "saving   tag = ${tag}"
      git tag -a ${tag} -m "tag ${tag}"
      ;;
    remove)
      tag=$2

      if [ -z "${tag}" ]; then 
        echo "tag invalid"
        exit 1
      fi

      echo "removing tag = ${tag}"
      git tag | grep "${v}" && git tag -d ${v}
      git push origin --delete ${tag}
      ;;
    push)
      echo "pushing  tag = ${tag}"
      git push && git push --tags
      ;;
  esac
}

# docker build -f 7.4/alpine3.12/fpm/Dockerfile -t dot1024/docker-php:7.4-testing .

# __main__
_tag=`cat ${__DIR__}/.cmd_tag`
__fn_git remove "${_tag}"
__fn_git save   "${_tag}"
# __fn_git push
