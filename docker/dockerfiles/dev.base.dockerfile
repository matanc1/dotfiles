FROM pytorch/pytorch

# Setting up the user
ARG USER
ENV USER ${USER}
RUN useradd -m $USER -g users -G sudo
ENV PATH=/home/${USER}/.local/bin:$PATH
ENV FASTAI_HOME=/home/${USER}/workspace/cloned/fastai/fastai_home

# This setting makes the apt installs be non-interactive (not asking for user input)
ARG DEBIAN_FRONTEND=noninteractive 

# Installing system wide software and enable sudo for the user
RUN apt update && \
    apt upgrade -y && \ 
    apt install -y \
                sudo \
                git \ 
                zip unzip \
                graphviz \
                net-tools \
                iputils-ping \
                && \
    pip install ipython \
                jupyterlab \ 
                matplotlib \
                duckduckgo_search \ 
                fastai \
                fastbook \
                dtreeviz \ 
                pandas \
                datasets \ 
                transformers \ 
                protobuf==3.20.1 \ 
                kaggle \ 
                jupytext \
                nbdev \
                opencv-python \
                pandas \
                scikit-learn \
                scipy \
                bash_kernel \
                jupyter_contrib_nbextensions \ 
                arrow && \ 
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    jupyter contrib nbextension install --system 
    

USER ${USER}
RUN jupyter nbextension enable execute_time/ExecuteTime && \
    jupyter nbextension enable codefolding/main && \ 
    jupyter nbextension enable scratchpad/main && \ 
    jupyter nbextension enable tree-filter/index && \ 
    jupyter nbextension enable collapsible_headings/main && \
    python -m bash_kernel.install
WORKDIR /home/${USER}/workspace

ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN sudo chmod +x /tini
ENTRYPOINT ["/tini", "-g", "--"]

CMD jupyter notebook --allow-root --ip=0.0.0.0 --port=8888 --NotebookApp.token=''
