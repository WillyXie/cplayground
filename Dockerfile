FROM ubuntu:24.04

WORKDIR /work

# Install basic tools
RUN apt-get update
RUN apt-get install -y build-essential cmake curl fish git tmux vim

# Vim plugin manager
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Tool config setup
RUN git clone https://github.com/WillyXie/cfg-setup.git
RUN cp cfg-setup/src/.vimrc ~/

# QT-specific library setup
RUN apt-get install -y libgl-dev libegl-dev libfontconfig1-dev libinput-dev
RUN apt-get install -y  libfontconfig1-dev \
                        libfreetype-dev \
                        libx11-dev \
                        libx11-xcb-dev \
                        libxcb-cursor-dev \
                        libxcb-glx0-dev \
                        libxcb-icccm4-dev \
                        libxcb-image0-dev \
                        libxcb-keysyms1-dev \
                        libxcb-randr0-dev \
                        libxcb-render-util0-dev \
                        libxcb-shape0-dev \
                        libxcb-shm0-dev \
                        libxcb-sync-dev \
                        libxcb-util-dev \
                        libxcb-xfixes0-dev \
                        libxcb-xinerama0-dev \
                        libxcb-xkb-dev \
                        libxcb1-dev \
                        libxext-dev \
                        libxfixes-dev \
                        libxi-dev \
                        libxkbcommon-dev \
                        libxkbcommon-x11-dev \
                        libxrender-dev
