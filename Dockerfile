FROM python:3.8-slim

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir -r requirements.txt

RUN export FLASK_APP=core/server.py && \
    rm core/store.sqlite3 && \
    flask db upgrade -d core/migrations/

EXPOSE 5000

ENV NAME World

CMD ["bash", "run.sh"]