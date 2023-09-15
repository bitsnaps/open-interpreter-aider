FROM gitpod/workspace-full

# Install ctags (aider's dependency)
RUN sudo apt-get update && sudo apt-get install universal-ctags -yq

# LaTeX dependency for nbconvert
RUN sudo apt-get install pandoc -yq
RUN sudo apt-get install texlive texlive-xetex texlive-latex-extra texlive-fonts-recommended texlive-plain-generic -yq

# Install LaTeX
RUN sudo apt-get install -yq texlive && \
    sudo rm -rf /var/lib/apt/lists/*

# Install and configure Deta Space
RUN curl -fsSL https://get.deta.dev/space-cli.sh | sh

ENV DETA_HOME=/home/gitpod/.detaspace

RUN echo 'export PATH=${DETA_HOME}/bin:$PATH' >>~/.bashrc
