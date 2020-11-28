FROM yunabe/tslab:20200707

RUN pip3 install nbgitpuller
USER root
RUN jupyter serverextension enable nbgitpuller --sys-prefix
USER node
