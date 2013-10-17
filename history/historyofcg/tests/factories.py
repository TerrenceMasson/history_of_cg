import factory
from historyofcg.models import *
from django.contrib.auth.models import User
from history import logger


class UserFactory(factory.django.DjangoModelFactory):
    FACTORY_FOR = User

    username = factory.Sequence(lambda n : "gowie{}".format(n))
    password = factory.Sequence(lambda n : "password{}".format(n))
    email = factory.Sequence(lambda n : "gowie.matt{}@gmail.com".format(n))
    first_name = factory.Sequence(lambda n : "Matt{}".format(n))
    last_name = factory.Sequence(lambda n : "Gowie{}".format(n))

class CategoryPersonFactory(factory.django.DjangoModelFactory):
    FACTORY_FOR = Category

    name = "person"
    date_created = "1991-03-28 06:47"
    date_modified = "1991-03-28 06:47"

class PageFactory(factory.django.DjangoModelFactory):
    FACTORY_FOR = Page

    name = factory.Sequence(lambda n : "shred {}".format(n))
    vanity_url = factory.Sequence(lambda n : "shred-{}".format(n))
    description = "test model"
    date_established = "1991-03-28"
    date_deceased = "2039-03-28"
    published = True
    # Associations
    user = factory.SubFactory(UserFactory)
    type = factory.SubFactory(CategoryPersonFactory)

    @factory.post_generation
    def tags(self, create, extracted, **kwargs):
        if not create:
            # Simple build, do nothing.
            return

        if extracted:
            # A list of groups were passed in, use them
            for tag in extracted:
                self.tags.add(tag)

class TagFactory(factory.django.DjangoModelFactory):
    FACTORY_FOR = Tag

    name = factory.Sequence(lambda n : "tags-are-fucking-stupid-{}".format(n))
    approved = True



