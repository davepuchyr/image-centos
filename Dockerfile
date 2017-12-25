FROM fedora:27

# Adding and calling builder-enter
COPY ./overlay-image-tools/usr/local/sbin/scw-builder-enter /usr/local/sbin/

RUN set -e; dnf update -y dnf ; dnf update -y ; \
        dnf install -y redhat-lsb-core cloud-init wget openssh-server openssh-clients rsync basesystem fedora-release fedora-repos bash curl elinks ; \
        /bin/sh -e /usr/local/sbin/scw-builder-enter; \
        dnf clean all -y;

# Patch rootfs
COPY ./overlay-image-tools ./overlay /

# Enable Scaleway services
RUN systemctl enable \
	scw-generate-ssh-keys \
	scw-fetch-ssh-keys \
	scw-gen-machine-id \
	scw-kernel-check \
	scw-sync-kernel-modules \
        sshd.service

# Clean rootfs from image-builder
RUN /usr/local/sbin/scw-builder-leave

