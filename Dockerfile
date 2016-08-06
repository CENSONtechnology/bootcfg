FROM quay.io/coreos/bootcfg:latest

RUN apk add --no-cache ca-certificates curl

RUN mkdir -p /var/lib/bootcfg/assets/coreos/1109.1.0/

RUN curl \
  https://alpha.release.core-os.net/amd64-usr/1109.1.0/coreos_production_pxe_image.cpio.gz \
  -o /var/lib/bootcfg/assets/coreos/1109.1.0/coreos_production_pxe_image.cpio.gz \
  && curl \
  https://alpha.release.core-os.net/amd64-usr/1109.1.0/coreos_production_pxe.vmlinuz \
  -o /var/lib/bootcfg/assets/coreos/1109.1.0/coreos_production_pxe.vmlinuz

COPY config/ /var/lib/bootcfg/

CMD ["-address=0.0.0.0:8085", "-log-level=debug"]
EXPOSE 8085
