FROM python:3.8-alpine

LABEL "com.github.actions.name"="S3 Sync and Invalidate Distribution"
LABEL "com.github.actions.description"="Sync a directory to an AWS S3 repository & Invalidate a Cloudfront Distribution"
LABEL "com.github.actions.icon"="refresh-cw"
LABEL "com.github.actions.color"="green"

LABEL version="0.1.1"
LABEL repository="https://github.com/digital-scarcity/s3-sync-action"
LABEL homepage="https://digitalscarcity.io"
LABEL maintainer="Max Gravitt <max@digitalscarcity.io>"

# https://github.com/aws/aws-cli/blob/master/CHANGELOG.rst
ENV AWSCLI_VERSION='1.18.14'

RUN pip install --quiet --no-cache-dir awscli==${AWSCLI_VERSION}

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
