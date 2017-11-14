FROM ubuntu
LABEL authors="Federico Marzocchi <hello@mrz.io>"

ARG SELENIUM_SERVER_URL=https://selenium-release.storage.googleapis.com/3.7/selenium-server-standalone-3.7.1.jar

ADD ${SELENIUM_SERVER_URL} /opt/selenium-server-standalone.jar

RUN apt-get -qqy update \
  && apt-get -qqy --no-install-recommends install openjdk-8-jre-headless > /dev/null

