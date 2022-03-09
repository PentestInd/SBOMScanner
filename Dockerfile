From debian:latest
RUN apt-get update && \
  apt-get install -y curl && \
  git && \
  npm && \
  python3
 
RUN npm install -g @cyclonedx/bom
RUN git clone https://github.com/CycloneDX/cyclonedx-cli.git
RUN git clone https://github.com/CycloneDX/cyclonedx-python.git
RUN curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh | sh -s -- -b /usr/local/bin
RUN curl -sSfL https://raw.githubusercontent.com/anchore/grype/main/install.sh | sh -s -- -b /usr/local/bin

FROM python:3.10-slim-buster

ARG VERSION

COPY ./dist /tmp/dist
RUN pip install cyclonedx-bom==${VERSION} --find-links file:///tmp/dist
ENTRYPOINT ["cyclonedx-bom"]
