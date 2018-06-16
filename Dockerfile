ARG BUILDER_VERSION

FROM odaceo/builder:${BUILDER_VERSION}

LABEL vendor="Odaceo" 
LABEL maintainer="Alexandre GARINO <alexandre.garino@odaceo.ch>"

ARG DOTNET_SDK_VERSION
ENV ASPNETCORE_URLS http://+:80
ENV DOTNET_RUNNING_IN_CONTAINER true
ENV DOTNET_USE_POLLING_FILE_WATCHER true
ENV NUGET_XMLDOC_MODE skip
COPY scripts/dotnet.sh /root/
RUN set -eux; /root/dotnet.sh
