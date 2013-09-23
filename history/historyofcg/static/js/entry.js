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

// using jQuery
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

var StoryForm = function() {
    var deleteStory = function(deleteButton) {
        var $button = $(deleteButton);
        $.ajax({
            type: "POST",
            url: "/delete/story/" + $button.data('story-id') + "/",
            success: function (data, textStatus, jqXHR) {
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

    return {
        submit: function(form) {
            var $form = $(form);
            $.ajax({
                data: $form.serialize(),
                type: $form.attr('method'),
                url: $form.attr('action'),
                success: function (data, textStatus, jqXHR) {
                    // Add the newly saved story to the DOM
                    $('.edit-story-container').append(data);
                    $form[0].reset();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    debugger
                    console.log("error saving story form - textStatus: ", textStatus);
                }
            });

        },
        init: function() {
            var self = this;

            // StoryForm DOM Events
            ////////////////////////
            $('.delete').on('click', function(e) {
                deleteStory(this);
            });

            $('.story-save-button').on('click', function (e) {
                self.submit($(this).closest('form'));
                return false;
            });

            $('.new-story-button').on('click', function(e) {
                $('.new-story-container').show();
            })
        }
    }
}();
Hist.StoryForm = StoryForm;

$(document).ready(function () {

    // Init All The Things!
    ///////////////////////
    Hist.initColorsAndDate();
    Hist.initChosen();
    Hist.initTabs();
    Hist.StoryForm.init();

    $.ajaxSetup({
        crossDomain: false, // obviates need for sameOrigin test
        beforeSend: function (xhr, settings) {
            if (!Hist.csrfSafeMethod(settings.type)) {
                var csrftoken = Hist.getCookie('csrftoken');
                xhr.setRequestHeader("X-CSRFToken", csrftoken);
            }
        }
    });

    // DOM Events
    //////////////

    $('.publish-page').click(function () {
        console.log($(this));
        if ($(this)[0].innerText == 'PUBLISH') {
            ___url = "/publish/page/" + $(this)[0].getAttribute('data-vanity-url') + "/"
            $.ajax({
                type: "POST",
                url: ___url,
                success: function (action) {
                    $('.publish-page').html('UNPUBLISH');
                    $('.publish-status').html('PUBLISHED');
                }
            })
        } else {
            ___url = "/unpublish/page/" + $(this)[0].getAttribute('data-vanity-url') + "/"
            $.ajax({
                type: "POST",
                url: ___url,
                success: function (action) {
                    $('.publish-page').html('PUBLISH');
                    $('.publish-status').html('UNPUBLISHED');
                }
            })
        }
    });


    // Story DOM Events
    ////////////////////

    $('.ui-icon-close').click(function () {
        $('.story-container').css('display:hide')
    });

    $('body').on('click', '.story-collapsed-heading', function (e) {
        e.preventDefault();
        console.log($(this).parent().next());
        $(this).next().slideDown();
        $(this).removeClass('story-collapsed-heading');
        $(this).addClass('story-opened-heading');
    });

    $('body').on('click', '.story-opened-heading', function (e) {
        e.preventDefault();
        $(this).next().slideUp();
        $(this).removeClass('story-opened-heading');
        $(this).addClass('story-collapsed-heading');
    });

    $('.story-publish-button').click(function (e) {
        e.preventDefault();
        button = $(this);
        if (button[0].innerText == 'PUBLISH') {
            ___url = "/publish/story/" + button[0].getAttribute('data-id') + "/"
            $.ajax({
                type: "POST",
                url: ___url,
                success: function (action) {
                    button.html('UNPUBLISH');
                    $('#' + button[0].getAttribute('data-id')).html('Published');
                }
            })
        } else {
            ___url = "/unpublish/story/" + $(this)[0].getAttribute('data-id') + "/"
            $.ajax({
                type: "POST",
                url: ___url,
                success: function (action) {
                    button.html('PUBLISH');
                    $('#' + button[0].getAttribute('data-id')).html('Saved');
                }
            })
        }
    });

    // Connection Functions
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

    // category change event should change all colors to current type
    $('#main-stub .entry-type-select').change(function () {
        var t = $(this).children('option:selected').text().toLowerCase();
        changeColorsForType(t);
        changeDateFieldsForType(t);
    });

    // Helper Text Show/Unshow
    ///////////////////////////
    $('.need-helper').focus(function () {
        $(this).siblings('.helper-popups').fadeIn();
    }).focusout(function () {
        $(this).siblings('.helper-popups').fadeOut();
    });
});

