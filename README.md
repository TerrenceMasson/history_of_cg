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
  * Create the hocg database for your local Postgres install. Use the Postgres.app icon to open psql and then run `CREATE DATABASE hocg` at the prompt
  * To start the History of CG server change into the 'history' directory (`cd history`) and run `python manage.py runserver --settings=settings.development`. 
  * You should now be able to navigate to http://localhost:8000 in your browser, and you're all set. 

