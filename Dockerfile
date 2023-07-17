FROM ubuntu:18.04

RUN apt-get update -y

RUN apt-get install python3 python-pip python3-pip --yes
RUN python3 -m pip install --upgrade pip==21 --force

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* 

WORKDIR /usr/src/app

COPY requirements.txt ./

RUN pip3 install -r requirements.txt

COPY . ./
EXPOSE 8080
ENTRYPOINT ["python3", "app.py"]
