FROM python:3-alpine

RUN apk --update upgrade && \
    apk add curl ca-certificates && \
    update-ca-certificates && \
    rm -rf /var/cache/apk/*


RUN mkdir -p /usr/src/app

COPY src /usr/src/app
COPY requirements.txt /usr/src/app/requirements.txt

WORKDIR /usr/src/app

RUN pip install -r /usr/src/app/requirements.txt && mkdir /usr/src/app/data

CMD ["python3", "main.py"]