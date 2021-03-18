FROM fedora:latest

RUN dnf install -y rpmdevtools

RUN rpmdev-bumpspec --version

COPY action.sh /action.sh

ENTRYPOINT ["/action.sh"]
