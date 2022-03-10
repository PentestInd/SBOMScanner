FROM golang:latest as builder
  
#RUN go install github.com/sigstore/cosign/cmd/cosign@main
RUN go install github.com/google/go-containerregistry/cmd/crane@latest

# —————

FROM golang:latest

# Install migrate
RUN go get github.com/mattes/migrate
# Install python-pip
#RUN apt-get update && apt-get install -y python-pip

RUN apt-get update
RUN apt-get -y install python3
RUN apt-get -y install python3-setuptools
RUN apt-get -y install python3-pip
RUN apt-get -y install npm
RUN apt-get -y install git

#RUN go install github.com/CycloneDX/cyclonedx-core-java

RUN git clone https://github.com/CycloneDX/cyclonedx-core-java.git

RUN git clone https://github.com/CycloneDX/cyclonedx-dotnet.git

RUN npm install --include-dev

RUN npm install -g @cyclonedx/bom

#COPY --from=builder /go/bin/cosign /go/bin/cosign
COPY --from=builder /go/bin/crane /go/bin/crane

RUN apt-get -qq update

RUN apt-get -qq -y install curl



#RUN apt-get  curl
RUN curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh | sh -s -- -b /usr/local/bin
RUN curl -sSfL https://raw.githubusercontent.com/anchore/grype/main/install.sh | sh -s -- -b /usr/local/bin

#FROM mcr.microsoft.com/dotnet/core/sdk:2.1

#ENV NBGV_VERSION 2.3.0

#RUN dotnet tool install --global CycloneDX --version 2.3.0

#ENV PATH="/root/.dotnet/tools:${PATH}"

#ENTRYPOINT ["nbgv"]
