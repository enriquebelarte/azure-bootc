FROM myrepo/mybootc-image 
COPY setup-azure-img.sh /tmp
RUN /tmp/setup-azure-img.sh && rm -f /tmp/setup-azure-img.sh
