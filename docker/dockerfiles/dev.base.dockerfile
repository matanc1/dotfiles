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
    pip install ipython \
                jupyterlab \ 
                matplotlib \
                "nbconvert<6"\
                pandas \
                nbdev \
                opencv-python \
                pandas \
                scikit-learn \
                scipy \
                jupyter_contrib_nbextensions \ 
                arrow && \ 
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    jupyter contrib nbextension install --user && \
    jupyter nbextension enable execute_time/ExecuteTime && \
    jupyter nbextension enable codefolding/main && \ 
    jupyter nbextension enable scratchpad/main && \ 
    jupyter nbextension enable tree-filter/index && \ 
    jupyter nbextension enable collapsible_headings/main 
    

USER ${USER}
WORKDIR /home/${USER}/workspace
RUN git clone --recurse-submodules https://github.com/matanc1/dotfiles.git && \ 
    cd dotfiles && \
    ./install
ENV PATH=/home/${USER}/.local/bin:$PATH

ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN sudo chmod +x /tini
ENTRYPOINT ["/tini", "-g", "--"]

ARG PORT=8888
EXPOSE ${PORT}

CMD jupyter notebook --allow-root --ip=0.0.0.0 --port=8888 --no-browser --NotebookApp.password='' --NotebookApp.token=''