```
 /=====================================================================\ 
 | LaTeXML Dockerfile                                                  | 
 | A Dockerfile to create a Docker Image with LaTeXML preinstalled.    | 
 |=====================================================================| 
 | Thanks to Tom Wiesing <tom.wiesing@gmail.com>                       | 
 | Part of LaTeXML:                                                    | 
 |  Public domain software, produced as part of work done by the       | 
 |  United States Government & not subject to copyright in the US.     | 
 |---------------------------------------------------------------------| 
 | Bruce Miller <bruce.miller@nist.gov>                        _     | 
 | http://dlmf.nist.gov/LaTeXML/                              (o o)    | 
 \=========================================================ooo==U==ooo=/ 

 This Dockerfile expects the root directory of LaTeXML as a build context. 
 To achieve this run the following command from the root directory:

 > docker build -t latexml -f release/docker/Dockerfile .

 This Dockerfile can include a full TeXLive installation. 
 This is enabled by default however it can be disabled by providing a
 build argument like so:

 > docker build -t latexml --build-arg WITH_TEXLIVE=no -f release/docker/Dockerfile .

 Please be aware that including a full TeXLive installation can take a
 significant amount of time (depending on network connection) and will
 increase the image size to several Gigabytes. 

 Futhermore to speed up the build process, it is also possible to
 tell docker not to run the tests during the build proess. To achieve
 this, pass --build-arg WITH_TESTS=no to the docker build command, e.g:

 > docker build -t latexml --build-arg WITH_TESTS=no -f release/docker/Dockerfile .
