# History Of CG

Requirements
------------------------

- [Docker](https://docs.docker.com/engine/install/)
  
Setting up Docker / Compose Workflow
------------------------

1. cd into the project's top level directory (where `requirements.txt` lives)
1. Run `docker-compose up` and wait until docker finishes initializing
1. Open a new terminal and run `docker exec -it hocg-webserver python manage.py migrate`
1. You should now be able to navigate to http://localhost:8000 in your browser to access HOCG

Setting up without Docker (using virtualenv):
------------------------

This legacy method is not recommended and should only be used if Docker cannot be installed.

  * cd into the project's top level directory (where `requirements.txt` lives) and create a virtualenv - `virtualenv -p $(which python3.7) venv` _(other python3.x versions should work fine)_
  * Source the virtual environment - `source venv/bin/activate`
  * Make sure you have PostgreSQL binary installed. For MacOS: `brew install postgresql`, Debian: `sudo apt-get install postgresql`
  * For MacOS prior installing python packages make sure OPENSSL libraries in LIBRARY_PATH: `export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/`
  * Install the dependencies - `pip install -r requirements.txt`
  * Create the hocg database for your local Postgres install. Use the Postgres.app icon to open psql and then run `CREATE DATABASE hocg` at the prompt
  * Now that the DB has been created you'll need to create the DB tables via this command: `python manage.py migrate`
  * To start the History of CG server change into the 'history' directory (`cd history`) and run `python manage.py runserver`.
  * You should now be able to navigate to http://localhost:8000 in your browser, and you're all set.
