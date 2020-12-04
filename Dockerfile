FROM yunabe/tslab:20200707

# Install nbgitpuller
USER root
RUN pip3 install nbgitpuller
RUN jupyter serverextension enable nbgitpuller --sys-prefix

# Install RISE
RUN pip3 install RISE

# Install jupyter contrib extensions and configurator
RUN pip3 install jupyter_contrib_nbextensions
RUN jupyter contrib nbextension install --sys-prefix
RUN jupyter nbextensions_configurator enable --sys-prefix

USER node
