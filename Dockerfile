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
ADD latexml/bin/            /opt/latexml/bin
#ADD latexml/doc/            /opt/latexml/doc/
ADD latexml/lib/            /opt/latexml/lib 
#ADD latexml/release/        /opt/latexml/release/
ADD latexml/t/              /opt/latexml/t/
ADD latexml/tools/          /opt/latexml/tools/
#ADD latexml/Changes         /opt/latexml/Changes
#ADD latexml/INSTALL         /opt/latexml/INSTALL
#ADD latexml/INSTALL.SKIP    /opt/latexml/INSTALL.SKIP
ADD latexml/LICENSE         /opt/latexml/LICENSE
ADD latexml/Makefile.PL     /opt/latexml/Makefile.PL
#ADD latexml/MANIFEST        /opt/latexml/MANIFEST
#ADD latexml/MANIFEST.SKIP   /opt/latexml/MANIFEST.SKIP
#ADD latexml/manual.pdf      /opt/latexml/manual.pdf
#ADD latexml/README.pod      /opt/README.pod

WORKDIR /opt/latexml

RUN perl Makefile.PL && make && make install
