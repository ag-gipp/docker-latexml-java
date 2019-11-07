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

 This Dockerfile expects the root directory of LaTeXML in the subfolder LaTeXML. 
 To achieve this run the following command from the root directory:

 > docker build -t latexml-java .

 This Dockerfile can include a full TeXLive installation. 
 Please be aware that including a full TeXLive installation can take a
 significant amount of time (depending on network connection) and will
 increase the image size to several Gigabytes. 
