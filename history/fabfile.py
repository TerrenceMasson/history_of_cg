""" Deployment of your django project.
"""

from fabric.api import env, cd, run, sudo, settings, prefix

env.hosts = ['historyofcg.com']
env.user = "root"

def update_django_project():
    """ Updates the remote django project.
    """
    with cd(settings.PROJECT_PATH):
        run('git pull')
        with prefix('source /historyofcg/dj_history/env/Scripts/activate'):
            run('pip install -r requirements.txt')
            run('python manage.py migrate')
            run('python manage.py collectstatic --noinput')

def restart_webserver():
    """ Restarts remote nginx and uwsgi.
    """
    sudo("service uwsgi restart")
    sudo("/etc/init.d/nginx restart")

def deploy():
    """ Deploy Django Project.
    """
    update_django_project()
    restart_webserver()