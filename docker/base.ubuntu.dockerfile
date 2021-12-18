ARG USER=matan
FROM ubuntu:20.04

# ---------- ARGUMENTS 
ARG USER

# ---------- ENV VARIABLES
ARG DEBIAN_FRONTEND=noninteractive

RUN useradd -m ${USER} -g users -G sudo


RUN apt update && \
    apt upgrade -y && \ 
    apt install -y \
                sudo \
                git \ 
                python3 \
                && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
    

USER ${USER}



# RUN sudo apt install -y \
# RUN git clone https://github.com/ArduPilot/ardupilot.git