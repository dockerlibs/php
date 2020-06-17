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

      echo "saving   tag(${tag})"
      git tag -a ${tag} -m "tag ${tag}"
      ;;
    remove)
      tag=$2

      if [ -z "${tag}" ]; then 
        echo "tag invalid"
        exit 1
      fi

      echo "removing tag(${tag})"
      
      v=`git tag | grep "${tag}"`

      if [ ! -z "${v}" ]; then
        git tag -d ${tag}
        git push origin --delete ${tag}
      fi

      ;;
    push)
      echo "pushing  tag(${tag})"
      git push && git push --tags
      ;;
  esac
}

__fn_git_muli_op() {
  tag=$1
  __fn_git remove "${tag}"
  __fn_git save   "${tag}"
  __fn_git push
}


__fn_build() {
  docker build -f 7.4/buster/fpm/Dockerfile -t dot:7.4-testing .
}

# __main__
case "$1" in
  build)
    __fn_build
    ;;
  *)
    # __fn_git_muli_op `cat ${__DIR__}/.cmd_tag.0`
    # __fn_git_muli_op `cat ${__DIR__}/.cmd_tag.1`
    # __fn_git_muli_op `cat ${__DIR__}/.cmd_tag.2`

    t0=`cat ${__DIR__}/.cmd_tag.0`
    t1=`cat ${__DIR__}/.cmd_tag.1`
    t2=`cat ${__DIR__}/.cmd_tag.2`
    __fn_git remove "${t0}" && __fn_git save   "${t0}"
    __fn_git remove "${t1}" && __fn_git save   "${t1}"
    __fn_git remove "${t2}" && __fn_git save   "${t2}"
    __fn_git push
    ;;
esac
