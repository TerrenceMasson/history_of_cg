var Hist = Hist || {}

// Loose Methods
/////////////////

function changeColors(color) {
    var allFields = $('.fields:not(.connection-fields) input[type=text], .fields:not(.connection-fields) select, .fields:not(.connection-fields) textarea, ul.token-input-list-hcg, li.source-title input, li.source-url input, .stories-col .stories p.story-collapsed-heading span.title');
    var allBorderFields = $('.fields .helper-popups');
    var allHoverFields = $('button, .button');

    allFields.removeClass('project person organization event none');
    allFields.addClass(color);

    allBorderFields.removeClass('project-border person-border organization-border event-border none-border');
    allBorderFields.addClass(color + '-border');

    allHoverFields.removeClass('project-hover person-hover organization-hover event-hover none-hover');
    allHoverFields.addClass(color + '-hover');
}

function changeColorsForType(t) {
    if (t.indexOf('project') !== -1) {
        changeColors('project');
    } else if (t.indexOf('person') !== -1) {
        changeColors('person');
    } else if (t.indexOf('organization') !== -1) {
        changeColors('organization');
    } else if (t.indexOf('event') !== -1) {
        changeColors('event');
    } else {
        changeColors('none');
    }
}

// Date field handling
///////////////////////

var dateInfo = {
    'project': {
        'dateLabel': 'Date',
        'helperText': 'When did this project take place?'
    },
    'person': {
        'dateLabel': 'Birth date',
        'helperText': 'When was this person born?',
        'secondDateLabel': 'Deceased?',
        'secondHelperText': 'Deceased Date',
        'secondDateCheckboxLabel': 'Is this person deceased?'
    },
    'organization': {
        'dateLabel': 'Established Date',
        'helperText': 'When was this organization founded?',
        'secondDateLabel': 'Is Closed?',
        'secondHelperText': 'Closing Date?',
        'secondDateCheckboxLabel': 'This organization no longer exists'
    },
    'event': {
        'dateLabel': 'Date',
        'helperText': 'When did this event take place?',
        'secondDateLabel': 'End Date',
        'secondHelperText': 'When did this event end?',
        'secondDateCheckboxLabel': 'This is a multi-day event'
    },
    'none': {
        'dateLabel': 'Date',
        'helperText': 'Select an entry type to learn more about this date'
    }
};

function showDeceased() {
    $('.label-entry-date-2').show();
    $('.entry-date-2').show();
}
function hideDeceased() {
    $('.label-entry-date-2').hide();
    $('.entry-date-2').hide();
}

function changeDateFields(t) {
    var $dateLabel = $('.basics .label-entry-date');
    var $dateHelperText = $('.basics .entry-date .helper-popups');
    var $secondDateLabel = $('.basics .label-entry-date-2');
    var $secondDateHelperText = $('.basics .entry-date-2 .helper-popups');
    var $secondDateCheckboxLabel = $('.basics .entry-date-2-selected label');
    var $secondDate = $('.basics .entry-date-2');
    var $secondDateCheckbox = $('.basics #entry-date-selected');
    var $tertiaryDateLabel = $('.basics .label-entry-date-3');
    // date 1 section
    $dateLabel.html(dateInfo[t].dateLabel);
    $dateHelperText.html(dateInfo[t].helperText);

    $secondDateLabel.html(dateInfo[t].secondDateLabel);
    $tertiaryDateLabel.html(dateInfo[t].secondHelperText);
}

function changeDateFieldsForType(t) {
    if (t.indexOf('project') !== -1) {
        hideDeceased();
        changeDateFields('project');
    } else if (t.indexOf('person') !== -1) {
        showDeceased();
        changeDateFields('person');
    } else if (t.indexOf('organization') !== -1) {
        showDeceased();
        changeDateFields('organization');
    } else if (t.indexOf('event') !== -1) {
        hideDeceased();
        changeDateFields('event');
    } else {
        hideDeceased();
        changeDateFields('none');
    }
}

Hist.initColorsAndDate = function() {
    // Initialize color change
    var initialEntryType = $('#main-stub .entry-type-select').children('option:selected').text().toLowerCase();
    changeColorsForType(initialEntryType);
    changeDateFieldsForType(initialEntryType);
}

