FROM ubuntu:20.04

RUN apt update &&A \
    apt upgrade && \ 
    apt install -y git

RUN git clone https://github.com/ArduPilot/ardupilot.git