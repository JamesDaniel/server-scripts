mkdir ~/nodejs
touch ~/nodejs/package.json
cat >> ~/nodejs/package.json <<- End

{
  "name": "docker_web_app",
  "version": "1.0.0",
  "description": "Node.js on Docker",
  "author": "First Last <first.last@example.com>",
  "main": "server.js",
  "scripts": {
    "start": "node server.js"
  },
  "dependencies": {
    "express": "^4.13.3"
  }
}

End
touch ~/nodejs/server.js
cat >> ~/nodejs/server.js <<- End

'use strict';

const express = require('express');

// Constants
const PORT = 8080;

// App
const app = express();
app.get('/', function (req, res) {
  res.send('Hello world\n');
});

app.listen(PORT);
console.log('Running on http://localhost:' + PORT);

End
touch ~/nodejs/Dockerfile
cat >> ~/nodejs/Dockerfile <<- End
FROM node:boron

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install

# Bundle app source
COPY . /usr/src/app

EXPOSE 8080
CMD [ "npm", "start" ]
End
touch ~/nodejs/.dockerignore
cat >> ~/nodejs/.dockerignore <<- End
node_modules
npm-debug.log
End
docker build -t $(whoami)/node-web-app /home/$(whoami)/nodejs
docker images
docker run --name docker-nodejs -p 3001:8080 -d $(whoami)/node-web-app

