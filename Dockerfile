 # This Dockerfile is used to build an headles vnc image based on Ubuntu

FROM ubuntu:20.04

MAINTAINER Nicole Prindle "nprindle@gatech.edu"
ENV REFRESHED_AT 2022-01-11
ENV CS2110_IMAGE_VERSION 2.0.0

## Connection ports for controlling the UI:
# VNC port:5901
# noVNC webport, connect via http://IP:6901/?password=vncpassword
ENV DISPLAY=:1 \
    VNC_PORT=5901 \
    NO_VNC_PORT=6901
EXPOSE $VNC_PORT $NO_VNC_PORT

### Environment config
ENV HOME=/cs2110 \
    TERM=xterm \
    STARTUPDIR=/dockerstartup \
    INST_SCRIPTS=/cs2110/install \
    SRC_FILES=/cs2110/src \
    NO_VNC_HOME=/cs2110/noVNC \
    DEBIAN_FRONTEND=noninteractive \
    VNC_COL_DEPTH=24 \
    VNC_RESOLUTION=1600x900 \
    VNC_PW= \
    VNC_VIEW_ONLY=false
WORKDIR $HOME

### Add all install scripts for further steps
ADD ./src/install/ $INST_SCRIPTS/
ADD ./src/CircuitSim.jar $SRC_FILES/
RUN find $INST_SCRIPTS -name '*.sh' -exec chmod a+x {} +

### Apply any necessary patches during pre-installation
RUN $INST_SCRIPTS/patches/apply_preinstall_patches.sh

### Install some common tools and applications
RUN $INST_SCRIPTS/base/tools.sh
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'
RUN $INST_SCRIPTS/base/apps.sh

### Install man pages
RUN $INST_SCRIPTS/base/man_pages.sh

### Install xvnc-server, noVNC, and xfce
RUN $INST_SCRIPTS/base/tigervnc.sh
RUN $INST_SCRIPTS/base/no_vnc.sh
RUN $INST_SCRIPTS/base/xfce_ui.sh

ADD ./src/config/xfce/ $HOME/

### Install gcc/gdb
RUN $INST_SCRIPTS/tools/cTools.sh

### Install complx and GBA
RUN $INST_SCRIPTS/tools/complxGba.sh
ENV PATH=$PATH:/usr/games

### Install circuitsim and java
RUN $INST_SCRIPTS/tools/circuitsimJava.sh

### configure startup
RUN $INST_SCRIPTS/base/libnss_wrapper.sh
ADD ./src/scripts $STARTUPDIR
RUN $INST_SCRIPTS/base/set_user_permission.sh $STARTUPDIR $HOME

RUN useradd -NM -d "$HOME" -u 1000 user -s /bin/bash
USER 1000

ENTRYPOINT ["/dockerstartup/vnc_startup.sh"]
CMD ["--wait"]
