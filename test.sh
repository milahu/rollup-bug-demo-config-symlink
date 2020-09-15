#!/bin/bash

# this will pass
rollup -c

# this will fail
orig='rollup.config.js'
moved='rollup.config.js.MOVED'
mv $orig $moved
ln -s $moved $orig # create symlink to config file
rollup -c
# error: [!] SyntaxError: Cannot use import statement outside a module
# [ the symlink 'rollup.config.js' is not recognized as js module file ]

# restore old state
rm $orig
mv $moved $orig
