# Define base image
ARG BASE_IMAGE=arm32v7/python:3.7.0-slim

# Build stage
FROM ${BASE_IMAGE} AS build

# Install a full C toolchain and C build-time dependencies
COPY --from=hypriot/rpi-alpine /usr/bin/qemu-arm-static /usr/bin/qemu-arm-static
RUN apt-get -y update && apt-get -y upgrade && apt-get install -y build-essential libffi-dev python3-dev libssl-dev

# Create the virtual environment.
RUN python3 -m venv /venv
ENV PATH=/venv/bin:$PATH

# Install the Python library dependencies into the virtual environment.
WORKDIR /app
COPY requirements.txt .
RUN pip install --upgrade pip==22.1.2
RUN pip install -r requirements.txt

# Final stage:
FROM ${BASE_IMAGE}

# Install the runtime-only C library dependencies we need.
# (nothing to do for base image)

# Copy the virtual environment from the first stage.
COPY --from=build /venv /venv
ENV PATH=/venv/bin:$PATH