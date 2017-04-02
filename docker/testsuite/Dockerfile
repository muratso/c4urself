FROM ruby

RUN apt-get update && apt-get install -y wget sudo build-essential chrpath libssl-dev libxft-dev libfontconfig libreadline6-dev curl git libffi-dev git-core libpq-dev --fix-missing

## Instalando o PhantomJS
RUN cd /tmp \
 && wget -O phantomjs.tar.bz2 "https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2" --auth-no-challenge \
 && tar xvjf phantomjs.tar.bz2 --strip 1 \
 && cp /tmp/bin/phantomjs /usr/local/bin/phantomjs \
 && ls -la /tmp \
 && rm -rf /tmp/*

ADD ./dockerutil/start.sh /start.sh
ADD ./automated /automated
RUN chmod 755 /start.sh

ENTRYPOINT ["/bin/bash","/start.sh"] 

