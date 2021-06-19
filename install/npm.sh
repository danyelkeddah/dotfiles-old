#!/bin/sh
packages=(
  dts-gen
  gulp
  gulp-cli
  nodemon
  tldr
  tslint
  yo
  grunt
  release-it
  underscore-cli
  vtop
  eslint-plugin-vue
  eslint
  n
  pnpm
  redis-commander
)

npm install -g "${packages[@]}"
