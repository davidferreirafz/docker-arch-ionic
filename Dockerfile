FROM base/archlinux
MAINTAINER David Ferreira <davidferreira.fz@gmail.com>

RUN pacman -Syu --noconfirm 
RUN pacman -S jdk8-openjdk --noconfirm
#RUN pacman -Scc --noconfirm
