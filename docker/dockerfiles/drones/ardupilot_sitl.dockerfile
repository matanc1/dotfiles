FROM matancohen/dev_base:latest


RUN git clone --recurse-submodules https://github.com/ArduPilot/ardupilot.git
RUN sudo usermod -a -G dialout ${USER}

# Needed for non interactive install
ENV DEBIAN_FRONTEND=noninteractive 
ENV TZ=Europe/Minsk
RUN echo "if [ -d \"\$HOME/.local/bin\" ] ; then\nPATH=\"\$HOME/.local/bin:\$PATH\"\nfi" >> ~/.bashrc
RUN ardupilot/Tools/environment_install/install-prereqs-ubuntu.sh -y

# # Check that local/bin are in PATH for pip --user installed package

