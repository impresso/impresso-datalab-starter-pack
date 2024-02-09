FROM quay.io/jupyter/scipy-notebook:python-3.11

COPY requirements.txt /tmp/

RUN pip install --no-cache-dir -r /tmp/requirements.txt

RUN python --version