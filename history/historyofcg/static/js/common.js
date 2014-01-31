var Hist = Hist || {};

$(document).ready(function() {
    Hist.Notifications.init();
    if (Hist.TL) { Hist.TL.init(); }
});

// jQuery Additions
////////////////////

// Prebind - Bind before other events. 
// Snagged from http://stackoverflow.com/questions/6029251/jquery-bind-event-listener-before-another
$.fn.preBind = function (type, data, fn) {
    this.each(function () {
        var $this = $(this);
        $this.bind(type, data, fn);

        var currentBindings = $._data(this, "events")[type];
        if ($.isArray(currentBindings)) {
            currentBindings.unshift(currentBindings.pop());
        }
    });
    return this;
};

// Notifications
/////////////////

Hist.Notifications = (function() {

    var showNotification = function(selector, message) {
        closeNotificatons();
        $notification = $(selector);
        $notification.children('.content').html(message);
        $notification.fadeIn();
        setTimeout(function() {
            $notification.fadeOut();
        }, 5500);
    }

    var closeNotificatons = function() {
        $('.notification').fadeOut();
    }

    return {
        error: function(message) {
            showNotification('.notification.error', message);
        },
        success: function(message) {
            showNotification('.notification.success', message);
        },
        init: function() {
            $(window).scroll(function(){
                $(".notification").stop()
                .animate({ "marginTop": ($(window).scrollTop()) + "px",
                           "marginLeft":($(window).scrollLeft()) + "px"},
                           "fast");
            });
            $('.notification .close').on('click', closeNotificatons);
        }
    }
})();

// Date field handling
///////////////////////

Hist.DateHandler = function() {
    // TODO: This DateInfo object is off for some of the categories (orgs at least)
    // Needs to be refactored
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
            'secondHelperText': 'Closing Date',
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

    var showDeceased = function() {
        $('.label-entry-date-2').show();
        $('.entry-date-2').show();
    }
    var hideDeceased = function() {
        $('.label-entry-date-2').hide();
        $('.entry-date-2').hide();
    }

    var changeDateFields = function(type) {
        var $dateLabel = $('.basics .label-entry-date');
        var $dateHelperText = $('.basics .entry-date .helper-popups');
        var $secondDateLabel = $('.basics .label-entry-date-2');
        var $secondDateHelperText = $('.basics .entry-date-2 .helper-popups');
        var $secondDateCheckboxLabel = $('.basics .entry-date-2-selected label');
        var $secondDate = $('.basics .entry-date-2');
        var $secondDateCheckbox = $('.basics #entry-date-selected');
        var $tertiaryDateLabel = $('.basics .label-entry-date-3');
        $dateLabel.html(dateInfo[type].dateLabel);
        $dateHelperText.html(dateInfo[type].helperText);
        $secondDateLabel.html(dateInfo[type].secondDateLabel);
        $tertiaryDateLabel.html(dateInfo[type].secondHelperText);
    }

    return {
        changeShowPageLabels: function() {
            var type = $('.entry_title').data('type').toLowerCase(),
                $establishedLabel = $('#date_established'),
                $deceasedLabel    = $('#date_deceased'),
                deceasedText      = dateInfo[type]['secondDateLabel'];
            // Remove ?'s --- Hack til the DateInfo object is fixed up.
            if (deceasedText) { deceasedText = deceasedText.replace(/\?/,''); }
            $establishedLabel.html(dateInfo[type]['dateLabel'] + ':');
            $deceasedLabel.html(deceasedText + ':');
        },
        changeDateFieldsForType: function(type) {
            if (type.indexOf('project') !== -1) {
                hideDeceased();
                changeDateFields('project');
            } else if (type.indexOf('person') !== -1) {
                showDeceased();
                changeDateFields('person');
            } else if (type.indexOf('organization') !== -1) {
                showDeceased();
                changeDateFields('organization');
            } else if (type.indexOf('event') !== -1) {
                hideDeceased();
                changeDateFields('event');
            } else {
                hideDeceased();
                changeDateFields('none');
            }
        }
    }
}();

$(function () {

    function toggleSignupForm(signup) {
        if (signup) {
            $('#login_box .form-container').load('/templates/signup.html');
            $('#login_box .signup-or-login')
                .removeClass('login')
                .children('a').html(buttonText.signupOrLogin.signup);
        } else {
            $('#login_box .form-container').load('/templates/login.html');
            $('#login_box .signup-or-login')
                .addClass('login')
                .children('a').html(buttonText.signupOrLogin.login);
        }
    }

    if ($('#login_button')) {
        $('#login_box .form-container').load('/templates/login.html');
    }

    var $timeline = $('.timeline');
    var $tooltip = $('.timeline .tooltip');
    if ($timeline) {
        $timeline.hover(
            function () {
                $tooltip.stop(true, true).fadeIn('fast');
            },
            function () {
                $tooltip.stop(true, true).fadeOut('fast');
            });
        $(document).mousemove(function (e) {
            $tooltip.css({
                left: e.pageX,
                top: e.pageY
            });
        });
    }
});
