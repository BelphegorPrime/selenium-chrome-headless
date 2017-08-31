export DISPLAY=:99.0

Xvfb ${DISPLAY} -screen 0 ${SCREEN_SIZE:-1280x720}x24 &> /var/log/xvfb.log &

java -Dwebdriver.chrome.logfile=/var/log/chrome.log \
    -jar /opt/selenium-server-standalone.jar
