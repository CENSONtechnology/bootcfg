FROM quay.io/coreos/bootcfg:latest

RUN apk add --no-cache ca-certificates curl

ENV CHANNEL stable
ENV RELEASE 1010.6.0

RUN mkdir -p /var/lib/bootcfg/assets/coreos/${RELEASE}/

RUN curl \
    https://${CHANNEL}.release.core-os.net/amd64-usr/${RELEASE}/coreos_production_pxe_image.cpio.gz \
    -o /var/lib/bootcfg/assets/coreos/${RELEASE}/coreos_production_pxe_image.cpio.gz \
  && curl \
    https://${CHANNEL}.release.core-os.net/amd64-usr/${RELEASE}/coreos_production_pxe_image.cpio.gz.sig \
    -o /var/lib/bootcfg/assets/coreos/${RELEASE}/coreos_production_pxe_image.cpio.gz.sig \
  && curl \
    https://${CHANNEL}.release.core-os.net/amd64-usr/${RELEASE}/coreos_production_pxe.vmlinuz \
    -o /var/lib/bootcfg/assets/coreos/${RELEASE}/coreos_production_pxe.vmlinuz \
  && curl \
    https://${CHANNEL}.release.core-os.net/amd64-usr/${RELEASE}/coreos_production_pxe.vmlinuz.sig \
    -o /var/lib/bootcfg/assets/coreos/${RELEASE}/coreos_production_pxe.vmlinuz.sig \
  && curl \
    https://${CHANNEL}.release.core-os.net/amd64-usr/${RELEASE}/coreos_production_image.bin.bz2 \
    -o /var/lib/bootcfg/assets/coreos/${RELEASE}/coreos_production_image.bin.bz2 \
  && curl \
    https://${CHANNEL}.release.core-os.net/amd64-usr/${RELEASE}/coreos_production_image.bin.bz2.sig \
    -o /var/lib/bootcfg/assets/coreos/${RELEASE}/coreos_production_image.bin.bz2.sig

COPY config/ /var/lib/bootcfg/

CMD ["-address=0.0.0.0:8085", "-log-level=debug"]
EXPOSE 8085
