FROM ubi8-minimal

RUN microdnf -y update
RUN microdnf -y install openssl openssl-devel pciutils wget

RUN wget -O /tmp/bootstrap.cgi https://linux.dell.com/repo/hardware/dsu/bootstrap.cgi
RUN bash /tmp/bootstrap.cgi

RUN microdnf install -y srvadmin-idrac

RUN microdnf -y clean all

COPY boot-from-iso.sh /boot-from-iso.sh

#ENTRYPOINT ["/opt/dell/srvadmin/bin/idracadm7"]
ENTRYPOINT ["/boot-from-iso.sh"]
