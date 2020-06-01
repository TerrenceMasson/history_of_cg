from datetime import date
from xml.etree import ElementTree
from django.contrib.auth.models import User
from historyofcg.models import Page, Category, Story, Tag

try:
    tree = ElementTree.parse('historyofcg/scripts/file.xml')
except IOError:
    tree = ElementTree.parse('history/historyofcg/scripts/file.xml')

root = tree.getroot()


def populate_page():
    Page.objects.all().delete()
    for child in root.iter():
        if child.tag == 'table_data' and child.attrib == {'name': 'entries'}:
            for child in child.iter():
                if child.tag == 'row':
                    row_data = {}
                    for row in child.iter():
                        if row.tag == 'field':
                            row_data[row.attrib['name']] = row.text
                    print(row_data)
                    if Page.objects.filter(name=row_data['name']):
                        print('page already exists')
                    else:
                        if row_data['slug']:
                            if row_data['date_1']:
                                Page.objects.create(
                                    old_id=row_data['id'],
                                    name=row_data['name'],
                                    date_created=date(int(row_data['created'][:4]), int(row_data['created'][5:7]),
                                                      int(row_data['created'][8:10])),
                                    date_modified=date(int(row_data['modified'][:4]), int(row_data['modified'][5:7]),
                                                       int(row_data['modified'][8:10])),
                                    published=False if row_data['published'] == '0' else True,
                                    type=Category.objects.get(id=int(row_data['category_id'])),
                                    user=User.objects.get(username='Tman'),
                                    vanity_url=row_data['slug'][:100],
                                    homepage=row_data['homepage_url'],
                                    description=row_data['description'] if row_data['description'] else " ",
                                    date_established=date(int(row_data['date_1'][:4]), int(row_data['date_1'][5:7]),
                                                          int(row_data['date_1'][8:10])),
                                    user_made=True
                                ).save()
                            else:
                                Page.objects.create(
                                    old_id=row_data['id'],
                                    name=row_data['name'],
                                    date_created=date(int(row_data['created'][:4]), int(row_data['created'][5:7]),
                                                      int(row_data['created'][8:10])),
                                    date_modified=date(int(row_data['modified'][:4]), int(row_data['modified'][5:7]),
                                                       int(row_data['modified'][8:10])),
                                    published=False if row_data['published'] == '0' else True,
                                    type=Category.objects.get(id=int(row_data['category_id'])),
                                    user=User.objects.get(username='Tman'),
                                    vanity_url=row_data['slug'][:100],
                                    homepage=row_data['homepage_url'],
                                    description=row_data['description'] if row_data['description'] else " ",
                                    user_made=True
                                ).save()


def hackish_migration_for_source_fields():
    stories_to_manual = []
    for child in root.iter():
        if child.tag == 'table_data' and child.attrib == {'name': 'stories'}:
            for child in child.iter():
                if child.tag == 'row':
                    row_data = {}
                    for row in child.iter():
                        if row.tag == 'field':
                            row_data[row.attrib['name']] = row.text
                    if row_data['title']:
                        if row_data['source_name'] or row_data['source_url']:
                            stories_to_manual.append(row_data)
                        story = Story.objects.get(old_id=row_data['id'])
                        story.old_id = row_data['id']
                        story.source = row_data['source_name']
                        story.source_url = row_data['source_url']
                        story.save()
    for s in stories_to_manual:
        print(s)


