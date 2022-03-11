FROM matancohen/dev_base

USER ${USER}
ENV DEBIAN_FRONTEND=noninteractive 
RUN pip install jupyterlab \ 
    matplotlib \
    "nbconvert<6"\
    pandas \
    nbdev \
    opencv-python \
    pandas \
    scikit-learn \
    scipy \
    jupyter_contrib_nbextensions \ 
    arrow 
RUN jupyter contrib nbextension install --user && \
    jupyter nbextension enable execute_time/ExecuteTime && \
    jupyter nbextension enable codefolding/main && \ 
    jupyter nbextension enable scratchpad/main && \ 
    jupyter nbextension enable tree-filter/index && \ 
    jupyter nbextension enable collapsible_headings/main 

 

ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN sudo chmod +x /tini
ENTRYPOINT ["/tini", "-g", "--"]

ARG PORT=8888
EXPOSE ${PORT}

CMD jupyter notebook --allow-root --ip=0.0.0.0 --port=8888 --no-browser --NotebookApp.password='' --NotebookApp.token=''