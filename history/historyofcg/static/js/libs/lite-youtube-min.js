(function (a) {
    function c(b) {
        var c = b.id;
        var d = b.style.width;
        var e = b.style.height;
        var f = a(document.createElement("img"));
        f.attr({"class": "lazy", "data-original": "http://img.youtube.com/vi/" + c + "/0.jpg", width: d, height: e});
        f.css({position: "relative", top: "0", left: "0"});
        f.lazyload();
        var g = a(document.createElement("a"));
        g.href = "#";
        var h = a('<img class="lite" src="http://lh4.googleusercontent.com/-QCeB6REIFlE/TuGUlY3N46I/AAAAAAAAAaI/9-urEUtpKcI/s800/youtube-play-button.png" />');
        var i = parseInt(d) / 2 - 71 / 2;
        var j = parseInt(e) / 2 - 51 / 2;
        h.attr("style", "position: absolute; left: " + i + "px; top: " + j + "px;");
        a(b).append(g.append(f, h));
        g.click(function () {
            var b = this.parentNode;
            a(b).replaceWith('<embed src="http://www.youtube.com/v/' + b.id + '?version=3&autoplay=1" type="application/x-shockwave-flash" width="' + b.style.width + '" height="' + b.style.height + '" allowscriptaccess="always"></embed>');
            return false
        });
        a.ajax({url: "http://gdata.youtube.com/feeds/api/videos/" + c + "?v=2&fields=id,title&alt=json", dataType: "json", success: function (b) {
            a(document.getElementById(b.entry.id.$t.split(":")[3])).append('<div style="position:relative;margin:-' + e + ' 5px;padding:5px;background-color:rgba(0,0,0,0.3);-moz-border-radius:7px;-webkit-border-radius:7px;border-radius:7px"><span style="font-weight:bold;font-size:16px;color:#ffffff;font-family:sans-serif;text-align:left;">' + b.entry.title.$t + "</span></div>")
        }})
    }

    function b() {
        a(".lite").each(function () {
            c(this)
        });
        return false
    }

    a.fn.YTLite = function () {
        return this.each(function () {
            c(this)
        })
    };
    a(function () {
        b()
    })
})(jQuery)
