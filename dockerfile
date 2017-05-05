FROM ubuntu

MAINTAINER Frank Foerster <openkm_docker@foersterfrank.de>

# add user openkm (password openkmadmin)
RUN useradd --password '$6$d7WGWXVT1$27UG2CfTvKuJTNj4UYzEAxVlLoJ6ia9lRlSIV2nhFpEHqJk0JQfrcrYEmqIdFaNN/IyWWjHC8aBLO1mRDxe3k/' openkm

# install wget gawk pciutils
RUN apt-get update && apt-get install -y wget gawk pciutils && apt-get clean

