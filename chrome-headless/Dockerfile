FROM selenium-server
LABEL authors="Federico Marzocchi <hello@mrz.io>"

ARG CHROME_VERSION=beta
ARG CHROME_DRIVER_URL=https://chromedriver.storage.googleapis.com/2.33/chromedriver_linux64.zip

RUN apt-get -qqy update \
  && apt-get -qqy install --no-install-recommends \
  curl \
  unzip

RUN curl -fksS https://dl.google.com/linux/direct/google-chrome-${CHROME_VERSION}_current_amd64.deb > /tmp/chrome.deb \
    && dpkg -i /tmp/chrome.deb \
    || apt-get -qqyf install > /dev/null \
    && rm /tmp/chrome.deb

RUN curl -fksS ${CHROME_DRIVER_URL} > /tmp/chromedriver.zip \
    && unzip /tmp/chromedriver.zip -d /tmp/ \
    && rm /tmp/chromedriver.zip \
    && mv -f /tmp/chromedriver /usr/local/bin/chromedriver \
    && chmod +x /usr/local/bin/chromedriver

CMD java -Dwebdriver.chrome.logfile=/var/log/chrome.log \
    -jar /opt/selenium-server-standalone.jar
