$(document).ready(function(){

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
        beforeSend: function(xhr, settings) {
            if (!csrfSafeMethod(settings.type)) {
                xhr.setRequestHeader("X-CSRFToken", csrftoken);
            }
        }
    });

    $('.publish-page').click(function() {
        console.log($(this));
        if ($(this)[0].innerText == 'PUBLISH') {
            ___url = "/publish/page/"+$(this)[0].getAttribute('data-vanity-url')+"/"
            $.ajax({
                type: "POST",
                url: ___url,
                success: function(action) {
                    $('.publish-page').html('UNPUBLISH');
                    $('.publish-status').html('PUBLISHED');
                }
            })
        } else {
            ___url = "/unpublish/page/"+$(this)[0].getAttribute('data-vanity-url')+"/"
            $.ajax({
                type: "POST",
                url: ___url,
                success: function(action) {
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
            url : story_toggler[0].getAttribute('data-href'),
            dataType : 'html',
            async : true
        }).done(function(content, status, xhr) {
            if (content) {
                $('.story-container').html(content).removeClass('hide')
            }
        });
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

    $('.ui-icon-close').click(function() {
        $('.story-container').css('display:hide')
    });

    $('#TextStorySaveForm').submit(function(e) {
        $.ajax({
            data: $(this).serialize(), // get the form data
            type: $(this).attr('method'), // GET or POST
            url: $(this).attr('action'), // the file to call
            success: function(action) {
                $('.story-save-button').html('SAVED');
            }
        });
        return false;
    });

    $('p.story-collapsed-heading').click(function(e) {
        e.preventDefault();
        console.log($(this).next());
        $(this).next().slideDown();
        $(this).removeClass('story-collapsed-heading');
        $(this).addClass('story-opened-heading');
    });

    $('.story-publish-button').click(function(e) {
        e.preventDefault();
        button = $(this);
        if ($(this)[0].innerText == 'PUBLISH') {
            ___url = "/publish/story/"+$(this)[0].getAttribute('data-id')+"/"
            $.ajax({
                type: "POST",
                url: ___url,
                success: function(action) {
                    console.log($(this));
                    button.html('UNPUBLISH');
                    $('.info').html('Published');
                }
            })
        } else {
            ___url = "/unpublish/story/"+$(this)[0].getAttribute('data-id')+"/"
            $.ajax({
                type: "POST",
                url: ___url,
                success: function(action) {
                    button.html('PUBLISH');
                    $('.info').html('Saved');
                }
            })
        }
    });

    $('.connect-entries-button').click(function(e) {
        e.preventDefault();
        button = $(this);
        url = "/add/connection/"+button[0].getAttribute('data-vanity-url')+"/"+$( "#connectionSearchBox")[0].value+"/";
        $.ajax({
            type: "POST",
            url: url,
            success: function(action) {
                window.location = "/edit/page/"+button[0].getAttribute('data-vanity-url');
            }
        })
    });

    $('.delete').click(function(e) {
        e.preventDefault();
        button = $(this);
        url = "/remove/connection/"+button[0].getAttribute('data-vanity-url')+"/"+button[0].getAttribute('data-name')+"/";
        $.ajax({
            type: "POST",
            url: url,
            success: function(action) {
                window.location = "/edit/page/"+button[0].getAttribute('data-vanity-url');
            }
        })
    });
});

$(function() {
    // stupid
    var dateInfo = {
        'project': {
            'dateLabel': 'Date',
            'helperText': 'When did this project take place?'
        },
        'person': {
            'dateLabel': 'Birth date',
            'helperText': 'When was this person born?',
            'secondDateLabel': 'Deceased date',
            'secondHelperText': 'When did this person DIE!?',
            'secondDateCheckboxLabel': 'This person is deceased'
        },
        'organization': {
            'dateLabel': 'Established Date',
            'helperText': 'When was this organization founded?',
            'secondDateLabel': 'Closing Date',
            'secondHelperText': 'When did this organization close?',
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
        allBorderFields.addClass(color+'-border');

        allHoverFields.removeClass('project-hover person-hover organization-hover event-hover none-hover');
        allHoverFields.addClass(color+'-hover');
    }

    function change_colors_with(t) {
        if(t.indexOf('project') !== -1) {
            change_colors('project');
        }
        else if(t.indexOf('person') !== -1) {
            change_colors('person');
        }
        else if(t.indexOf('organization') !== -1) {
            change_colors('organization');
        }
        else if(t.indexOf('event') !== -1) {
            change_colors('event');
        }
        else {
            change_colors('none');
        }
    }

    function change_date_fields(t) {
        var $dateLabel = $('.basics .label-entry-date span.label');
        var $dateHelperText = $('.basics .entry-date .helper-popups');
        var $secondDateLabel = $('.basics .label-entry-date-2 span.label');
        var $secondDateHelperText = $('.basics .entry-date-2 .helper-popups');
        var $secondDateCheckboxLabel = $('.basics .entry-date-2-selected label');
        var $secondDate = $('.basics .entry-date-2');
        var $secondDateCheckbox = $('.basics #entry-date-selected');

        // date 1 section
        $dateLabel.html(dateInfo[t].dateLabel);
        $dateHelperText.html(dateInfo[t].helperText);
    }

    function change_date_fields_with(t) {
        if(t.indexOf('project') !== -1) {
            change_date_fields('project');
        }
        else if(t.indexOf('person') !== -1) {
            change_date_fields('person');
        }
        else if(t.indexOf('organization') !== -1) {
            change_date_fields('organization');
        }
        else if(t.indexOf('event') !== -1) {
            change_date_fields('event');
        }
        else {
            change_date_fields('none');
        }
    }

    function init() {
        // Initialize color change
        var initialEntryType = $('#main-stub .entry-type-select').children('option:selected').text().toLowerCase();

        change_colors_with(initialEntryType);
        change_date_fields_with(initialEntryType);

        // category change event should change all colors to current type
        $('#main-stub .entry-type-select').change(function() {
            var t = $(this).children('option:selected').text().toLowerCase();

            change_colors_with(t);
            change_date_fields_with(t);
        });

        // ----------------- DATEPICKER -----------------
        $("#entry-date-box-1").datepicker({
          altField: '#entry-date-box-1-helper',
          altFormat:'yy-mm-dd',
          changeMonth: true,
          changeYear: true,
          minDate: new Date(1940, 1 - 1, 1),
          yearRange: '1940:c',
          onSelect: function( selectedDate ) {
            var option = "minDate",
                instance = $( this ).data( "datepicker" ),
                date = $.datepicker.parseDate(
                  instance.settings.dateFormat ||
                  $.datepicker._defaults.dateFormat,
                  selectedDate, instance.settings );
            $('#entry-date-box-2').datepicker( "option", option, date );

            // select the second date automatically if shown.
            if($('.basics #entry-date-selected').is(':checked')) {
              $('#entry-date-box-2').val(selectedDate);
            }
          },
          minDate: new Date(1940, 1 - 1, 1)
        });
        $("#entry-date-box-2").datepicker({
          altField: '#entry-date-box-2-helper',
          altFormat:'yy-mm-dd',
          changeMonth: true,
          changeYear: true,
          minDate: new Date(1940, 1 - 1, 1),
          yearRange: '1940:c',
          onSelect: function( selectedDate ) {
            var option = "maxDate",
                instance = $( this ).data( "datepicker" ),
                date = $.datepicker.parseDate(
                  instance.settings.dateFormat ||
                  $.datepicker._defaults.dateFormat,
                  selectedDate, instance.settings );
            $('#entry-date-box-1').datepicker( "option", option, date );
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
