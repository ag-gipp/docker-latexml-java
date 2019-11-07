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
