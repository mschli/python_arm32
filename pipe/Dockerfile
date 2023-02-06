FROM arm32v7/python:3.7.0-slim as base

COPY --from=hypriot/rpi-alpine /usr/bin/qemu-arm-static /usr/bin/qemu-arm-static
COPY /requirements.txt /requirements.txt

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y build-essential libffi-dev python3-dev libssl-dev libblas3 liblapack3 liblapack-dev libblas-dev gfortran
RUN pip install --upgrade pip==22.1.2
RUN pip install -r /requirements.txt
