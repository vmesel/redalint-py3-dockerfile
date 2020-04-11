FROM debian:buster
MAINTAINER vmesel

RUN apt-get update --allow-insecure-repositories --allow-unauthenticated && \
    apt-get install gpg -y

RUN gpg --keyserver pool.sks-keyservers.net --recv-key F8E3347256922A8AE767605B7808CE96D38B9201
RUN gpg --export '7808CE96D38B9201' | apt-key add -

RUN echo deb [trusted=yes] http://www.lesbonscomptes.com/recoll/debian/ stable main > \
	/etc/apt/sources.list.d/recoll.list

RUN echo deb-src [trusted=yes] http://www.lesbonscomptes.com/recoll/debian/ stable main >> \
	/etc/apt/sources.list.d/recoll.list

RUN apt-get install -y recoll python3-recoll python3 python3-pip git wv poppler-utils --allow-unauthenticated&& \
    apt-get clean

RUN apt-get install libcairo2-dev libjpeg-dev libgif-dev -y pkg-config

RUN apt-get install -y unzip xsltproc unrtf untex libimage-exiftool-perl antiword python3-waitress

RUN mkdir /homes && mkdir /root/.recolL && mkdir /redalint

WORKDIR /redalint

COPY . /redalint

RUN pip3 install -r /redalint/custom_metadata/requirements.txt

WORKDIR /redalint/custom_metadata

RUN python3 metadata_gen.py

WORKDIR /redalint

