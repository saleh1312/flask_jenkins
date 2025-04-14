FROM ubuntu:22.04

# Set shell
ENV SHELL=/bin/bash

# Install system dependencies
RUN apt update && apt install -y \
    curl \
    git \
    build-essential \
    libnss3 \
    libxkbfile1 \
    libsecret-1-0 \
    && rm -rf /var/lib/apt/lists/*
# Install Python and pip
RUN echo 'export PATH="/usr/bin:$PATH"' >> /root/.bashrc

RUN apt update && apt install -y python3 python3-pip


WORKDIR /home/project

COPY requirements.txt ./

RUN pip install -r requirements.txt

COPY . .

EXPOSE 8501

CMD ["streamlit", "run","main.py"]