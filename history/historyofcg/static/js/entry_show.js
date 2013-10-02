Hist = Hist || {};

$(document).ready(function() {
    Hist.Lightbox.init();
    Hist.DateHandler.changeShowPageLabels();
});

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