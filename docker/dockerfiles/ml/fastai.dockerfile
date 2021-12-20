FROM matancohen/dev_base:latest as base

USER ${USER}
# Taken from: https://github.com/fastai/docker-containers/blob/master/fastai-build/Dockerfile
RUN pip install torch==1.10.1+cu102 torchvision==0.11.2+cu102 torchaudio===0.10.1+cu102 \
                -f https://download.pytorch.org/whl/cu102/torch_stable.html \
    albumentations \
    catalyst \
    captum \
    "fastprogress>=0.1.22" \
    graphviz \
    jupyterlab \ 
    kornia \
    matplotlib \
    "nbconvert<6"\
    nbdev \
    neptune-client \
    opencv-python \
    pandas \
    pillow \
    pyarrow \
    pydicom \
    pyyaml \
    scikit-learn \
    scikit-image \
    scipy \
    "sentencepiece<0.1.90" \
    spacy \
    tensorboard \
    wandb \
    jupyter_contrib_nbextensions

RUN git clone https://github.com/fastai/fastai.git --depth 1  && \
        git clone https://github.com/fastai/fastcore.git --depth 1  &&  \
        git clone https://github.com/fastai/course-v4 --depth 1
RUN cd fastai && pip install -e . && cd ../fastcore && pip install -e . 


ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN sudo chmod +x /tini
ENTRYPOINT ["/tini", "-g", "--"]


ARG PORT=8888
EXPOSE ${PORT}

CMD jupyter notebook --allow-root --ip=0.0.0.0 --port=8888 --no-browser --NotebookApp.password='' --NotebookApp.token=''