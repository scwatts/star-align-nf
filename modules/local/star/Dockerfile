FROM continuumio/miniconda3:23.5.2-0-alpine as build

RUN \
  conda install conda-libmamba-solver

RUN \
  echo -e > ~/.condarc '\
solver: libmamba\n\
channels:\n\
  - conda-forge\n\
  - bioconda\n\
  - defaults'

RUN \
  conda create -y --prefix /env/ 'star=2.7.3a'

RUN \
  conda install -y --prefix /env/ bash

FROM gcr.io/distroless/base-debian11:latest

# Copy BusyBox binaries; Nextflow uses /bin/bash to execute process shell code
COPY --from=busybox:1.35.0-uclibc /bin/ /bin/
COPY --from=build /env/bin/bash /bin/

# Copy Conda env
COPY --from=build /env/ /env/

ENV PATH="/env/bin:${PATH}"
ENV LD_LIBRARY_PATH="/env/lib/:${LD_LIBRARY_PATH}"
