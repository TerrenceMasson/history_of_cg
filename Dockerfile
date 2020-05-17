FROM python:2.7

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install -r requirements.txt

COPY . .

WORKDIR /usr/src/app/history
RUN mkdir log

CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000", "--settings=settings.development"]
