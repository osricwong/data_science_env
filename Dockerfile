FROM ubuntu:14.04 
MAINTAINER Jack Kwong

ADD .bash_profile /root/.profile
ADD .bash_profile /root/.bash_profile

ENV HOME /root
ENV PYENVPATH $HOME/.pyenv
ENV PATH $PYENVPATH/shims:$PYENVPATH/bin:$PATH

RUN apt-get update
RUN apt-get install -y curl git vim build-essential

RUN curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash

RUN apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev

RUN pyenv install 3.5.0
RUN pyenv rehash
RUN pyenv global 3.5.0


RUN apt-get install -y --no-install-recommends ubuntu-desktop
RUN apt-get install -y vnc4server

ADD xstartup /root/.vnc/xstartup

CMD vncserver :1

EXPOSE 22
EXPOSE 5901