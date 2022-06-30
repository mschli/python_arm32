FROM arm32v7/python:3.7.0-slim

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y build-essential libffi-dev python3-dev libssl-dev
RUN apt-get install -y libblas3 liblapack3 liblapack-dev libblas-dev gfortran