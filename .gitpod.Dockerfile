FROM gitpod/workspace-full-vnc
RUN sudo apt-get update && \
    sudo apt-get install -y libgtk-3-dev && \
    sudo rm -rf /var/lib/apt/lists/*

USER gitpod
RUN pyenv install 3.9.1
RUN pyenv global 3.9.1
RUN pyenv rehash

# ENV PYTHONUSERBASE=/workspace/.pip-modules
# RUN pyenv init

RUN pip install --upgrade pip
RUN pip install --upgrade wheel setuptools
RUN pip install --upgrade pylint rich python-language-server[all]
RUN pip install --upgrade robotpy[all]

RUN echo 'alias cd..="cd .."' >> ~/.bashrc
