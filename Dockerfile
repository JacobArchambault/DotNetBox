FROM registry.fedoraproject.org/fedora-toolbox:latest

ARG NAME=dotnetbox

LABEL name="$NAME" \
      summary="Fedora toolbox container" \
      maintainer="Jacob Archambault"

# Install packages
RUN dnf -y upgrade \
  && dnf -y install \
  kate \
  kate-plugins \
  dotnet-sdk-9.0 --nodocs --setopt install_weak_deps=False \
  && dnf clean all \
  && dotnet tool install --global dotnet-ef \
  && dotnet tool install --global csharp-ls
