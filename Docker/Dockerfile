FROM python:latest
WORKDIR /home/python
RUN apt update && apt upgrade
ADD https://raw.githubusercontent.com/amrkedra/First-DevOps-Repo-For-Organization/main/Docker/hello.py /home/python/
RUN python3 hello.py
SHELL [ "/bin/nash" , "-c" , "cat hello.py > test.txt" ]