def initial_stories_fill():
    Story.objects.all().delete()
    for child in root.iter():
        if child.tag == 'table_data' and child.attrib == {'name': 'stories'}:
            for child in child.iter():
                if child.tag == 'row':
                    row_data = {}
                    for row in child.iter():
                        if row.tag == 'field':
                            row_data[row.attrib['name']] = row.text
                    if row_data['title']:
                        if row_data['story_type_id'] == '1':
                            print('video story: ', row_data)
                            Story.objects.create(
                                title=row_data['title'],
                                date=date(int(row_data['date'][:4]), int(row_data['date'][5:7]),
                                          int(row_data['date'][8:10])) if row_data['date'] else None,
                                user=User.objects.get(username="Tman"),
                                #this is just temporary, really sloppy but works T_T
                                page=Page.objects.get(id=1),
                                published=row_data['published'] == '1',
                                video=row_data['video'],
                                date_created=date(int(row_data['created'][:4]), int(row_data['created'][5:7]),
                                                  int(row_data['created'][8:10])),
                                date_modified=date(int(row_data['modified'][:4]), int(row_data['modified'][5:7]),
                                                   int(row_data['modified'][8:10])),
                                old_id=row_data['id']
                            ).save()
                        if row_data['story_type_id'] == '2':
                            print('image story: ', row_data)
                            Story.objects.create(
                                title=row_data['title'],
                                date=date(int(row_data['date'][:4]), int(row_data['date'][5:7]),
                                          int(row_data['date'][8:10])) if row_data['date'] else None,
                                user=User.objects.get(username="Tman"),
                                #this is just temporary, really sloppy but works T_T
                                page=Page.objects.get(id=1),
                                published=row_data['published'] == '1',
                                image=row_data['url'],
                                date_created=date(int(row_data['created'][:4]), int(row_data['created'][5:7]),
                                                  int(row_data['created'][8:10])),
                                date_modified=date(int(row_data['modified'][:4]), int(row_data['modified'][5:7]),
                                                   int(row_data['modified'][8:10])),
                                old_id=row_data['id']
                            ).save()
                        if row_data['story_type_id'] == '3':
                            print('text story: ', row_data)
                            Story.objects.create(
                                title=row_data['title'],
                                date=date(int(row_data['date'][:4]), int(row_data['date'][5:7]),
                                          int(row_data['date'][8:10])) if row_data['date'] else None,
                                user=User.objects.get(username="Tman"),
                                #this is just temporary, really sloppy but works T_T
                                page=Page.objects.get(id=1),
                                published=row_data['published'] == '1',
                                text=row_data['story'].encode('utf-8'),
                                date_created=date(int(row_data['created'][:4]), int(row_data['created'][5:7]),
                                                  int(row_data['created'][8:10])),
                                date_modified=date(int(row_data['modified'][:4]), int(row_data['modified'][5:7]),
                                                   int(row_data['modified'][8:10])),
                                old_id=row_data['id']
                            ).save()


def correct_story_page():
    for child in root.iter():
        if child.tag == 'table_data' and child.attrib == {'name': 'entries_stories'}:
            for child in child.iter():
                if child.tag == 'row':
                    row_data = {}
                    for row in child.iter():
                        if row.tag == 'field':
                            row_data[row.attrib['name']] = row.text
                    print(row_data)
                    page = Page.objects.filter(old_id=int(row_data['entry_id']))
                    story = Story.objects.filter(old_id=int(row_data['story_id']))
                    if page and story:
                        story[0].page = page[0]
                        story[0].save()


def populate_stories():
    initial_stories_fill()
    correct_story_page()


def create_tags():
    Tag.objects.all().delete()
    for child in root.iter():
        if child.tag == 'table_data' and child.attrib == {'name': 'tags'}:
            for child in child.iter():
                if child.tag == 'row':
                    row_data = {}
                    for row in child.iter():
                        if row.tag == 'field':
                            row_data[row.attrib['name']] = row.text
                    print(row_data)
                    if row_data['name']:
                        Tag.objects.create(
                            name=row_data['name'],
                            approved=row_data['approved'] == '1',
                            old_id=row_data['id']
                        ).save()


def assign_tags():
    for child in root.iter():
        if child.tag == 'table_data' and child.attrib == {'name': 'entries_tags'}:
            for child in child.iter():
                if child.tag == 'row':
                    row_data = {}
                    for row in child.iter():
                        if row.tag == 'field':
                            row_data[row.attrib['name']] = row.text
                    print(row_data)
                    page = Page.objects.filter(old_id=int(row_data['entry_id']))
                    tag = Tag.objects.filter(old_id=int(row_data['tag_id']))
                    if page and tag:
                        page[0].tags.add(tag[0])
                        page[0].save()


def populate_tags():
    create_tags()
    assign_tags()


def create_connections():
    for child in root.iter():
        if child.tag == 'table_data' and child.attrib == {'name': 'connections'}:
            for child in child.iter():
                if child.tag == 'row':
                    row_data = {}
                    for row in child.iter():
                        if row.tag == 'field':
                            row_data[row.attrib['name']] = row.text
                    print(row_data)
                    page_1 = Page.objects.filter(old_id=int(row_data['entry_id_1']))
                    page_2 = Page.objects.filter(old_id=int(row_data['entry_id_2']))
                    if page_1 and page_2:
                        page_1[0].connections.add(page_2[0])
                        page_2[0].connections.add(page_1[0])
                        page_1[0].save()
                        page_2[0].save()


def populate_prod_db():
    populate_page()
    populate_stories()
    populate_tags()
    create_connections()