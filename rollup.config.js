// this import fails
import fs from 'fs';

// use import
console.log('test: size of '+__filename+
  ' is '+fs.statSync(__filename).size+' byte');

export default {
    input: 'rollup-input.js',
    output: {
        file: 'rollup-output.js',
        format: 'commonjs',
        name: 'test',
    },
};
