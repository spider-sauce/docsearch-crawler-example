FROM gitpod/workspace-full

USER gitpod
RUN sudo apt-get update && \
    sudo apt-get --only-upgrade install google-chrome-stable && \
    google-chrome --version

RUN sudo apt-get install unzip && \
    version=$(curl -s https://chromedriver.storage.googleapis.com/LATEST_RELEASE) && \
    wget -qP "/tmp/" "https://chromedriver.storage.googleapis.com/${version}/chromedriver_linux64.zip" && \
    sudo unzip -o /tmp/chromedriver_linux64.zip -d /usr/bin && \
    export CHROMEDRIVER_PATH="usr/bin/chromedriver" && \
    echo $CHROMEDRIVER_PATH && \
    chromedriver -v
RUN git clone https://github.com/algolia/docsearch-scraper.git && \
    cp .docsearch/config.json docsearch-scraper