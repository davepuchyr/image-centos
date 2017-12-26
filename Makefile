NAME =			fedora
VERSION =		dirty-shutdown
VERSION_ALIASES =	27
TITLE =			Fedora 27
DESCRIPTION =		Fedora 27
SOURCE_URL =		https://github.com/davepuchyr/image-fedora.git
VENDOR_URL =		https://www.getfedora.com/
DEFAULT_IMAGE_ARCH =	x86_64


IMAGE_VOLUME_SIZE =	8G
IMAGE_BOOTSCRIPT =	mainline 4.14.5 rev1
IMAGE_NAME =		Fedora 27


# This is specific to distribution images
# -- to fetch latest code, run 'make sync-image-tools'
IMAGE_TOOLS_FLAVORS =   systemd,common,docker-based
IMAGE_TOOLS_CHECKOUT =  master


## Image tools  (https://github.com/scaleway/image-tools)
all:    docker-rules.mk
docker-rules.mk:
	wget -qO - http://j.mp/scw-builder | bash
-include docker-rules.mk
