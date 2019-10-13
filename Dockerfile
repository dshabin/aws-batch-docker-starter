FROM ubuntu:18.04
RUN apt-get update && apt-get install
RUN yes | apt-get install python3-pip python3-dev libpq-dev nginx
RUN pip3 install --upgrade pip
RUN pip3 install virtualenv
RUN virtualenv -p python3 /root/myprojectenv
RUN . /root/myprojectenv/bin/activate
COPY src/ /root/src
WORKDIR /root/src
RUN pip install -r /root/src/requirements.txt
