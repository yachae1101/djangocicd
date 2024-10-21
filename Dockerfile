FROM --platform=linux/amd64 python:3.12.7-slim as build

RUN apt-get update && apt-get install -y --no-install-recommends && rm -rf /var/lib/apt//lists/*

WORKDIR /usr/src/app

COPY requirements.txt ./

RUN pip install -r requirements.txt

COPY . .

EXPOSE 80

CMD ["python", "manage.py", "runserver", "0.0.0.0:80"]
