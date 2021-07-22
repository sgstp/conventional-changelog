FROM node:alpine

LABEL MAINTAINER="Samuel Gauvin-St-Pierre <sgauvin_stpierre@hotmail.com>"

RUN npm install --global conventional-changelog-cli && \
	apk add git && \
    mkdir /src

WORKDIR "/src"

ENTRYPOINT ["conventional-changelog"]