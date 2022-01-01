FROM matancohen/dev_base as builder

ENV PYTHONPATH=/home/${USER}/workspace/mavlink
ENV DEBIAN_FRONTEND=noninteractive 

RUN sudo ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
RUN pip install future 
RUN sudo apt install -y python3-lxml libxml2-utils python3-tk && \
    git clone https://github.com/mavlink/mavlink.git --recursive
RUN cd mavlink && python -m pymavlink.tools.mavgen --lang=WLua --wire-protocol=2.0 --output=mavlink_2_common message_definitions/v1.0/common.xml


FROM matancohen/wireshark
RUN sudo usermod -a -G wireshark ${USER}
COPY --from=builder /home/${USER}/workspace/mavlink/mavlink_2_common.lua /usr/lib/x86_64-linux-gnu/wireshark/plugins/3.2/mavlink_2_common.lua