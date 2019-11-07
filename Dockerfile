
# /=====================================================================\ #
# | LaTeXML Dockerfile                                                  | #
# | A Dockerfile to create a Docker Image with LaTeXML preinstalled.    | #
# |=====================================================================| #
# | Thanks to Tom Wiesing <tom.wiesing@gmail.com>                       | #
# | Part of LaTeXML:                                                    | #
# |  Public domain software, produced as part of work done by the       | #
# |  United States Government & not subject to copyright in the US.     | #
# |---------------------------------------------------------------------| #
# | Bruce Miller <bruce.miller@nist.gov>                        #_#     | #
# | http://dlmf.nist.gov/LaTeXML/                              (o o)    | #
# \=========================================================ooo==U==ooo=/ #

# This Dockerfile expects the root directory of LaTeXML as a build context. 
# To achieve this run the following command from the root directory:
#
# > docker build -t latexml -f release/docker/Dockerfile .

# This Dockerfile can include a full TeXLive installation. 
# This is enabled by default however it can be disabled by providing a
# build argument like so:
#
# > docker build -t latexml --build-arg WITH_TEXLIVE=no -f release/docker/Dockerfile .
#
# Please be aware that including a full TeXLive installation can take a
# significant amount of time (depending on network connection) and will
# increase the image size to several Gigabytes. 
#
# Futhermore to speed up the build process, it is also possible to
# tell docker not to run the tests during the build proess. To achieve
# this, pass --build-arg WITH_TESTS=no to the docker build command, e.g:
#
# > docker build -t latexml --build-arg WITH_TESTS=no -f release/docker/Dockerfile .


# We start from alpine linux 3.10
FROM openjdk:13-jdk-buster

# Install the dependencies
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  libarchive-zip-perl libfile-which-perl libimage-size-perl  \
  libio-string-perl libjson-xs-perl libtext-unidecode-perl \
  libparse-recdescent-perl liburi-perl libuuid-tiny-perl libwww-perl \
  libxml2 libxml-libxml-perl libxslt1.1 libxml-libxslt-perl  \
  texlive-full imagemagick libimage-magick-perl make javacc\
  && rm -rf /var/lib/apt/lists/*

# Make a directory for latexml
RUN mkdir -p /opt/latexml

# Add all of the source files
ADD bin/            /opt/latexml/bin
#ADD doc/            /opt/latexml/doc/
ADD lib/            /opt/latexml/lib 
#ADD release/        /opt/latexml/release/
ADD t/              /opt/latexml/t/
ADD tools/          /opt/latexml/tools/
#ADD Changes         /opt/latexml/Changes
#ADD INSTALL         /opt/latexml/INSTALL
#ADD INSTALL.SKIP    /opt/latexml/INSTALL.SKIP
ADD LICENSE         /opt/latexml/LICENSE
ADD Makefile.PL     /opt/latexml/Makefile.PL
#ADD MANIFEST        /opt/latexml/MANIFEST
#ADD MANIFEST.SKIP   /opt/latexml/MANIFEST.SKIP
#ADD manual.pdf      /opt/latexml/manual.pdf
#ADD README.pod      /opt/README.pod

WORKDIR /opt/latexml

RUN perl Makefile.PL && make && make install