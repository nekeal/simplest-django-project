# Dockerfile

FROM python:3.8-alpine

RUN apk add --no-cache --virtual .build-deps \
    gcc \
    python3-dev \
    musl-dev \
    postgresql-dev \
    && pip install --no-cache-dir psycopg2-binary \
    && apk del --no-cache .build-deps \
    && apk add postgresql-libs

WORKDIR /code
ADD . .
RUN pip install -r requirements.txt --no-cache-dir

EXPOSE 8000
CMD ["python", "manage.py", "runserver"]
