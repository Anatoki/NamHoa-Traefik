# base image
FROM node:12.2.0

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

ARG GIT_URL

# install and cache app dependencies
RUN cd /tmp \
    git clone ${GIT_URL} source \
    cp -R source/angular /app

RUN npm install
RUN npm install -g @angular/cli@7.3.9

# start app
CMD ng serve --host 0.0.0.0
