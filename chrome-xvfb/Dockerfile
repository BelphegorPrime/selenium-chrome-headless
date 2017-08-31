FROM chrome-headless
LABEL authors="Federico Marzocchi <hello@mrz.io>"

RUN apt-get -qqy update \
  && apt-get -qqy install --no-install-recommends \
  xvfb

ADD cmd.sh /cmd.sh

RUN chmod +x /cmd.sh

CMD /cmd.sh
