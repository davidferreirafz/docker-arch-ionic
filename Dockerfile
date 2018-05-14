FROM base/archlinux
MAINTAINER David Ferreira <davidferreira.fz@gmail.com>

RUN pacman -Syu --noconfirm 
RUN pacman -S jdk8-openjdk fakeroot wget binutils sudo libxtst fontconfig freetype2 libxrender lib32-glibc lib32-gcc-libs npm --noconfirm
RUN useradd -m -g users -s /bin/bash user && chgrp users -R /opt/ && chmod 777 -R /opt && cd /opt
RUN mkdir download && chmod 777 -R download && chgrp users -R download
RUN cd download && wget https://aur.archlinux.org/cgit/aur.git/snapshot/android-sdk.tar.gz && chmod 777 /opt/download/android-sdk && tar -zxvf android-sdk.tar.gz && cd android-sdk && pwd && sudo -u user makepkg
RUN exit;
RUN pacman -U /opt/download/android-sdk/android-sdk-26.1.1-1-x86_64.pkg.tar.xz --noconfirm;
RUN su user;
RUN cd download;
RUN wget https://aur.archlinux.org/cgit/aur.git/snapshot/android-sdk-platform-tools.tar.gz;
RUN tar -zxvf android-sdk-platform-tools.tar.gz;
RUN cd android-sdk-platform-tools;
RUN makepkg;
RUN exit;
RUN pacman -U /opt/download/android-sdk-platform-tools/android-sdk-platform-tools-r27.0.1-1-x86_64.pkg.tar.xz --noconfirm
RUN su user;
RUN cd download;
RUN wget https://aur.archlinux.org/cgit/aur.git/snapshot/android-platform-26.tar.gz;
RUN tar -zxvf android-platform-26.tar.gz;
RUN cd android-platform-26;
RUN makepkg;
RUN exit;
RUN pacman -U /opt/download/android-platform-26/android-platform-26-8.0.0_r02-1-any.pkg.tar.xz --noconfirm

#RUN wget https://aur.archlinux.org/cgit/aur.git/snapshot/android-google-apis-23.tar.gz 
#RUN wget https://aur.archlinux.org/cgit/aur.git/snapshot/android-platform-26.tar.gz
#RUN tar -zxvf android-platform-26.tar.gz; cd android-platform-26
#RUN su user makepkg

#wget https://aur.archlinux.org/cgit/aur.git/snapshot/android-sdk.tar.gz
#tar -zxvf android-sdk.tar.gz
#chmod 777 -R android-sdk
#cd android-sdk

#RUN su user
#RUN tar -zxvf android-google-apis-23.tar.gz; cd android-google-apis-23;
#RUN chmod 777 -R /opt/
#RUN useradd -m -g users -s /bin/bash user

#RUN su user 
#RUN pacman -Scc --noconfirm
