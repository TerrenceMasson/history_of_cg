# -*- coding: utf-8 -*-

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('date_created', models.DateTimeField(auto_now_add=True)),
                ('date_modified', models.DateTimeField(auto_now=True)),
                ('name', models.CharField(max_length=15)),
            ],
            options={
                'abstract': False,
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Location',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('date_created', models.DateTimeField(auto_now_add=True)),
                ('date_modified', models.DateTimeField(auto_now=True)),
                ('city', models.CharField(unique=True, max_length=50)),
                ('state', models.CharField(max_length=50)),
                ('country', models.CharField(max_length=50)),
                ('latitude', models.FloatField(unique=True, null=True, blank=True)),
                ('longitude', models.FloatField(unique=True, null=True, blank=True)),
            ],
            options={
                'abstract': False,
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Page',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('date_created', models.DateTimeField(auto_now_add=True)),
                ('date_modified', models.DateTimeField(auto_now=True)),
                ('location', models.CharField(max_length=20, null=True, blank=True)),
                ('name', models.CharField(unique=True, max_length=100)),
                ('vanity_url', models.CharField(unique=True, max_length=100)),
                ('description', models.TextField()),
                ('homepage', models.URLField(null=True, blank=True)),
                ('date_established', models.DateField(null=True, blank=True)),
                ('published', models.BooleanField(default=False)),
                ('image', models.URLField(null=True, blank=True)),
                ('old_id', models.PositiveIntegerField(null=True, blank=True)),
                ('is_deceased', models.BooleanField(default=False)),
                ('date_deceased', models.DateField(null=True, blank=True)),
                ('user_made', models.BooleanField(default=True)),
                ('connections', models.ManyToManyField(related_name='connections_rel_+', null=True, to='historyofcg.Page', blank=True)),
            ],
            options={
                'abstract': False,
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Review',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('date_created', models.DateTimeField(auto_now_add=True)),
                ('date_modified', models.DateTimeField(auto_now=True)),
                ('type', models.CharField(max_length=4, choices=[(b'UP', b'up'), (b'DOWN', b'down')])),
                ('page', models.ForeignKey(to='historyofcg.Page')),
            ],
            options={
                'abstract': False,
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Story',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('date_created', models.DateTimeField(auto_now_add=True)),
                ('date_modified', models.DateTimeField(auto_now=True)),
                ('title', models.CharField(max_length=50)),
                ('date', models.DateField(null=True, blank=True)),
                ('source', models.CharField(max_length=200, null=True, blank=True)),
                ('source_url', models.URLField(null=True, blank=True)),
                ('published', models.BooleanField(default=False)),
                ('old_id', models.PositiveIntegerField(null=True, blank=True)),
                ('video', models.CharField(max_length=200, null=True, blank=True)),
                ('image', models.URLField(null=True, blank=True)),
                ('text', models.TextField(null=True, blank=True)),
                ('deleted', models.BooleanField(default=False)),
                ('page', models.ForeignKey(to='historyofcg.Page')),
                ('user', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'abstract': False,
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Tag',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('date_created', models.DateTimeField(auto_now_add=True)),
                ('date_modified', models.DateTimeField(auto_now=True)),
                ('name', models.CharField(max_length=20)),
                ('approved', models.BooleanField(default=False)),
                ('old_id', models.PositiveIntegerField(null=True, blank=True)),
            ],
            options={
                'abstract': False,
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='UpcomingFeature',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('date_created', models.DateTimeField(auto_now_add=True)),
                ('date_modified', models.DateTimeField(auto_now=True)),
                ('name', models.CharField(max_length=20)),
                ('text', models.TextField()),
                ('display', models.BooleanField(default=False)),
            ],
            options={
                'abstract': False,
            },
            bases=(models.Model,),
        ),
        migrations.AddField(
            model_name='review',
            name='story',
            field=models.ForeignKey(to='historyofcg.Story'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='review',
            name='user',
            field=models.ForeignKey(to=settings.AUTH_USER_MODEL),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='page',
            name='tags',
            field=models.ManyToManyField(to='historyofcg.Tag'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='page',
            name='type',
            field=models.ForeignKey(to='historyofcg.Category'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='page',
            name='user',
            field=models.ForeignKey(to=settings.AUTH_USER_MODEL),
            preserve_default=True,
        ),
    ]
