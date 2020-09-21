# mediawiki-docker

Proposed solution:

1. Create a docker file which would have the base image of RHEL. Run the step of commands for Mediawiki on top of the image.

2. Push the docker file to a git repo. Configure runner and build an image out of the docker file.

3. Use the standard CFT template to deploy the image on any of the container service. 

Please refer the MediaWiki image for the details. 


