FROM alpine:latest
MAINTAINER Pierre SMARS
LABEL tw.edu.yuntech.smars.version="0.3" \
      tw.edu.yuntech.smars.release-date="2020-01-18"
RUN apk update && \
	apk add --no-cache\
	zsh \
	zsh-vcs \
	zsh-syntax-highlighting \
	shadow \
	less \
	procps \
	usbutils \
	htop \
	sudo \
	neovim \
	git \
	wget \
	make \
	mc \
	openssh-client \
	screen \
	zip \
	unrar
	
COPY config /root/config

ENV EDITOR="/usr/bin/nvim"
RUN find /root -type f -exec chmod 0640 {} \; && \
	chmod 0700 /root/config/install
WORKDIR /root
CMD /root/config/install && \
	/bin/zsh

