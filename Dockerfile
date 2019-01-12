FROM jupyter/all-spark-notebook
LABEL maintainer="Michael West <quagly@gmail.com>"

USER root

RUN  apt-get -y update && \
     apt-get install --no-install-recommends -y \
      vim \
      stow && \
     rm -rf /var/lib/apt/lists/*

USER jovyan

ENV PATH $PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin

# setup home directory for development
# not needed for notebook use

# save debian provided .bashrc to .bashrc_local to keep its goodies
RUN mv $HOME/.bashrc $HOME/.bashrc_local

RUN git clone https://github.com/quagly/dotfiles.git $HOME/.dotfiles

WORKDIR $HOME/.dotfiles
                                                                                                                                                 RUN stow bash;\
  stow vim;\
  stow tmux

WORKDIR $HOME

# configure vim
RUN git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
# command to install plugins, returns non-zero exit code but works.
# added true to the end until I can figure it out
# maybe still related to no interactivity despite -E?
RUN vim -E -u NONE -S $HOME/.vimrc +PluginInstall +qall || true




