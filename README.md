# History Of CG

Requirements:
-------------
  * Python version 2.7.5
  * [virtualenv](https://pypi.python.org/pypi/virtualenv)
  * [heroku-toolbelt](https://toolbelt.heroku.com/osx)
  * [PostgresApp](http://postgresapp.com/) - Mac Users only. Linux users install and create the DB and add instructions on doing so. 

Setting up your machine:
------------------------

  * cd into the project's top level directory (where requirements.txt lives) and create a virtualenv - `virtualenv venv`
  * Source the virtual environment - `source venv/bin/activate`
  * Install the dependencies - `pip install -r requirements.txt`
  * Setup a .env file so foreman knows where to find Django's settings. You can do this by running the following from this projects top level directory (where Procfile lives):
    * `touch .env && echo "DJANGO_SETTINGS_MODULE=history.settings.development" >> .env`
  * Create the hocg database for your local Postgres install. Use the Postgres.app icon to open psql and then run `CREATE DATABASE mydb` at the prompt
  * Use `foreman start` to start Gunicorn. localhost:5000 should be up and running. 

