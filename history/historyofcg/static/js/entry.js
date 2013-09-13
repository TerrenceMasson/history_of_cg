var Hist = Hist || {}

Hist.initChosen = function() {
    // Init Chosen Selects
    if (jQuery().chosen) {
        console.log("Chosen found.")
        $('.chosen-select').chosen({ width: "15%", disable_search_threshold: 32 });
    }
}

$(document).ready(function () {

    // using jQuery
    function getCookie(name) {
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

    var csrftoken = getCookie('csrftoken');

    function csrfSafeMethod(method) {
        // these HTTP methods do not require CSRF protection
        return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));
    }

    $.ajaxSetup({
        crossDomain: false, // obviates need for sameOrigin test
        beforeSend: function (xhr, settings) {
            if (!csrfSafeMethod(settings.type)) {
                xhr.setRequestHeader("X-CSRFToken", csrftoken);
            }
        }
    });

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

    story_toggler = $('.btn-story');

    function showStoryForm(e) {
        story_toggler.addClass('loading');
        $.ajax({
            url: story_toggler[0].getAttribute('data-href'),
            dataType: 'html',
            async: true
        }).done(function (content, status, xhr) {
                if (content) {
                    $('.story-container').html(content).removeClass('hide')
                    // Style the date picker with Chosen
                    Hist.initChosen();
                }
            });
        story_toggler.removeClass('loading');
    }

    function handleStoryClick(e) {
        e.preventDefault();
        if (story_toggler.hasClass('disabled') === false) {
            story_toggler.addClass('disabled');
            showStoryForm();
        }
    }

    if (story_toggler.length) {
        story_toggler.on('click', handleStoryClick);
    }

    $('.ui-icon-close').click(function () {
        $('.story-container').css('display:hide')
    });

    $('#TextStorySaveForm').submit(function (e) {
        $.ajax({
            data: $(this).serialize(), // get the form data
            type: $(this).attr('method'), // GET or POST
            url: $(this).attr('action'), // the file to call
            success: function (action) {
                $('.story-save-button').html('SAVED');
            }
        });
        return false;
    });

    $('body').on('ready', '.tabs-min', function () {
        print('loaded');
        $(this).tabs('enable');
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

    $('p.story-collapsed-heading span.delete').click(function (e) {
        e.preventDefault();
        button = $(this);
        url = "/delete/story/" + button[0].getAttribute('data-story-id') + "/";
        $.ajax({
            type: "POST",
            url: url,
            success: function (action) {
                window.location = "/edit/page/" + button[0].getAttribute('data-vanity-url');
            }
        })
    });

    $('p.story-opened-heading span.delete').click(function (e) {
        e.preventDefault();
        button = $(this);
        url = "/delete/story/" + button[0].getAttribute('data-story-id') + "/";
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

    function cycle_vote_color(button) {
        console.log(button.hasClass("no-vote"));
        if (button.hasClass("no-vote")) {
            button.removeClass("no-vote");
            button.addClass("up-vote");
            button.unbind('click');
            button.click(function (e) {
                e.preventDefault();
                button = $(this);
                url = "/vote/down/" + button[0].getAttribute('data-story-id') + "/";
                $.ajax({
                    type: "POST",
                    url: url,
                    success: function (action) {
                        cycle_vote_color(button);
                    }
                })
            });
        }
        else if (button.hasClass("up-vote")) {
            button.removeClass("up-vote");
            button.addClass("down-vote");
            button.unbind('click');
            button.click(function (e) {
                e.preventDefault();
                button = $(this);
                url = "/vote/none/" + button[0].getAttribute('data-story-id') + "/";
                $.ajax({
                    type: "POST",
                    url: url,
                    success: function (action) {
                        cycle_vote_color(button);
                    }
                })
            });
        }
        else if (button.hasClass("down-vote")) {
            button.removeClass("down-vote");
            button.addClass("no-vote");
            button.unbind('click');
            button.click(function (e) {
                e.preventDefault();
                button = $(this);
                url = "/vote/up/" + button[0].getAttribute('data-story-id') + "/";
                $.ajax({
                    type: "POST",
                    url: url,
                    success: function (action) {
                        cycle_vote_color(button);
                    }
                })
            });
        }
    }

    $('.no-vote').click(function (e) {
        e.preventDefault();
        button = $(this);
        url = "/vote/up/" + button[0].getAttribute('data-story-id') + "/";
        $.ajax({
            type: "POST",
            url: url,
            success: function (action) {
                cycle_vote_color(button);
            }
        })
    });

    $('.up-vote').click(function (e) {
        e.preventDefault();
        button = $(this);
        url = "/vote/down/" + button[0].getAttribute('data-story-id') + "/";
        $.ajax({
            type: "POST",
            url: url,
            success: function (action) {
                cycle_vote_color(button);
            }
        })
    });

    $('.down-vote').click(function (e) {
        e.preventDefault();
        button = $(this);
        url = "/vote/none/" + button[0].getAttribute('data-story-id') + "/";
        $.ajax({
            type: "POST",
            url: url,
            success: function (action) {
                cycle_vote_color(button);
            }
        })
    });
});

$(function () {
    // stupid
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

    function change_colors(color) {
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

    function change_colors_with(t) {
        if (t.indexOf('project') !== -1) {
            change_colors('project');
        }
        else if (t.indexOf('person') !== -1) {
            change_colors('person');
        }
        else if (t.indexOf('organization') !== -1) {
            change_colors('organization');
        }
        else if (t.indexOf('event') !== -1) {
            change_colors('event');
        }
        else {
            change_colors('none');
        }
    }

    function change_date_fields(t) {
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

    function show_deceased_fields() {
        $('.label-entry-date-2').show();
        $('.entry-date-2').show();
    }

    function hide_deceased_fields() {
        $('.label-entry-date-2').hide();
        $('.entry-date-2').hide();
    }

    function change_date_fields_with(t) {
        if (t.indexOf('project') !== -1) {
            hide_deceased_fields();
            change_date_fields('project');
        }
        else if (t.indexOf('person') !== -1) {
            show_deceased_fields();
            change_date_fields('person');
        }
        else if (t.indexOf('organization') !== -1) {
            show_deceased_fields();
            change_date_fields('organization');
        }
        else if (t.indexOf('event') !== -1) {
            hide_deceased_fields();
            change_date_fields('event');
        }
        else {
            hide_deceased_fields();
            change_date_fields('none');
        }
    }

    function init() {
        // Initialize color change
        var initialEntryType = $('#main-stub .entry-type-select').children('option:selected').text().toLowerCase();

        change_colors_with(initialEntryType);
        change_date_fields_with(initialEntryType);

        // category change event should change all colors to current type
        $('#main-stub .entry-type-select').change(function () {
            var t = $(this).children('option:selected').text().toLowerCase();
            change_colors_with(t);
            change_date_fields_with(t);
        });

        Hist.initChosen();

        // ----------------- DATEPICKER -----------------
        $("#entry-date-box-1").datepicker({
            altField: '#entry-date-box-1-helper',
            altFormat: 'yy-mm-dd',
            changeMonth: true,
            changeYear: true,
            minDate: new Date(1940, 1 - 1, 1),
            yearRange: '1940:c',
            onSelect: function (selectedDate) {
                var option = "minDate",
                    instance = $(this).data("datepicker"),
                    date = $.datepicker.parseDate(
                        instance.settings.dateFormat ||
                            $.datepicker._defaults.dateFormat,
                        selectedDate, instance.settings);
                $('#entry-date-box-2').datepicker("option", option, date);

                // select the second date automatically if shown.
                if ($('.basics #entry-date-selected').is(':checked')) {
                    $('#entry-date-box-2').val(selectedDate);
                }
            },
            minDate: new Date(1940, 1 - 1, 1)
        });
        $("#entry-date-box-2").datepicker({
            altField: '#entry-date-box-2-helper',
            altFormat: 'yy-mm-dd',
            changeMonth: true,
            changeYear: true,
            minDate: new Date(1940, 1 - 1, 1),
            yearRange: '1940:c',
            onSelect: function (selectedDate) {
                var option = "maxDate",
                    instance = $(this).data("datepicker"),
                    date = $.datepicker.parseDate(
                        instance.settings.dateFormat ||
                            $.datepicker._defaults.dateFormat,
                        selectedDate, instance.settings);
                $('#entry-date-box-1').datepicker("option", option, date);
            }
        });

        // ----------------- HELPER TEXTS - basics
        $('.need-helper')
            .focus(function () {
                $(this).siblings('.helper-popups').fadeIn();
            })
            .focusout(function () {
                $(this).siblings('.helper-popups').fadeOut();
            });
    }

    init();
});
