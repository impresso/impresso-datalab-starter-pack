FROM quay.io/jupyter/scipy-notebook:python-3.11

USER root

ARG NB_USER=impresso
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

RUN adduser --help

RUN useradd -o \
    --uid ${NB_UID} \
    ${NB_USER}

COPY notebooks ${HOME}

RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

COPY requirements.txt /tmp/requirements.txt

RUN pip install --no-cache-dir -r /tmp/requirements.txt

WORKDIR ${HOME}

RUN python --version