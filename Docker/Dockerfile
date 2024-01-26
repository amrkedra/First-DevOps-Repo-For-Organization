FROM python:latest
WORKDIR /home/python
RUN apt update && apt upgrade
COPY hello.py /home/python/
RUN python3 hello.py