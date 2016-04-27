FROM node:latest
MAINTAINER mustejab
# set default workdir
WORKDIR /usr/src
# Add package.json to allow for caching
COPY package.json /usr/src/package.json
# Install app dependencies
RUN npm install
# Bundle app source and tests
COPY server.js /usr/src/
COPY test /usr/src/test
COPY lib /usr/src/lib
COPY vendor /usr/src/vendor
COPY views /usr/src/views
# user to non-privileged user
USER nobody
# Expose the application port and run application
EXPOSE 5000
CMD [“node”,”server.js”]
