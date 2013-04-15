# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):
    def forwards(self, orm):
        # Adding model 'Category'
        db.create_table('historyofcg_category', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('date_created', self.gf('django.db.models.fields.DateTimeField')(auto_now_add=True, blank=True)),
            ('date_modified', self.gf('django.db.models.fields.DateTimeField')(auto_now=True, blank=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=15)),
        ))
        db.send_create_signal('historyofcg', ['Category'])

        # Adding model 'Tag'
        db.create_table('historyofcg_tag', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('date_created', self.gf('django.db.models.fields.DateTimeField')(auto_now_add=True, blank=True)),
            ('date_modified', self.gf('django.db.models.fields.DateTimeField')(auto_now=True, blank=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=20)),
        ))
        db.send_create_signal('historyofcg', ['Tag'])

        # Adding model 'Location'
        db.create_table('historyofcg_location', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('date_created', self.gf('django.db.models.fields.DateTimeField')(auto_now_add=True, blank=True)),
            ('date_modified', self.gf('django.db.models.fields.DateTimeField')(auto_now=True, blank=True)),
            ('city', self.gf('django.db.models.fields.CharField')(unique=True, max_length=50)),
            ('state', self.gf('django.db.models.fields.CharField')(max_length=50)),
            ('country', self.gf('django.db.models.fields.CharField')(max_length=50)),
            ('latitude', self.gf('django.db.models.fields.FloatField')(unique=True, null=True, blank=True)),
            ('longitude', self.gf('django.db.models.fields.FloatField')(unique=True, null=True, blank=True)),
        ))
        db.send_create_signal('historyofcg', ['Location'])

        # Adding model 'Page'
        db.create_table('historyofcg_page', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('date_created', self.gf('django.db.models.fields.DateTimeField')(auto_now_add=True, blank=True)),
            ('date_modified', self.gf('django.db.models.fields.DateTimeField')(auto_now=True, blank=True)),
            ('type', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['historyofcg.Category'])),
            ('name', self.gf('django.db.models.fields.CharField')(unique=True, max_length=40)),
            ('vanity_url', self.gf('django.db.models.fields.CharField')(unique=True, max_length=20)),
            ('description', self.gf('django.db.models.fields.TextField')()),
            ('homepage', self.gf('django.db.models.fields.URLField')(max_length=200, null=True, blank=True)),
            ('date_established', self.gf('django.db.models.fields.DateField')(null=True, blank=True)),
        ))
        db.send_create_signal('historyofcg', ['Page'])

        # Adding M2M table for field tags on 'Page'
        db.create_table('historyofcg_page_tags', (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('page', models.ForeignKey(orm['historyofcg.page'], null=False)),
            ('tag', models.ForeignKey(orm['historyofcg.tag'], null=False))
        ))
        db.create_unique('historyofcg_page_tags', ['page_id', 'tag_id'])

        # Adding model 'Source'
        db.create_table('historyofcg_source', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('date_created', self.gf('django.db.models.fields.DateTimeField')(auto_now_add=True, blank=True)),
            ('date_modified', self.gf('django.db.models.fields.DateTimeField')(auto_now=True, blank=True)),
            ('name', self.gf('django.db.models.fields.CharField')(unique=True, max_length=50)),
            ('url', self.gf('django.db.models.fields.URLField')(max_length=200)),
        ))
        db.send_create_signal('historyofcg', ['Source'])

        # Adding model 'Entry'
        db.create_table('historyofcg_entry', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('date_created', self.gf('django.db.models.fields.DateTimeField')(auto_now_add=True, blank=True)),
            ('date_modified', self.gf('django.db.models.fields.DateTimeField')(auto_now=True, blank=True)),
            ('name', self.gf('django.db.models.fields.CharField')(unique=True, max_length=50)),
            ('category', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['historyofcg.Category'])),
            ('description', self.gf('django.db.models.fields.TextField')()),
            ('user', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['auth.User'])),
            ('date_1', self.gf('django.db.models.fields.DateField')(null=True, blank=True)),
            ('date_2', self.gf('django.db.models.fields.DateField')(null=True, blank=True)),
            ('location', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['historyofcg.Location'])),
            ('published', self.gf('django.db.models.fields.BooleanField')(default=False)),
            ('source', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['historyofcg.Source'])),
            ('page', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['historyofcg.Page'])),
            ('url', self.gf('django.db.models.fields.URLField')(max_length=200)),
        ))
        db.send_create_signal('historyofcg', ['Entry'])

        # Adding M2M table for field tags on 'Entry'
        db.create_table('historyofcg_entry_tags', (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('entry', models.ForeignKey(orm['historyofcg.entry'], null=False)),
            ('tag', models.ForeignKey(orm['historyofcg.tag'], null=False))
        ))
        db.create_unique('historyofcg_entry_tags', ['entry_id', 'tag_id'])

        # Adding model 'Story'
        db.create_table('historyofcg_story', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('date_created', self.gf('django.db.models.fields.DateTimeField')(auto_now_add=True, blank=True)),
            ('date_modified', self.gf('django.db.models.fields.DateTimeField')(auto_now=True, blank=True)),
            ('title', self.gf('django.db.models.fields.CharField')(unique=True, max_length=50)),
            ('date', self.gf('django.db.models.fields.DateTimeField')(null=True, blank=True)),
            ('page', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['historyofcg.Page'])),
            ('source', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['historyofcg.Source'])),
            ('user', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['auth.User'])),
        ))
        db.send_create_signal('historyofcg', ['Story'])

        # Adding M2M table for field tags on 'Story'
        db.create_table('historyofcg_story_tags', (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('story', models.ForeignKey(orm['historyofcg.story'], null=False)),
            ('tag', models.ForeignKey(orm['historyofcg.tag'], null=False))
        ))
        db.create_unique('historyofcg_story_tags', ['story_id', 'tag_id'])

        # Adding model 'VideoStory'
        db.create_table('historyofcg_videostory', (
            ('story_ptr',
             self.gf('django.db.models.fields.related.OneToOneField')(to=orm['historyofcg.Story'], unique=True,
                                                                      primary_key=True)),
            ('video', self.gf('django.db.models.fields.CharField')(unique=True, max_length=200)),
        ))
        db.send_create_signal('historyofcg', ['VideoStory'])

        # Adding model 'ImageStory'
        db.create_table('historyofcg_imagestory', (
            ('story_ptr',
             self.gf('django.db.models.fields.related.OneToOneField')(to=orm['historyofcg.Story'], unique=True,
                                                                      primary_key=True)),
            ('image', self.gf('django.db.models.fields.URLField')(unique=True, max_length=200)),
        ))
        db.send_create_signal('historyofcg', ['ImageStory'])

        # Adding model 'TextStory'
        db.create_table('historyofcg_textstory', (
            ('story_ptr',
             self.gf('django.db.models.fields.related.OneToOneField')(to=orm['historyofcg.Story'], unique=True,
                                                                      primary_key=True)),
            ('text', self.gf('django.db.models.fields.TextField')(unique=True)),
        ))
        db.send_create_signal('historyofcg', ['TextStory'])

        # Adding model 'Connection'
        db.create_table('historyofcg_connection', (
            ('entry_ptr',
             self.gf('django.db.models.fields.related.OneToOneField')(to=orm['historyofcg.Entry'], unique=True,
                                                                      primary_key=True)),
            ('image', self.gf('django.db.models.fields.URLField')(unique=True, max_length=200)),
        ))
        db.send_create_signal('historyofcg', ['Connection'])


    def backwards(self, orm):
        # Deleting model 'Category'
        db.delete_table('historyofcg_category')

        # Deleting model 'Tag'
        db.delete_table('historyofcg_tag')

        # Deleting model 'Location'
        db.delete_table('historyofcg_location')

        # Deleting model 'Page'
        db.delete_table('historyofcg_page')

        # Removing M2M table for field tags on 'Page'
        db.delete_table('historyofcg_page_tags')

        # Deleting model 'Source'
        db.delete_table('historyofcg_source')

        # Deleting model 'Entry'
        db.delete_table('historyofcg_entry')

        # Removing M2M table for field tags on 'Entry'
        db.delete_table('historyofcg_entry_tags')

        # Deleting model 'Story'
        db.delete_table('historyofcg_story')

        # Removing M2M table for field tags on 'Story'
        db.delete_table('historyofcg_story_tags')

        # Deleting model 'VideoStory'
        db.delete_table('historyofcg_videostory')

        # Deleting model 'ImageStory'
        db.delete_table('historyofcg_imagestory')

        # Deleting model 'TextStory'
        db.delete_table('historyofcg_textstory')

        # Deleting model 'Connection'
        db.delete_table('historyofcg_connection')


    models = {
        'auth.group': {
            'Meta': {'object_name': 'Group'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '80'}),
            'permissions': ('django.db.models.fields.related.ManyToManyField', [],
                            {'to': "orm['auth.Permission']", 'symmetrical': 'False', 'blank': 'True'})
        },
        'auth.permission': {
            'Meta': {'ordering': "('content_type__app_label', 'content_type__model', 'codename')",
                     'unique_together': "(('content_type', 'codename'),)", 'object_name': 'Permission'},
            'codename': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'content_type': (
            'django.db.models.fields.related.ForeignKey', [], {'to': "orm['contenttypes.ContentType']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '50'})
        },
        'auth.user': {
            'Meta': {'object_name': 'User'},
            'date_joined': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            'email': ('django.db.models.fields.EmailField', [], {'max_length': '75', 'blank': 'True'}),
            'first_name': ('django.db.models.fields.CharField', [], {'max_length': '30', 'blank': 'True'}),
            'groups': ('django.db.models.fields.related.ManyToManyField', [],
                       {'to': "orm['auth.Group']", 'symmetrical': 'False', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'is_active': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'is_staff': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'is_superuser': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'last_login': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            'last_name': ('django.db.models.fields.CharField', [], {'max_length': '30', 'blank': 'True'}),
            'password': ('django.db.models.fields.CharField', [], {'max_length': '128'}),
            'user_permissions': ('django.db.models.fields.related.ManyToManyField', [],
                                 {'to': "orm['auth.Permission']", 'symmetrical': 'False', 'blank': 'True'}),
            'username': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '30'})
        },
        'contenttypes.contenttype': {
            'Meta': {'ordering': "('name',)", 'unique_together': "(('app_label', 'model'),)",
                     'object_name': 'ContentType', 'db_table': "'django_content_type'"},
            'app_label': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'model': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        'historyofcg.category': {
            'Meta': {'object_name': 'Category'},
            'date_created': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'date_modified': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '15'})
        },
        'historyofcg.connection': {
            'Meta': {'object_name': 'Connection', '_ormbases': ['historyofcg.Entry']},
            'entry_ptr': ('django.db.models.fields.related.OneToOneField', [],
                          {'to': "orm['historyofcg.Entry']", 'unique': 'True', 'primary_key': 'True'}),
            'image': ('django.db.models.fields.URLField', [], {'unique': 'True', 'max_length': '200'})
        },
        'historyofcg.entry': {
            'Meta': {'object_name': 'Entry'},
            'category': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['historyofcg.Category']"}),
            'date_1': ('django.db.models.fields.DateField', [], {'null': 'True', 'blank': 'True'}),
            'date_2': ('django.db.models.fields.DateField', [], {'null': 'True', 'blank': 'True'}),
            'date_created': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'date_modified': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'}),
            'description': ('django.db.models.fields.TextField', [], {}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'location': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['historyofcg.Location']"}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '50'}),
            'page': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['historyofcg.Page']"}),
            'published': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'source': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['historyofcg.Source']"}),
            'tags': ('django.db.models.fields.related.ManyToManyField', [],
                     {'to': "orm['historyofcg.Tag']", 'symmetrical': 'False'}),
            'url': ('django.db.models.fields.URLField', [], {'max_length': '200'}),
            'user': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['auth.User']"})
        },
        'historyofcg.imagestory': {
            'Meta': {'object_name': 'ImageStory', '_ormbases': ['historyofcg.Story']},
            'image': ('django.db.models.fields.URLField', [], {'unique': 'True', 'max_length': '200'}),
            'story_ptr': ('django.db.models.fields.related.OneToOneField', [],
                          {'to': "orm['historyofcg.Story']", 'unique': 'True', 'primary_key': 'True'})
        },
        'historyofcg.location': {
            'Meta': {'object_name': 'Location'},
            'city': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '50'}),
            'country': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'date_created': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'date_modified': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'latitude': ('django.db.models.fields.FloatField', [], {'unique': 'True', 'null': 'True', 'blank': 'True'}),
            'longitude': (
            'django.db.models.fields.FloatField', [], {'unique': 'True', 'null': 'True', 'blank': 'True'}),
            'state': ('django.db.models.fields.CharField', [], {'max_length': '50'})
        },
        'historyofcg.page': {
            'Meta': {'object_name': 'Page'},
            'date_created': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'date_established': ('django.db.models.fields.DateField', [], {'null': 'True', 'blank': 'True'}),
            'date_modified': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'}),
            'description': ('django.db.models.fields.TextField', [], {}),
            'homepage': (
            'django.db.models.fields.URLField', [], {'max_length': '200', 'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '40'}),
            'tags': ('django.db.models.fields.related.ManyToManyField', [],
                     {'to': "orm['historyofcg.Tag']", 'symmetrical': 'False'}),
            'type': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['historyofcg.Category']"}),
            'vanity_url': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '20'})
        },
        'historyofcg.source': {
            'Meta': {'object_name': 'Source'},
            'date_created': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'date_modified': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '50'}),
            'url': ('django.db.models.fields.URLField', [], {'max_length': '200'})
        },
        'historyofcg.story': {
            'Meta': {'object_name': 'Story'},
            'date': ('django.db.models.fields.DateTimeField', [], {'null': 'True', 'blank': 'True'}),
            'date_created': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'date_modified': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'page': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['historyofcg.Page']"}),
            'source': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['historyofcg.Source']"}),
            'tags': ('django.db.models.fields.related.ManyToManyField', [],
                     {'to': "orm['historyofcg.Tag']", 'symmetrical': 'False'}),
            'title': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '50'}),
            'user': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['auth.User']"})
        },
        'historyofcg.tag': {
            'Meta': {'object_name': 'Tag'},
            'date_created': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'date_modified': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '20'})
        },
        'historyofcg.textstory': {
            'Meta': {'object_name': 'TextStory', '_ormbases': ['historyofcg.Story']},
            'story_ptr': ('django.db.models.fields.related.OneToOneField', [],
                          {'to': "orm['historyofcg.Story']", 'unique': 'True', 'primary_key': 'True'}),
            'text': ('django.db.models.fields.TextField', [], {'unique': 'True'})
        },
        'historyofcg.videostory': {
            'Meta': {'object_name': 'VideoStory', '_ormbases': ['historyofcg.Story']},
            'story_ptr': ('django.db.models.fields.related.OneToOneField', [],
                          {'to': "orm['historyofcg.Story']", 'unique': 'True', 'primary_key': 'True'}),
            'video': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '200'})
        }
    }

    complete_apps = ['historyofcg']