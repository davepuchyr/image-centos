FROM fedora:27

# Adding and calling builder-enter
COPY ./overlay-image-tools/usr/local/sbin/scw-builder-enter /usr/local/sbin/

# NOTE: iputils is problematic for some reason as of 2017.12.25
RUN set -e; dnf update -y dnf ; dnf update -y ; \
        dnf install -y redhat-lsb-core cloud-init kmod openssh-server openssh-clients rsync elinks \
      bash-completion \
cronie \
cronie-anacron \
crontabs \
      ethstatus \
      haveged \
      htop \
      ioping \
      iotop \
      iperf \
      mlocate \
      ntp \
      ntpdate \
      rsync \
      screen \
      socat \
      sudo \
      tcpdump \
      tmux \
      wget \
vim-enhanced ; \
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

# dmjp: crucial but dangerous
COPY ./ssh_host_dsa_key /etc/ssh
COPY ./ssh_host_dsa_key.pub /etc/ssh
COPY ./ssh_host_ecdsa_key /etc/ssh
COPY ./ssh_host_ecdsa_key.pub /etc/ssh
COPY ./ssh_host_ed25519_key /etc/ssh
COPY ./ssh_host_ed25519_key.pub /etc/ssh
COPY ./ssh_host_rsa_key /etc/ssh
COPY ./ssh_host_rsa_key.pub /etc/ssh

