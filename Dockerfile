FROM base/archlinux
MAINTAINER David Ferreira <davidferreira.fz@gmail.com>

RUN pacman -Syu --noconfirm 
RUN pacman -S jdk8-openjdk fakeroot wget binutils sudo libxtst fontconfig freetype2 \
            libxrender lib32-glibc lib32-gcc-libs npm --noconfirm
RUN useradd -m -g users -s /bin/bash user && \
     mkdir /opt/download && \
	 chown user -R /opt/download
USER user
RUN cd /opt/download && \
    wget https://aur.archlinux.org/cgit/aur.git/snapshot/android-sdk.tar.gz && \
	tar -zxvf android-sdk.tar.gz && \
	cd android-sdk && \
	makepkg && \
	ls
USER root
RUN pacman -U /opt/download/android-sdk-platform-tools/android-sdk-26.1.1-1-x86_64.pkg.tar.xz --noconfirm
