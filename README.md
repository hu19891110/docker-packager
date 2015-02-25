## What does this do?

This builds an image that provides tools for packaging apps for release as an apt package or an osx .pkg installer.

### How to use?

Build your app and have the artifacts available inside a container that runs using `nitrousio/packager` as its image.
Use the tools inside made available by the image to package your app.

### What does this include?

fpm, deb-s3, freight, bomutils, xar

### How to update the tools?

This repo is configured to be the source of a [DockerHub automated build repository](https://registry.hub.docker.com/u/nitrousio/packager/builds_history/43766/). 

Edit the scripts/files/Dockerfiles to your needs and push to master. 
Changes will then be automatically built into a new layer after an update build of the repository. 
Pull the new layers after updating the image.


