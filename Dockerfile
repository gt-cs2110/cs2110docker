 # This Dockerfile is used to build an headles vnc image based on Ubuntu

FROM ubuntu:20.04

MAINTAINER Gibran Essa "gibran@gatech.edu"
ENV REFRESHED_AT 2020-06-28
ENV CS2110_IMAGE_VERSION 1.0.2

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
    VNC_PW=cs2110rocks \
    VNC_VIEW_ONLY=false
WORKDIR $HOME

### Add all install scripts for further steps
ADD ./src/patches $INST_SCRIPTS/patches
ADD ./src/install/base/ $INST_SCRIPTS/
ADD ./src/install/tools/ $INST_SCRIPTS/
ADD ./src/CircuitSim.jar $SRC_FILES/
RUN find $INST_SCRIPTS -name '*.sh' -exec chmod a+x {} +

### Apply any necessary patches
RUN $INST_SCRIPTS/patches/apply_patches.sh

### Install some common tools
RUN $INST_SCRIPTS/tools.sh
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

### Install man pages
RUN $INST_SCRIPTS/man_pages.sh

### Install xvnc-server, noVNC, and xfce
RUN $INST_SCRIPTS/tigervnc.sh
RUN $INST_SCRIPTS/no_vnc.sh
RUN $INST_SCRIPTS/xfce_ui.sh

ADD ./src/config/xfce/ $HOME/

### configure startup
RUN $INST_SCRIPTS/libnss_wrapper.sh
ADD ./src/scripts $STARTUPDIR
RUN $INST_SCRIPTS/set_user_permission.sh $STARTUPDIR $HOME

### Install gcc/gdb
RUN $INST_SCRIPTS/cTools.sh

### Install complx and GBA
RUN $INST_SCRIPTS/complxGba.sh
ENV PATH=$PATH:/usr/games

### Install circuitsim and java
RUN $INST_SCRIPTS/circuitsimJava.sh

USER 1000

ENTRYPOINT ["/dockerstartup/vnc_startup.sh"]
CMD ["--wait"]
