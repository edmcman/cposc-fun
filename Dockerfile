FROM akabe/ocaml-jupyter-datascience:debian8_ocaml4.05.0

### standard stuff from https://mybinder.readthedocs.io/en/latest/examples/sample_repos.html
### create user with a home directory
ARG NB_USER
ARG NB_UID
ENV USER ${NB_USER}

# Rename opam to the desired username
RUN sudo usermod -l ${NB_USER} opam

USER ${NB_USER}
