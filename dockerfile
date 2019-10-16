FROM ubuntu:14.04
MAINTAINER Haryanto, M07158031@o365.mcut.edu.tw

USER root
WORKDIR /root

RUN apt-get update \
    	&& apt-get upgrade -y \
	&& apt-get install -qqy x11-apps \
    	&& apt-get install -y \
   	build-essential \
	software-properties-common \
    	ca-certificates \
    	dbus-x11 \
	xorg \
	openbox \
    	x11-xserver-utils \
    	gcc \
    	git \
    	libpq-dev \
    	make \
    	mercurial \
    	pkg-config \
    	python3.4 \
    	python3.4-dev \
    	ssh \
	libffi-dev \
	libxml2-dev \
	libxslt1-dev \
        libtiff4-dev \
	libjpeg8-dev \
	zlib1g-dev \
	libfreetype6-dev \
        liblcms2-dev \
	libwebp-dev \
	tcl8.5-dev \
	tk8.5-dev \
	python3-pyqt4 \
	imagemagick \
	libfontconfig-dev \
	fonts-noto-cjk \
	python3-tk \
	ttf-mscorefonts-installer \
	&& fc-cache \
    	&& apt-get autoremove \
    	&& apt-get clean

ADD https://raw.githubusercontent.com/pypa/pip/5d927de5cdc7c05b1afbdd78ae0d1b127c04d9d0/contrib/get-pip.py /root/get-pip.py
RUN python3.4 /root/get-pip.py
RUN pip3.4 install -U "setuptools" \
	"scikit-learn" \
	"matplotlib==2.0" \
	"numpy==1.14.5" \
	"scipy==0.19" \
	"pillow==5.1.0" \
	"numpydoc==0.6" \
	"scikit-image==0.14.0" \
	"jupyter" \
	"notebook" \
	"QtPy==1.2" \
	"decorator==4.4.0" \
	"qtconsole==4.3" \
	"QtAwesome==0.4" \
	"imageio==2.5" \
	"imagesize==1.1.0" \
	"image" \
	"h5py==2.9.0" \
	"ipywidgets==7.4.2" \
	"opencv-python" \
	"Python-fontconfig" \
	"wordcloud" \
	"tornado" \
	"opencv-contrib-python" 
	
WORKDIR /home

RUN git clone https://github.com/oilmcut2019/Hands-On-Image-Processing-with-Python-B.git

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

CMD [ "jupyter","notebook", "--allow-root" ]
