// String Additions
////////////////////
String.prototype.contains = function(substring, ignoreCase) {
    var lowerSubString = substring.toLowerCase(),
        lowerThis = this.toLowerCase();
    if (ignoreCase) {
        return lowerThis.indexOf(lowerSubString) > -1;
    } else {
        return this.indexOf(substring) > -1;
    }
}
String.prototype.isEmpty = function() {
    return this.trim() === "";
}

$(document).ready(function(){
    $('.tile.story-image').nivoLightbox();
});

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
