FROM base/archlinux
MAINTAINER David Ferreira <davidferreira.fz@gmail.com>

RUN pacman -Syu --noconfirm 
RUN pacman -S jdk8-openjdk fakeroot wget binutils sudo libxtst fontconfig freetype2 libxrender lib32-glibc lib32-gcc-libs npm --noconfirm
RUN mkdir /opt/download && chown nobody /opt/download/ && chmod 777 /opt/download && cd /opt/download/
RUN sudo -u nobody wget https://aur.archlinux.org/cgit/aur.git/snapshot/android-sdk.tar.gz && sudo -u nobody tar -zxvf android-sdk.tar.gz && sudo -u nobody makepkg
RUN pacman -U /opt/download/android-sdk-platform-tools/android-sdk-platform-tools-r27.0.1-1-x86_64.pkg.tar.xz --noconfirm
