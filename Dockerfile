FROM base/archlinux
#FROM pritunl/archlinux:2018-05-12
MAINTAINER David Ferreira <davidferreira.fz@gmail.com>

#ARG USER_HOME_DIR="/root"
#ENV MAVEN_HOME /usr/share/maven
ENV ANDROID_BUILD_TOOLS_VERSION 27.0.3
ENV ANDROID_SDK_HOME /opt/android-sdk
ENV ANDROID_SDK_ROOT /opt/android-sdk
ENV ANDROID_HOME /opt/android-sdk
ENV ANDROID_SDK /opt/android-sdk
ENV PATH $PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools/$ANDROID_BUILD_TOOLS_VERSION
#RUN echo "[multilib]" >> /etc/pacman.conf && \ 
#    echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf 
RUN date
RUN pacman -Syu --noconfirm 
RUN pacman -S jdk8-openjdk fakeroot wget binutils sudo libxtst fontconfig git freetype2 \
            libxrender lib32-glibc lib32-gcc-libs npm python2 make gcc gradle --noconfirm
RUN pacman -U http://mirror.pritunl.com/archlinux/all/lib32-zlib-1.2.11-1 --noconfirm
RUN useradd -m -g users -s /bin/bash user && \
     mkdir /opt/download && \
     chown user -R /opt/download
RUN date    
USER user
RUN cd /opt/download && \
    wget https://aur.archlinux.org/cgit/aur.git/snapshot/android-sdk.tar.gz && \
    tar -zxvf android-sdk.tar.gz && \
    cd android-sdk && \
    makepkg && \
   ls && pwd
USER root
RUN pacman -U /opt/download/android-sdk/android-sdk-26.1.1-1-x86_64.pkg.tar.xz --noconfirm  && \
    rm -rf /opt/download/android-sdk/ && \
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
    rm -rf /opt/download/android-sdk-platform-tools/  && \
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
    rm -rf /opt/download/android-platform-26/  && \
    rm /opt/download/android-platform-26.tar.gz
USER user
RUN cd /opt/download && \
    wget https://aur.archlinux.org/cgit/aur.git/snapshot/android-sdk-build-tools.tar.gz && \   
	tar -zxvf android-sdk-build-tools.tar.gz && \
	cd android-sdk-build-tools && \
	makepkg && \
	ls && pwd
USER root
RUN pacman -U /opt/download/android-sdk-build-tools/android-sdk-build-tools-r27.0.3-1-x86_64.pkg.tar.xz --noconfirm  && \
    rm -rf /opt/download/android-sdk-build-tools/  && \
    rm /opt/download/android-sdk-build-tools.tar.gz
RUN date    
RUN npm install -g ionic cordova --force
#cordova node-sass node-gyp
RUN pacman -Sc --noconfirm
VOLUME "/root/"
RUN date
