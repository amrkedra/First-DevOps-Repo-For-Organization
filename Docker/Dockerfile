FROM alpine
WORKDIR /home/amrkedra
COPY ./script.sh /home/amrkedra/
CMD [ "sudo chmod 700 script.sh" ]
ENTRYPOINT [ "sh" ]
CMD [ "/bin/sh","-c" , "/home/amrkedra/script.sh" ]