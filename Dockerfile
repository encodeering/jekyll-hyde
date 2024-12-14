# https://jekyllrb.com/docs/installation/ubuntu/

FROM        debian:bookworm

EXPOSE      4000

ARG         USER=jekyll

RUN         apt-get update \
 &&         apt-get install -y ruby-full build-essential sudo

RUN         useradd -ms /bin/bash $USER \
 &&         echo "${USER} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USER

USER              $USER
WORKDIR     /home/$USER

RUN         echo '# Install Ruby Gems to ~/gems'                >> .bashrc \
 &&         echo 'export GEM_HOME="/home/$(whoami)/gems"'       >> .bashrc \
 &&         echo 'export PATH="/home/$(whoami)/gems/bin:$PATH"' >> .bashrc

SHELL       ["/bin/bash", "-i", "-c"]

RUN         gem install jekyll bundler

SHELL       ["/bin/bash", "-c"]