Hist.initChosen = function() {
    // Init Chosen Selects
    if (jQuery().chosen) {
        console.log("Chosen found.")
        $('.chosen-select').chosen({ width: "15%", disable_search_threshold: 32 });
    }
}

Hist.initTabs = function() {
    $('.tabs-min').tabs();
}

// CSRF Workaround
// Ref: https://docs.djangoproject.com/en/dev/ref/contrib/csrf/#ajax
///////////////////
Hist.getCookie = function(name) {
    var cookieValue = null;
    if (document.cookie && document.cookie != '') {
        var cookies = document.cookie.split(';');
        for (var i = 0; i < cookies.length; i++) {
            var cookie = jQuery.trim(cookies[i]);
            // Does this cookie string begin with the name we want?
            if (cookie.substring(0, name.length + 1) == (name + '=')) {
                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                break;
            }
        }
    }
    return cookieValue;
}

Hist.csrfSafeMethod = function(method) {
    // these HTTP methods do not require CSRF protection
    return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));
}

Hist.initCSRF = function() {
    $.ajaxSetup({
        crossDomain: false, // obviates need for sameOrigin test
        beforeSend: function (xhr, settings) {
            if (!Hist.csrfSafeMethod(settings.type)) {
                var csrftoken = Hist.getCookie('csrftoken');
                xhr.setRequestHeader("X-CSRFToken", csrftoken);
            }
        }
    });
}

// Publishing/Unpublishing Page/Story
//////////////////////////////////////

var STORY_TYPE = "story",
    PAGE_TYPE  = "page";
