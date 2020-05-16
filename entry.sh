# trap : TERM INT
# tail -f /dev/null & wait

cd /application/src/api && npm install
/application/src/api/node_modules/.bin/nodemon /application/src/api/index.js