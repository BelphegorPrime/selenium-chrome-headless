FROM chrome-xvfb
LABEL authors="Federico Marzocchi <hello@mrz.io>"

RUN apt-get -qqy update \
  && apt-get -qqy install --no-install-recommends \
  ffmpeg

CMD /cmd.sh
