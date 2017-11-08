# 2017-10-23: One time build of the Elm administrator code.
#
# Build the image and run the container to produce 
# the compiled JS in the dist folder.
#
# docker build -f Dockerfile_elm -t dev3build .
# docker container run -it --rm -v $(pwd)/dist:/opt/dist dev3build:latest
FROM node:6.11.3 as build

RUN mkdir -p /opt/src
RUN mkdir -p /opt/dist

VOLUME ["/opt/dist"]

WORKDIR /opt/src
RUN npm install elm@0.18.0 elm-test@0.18.0 \
    webpack elm-webpack-loader extract-text-webpack-plugin \
    css-loader style-loader url-loader file-loader \
    underscore socket.io

ENV PATH /opt/src/node_modules/.bin:$PATH

COPY app/client/elm/elm-package.json /opt/src
RUN ["elm", "package", "install", "-y"]

COPY app/client/elm /opt/src
CMD ["webpack"]
