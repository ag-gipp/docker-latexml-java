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

# Make a directory for LaTeXML
RUN mkdir -p /opt/LaTeXML

# Add all of the source files
ADD LaTeXML/bin/            /opt/LaTeXML/bin
#ADD LaTeXML/doc/            /opt/LaTeXML/doc/
ADD LaTeXML/lib/            /opt/LaTeXML/lib 
#ADD LaTeXML/release/        /opt/LaTeXML/release/
ADD LaTeXML/t/              /opt/LaTeXML/t/
ADD LaTeXML/tools/          /opt/LaTeXML/tools/
#ADD LaTeXML/Changes         /opt/LaTeXML/Changes
#ADD LaTeXML/INSTALL         /opt/LaTeXML/INSTALL
#ADD LaTeXML/INSTALL.SKIP    /opt/LaTeXML/INSTALL.SKIP
ADD LaTeXML/LICENSE         /opt/LaTeXML/LICENSE
ADD LaTeXML/Makefile.PL     /opt/LaTeXML/Makefile.PL
#ADD LaTeXML/MANIFEST        /opt/LaTeXML/MANIFEST
#ADD LaTeXML/MANIFEST.SKIP   /opt/LaTeXML/MANIFEST.SKIP
#ADD LaTeXML/manual.pdf      /opt/LaTeXML/manual.pdf
#ADD LaTeXML/README.pod      /opt/README.pod

WORKDIR /opt/LaTeXML

RUN perl Makefile.PL && make && make install
