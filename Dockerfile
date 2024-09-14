FROM ubuntu:latest
LABEL authors="entiy"

ENTRYPOINT ["top", "-b"]