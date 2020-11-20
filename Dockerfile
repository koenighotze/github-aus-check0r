FROM koenighotze/github-cli:1.0.0

USER root
RUN apt-get update \
    && apt-get install -y --no-install-recommends jq=1.5+dfsg-2+b1 \
    && rm -rf /var/lib/apt/lists/*

RUN adduser auscheckor --system
USER auscheckor
WORKDIR /home/auscheckor

ARG NAME
ARG DESCRIPTION
ARG VERSION
ARG COMMIT_SHA
ARG BUILD_TIMESTAMP
ARG VCS_URL

LABEL org.opencontainers.image.title="$NAME"
LABEL org.opencontainers.image.description="$DESCRIPTION"
LABEL org.opencontainers.image.version="$VERSION"
LABEL org.opencontainers.image.created="$BUILD_TIMESTAMP"
LABEL org.opencontainers.image.revision="$COMMIT_SHA"
LABEL org.opencontainers.image.source="$VCS_URL"
LABEL org.opencontainers.image.author="Koenighotze"
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.docker.cmd="docker run --rm=true -ti koenighotze/${NAME}"

COPY fetch_all_repos.sh ./

ENTRYPOINT [ "./fetch_all_repos.sh" ]
CMD [""]
