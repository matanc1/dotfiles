FROM matancohen/dev_base:latest

RUN sudo usermod -a -G dialout ${USER}
RUN git clone --recurse-submodules https://github.com/ArduPilot/ardupilot.git

# Needed for non interactive install
ENV DEBIAN_FRONTEND=noninteractive 
RUN sudo ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
RUN ardupilot/Tools/environment_install/install-prereqs-ubuntu.sh -y

ENTRYPOINT ./ardupilot/Tools/autotest/sim_vehicle.py -v ArduCopter --console --map