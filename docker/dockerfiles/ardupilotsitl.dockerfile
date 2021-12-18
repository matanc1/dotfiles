FROM matancohen/dev_base:latest

RUN git clone --recurse-submodules https://github.com/ArduPilot/ardupilot.git
RUN sudo usermod -a -G dialout ${USER}