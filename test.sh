#!/bin/bash

config='rollup.config.js'
moved_1='rollup.config.MOVED.js'
moved_2='rollup.config.js.MOVED'

# pass
echo test no symlink
rollup -c

# fail
echo; echo test symlink $moved_1
mv $config $moved_1; ln -s $moved_1 $config
rollup -c
rm $config; mv $moved_1 $config

# fail
echo; echo test symlink $moved_2
mv $config $moved_2; ln -s $moved_2 $config
rollup -c
rm $config; mv $moved_2 $config

# pass
echo; echo test symlink $moved_1 + require
mv $config $moved_1; ln -s $moved_1 $config
sed -i "s/import fs from 'fs';/const fs = require('fs');/" $config
rollup -c
sed -i "s/const fs = require('fs');/import fs from 'fs';/" $config
rm $config; mv $moved_1 $config
