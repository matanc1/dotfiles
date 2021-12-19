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
    jupyter \
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
    wandb 

RUN git clone https://github.com/fastai/fastai.git --depth 1  && \
        git clone https://github.com/fastai/fastcore.git --depth 1  &&  \
        git clone https://github.com/fastai/course-v4 --depth 1
RUN cd fastai && pip install -e . && cd ../fastcore && pip install -e . 
RUN echo '#!/bin/bash\njupyter notebook --ip=0.0.0.0 --port=8888 --allow-root --no-browser' >> run_jupyter.sh
COPY --chmod=777 download_testdata.py ./
COPY --chmod=777 extract.sh ./