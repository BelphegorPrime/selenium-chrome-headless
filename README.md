Selenium + Chrome Headless in Docker
===

Run Chrome Headless (or Chrome under Xvfb) with Selenium Server Standalone in
Docker.

Build the images
---

First, build the Selenium Server image

    docker build -t selenium-server  ./selenium-server

Then, build the Chrome image 

    docker build -t chrome-headless ./chrome-headless

By default, the image is built using Chrome Beta, as stable Chrome in headless
mode is not so stable when running test suites that navigate in windows. You
can build an image for Chrome stable with:

    docker build -t chrome-headless --build-arg CHROME_VERSION=stable ./chrome-headless

If you want to run your tests against a windowed Chrome build the image with Xvfb.

    docker build -t chrome-xvfb ./chrome-xvfb

Run
---

    docker run -it -p 4444:4444 chrome-headless

Or:

    docker run -it -p 4444:4444 chrome-xvfb

You might need to map some host names:

    docker run -it --add-host "example.org example.com":192.168.99.102 -p 4444:4444 chrome-headless

Running tests
---

Your test harness needs must be pointed to the container's address, and
Selenium has to be instructed, when starting a session, to start Chrome
without the sandbox. For running Chrome in headless mode, also add the
`--headless` switch.

For example, if you are using Behat:

```yaml
default:
  extensions:
    Behat\MinkExtension:
      base_url: http://en.wikipedia.org/wiki
      default_session: selenium_chrome
      sessions:
        selenium_chrome:
          selenium2:
            wd_host: http://192.168.99.104:4444/wd/hub
            browser: chrome
            capabilities:
              extra_capabilities:
                chromeOptions:
                  args:
                    - "--no-sandbox"
                    - "--headless"
```
