# History Of CG

## Local Development Setup

Requirements:
-------------
  * Python version 2.7.5
  * [pip](https://pypi.python.org/pypi/pip)
  * [heroku-toolbelt](https://toolbelt.heroku.com/osx)

Setting up your machine:
------------------------

  * cd into the project's top level directory (where requirements.txt lives) and run `pip install -r requirements.txt`
  * TODO: Adds steps for the virtualenv bullshit
  * Setup a .env file so foreman knows where to find Django's settings. You can do this by running the following from this projects top level directory (where Procfile lives):
    * `touch .env && echo "DJANGO_SETTINGS_MODULE=history.settings.development" >> .env`

