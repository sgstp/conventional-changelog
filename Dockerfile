FROM node:alpine

LABEL MAINTAINER="Samuel Gauvin-St-Pierre <sgauvin_stpierre@hotmail.com>"

RUN npm install --global conventional-changelog-cli && \
	apk add git && \
    mkdir /src

RUN sed -i -E "93s|.*|if (note.title == undefined) {note.title = 'BREAKING CHANGE'} note.title = note.title.charAt(0).toUpperCase() + note.title.slice(1).toLowerCase();|g" /usr/local/lib/node_modules/conventional-changelog-cli/node_modules/conventional-changelog-conventionalcommits/writer-opts.js && \
    sed -i "5s|.*|if (match \&\& commit.notes.find(e => e.title =='BREAKING CHANGE') == undefined) {|" /usr/local/lib/node_modules/conventional-changelog-cli/node_modules/conventional-changelog-conventionalcommits/add-bang-notes.js && \
    sed -i "6s|.*|### {{title}}|" /usr/local/lib/node_modules/conventional-changelog-cli/node_modules/conventional-changelog-conventionalcommits/templates/template.hbs

WORKDIR "/src"

ENTRYPOINT ["conventional-changelog"]