FROM python:3.9-slim

ADD requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN apt-get update && \
    apt-get install -y netcat-openbsd tcpdump && \
    rm -rf /var/lib/apt/lists/*

ADD src /app
WORKDIR /app

RUN chmod +x /app/entrypoint.sh

CMD ["/app/entrypoint.sh"]
