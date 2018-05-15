FROM base/archlinux
MAINTAINER David Ferreira <davidferreira.fz@gmail.com>

RUN pacman -Syu --noconfirm 
RUN pacman -S jdk8-openjdk fakeroot wget binutils sudo libxtst fontconfig freetype2 \
            libxrender lib32-glibc lib32-gcc-libs npm python2 make gcc gradle --noconfirm
RUN useradd -m -g users -s /bin/bash user && \
     mkdir /opt/download && \
	 chown user -R /opt/download
USER user
RUN cd /opt/download && \
    wget https://aur.archlinux.org/cgit/aur.git/snapshot/android-sdk.tar.gz && \
	tar -zxvf android-sdk.tar.gz && \
	cd android-sdk && \
	makepkg && \
	ls && pwd
USER root
RUN pacman -U /opt/download/android-sdk/android-sdk-26.1.1-1-x86_64.pkg.tar.xz --noconfirm  && \
    rm -rf /opt/download/android-sdk/ && /
    rm /opt/download/android-sdk.tar.gz
USER user
RUN cd /opt/download && \
    wget https://aur.archlinux.org/cgit/aur.git/snapshot/android-sdk-platform-tools.tar.gz && \
	tar -zxvf android-sdk-platform-tools.tar.gz && \
	cd android-sdk-platform-tools && \
	makepkg && \
	ls && pwd
USER root
RUN pacman -U /opt/download/android-sdk-platform-tools/android-sdk-platform-tools-r27.0.1-1-x86_64.pkg.tar.xz --noconfirm  && \
    rm -rf /opt/download/android-sdk-platform-tools/  && /
    rm /opt/download/android-sdk-platform-tools.tar.gz
USER user
RUN cd /opt/download && \
    wget https://aur.archlinux.org/cgit/aur.git/snapshot/android-platform-26.tar.gz && \
	tar -zxvf android-platform-26.tar.gz && \
	cd android-platform-26 && \
	makepkg && \
	ls && pwd
USER root
RUN pacman -U /opt/download/android-platform-26/android-platform-26-8.0.0_r02-1-any.pkg.tar.xz --noconfirm  && \
    rm -rf /opt/download/android-platform-26/  && /
    rm /opt/download/android-platform-26.tar.gz
RUN pacman -Scc --noconfirm
ENV ANDROID_HOME /opt/android-sdk \
    PATH  ${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
RUN npm install -g ionic cordova

