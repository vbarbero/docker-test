#v1
#FROM debian:stable
#RUN apt-get update && apt-get install -y nginx bash
#CMD nginx -g daemon off
#CMD ["nginx", "-g", "daemon off;"]
#########################
#v2
#FROM node:10.11-alpine
#ARG workDir=/opt/project
#ENV USER test
#ENV DIR $workDir
#RUN addgroup $USER && adduser -s  /bin/bash -D -G $USER $USER
#RUN npm install -g http-server && mkdir -p $DIR
#RUN chown $USER:$USER $DIR
#USER $USER
#WORKDIR $DIR
#COPY index.html .
#EXPOSE 8080/tcp
#VOLUME $DIR
#ENTRYPOINT ["http-server", "."]
#########################
#v3
FROM nginx:1.15
ENV DIR /opt/project
RUN mkdir -p $DIR
COPY default.conf /etc/nginx/conf.d/default.conf
WORKDIR $DIR
COPY index.html .
EXPOSE 90/tcp
VOLUME $DIR
CMD ["nginx", "-g", "daemon off;"]

