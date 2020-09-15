#!/bin/bash

# this will pass
rollup -c

# this will fail
orig='rollup.config.js'
moved='rollup.config.js.MOVED'
mv $orig $moved
ln -s $moved $orig # create symlink to config file
rollup -c

# restore old state
rm $orig
mv $moved $orig