Hist.publishForType = function(type, identifier, $storyButton) {
    $.ajax({
        type: "POST",
        url: "/publish/" + type + "/" + identifier + "/",
        success: function (action) {
            console.log("Successfully published " + type);
            if (type === STORY_TYPE) {
                $storyButton.html('UNPUBLISH');
                $('#' + $storyButton.data('id') + "-story").html('PUBLISHED');
            } else {
                $('.publish-page').html('UNPUBLISH');
                $('.publish-status').html('PUBLISHED');
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.log("Error publishing " + type + " with identifier: " + identifier);
        }
    });
}

Hist.unpublishForType = function(type, identifier, $storyButton) {
    $.ajax({
        type: "POST",
        url: "/unpublish/" + type + "/" + identifier + "/",
        success: function(data, textStatus, jqXHR) {
            console.log("Successfully unpublished " + type);
            if (type === STORY_TYPE) {
                $storyButton.text('PUBLISH');
                $('#' + $storyButton.data('id') + "-story").html('UNPUBLISHED')
            } else {
                $('.publish-page').html('PUBLISH');
                $('.publish-status').html('UNPUBLISHED');
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.log("Error unpublishing " + type + " with identifier: " + identifier);
        }
    })
}

// StoryForm
/////////////
var StoryForm = function() {
    var deleteStory = function(deleteButton) {
        var $button = $(deleteButton);
        $.ajax({
            type: "POST",
            url: "/delete/story/" + $button.data('story-id') + "/",
            success: function(data, textStatus, jqXHR) {
                // TODO: Show some success message.
                $button.closest('.edit').remove();
                console.log("Story successfully deleted");
            },
            error: function(jqXHR, textStatus, errorThrown) {
                // TODO: Show some error message.
                console.log("Story failed to delete.");
            }
        })
    }

    // Open/Collapse a Story via it's Header
    var toggleStoryHeader = function(header) {
        var $header = $(header);
        if ($header.attr('class') === 'story-collapsed-heading') {
            $header.next().slideDown();
        } else {
            $header.next().slideUp();
        }
        $header.toggleClass("story-collapsed-heading story-opened-heading");
    }

    var submitForm = function(form, isNewStory) {
        var $form = $(form);
        $.ajax({
            data: $form.serialize(),
            type: "POST",
            url:  $form.attr('action'),
            success: function (data, textStatus, jqXHR) {
                if (isNewStory) {
                    // Add the newly saved story to the DOM
                    $('.edit-story-container').append(data);
                    $form[0].reset();
                } else {
                    // TODO: Doing nothing, but we should show a success message
                    console.log("Story was successfully edited");
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                // TODO: Show error message
                console.log("error saving story form - textStatus: ", textStatus);
            }
        });
    }

    return {
        init: function() {
            var self = this;

            // StoryForm DOM Events
            ////////////////////////
            $('.delete-story').on('click', function(e) {
                deleteStory(this);
                return false;
            });
            // New Story Submit event
            $('.story-save-button').on('click', function(e) {
                submitForm($(this).closest('form'), true);
                return false;
            });
            $('.story-edit-button').on('click', function(e) {
                submitForm($(this).closest('form'), false);
                return false;
            });
            // Show New Story
            $('.new-story-button').on('click', function(e) {
                $('.new-story-container').show();
            });
            // Open/Collapse Story
            $('.story-collapsed-heading, .story-opened-heading').on('click', function(e) {
                toggleStoryHeader(this);
            });
        }
    }
}();
Hist.StoryForm = StoryForm;

$(document).ready(function () {

    // Init All The Things!
    ///////////////////////
    Hist.initCSRF();
    Hist.initColorsAndDate();
    Hist.initChosen();
    Hist.initTabs();
    Hist.StoryForm.init();

    // DOM Events
    //////////////

    // Change Color for page on select change
    $('#main-stub .entry-type-select').change(function () {
        var type = $(this).children('option:selected').text().toLowerCase();
        changeColorsForType(type);
        changeDateFieldsForType(type);
    });

    // Publish/Unpublish Page/Story
    $('.publish-page').on('click', function (e) {
        var $button = $(this),
            identifier = $button.data('vanity-url');
        if ($button.text().contains("unpublish", true)) {
            Hist.unpublishForType(PAGE_TYPE, identifier);
        } else if ($button.text().contains("publish", true)) {
            Hist.publishForType(PAGE_TYPE, identifier);
        }
        return false;
    });
    $('.story-publish-button').on('click', function (e) {
        var $button = $(this),
            identifier = $button.data('id');
        console.log("button text: ", $button.text());
        if ($button.text().contains("unpublish", true)) {
            console.log("Calling uppub for story");
            Hist.unpublishForType(STORY_TYPE, identifier, $button);
        } else if ($button.text().contains("publish", true)) {
            console.log("Calling pub for story");
            Hist.publishForType(STORY_TYPE, identifier, $button);
        }
        return false;
    });

    // Connection Functions
    // TODO: Refactor
    ////////////////////////
    $('.connect-entries-button').click(function (e) {
        e.preventDefault();
        button = $(this);
        console.log($("#connectionSearchBox")[0].value);
        url = "/add/connection/" + button[0].getAttribute('data-vanity-url') + "/" + $("#connectionSearchBox")[0].value.replace(/ /gi,"-").replace("(", "").replace(")", "").replace(".", "").replace("-&-", "-") + "/";
        $.ajax({
            type: "POST",
            url: url,
            success: function (action) {
                window.location = "/edit/page/" + button[0].getAttribute('data-vanity-url');
            }
        })
    });

    $('div.connections span.delete').click(function (e) {
        e.preventDefault();
        button = $(this);
        url = "/remove/connection/" + button[0].getAttribute('data-vanity-url') + "/" + button[0].getAttribute('data-name') + "/";
        $.ajax({
            type: "POST",
            url: url,
            success: function (action) {
                window.location = "/edit/page/" + button[0].getAttribute('data-vanity-url');
            }
        })
    });

    $('div.connections span.name').click(function(e) {
        e.preventDefault();
        window.location = "/pages/" + $(this)[0].getAttribute('data-vanity-url');
    });


    // Deceased Date Fields
    // TODO: Refactor
    ////////////////////////
    if ($('#id_is_deceased').is(':checked')) {
        $(".label-entry-date-3").show();
        $(".entry-date-3").show();
        hide_page=false;
    } else {
        $(".label-entry-date-3").hide();
        $(".entry-date-3").hide();
        hide_page=true;
    }

    $("#id_is_deceased").click(function(){
        hide_page =! hide_page;
        if(hide_page) {
            $(".label-entry-date-3").hide();
            $(".entry-date-3").hide();
        } else {
            $('.entry-date-3 .chosen-container').removeAttr('style')
            $(".label-entry-date-3").show();
            $(".entry-date-3").show();
        }
    })

    // Helper Text Show/Unshow
    ///////////////////////////
    $('.need-helper').focus(function () {
        $(this).siblings('.helper-popups').fadeIn();
    }).focusout(function () {
        $(this).siblings('.helper-popups').fadeOut();
    });
});
