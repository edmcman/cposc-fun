FROM ocaml/opam:ubuntu-20.10-ocaml-4.06

RUN sudo apt-get -y install pkg-config libgmp-dev libzmq3-dev m4 zlib1g-dev python3-pip
RUN sudo pip3 install --upgrade pip

# Install jupyter
RUN sudo pip3 install notebook

# Install the OCaml jupyter kernel
RUN opam install -y jupyter
RUN eval $(opam env) && ocaml-jupyter-opam-genspec
RUN sudo jupyter kernelspec install --name ocaml-jupyter /home/opam/.opam/4.06/share/jupyter

# Install nbgitpuller
RUN sudo pip3 install nbgitpuller
RUN sudo jupyter serverextension enable nbgitpuller --sys-prefix

# Install RISE
RUN sudo pip3 install RISE

# Install jupyter contrib extensions and configurator
RUN sudo pip3 install jupyter_contrib_nbextensions
RUN sudo jupyter contrib nbextension install --sys-prefix
RUN sudo jupyter nbextensions_configurator enable --sys-prefix

COPY --chown=opam . /home/opam

CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
