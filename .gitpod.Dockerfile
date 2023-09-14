FROM gitpod/workspace-full

# Install ctags (aider's dependency)
RUN sudo apt-get update && sudo apt-get install universal-ctags -yq

# LaTeX dependency for nbconvert
RUN sudo apt-get install pandoc -yq
RUN sudo apt-get install texlive-xetex texlive-fonts-recommended texlive-plain-generic -yq

# Install LaTeX
RUN sudo apt-get update -q && \
    sudo apt-get install -yq texlive && \
    sudo rm -rf /var/lib/apt/lists/*
