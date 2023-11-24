FROM		osrf/ros:melodic-desktop-full-bionic
MAINTAINER	gcccompil3r@gmail.com
LABEL 		authors="gcccompil3r@gmail.com"

ARG DEBIAN_FRONTEND=noninteractive
ARG HOST_USER
ARG UNAME=$HOST_USER
ARG UID=1000
ARG GID=1000
ARG HOME=/home/${UNAME}

ENV DEBCONF_NOWARNINGS="yes"
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn

RUN apt-get autoremove --purge --yes \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -rf /etc/ros/rosdep/sources.list.d/20-default.list


RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y language-pack-ko

RUN apt-get install -y \
        vim \
        iputils-ping \
        net-tools

RUN apt-get install -y bash expect sudo
RUN apt-get install -y chrony ntpdate build-essential curl nano
RUN apt-get install -y lsb-release

RUN apt-get --fix-missing update \
	&& apt-get update \
	&& apt-get install -f

RUN apt-get install -y \
	tmux \
	wget \
	vim \
	git \
	libgl1-mesa-glx \
	libgl1-mesa-dri \
	mesa-utils \
	unzip \
	locales \
	ntp \
	whois

#RUN locale-gen ko_KR.UTF-8

#ENV LANG ko_KR.UTF-8
#ENV LANGUAGE ko_KR.UTF-8
#ENV LC_ALL ko_KR.UTF-8

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN rosdep init
RUN apt-get install -y ros-melodic-rqt*
RUN apt-get install -y python3 python3-pip python-rosinstall python-rosdep python-rosinstall-generator

RUN useradd -rm -d ${HOME} -s /bin/bash -g root -G sudo,audio,video,plugdev -u ${UID} ${UNAME}
RUN mkdir -p /etc/sudoers.d && \
	echo "${UNAME} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${UNAME} && \
	chmod 0440 /etc/sudoers.d/${UNAME}

#USER ${UNAME}
#WORKDIR $HOME

#COPY --chown=1000:1000 workspace /home/${UNAME}/workspace
#COPY --chown=1000:1000 proj /home/${UNAME}/proj
#COPY --chown=eddi:eddi workspace /home/${UNAME}/workspace
#COPY --chown=eddi:eddi proj /home/${UNAME}/proj

USER ${UNAME}
ENV HOME /home/${UNAME}
ENV LANG en_US.UTF-8
WORKDIR /home/${UNAME}

RUN rosdep update
RUN rosdep fix-permissions
