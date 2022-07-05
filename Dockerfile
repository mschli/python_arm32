FROM arm32v7/python:3.7.0-slim as base

COPY --from=hypriot/rpi-alpine /usr/bin/qemu-arm-static /usr/bin/qemu-arm-static

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y build-essential libffi-dev python3-dev libssl-dev
RUN apt-get install -y libblas3 liblapack3 liblapack-dev libblas-dev gfortran

RUN pip install numpy==1.21.6
RUN pip install pandas==1.1.5
RUN pip install scipy==1.7.3
