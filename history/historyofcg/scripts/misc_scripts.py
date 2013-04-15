from historyofcg.models import Page


def remove_page_images():
    pages = Page.objects.all()

    for p in pages:
        p.image = None
        p.save()


__author__ = 'Kyle'
