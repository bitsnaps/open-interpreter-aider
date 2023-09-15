FROM gitpod/workspace-full

# Install ctags (aider's dependency)
RUN sudo apt-get update && sudo apt-get install universal-ctags -yq

# LaTeX dependency for nbconvert
RUN sudo apt-get install pandoc texlive texlive-xetex texlive-latex-extra texlive-fonts-recommended texlive-plain-generic -yq

# This package has everything, but it's quite heavy (~2.5Gb)
#RUN sudo apt-get install texlive-full -yq

# Install LaTeX
RUN sudo apt-get install -yq texlive && \
    sudo rm -rf /var/lib/apt/lists/*

# Install expect system tool for script automation
#RUN sudo add-apt-repository universe && sudo apt-get update && sudo apt-get install expect -yq

# Install and configure Deta Space CLI
RUN curl -fsSL https://get.deta.dev/space-cli.sh | sh

ENV DETA_HOME="$HOME/.detaspace"

RUN echo 'export PATH=${DETA_HOME}/bin:$PATH' >>~/.bashrc

# Deta space CLI should be configured, now run: `space login` then enter your authentication token.