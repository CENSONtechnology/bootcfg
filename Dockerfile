FROM quay.io/coreos/bootcfg:latest

RUN apk add --no-cache ca-certificates curl

RUN mkdir -p /var/lib/bootcfg/assets/coreos/1010.6.0/

RUN curl \
  https://stable.release.core-os.net/amd64-usr/1010.6.0/coreos_production_pxe_image.cpio.gz \
  -o /var/lib/bootcfg/assets/coreos/1010.6.0/coreos_production_pxe_image.cpio.gz \
  && curl \
  https://stable.release.core-os.net/amd64-usr/1010.6.0/coreos_production_pxe.vmlinuz \
  -o /var/lib/bootcfg/assets/coreos/1010.6.0/coreos_production_pxe.vmlinuz \
  && curl \
  https://stable.release.core-os.net/amd64-usr/1010.6.0/coreos_production_image.bin.bz2 \
  -o /var/lib/bootcfg/assets/coreos/1010.6.0/coreos_production_image.bin.bz2

COPY config/ /var/lib/bootcfg/

CMD ["-address=0.0.0.0:8085", "-log-level=debug"]
EXPOSE 8085
