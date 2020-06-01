FROM python:3.7

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install -r requirements.txt

COPY . .

WORKDIR /usr/src/app/history

CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000", "--settings=settings.development"]
