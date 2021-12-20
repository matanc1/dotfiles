FROM ubuntu:20.04

# Setting up arguments needed for the dockerfile
ARG USER
ARG DEBIAN_FRONTEND=noninteractive 

ENV USER ${USER}

# Setting up the user
RUN useradd -m $USER -g users -G sudo

# Installing system wide software and enable sudo for the user
RUN apt update && \
    apt upgrade -y && \ 
    apt install -y \
                sudo \
                git \ 
                python3 \
                python-is-python3 \
                python3-pip \
                zip unzip \
                net-tools \
                iputils-ping \
                && \
    pip install ipython && \ 
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
    

USER ${USER}
WORKDIR /home/${USER}/workspace
RUN git clone -b feature/adding-base-dockerfiles --recurse-submodules https://github.com/matanc1/dotfiles.git && \ 
    cd dotfiles && \
    ./install
ENV PATH=/home/${USER}/.local/bin:$PATH