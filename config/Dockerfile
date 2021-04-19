FROM ubuntu:18.04

ENV PATH "$PATH:$HOME/DV8Build/bin"

COPY DV8Build .

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/bin/bash","/entrypoint.sh"]