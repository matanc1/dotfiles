FROM matancohen/dev_base

ENV DEBIAN_FRONTEND=noninteractive 
RUN echo "wireshark-common wireshark-common/install-setuid boolean true" | sudo debconf-set-selections && \ 
    sudo ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
RUN sudo apt install -y wireshark

ENTRYPOINT ["sudo", "wireshark"]