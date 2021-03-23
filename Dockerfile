# Base image
FROM python:3.8-slim-buster as base

FROM base as builder

WORKDIR /install

RUN apt-get update && apt-get install -y --no-install-recommends build-essential gcc make curl

WORKDIR /install/nll
RUN curl http://alomax.free.fr/nlloc/soft7.00/tar/NLL7.00_src.tgz -o NLL7.00_src.tgz && \
    tar -xzvf NLL7.00_src.tgz
WORKDIR /install/nll/src
RUN mkdir bin && export MYBIN="./bin" && make -R all

RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

COPY source /install/source
WORKDIR /install/source

RUN pip3 install --upgrade pip && \
    pip3 install numpy PyQt5 wheel jupyter jupyterlab && \
    pip3 install --no-cache-dir -r requirements.txt && \
    pip3 install .

FROM base as build-image

COPY --from=builder /opt/venv /opt/venv
COPY --from=builder /install/nll/src/bin/Vel2Grid /usr/local/bin/
COPY --from=builder /install/nll/src/bin/Grid2Time /usr/local/bin/
RUN apt-get update && apt-get install -y --no-install-recommends libgomp1
ENV PATH="/opt/venv/bin:$PATH"
COPY volcano-tectonic_example /ssw/volcano-tectonic_example
COPY iceland-icequake_example /ssw/iceland-icequake_example
COPY antarctica-icequake_example /ssw/antarctica-icequake_example
COPY templates /ssw/templates
WORKDIR /ssw

EXPOSE 8888

ENTRYPOINT ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root"]
