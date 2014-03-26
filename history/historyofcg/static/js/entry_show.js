Hist = Hist || {};

$(document).ready(function() {
    Hist.Lightbox.init();
    Hist.DateHandler.changeShowPageLabels();
    Hist.VideoHandler.init();
});

// Video / Video Image Handling
////////////////////////////////

Hist.VideoHandler = function() {
    // TODO: This is the client_id I just got from signing up my gmail as a vimeo developer
    //   and unfortunately it isn't working. I'm getting 403's with the following error:
    //   "error": "The app is not allowed to perform that action."
    //   Until I figure that out I'm going to use some random id that was sitting around on
    //   StackOverflow... which of course I shouldn't do, but fuck it.
    // var CLIENT_ID = 'b3804a2a4c901fecb87a26138bb322c244432283';
    // Random StackOverflow dude's client_id
    var CLIENT_ID = 'd0b4a83fc5c12570e9270fc54ef6ecabb8675fcf';
    return {
        getVimeoId: function(url) {
            var regex = /vimeo.com\/(\d*)/i;
            return url.match(regex)[1];
        },
        grabVimeoImage: function($urlContainer, vimeoId) {
            var vimeoUrl = 'https://api.vimeo.com/videos/' + vimeoId + '?client_id=' + CLIENT_ID;
            $.ajax({
                url: vimeoUrl,
                type: "GET",
                crossDomain: true,
                beforeSend: function (req) {
                    req.setRequestHeader('Accept', 'application/vnd.vimeo.video+json;version=3.0');
                },
                success: function (data) {
                    var imageUrl = data.pictures[0].link,
                        image;
                    if (imageUrl) {
                        image = $('<img>').addClass('story_video_image').attr('src', imageUrl);
                        $urlContainer.replaceWith(image);
                    }
                }
            });
        },
        updateVimeos: function($vimeos) {
            var self = this;
            $vimeos.each(function() {
                var $this = $(this),
                    dataUrl = $this.data('url'),
                    vimeoId = self.getVimeoId(dataUrl);
                self.grabVimeoImage($this, vimeoId);
            });
        },
        init: function() {
            var $vimeos = $('.vimeo_video'),
                $badVideos = $('.destroy_me');
            if ($vimeos.length > 0) {
                this.updateVimeos($vimeos);
            }

            // Remove videos which have a bad url
            $badVideos.each(function(idx, video) {
                $(video).parent('.story-video').remove();
            });
        }
    };
}();

// Nivo LightBox Config
////////////////////////

Hist.Lightbox = function() {
    var currentIndex, itemCount;
    var setItemDetails = function(lightbox) {
        if ($('.lightbox-item-details').length === 0) {
            $('.nivo-lightbox-overlay').append("<div class='lightbox-item-details'> Story " + currentIndex + " of " + itemCount + "</div>");
        } else {
            $('.lightbox-item-details').html("Story " + currentIndex + " of " + itemCount);
        }
    }
    var setCurrentIndex = function(item) {
        var $currentItem = $(item.target).closest('.nivo-lightbox-item');
        currentIndex = $currentItem.data('index')
    }
    var updateItemDetails = function(item) {
        currentIndex = $(item[0]).data('index');
        setItemDetails();
    }
    return {
        init: function() {
            itemCount = $('.nivo-lightbox-item').length;

            $('.tile.nivo-lightbox-item').nivoLightbox({
                afterShowLightbox: setItemDetails,
                onPrev: updateItemDetails,
                onNext: updateItemDetails
            });

            $('.tile.nivo-lightbox-item').on('click', setCurrentIndex);
        }
    }
}();