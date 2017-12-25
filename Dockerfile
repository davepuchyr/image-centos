FROM fedora:27

# Adding and calling builder-enter
COPY ./overlay-image-tools/usr/local/sbin/scw-builder-enter /usr/local/sbin/
RUN set -e; dnf -y update \
        /bin/sh -e /usr/local/sbin/scw-builder-enter; \
        dnf clean all; \
      ;; \
    esac

# Patch rootfs
COPY ./overlay-image-tools ./overlay /

# Remove root password
RUN passwd -d root

# Enable Scaleway services
RUN systemctl enable \
	scw-generate-ssh-keys \
	scw-fetch-ssh-keys \
	scw-gen-machine-id \
	scw-kernel-check \
	scw-sync-kernel-modules

# Clean rootfs from image-builder
RUN /usr/local/sbin/scw-builder-leave

