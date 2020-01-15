FROM alpine:latest
MAINTAINER Pierre SMARS smars@yuntech.edu.tw
LABEL tw.edu.yuntech.smars.version="0.2-beta" \
      tw.edu.yuntech.smars.release-date="2020-01-15"
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
	
COPY .zshrc /root
COPY .screenrc /root
COPY .alias /root
COPY .config /root/.config
ENV EDITOR="/usr/bin/nvim"
RUN find /root -type f -exec chmod 0640 {} \;
WORKDIR /root
CMD ["/bin/zsh"]
