FROM python:2.7

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

WORKDIR /usr/src/app/history

CMD [ "python", "./manage.py", "runserver", "--settings=settings.development"]
