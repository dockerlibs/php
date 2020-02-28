#!/bin/sh

_tags="7.2-fpm-stretch-0 7.2.28-fpm-stretch-0"

__fn_git_tag_save(){
  for v in ${_tags}; do
    git tag | grep "${v}" && git tag -d ${v}
    git tag -a ${v} -m "tag ${v}"
  done
}

__fn_git_tag_del() {
  git push origin --delete $1
}

__fn_git_tag_push(){
  git push && git push --tags
}

case "$1" in
  save)
    __fn_git_tag_save
    ;;
  push)
    __fn_git_tag_push
    ;;
esac
