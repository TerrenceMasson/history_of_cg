$(function () {
    var $dialog = $('<div></div>')
        .html('')
        .dialog({
            autoOpen: false,
            modal: true,
            show: 'fadeIn',
            title: '',
            maxHeight: 1000,
            maxWidth: 2000,
            width: 600
        });


    $('.opener').click(function () {
        var story = $(this)[0];
        var container = $(this).parent('.tile');

        console.log(container);

        function reset_buttons() {
            var buttons = {};
            if (container[0].previousElementSibling && container[0].previousElementSibling.getAttribute('class').indexOf('dynamic') == -1) {
                buttons["<"] = function () {
                    console.log('previous button');
                    container = container.prev();
                    if (container.hasClass('story-image')) {
                        $dialog.html('<img style="width:590px;" src=' + container[0].getAttribute('data-image') + '>');
                    }
                    if (container.hasClass('story-video')) {
                        $dialog.html('<div class="container"><embed src="http://www.youtube.com/v/' + container[0].getAttribute('data-video') + '" type="application/x-shockwave-flash" width="590px" height="443" allowscriptaccess="always"></div>');
                    }
                    if (container.hasClass('story-text')) {
                        $dialog.html('<div class="container"><span>' + container[0].getAttribute('data-full-text') + '</span></div>');
                    }
                    $dialog.dialog("option", "title", container.innerText);
                    $dialog.dialog("option", "position", {my: "center", at: "center", of: window});
                    $dialog.dialog('option', 'buttons', reset_buttons());
                };
            }
            buttons["X"] = function () {
                $dialog.dialog("close");
            };
            if (container[0].nextElementSibling && container[0].nextElementSibling.getAttribute('class').indexOf('connection') == -1) {
                buttons[">"] = function () {
                    console.log('next button');
                    container = container.next();
                    if (container.hasClass('story-image')) {
                        $dialog.html('<img style="width:590px;" src=' + container[0].getAttribute('data-image') + '>');
                    }
                    if (container.hasClass('story-video')) {
                        $dialog.html('<div class="container"><embed src="http://www.youtube.com/v/' + container[0].getAttribute('data-video') + '" type="application/x-shockwave-flash" width="590px" height="443" allowscriptaccess="always"></div>');
                    }
                    if (container.hasClass('story-text')) {
                        $dialog.html('<div class="container"><span>' + container[0].getAttribute('data-full-text') + '</span></div>');
                    }
                    $dialog.dialog("option", "title", 'Story story_id of story_total');
                    $dialog.dialog("option", "position", {my: "center", at: "center", of: window});
                    $dialog.dialog('option', 'buttons', reset_buttons());
                };
            }

            return buttons;
        }

        if (container.hasClass('story-image')) {
            $dialog.html('<div class="container"><img style="width:590px;" src=' + container[0].getAttribute('data-image') + '></div>');
        }
        if (container.hasClass('story-video')) {
            $dialog.html('<div class="container"><embed src="http://www.youtube.com/v/' + container[0].getAttribute('data-video') + '" type="application/x-shockwave-flash" width="590px" height="443" allowscriptaccess="always"></div>');
        }
        if (container.hasClass('story-text')) {
            $dialog.html('<div class="containter"><span style="width:590px;">' + container[0].getAttribute('data-full-text') + '</span></div>');
        }
        console.log('entry filled');

        $dialog.dialog("option", "title", 'Story story_id of story_total');
        $dialog.dialog('option', 'buttons', reset_buttons());
        console.log('buttons drawn');
        $dialog.dialog('open');
        // prevent the default action, e.g., following a link
        return false;
    });

    function toggleSignupForm(signup) {
        if (signup) {
            $('#login_box .form-container').load('/templates/signup.html');
            $('#login_box .signup-or-login')
                .removeClass('login')
                .children('a').html(buttonText.signupOrLogin.signup);
        }
        else {
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
