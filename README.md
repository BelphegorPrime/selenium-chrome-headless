Selenium + Chrome Headless in Docker
===

Run Chrome Headless with Selenium Server Standalone in Docker.

Build the images
---

First, build the Selenium Server image

    docker build -t selenium-server  selenium-server

Then, build the Chrome image 

    docker build -t selenium-chrome chrome

By default, it's built using Chrome Beta, as stable has problems running test suites that navigate in windows.

Build an image for stable Chrome with:

    docker build -t selenium-chrome-stable --build-arg CHROME_VERSION=stable .

Run
---

    docker run -it -p 4444:4444 selenium-chrome

You might need to map some host names:

    docker run -it --add-host "example.org example.com":192.168.99.102 -p 4444:4444 selenium-chrome

Running tests
---

Your test harness needs must be pointed to the container's address, and Selenium has to be instructed, when starting
a session, to use Chrome in headless mode.

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
                    - "--headless"
                    - "--no-sandbox"
```
