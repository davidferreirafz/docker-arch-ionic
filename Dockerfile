FROM base/archlinux
MAINTAINER David Ferreira <davidferreira.fz@gmail.com>

RUN pacman -Syu --noconfirm 
RUN pacman -S jdk8-openjdk fakeroot wget binutils libxtst fontconfig freetype2 libxrender lib32-glibc lib32-gcc-libs --noconfirm
RUN chgrp users -R /opt/
RUN chmod 777 -R /opt
RUN cd /opt; 
RUN mkdir download;
RUN chmod 777 -R download;
RUN chgrp users -R download;
RUN su user;
RUN cd download;
RUN wget https://aur.archlinux.org/cgit/aur.git/snapshot/android-sdk.tar.gz
RUN tar -zxvf android-sdk.tar.gz
RUN cd android-sdk
RUN makepkg


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
