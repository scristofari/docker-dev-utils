FROM alpine:3.3

MAINTAINER Sylvain Cristofari <s.cristofari@gmail.com>

RUN apk update && apk add bash git vim zsh ctags

WORKDIR /root

# oh my zsh
RUN git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
RUN cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
RUN sed -i 's/plugins=(git)/plugins=(aws bower Composer common-aliases docker git git-extras npm symfony2)/g' ~/.zshrc 

# My vim
RUN git clone https://github.com/scristofari/myvim.git ~/.vim
RUN cp ~/.vim/vimrc ~/.vimrc
RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
RUN vim +PluginInstall +qall

ENTRYPOINT zsh
