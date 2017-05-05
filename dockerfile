FROM ubuntu

MAINTAINER Frank Foerster <openkm_docker@foersterfrank.de>

# add user openkm (password openkmadmin)
RUN useradd --password '$6$d7WGWXVT1$27UG2CfTvKuJTNj4UYzEAxVlLoJ6ia9lRlSIV2nhFpEHqJk0JQfrcrYEmqIdFaNN/IyWWjHC8aBLO1mRDxe3k/' openkm

# install wget gawk pciutils
RUN apt-get update && apt-get install -y wget gawk pciutils && apt-get clean

# download and run inxi
RUN wget -O /tmp/inxi -Nc smxi.org/inxi && chmod +x /tmp/inxi && /tmp/inxi -F

# increase ulimit
RUN sed -i '/#session[[:space:]]*required[[:space:]]*pam_limits.so/s/^#//;' /etc/pam.d/su
RUN sed -i '/# End of file/d' /etc/security/limits.conf && \
    echo "*   soft  nofile   6084" >> /etc/security/limits.conf && \
    echo "*   hard  nofile   6084" >> /etc/security/limits.conf && \
    echo "# End of file" >> /etc/security/limits.conf

