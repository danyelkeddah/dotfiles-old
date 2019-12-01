#!/bin/sh
packages=(
  dts-gen
  gulp
  gulp-cli
  nodemon
  tldr
  tslint
  yo
  diff-so-fancy
  grunt
  release-it
  underscore-cli
  vtop
)

npm install -g "${packages[@]}"