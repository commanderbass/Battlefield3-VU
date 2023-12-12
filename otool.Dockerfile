FROM python:3.8

RUN apt-get update \
    && apt-get install -yq wget unzip

RUN wget -nc https://github.com/Imposter/otool/archive/vu.zip -O /tmp/otool-vu.zip \
    && cd / \
    && unzip /tmp/otool-vu.zip \
    && pip3 install -r otool-vu/requirements.txt

CMD ["python3", "/otool-vu/otool.py", "-d", "/data"]

VOLUME /data
