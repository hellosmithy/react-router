#!/bin/bash -e

babel=node_modules/.bin/babel
webpack=node_modules/.bin/webpack
build_dir=lib

rm -rf $build_dir

$babel ./modules -d $build_dir --ignore "__tests__" --loose all

NODE_ENV=production $webpack modules/index.js $build_dir/umd/ReactRouter.js
NODE_ENV=production $webpack -p modules/index.js $build_dir/umd/ReactRouter.min.js

echo "gzipped, the global build is `gzip -c $build_dir/umd/ReactRouter.min.js | wc -c | sed -e 's/^[[:space:]]*//'` bytes"
