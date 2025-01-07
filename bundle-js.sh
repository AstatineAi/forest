#!/nix/store/5mh7kaj2fyv8mk4sfq1brwxgc02884wi-bash-5.2p37/bin/bash

npm install

./node_modules/.bin/esbuild --minify --bundle javascript-source/forester.js --outfile=forester.js


