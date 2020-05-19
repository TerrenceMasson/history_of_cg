# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.db.utils import IntegrityError


def forward(apps, schema_editor):
    Category = apps.get_model('historyofcg', 'Category')
    db_alias = schema_editor.connection.alias
    try:
        Category.objects.using(db_alias).bulk_create([
            Category(id=1, name='person'),
            Category(id=2, name='project'),
            Category(id=3, name='organization'),
            Category(id=4, name='event'),
        ])
    except IntegrityError:
        pass
    


def backward(apps, schema_editor):
    Category = apps.get_model('historyofcg', 'Category')
    db_alias = schema_editor.connection.alias
    Category.objects.using(db_alias).filter(id=1, name='person').delete()
    Category.objects.using(db_alias).filter(id=2, name='project').delete()
    Category.objects.using(db_alias).filter(id=3, name='organization').delete()
    Category.objects.using(db_alias).filter(id=4, name='event').delete()


class Migration(migrations.Migration):

    dependencies = [
        ('historyofcg', '0001_initial'),
    ]

    operations = [
        (migrations.RunPython(forward, backward))
    ]
