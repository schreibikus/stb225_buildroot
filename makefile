BUILDROOT_VERSION=2020.11

all: image

downloads/buildroot/buildroot-$(BUILDROOT_VERSION).tar.bz2:
	@mkdir -p $(shell dirname $@)
	cd $(shell dirname $@) && wget https://buildroot.org/downloads/buildroot-$(BUILDROOT_VERSION).tar.bz2

buildroot-$(BUILDROOT_VERSION)/.config:downloads/buildroot/buildroot-$(BUILDROOT_VERSION).tar.bz2
	@tar xf downloads/buildroot/buildroot-$(BUILDROOT_VERSION).tar.bz2
	@if [ -d overlay ]; then \
		echo "Copying overlay tree overlay" ; \
		rsync -arv --exclude='.svn' overlay/ buildroot-$(BUILDROOT_VERSION)/ ; fi
	@if [ -d patches ]; then \
		echo "Patching buildroot"; \
		for PATHFILES in patches/*.patch ; do \
		    patch -d buildroot-$(BUILDROOT_VERSION) -p1 < $$PATHFILES ; done ; fi
	@cp configs/buildroot.config buildroot-$(BUILDROOT_VERSION)/.config

image:buildroot-$(BUILDROOT_VERSION)/.config
	@LC_ALL=C LANG=C make -C buildroot-$(BUILDROOT_VERSION)
	echo "Please find Linux image at buildroot-$(BUILDROOT_VERSION)/output/images/uImage.bin"
	ls -l buildroot-$(BUILDROOT_VERSION)/output/images/uImage.bin

config:buildroot-$(BUILDROOT_VERSION)/.config
	@make -C buildroot-$(BUILDROOT_VERSION) menuconfig
