ARG USER=matan
FROM ubuntu:20.04

# Setting up arguments needed for the dockerfile
ARG USER

# Setting up the user
RUN useradd -m ${USER} -g users -G sudo

# Installing system wide software and enable sudo for the user
RUN apt update && \
    apt upgrade -y && \ 
    apt install -y \
                sudo \
                git \ 
                python3 \
                python-is-python3 \
                && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
    

USER ${USER}

WORKDIR /home/${USER}/workspace
RUN git clone -b feature/adding-base-dockerfiles --recurse-submodules https://github.com/matanc1/dotfiles.git && \ 
    cd dotfiles && \
    ./install