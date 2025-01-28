#!/nix/store/4fvc5fm8bszmkydng1ivrvr5cbvr1g60-bash-5.2p37/bin/bash

npm install

./node_modules/.bin/esbuild --minify --bundle javascript-source/forester.js --outfile=forester.js


