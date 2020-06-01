import io, struct, urllib
from django import template
from django.core.files.images import ImageFile
from django.template import NodeList
from django.contrib.auth.models import Group
from history.historyofcg.models import Review, Story, Page
from random import choice, uniform
from history import logger


register = template.Library()

@register.simple_tag
def random_double_size():
    if choice([True, False]):
        return "double-size"
    else:
        return ""

@register.filter
def get_story_type(story):
    if story.text != None and story.text != "":
        return "story-text"
    elif story.image != None and story.image != "":
        return "story-image"
    elif story.video != None and story.video != "":
        return "story-video"

@register.filter
def get_youtube_img(story):
    if story.video != "":
        video_id = story.video.split('?v=')[1]
        return "https://img.youtube.com/vi/%s/hqdefault.jpg" % video_id
    else:
        logger.log("story.video equals empty string. Can't grab image for this story: ", story)

@register.filter
def is_youtube_video(story):
    return True if "youtube" in story.video else False

@register.filter
def is_vimeo_video(story):
    return True if "vimeo" in story.video else False

@register.filter
def get_story_icon(story):
    if story.text != "":
        return "story-type-icon-text"
    elif story.image != "":
        return "story-type-icon-image"
    elif story.video != "":
        return "story-type-icon-video"

@register.filter
def replace(value, args):
    # fancy syntax -> args are split by a /
    # first arg is the value to replace in the string
    # second is what to replace it with
    to_replace = args.split('/')[0]
    replace_with = args.split('/')[1]

    split = value.replace(to_replace, replace_with)

    return split


@register.filter
def get_random_image(page):
    images = Story.objects.filter(page__pk=page.id, published=True, deleted=False)
    images = [x for x in images if x.type() == "image"]
    if len(images) == 0:
        ## TODO: We're hot linking our random person image from clker.com
        return "/static/img/P_desatCentered02.png" if page.type.name != "person" else "/static/img/missing-image.jpg"
    else:
        return choice(images).image


@register.filter
def object_user_is(value, arg):
    expected_group = Group.objects.filter(name=arg)
    if expected_group:
        if expected_group[0] in value.user.groups.all():
            return True


@register.filter
def user_vote_cast(value, arg):
    story = value
    if Review.objects.filter(story__id=story.id, user__id=arg):
        vote = Review.objects.filter(story__id=story.id, user__id=arg)[0]

        return "{}-vote".format(vote.type.lower())
    else:
        return "no-vote"


@register.tag()
def ifusergroup(parser, token):
    """ Check to see if the currently logged in user belongs to a specific
    group. Requires the Django authentication contrib app and middleware.

    Usage: {% ifusergroup Admins %} ... {% endifusergroup %}, or
           {% ifusergroup Admins|Group1|Group2 %} ... {% endifusergroup %}, or
           {% ifusergroup Admins %} ... {% else %} ... {% endifusergroup %}

    """
    try:
        tag, group = token.split_contents()
    except ValueError:
        raise template.TemplateSyntaxError("Tag 'ifusergroup' requires 1 argument.")

    nodelist_true = parser.parse(('else', 'endifusergroup'))
    token = parser.next_token()

    if token.contents == 'else':
        nodelist_false = parser.parse(('endifusergroup',))
        parser.delete_first_token()
    else:
        nodelist_false = NodeList()

    return GroupCheckNode(group, nodelist_true, nodelist_false)


class GroupCheckNode(template.Node):
    def __init__(self, group, nodelist_true, nodelist_false):
        self.group = group
        self.nodelist_true = nodelist_true
        self.nodelist_false = nodelist_false

    def render(self, context):
        print(context)
        if "request" in context:
            print('request')
            user = context['request'].user
        elif "user" in context:
            print('user')
            user = context['user']

        if not user.is_authenticated:
            return self.nodelist_false.render(context)

        try:
            for group in self.group.split("|"):

                if Group.objects.get(name=group) in user.groups.all():
                    return self.nodelist_true.render(context)

        except Group.DoesNotExist:
            return self.nodelist_false.render(context)

        return self.nodelist_false.render(context)


@register.filter
def get_img_width(value):
    header = urllib.request.urlopen(value).read(24)
    return_list = getImageInfo(header)
    return int(return_list[1])


def getImageInfo(data):
    data = str(data)
    size = len(data)
    height = -1
    width = -1
    content_type = ''

    # handle GIFs
    if (size >= 10) and data[:6] in ('GIF87a', 'GIF89a'):
        # Check to see if content_type is correct
        content_type = 'image/gif'
        w, h = struct.unpack("<HH", data[6:10])
        width = int(w)
        height = int(h)

    # See PNG 2. Edition spec (http://www.w3.org/TR/PNG/)
    # Bytes 0-7 are below, 4-byte chunk length, then 'IHDR'
    # and finally the 4-byte width, height
    elif ((size >= 24) and data.startswith('\211PNG\r\n\032\n')
          and (data[12:16] == 'IHDR')):
        content_type = 'image/png'
        w, h = struct.unpack(">LL", data[16:24])
        width = int(w)
        height = int(h)

    # Maybe this is for an older PNG version.
    elif (size >= 16) and data.startswith('\211PNG\r\n\032\n'):
        # Check to see if we have the right content type
        content_type = 'image/png'
        w, h = struct.unpack(">LL", data[8:16])
        width = int(w)
        height = int(h)

    # handle JPEGs
    elif (size >= 20):
    # and data.startswith('\377\370'):
        content_type = 'image/jpeg'
        jpeg = io.StringIO(data)
        jpeg.read(2)
        b = jpeg.read(1)
        try:
            while (b and ord(b) != 0xDA):
                while (ord(b) != 0xFF): b = jpeg.read(1)
                while (ord(b) == 0xFF): b = jpeg.read(1)
                if (ord(b) >= 0xC0 and ord(b) <= 0xC3):
                    jpeg.read(3)
                    h, w = struct.unpack(">HH", jpeg.read(4))
                    break
                else:
                    jpeg.read(int(struct.unpack(">H", jpeg.read(2))[0]) - 2)
                b = jpeg.read(1)
            width = int(w)
            height = int(h)
        except struct.error:
            pass
        except ValueError:
            pass

    return [content_type, width, height]


__author__ = 'Kyle'
