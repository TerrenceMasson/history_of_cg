
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

Hist.initColorsAndDate = function() {
    // Initialize color change
    var initialEntryType = $('#main-stub .entry-type-select').children('option:selected').text().toLowerCase();
    changeColorsForType(initialEntryType);
    Hist.DateHandler.changeDateFieldsForType(initialEntryType);
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

Hist.TokenInput = function() {
    var inputValue = "";

    var postNewTag = function(e) {
        // If the input value isn't blank then post the new Tag name to the server
        // and then add it to the dom via $.tokenInput#add
        if (inputValue != "") {
            $.post("/add/tag/", { "tag_name": inputValue }, function(data, other, other1) {
                $('input.tokeninput').tokenInput("add", { id: data[0].pk, name: data[0].fields.name });
            });
        }
        return false;
    }
    var addCreateButton = function() {
        var createButton = $('<button>')
                        .addClass('add-tag-button')
                        .text('Create')
                        .on('click', postNewTag);
        $('.entry-tags').append(createButton);
    }

    return {
        init: function() {
            $("input.tokeninput").each(function () {
                var $field = $(this), 
                    options = $field.data("settings");
                options.onReady = addCreateButton;
                $field.tokenInput($field.data("search-url"), options);
            });

            // Grab the input value before InputToken wipes it out. 
            // Uses jQuery preBind addition from common.js
            $('.token-input-input-token-hcg input').preBind('blur', function(e) {
                inputValue = $(this).val();
            });
        },
    };
}();

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

    // Validation
    //////////////
    var validateStory = function($form) {
        var errors = [],
            type = $form.data('type');
        // Always check for a title, since it's always required
        if ($form.find('.story-title input').val().isEmpty()) {
            errors.push("The story title is required.");
        }
        
        // Check for the individual story types required fields
        if (type === "text") {
            var $storyField = $form.find('.story-body textarea');
            if ($storyField.val().isEmpty()) {
                errors.push("The story body is required.");
            }
        } else if (type === "image" || type === "video") {
            var $urlField = $form.find('.story-url input');
            if ($urlField.val().isEmpty()) {
                errors.push("The URL for the story is required.")
            }
        }
        return errors;
    }

    // Error Handling
    //////////////////

    var showErrors = function($form, errors) {
        var $errors = $form.find('.errors');
        $.each(errors, function(index, error) {
            $errors.append("<li> " + error + " </li>");
        });
    }

    var clearErrors = function($form) {
        $form.find('.errors').html('');
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

    var resetForm = function($form) {
        var $chosenSelects = $form.find('.chosen-select');
        $.each($chosenSelects, function(index, select) {
            var $select = $(select);
            $select.val('').trigger('chosen:updated');
        });
        $form[0].reset();
    }

    // AJAX
    ////////
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
        });
    }

    var submitForm = function(form, isNewStory) {
        var $form = $(form),
            errors = validateStory($form);
        clearErrors($form);
        if (errors.length != 0) {
            // Show errors and return
            showErrors($form, errors);
            return false;
        }
        $.ajax({
            data: $form.serialize(),
            type: "POST",
            url:  $form.attr('action'),
            success: function (data, textStatus, jqXHR) {
                if (isNewStory) {
                    // Add the newly saved story to the DOM
                    $('.edit-story-container').append(data);
                    resetForm($form);
                    Hist.initChosen();
                } else {
                    // TODO: Doing nothing, but we should show a success message
                    console.log("Story was successfully edited");
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                var response = JSON.parse(jqXHR.responseText),
                    errors = [],
                    value;
                for (var key in response) {
                    value = response[key].join(' ');
                    errors.push(value);
                }
                showErrors($form, errors);
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
            $('.stories-col').on('click', '.story-save-button', function(e) {
                submitForm($(this).closest('form'), true);
                return false;
            });
            $('.stories-col').on('click', '.story-edit-button', function(e) {
                submitForm($(this).closest('form'), false);
                return false;
            });
            // Show New Story
            $('.new-story-button').on('click', function(e) {
                $('.new-story-container').show();
            });
            // Open/Collapse Story
            $('.stories-col').on('click', '.story-collapsed-heading, .story-opened-heading', function(e) {
                toggleStoryHeader(this);
            });
        }
    }
}();
Hist.StoryForm = StoryForm;

Hist.ConnectEntries = function() {
    var currentPageId,
        currentPageVanity;

    var modifyConnectionWithEntry = function(connecteeId, isAddConnection) {
        var type = isAddConnection ? "add" : "remove",
            url = "/" + type + "/connection/" + currentPageId + "/" + connecteeId + "/";
        $.ajax({
            type: "POST",
            url: url,
            success: function (action) {
                window.location = "/edit/page/" + currentPageVanity;
            }
        });
    }

    var initAutoComplete = function() {
        // Get pagename
        var path = window.location.pathname;
        var pagename = path.substring(path.lastIndexOf("/") + 1)
        pagename = pagename.toLowerCase();

        $('#connectionSearchBox').autocomplete({
            source: "/get/pages/",
            minLength: 1,
            focus: function (event, ui) {
                $("#connectionSearchBox").val(ui.item['name']);
                $("#connectionSearchBox").data('id', ui.item['id']);
                return false;
            },
            select: function (event, ui) {
                $("#connectionSearchBox").val(ui.item['name']);
                $("#connectionSearchBox").data('id', ui.item['id']);
                return false;
            }
        }).data("autocomplete")._renderItem = function (ul, item) {
            var re = new RegExp(this.term, "i");
            var match = item.name.match(re);
            var t = item['name'].replace(re, "<span class='autocomplete-name-term-highlight'>" + match + "</span>");
            var innerContent = "<a><span class='autocomplete-name'>" + t + "</span><span class='autocomplete-category-box " + item['type'] + "'></span>";

            if (pagename === "") {
                innerContent += "<span class='autocomplete-category " + item['type'] + "'>" + item['type'].toUpperCase() + "</span>";
            }

            innerContent += "</a>";

            return $("<li></li>").data("item.autocomplete", item)
            .append(innerContent)
            .appendTo(ul);
        };
    }

    return {
        init: function() {
            // Init the jQuery autocomplete plugin on the connection entries search box
            initAutoComplete();

            // Setup Connect Entries State
            currentPageId = $('#entry_edit_form').data('id');
            currentPageVanity = $('#entry_edit_form').data('vanity-url');

            // Register Dom events
            $('.connect-entries-button').click(function (e) {
                e.preventDefault();
                modifyConnectionWithEntry($('#connectionSearchBox').data('id'), true);
            });

            $('.connections .delete').click(function (e) {
                modifyConnectionWithEntry($(this).data('id'), false);
            });

            // TODO: I don't feel like dealing with stlying issues right now, but
            // somebody reinvented the a tag here and yeah.. should change that.
            // $('.connections .name').click(function(e) {
            //     window.location = "/pages/" + $(this).data('vanity-url');
            // });
        }
    }
}();

$(document).ready(function () {

    // Init All The Things!
    ///////////////////////
    Hist.initCSRF();
    Hist.initColorsAndDate();
    Hist.initChosen();
    Hist.initTabs();
    Hist.TokenInput.init();
    Hist.StoryForm.init();

    // If this screen isn't the edit screen then no need to init this.
    if ($('#connectionSearchBox').length !== 0) {
        Hist.ConnectEntries.init();
    }

    // DOM Events
    //////////////

    // Change Color for page on select change
    $('#main-stub .entry-type-select').change(function () {
        var type = $(this).children('option:selected').text().toLowerCase();
        changeColorsForType(type);
        Hist.DateHandler.changeDateFieldsForType(type);
    });

    // Publish/Unpublish Page/Story
    $('.form-container').on('click', '.publish-page', function (e) {
        var $button = $(this),
            identifier = $button.data('vanity-url');
        if ($button.text().contains("unpublish", true)) {
            Hist.unpublishForType(PAGE_TYPE, identifier);
        } else if ($button.text().contains("publish", true)) {
            Hist.publishForType(PAGE_TYPE, identifier);
        }
        return false;
    });
    $('.stories-col').on('click', '.story-publish-button', function(e) {
        var $button = $(this),
            identifier = $button.data('id');
        if ($button.text().contains("unpublish", true)) {
            Hist.unpublishForType(STORY_TYPE, identifier, $button);
        } else if ($button.text().contains("publish", true)) {
            Hist.publishForType(STORY_TYPE, identifier, $button);
        }
        return false;
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
