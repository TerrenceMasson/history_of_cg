// initialize Isotope
$(document).ready(function() {
    var $container = $('#updated-entries-container')
    $container.isotope({
        itemSelector: ".tile",
        animationEngine: "best-available",
        layoutMode: "masonry",
        masonry: {
            columnWidth: 245,
            columnNumber: 4
        },
        resizable: false
    });
    $container.isotope("shuffle");

    // update columnWidth on window resize
    $(window).smartresize(function () {
        $container.isotope({
            // update columnWidth to a percentage of container width
            masonry: { columnWidth: $container.width() / 4 }
        });
    });
});
