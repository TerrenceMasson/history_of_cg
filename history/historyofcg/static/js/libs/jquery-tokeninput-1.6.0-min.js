/*
 * jQuery Plugin: Tokenizing Autocomplete Text Entry
 * Version 1.6.0
 *
 * Copyright (c) 2009 James Smith (http://loopj.com)
 * Licensed jointly under the GPL and MIT licenses,
 * choose which one suits your project best!
 *
 */
(function (a) {
    var b = {method: "GET", contentType: "json", queryParam: "q", searchDelay: 300, minChars: 1, propertyToSearch: "name", jsonContainer: null, hintText: "Type in a search term", noResultsText: "No results", searchingText: "Searching...", deleteText: "&times;", animateDropdown: !0, tokenLimit: null, tokenDelimiter: ",", preventDuplicates: !1, tokenValue: "id", prePopulate: null, processPrePopulate: !1, idPrefix: "token-input-", resultsFormatter: function (a) {
        return"<li>" + a[this.propertyToSearch] + "</li>"
    }, tokenFormatter: function (a) {
        return"<li><p>" + a[this.propertyToSearch] + "</p></li>"
    }, onResult: null, onAdd: null, onDelete: null, onReady: null}, c = {tokenList: "token-input-list", token: "token-input-token", tokenDelete: "token-input-delete-token", selectedToken: "token-input-selected-token", highlightedToken: "token-input-highlighted-token", dropdown: "token-input-dropdown", dropdownItem: "token-input-dropdown-item", dropdownItem2: "token-input-dropdown-item2", selectedDropdownItem: "token-input-selected-dropdown-item", inputToken: "token-input-input-token"}, d = {BEFORE: 0, AFTER: 1, END: 2}, e = {BACKSPACE: 8, TAB: 9, ENTER: 13, ESCAPE: 27, SPACE: 32, PAGE_UP: 33, PAGE_DOWN: 34, END: 35, HOME: 36, LEFT: 37, UP: 38, RIGHT: 39, DOWN: 40, NUMPAD_ENTER: 108, COMMA: 188}, f = {init: function (c, d) {
        var e = a.extend({}, b, d || {});
        return this.each(function () {
            a(this).data("tokenInputObject", new a.TokenList(this, c, e))
        })
    }, clear: function () {
        return this.data("tokenInputObject").clear(), this
    }, add: function (a) {
        return this.data("tokenInputObject").add(a), this
    }, remove: function (a) {
        return this.data("tokenInputObject").remove(a), this
    }, get: function () {
        return this.data("tokenInputObject").getTokens()
    }};
    a.fn.tokenInput = function (a) {
        return f[a] ? f[a].apply(this, Array.prototype.slice.call(arguments, 1)) : f.init.apply(this, arguments)
    }, a.TokenList = function (b, f, g) {
        function x() {
            if (g.tokenLimit !== null && j >= g.tokenLimit) {
                n.hide(), H();
                return
            }
        }

        function y() {
            if (m === (m = n.val()))return;
            var a = m.replace(/&/g, "&amp;").replace(/\s/g, " ").replace(/</g, "&lt;").replace(/>/g, "&gt;");
            v.html(a), n.width(v.width() + 30)
        }

        function z(a) {
            return a >= 48 && a <= 90 || a >= 96 && a <= 111 || a >= 186 && a <= 192 || a >= 219 && a <= 222
        }

        function A(b) {
            var c = g.tokenFormatter(b);
            c = a(c).addClass(g.classes.token).insertBefore(t), a("<span>" + g.deleteText + "</span>").addClass(g.classes.tokenDelete).appendTo(c).click(function () {
                return F(a(this).parent()), o.change(), !1
            });
            var d = {id: b.id};
            return d[g.propertyToSearch] = b[g.propertyToSearch], a.data(c.get(0), "tokeninput", b), i = i.slice(0, q).concat([d]).concat(i.slice(q)), q++, G(i, o), j += 1, g.tokenLimit !== null && j >= g.tokenLimit && (n.hide(), H()), c
        }

        function B(b) {
            var c = g.onAdd;
            if (j > 0 && g.preventDuplicates) {
                var d = null;
                s.children().each(function () {
                    var c = a(this), e = a.data(c.get(0), "tokeninput");
                    if (e && e.id === b.id)return d = c, !1
                });
                if (d) {
                    C(d), t.insertAfter(d), n.focus();
                    return
                }
            }
            if (g.tokenLimit == null || j < g.tokenLimit)A(b), x();
            n.val(""), H(), a.isFunction(c) && c.call(o, b)
        }

        function C(a) {
            a.addClass(g.classes.selectedToken), p = a.get(0), n.val(""), H()
        }

        function D(a, b) {
            a.removeClass(g.classes.selectedToken), p = null, b === d.BEFORE ? (t.insertBefore(a), q--) : b === d.AFTER ? (t.insertAfter(a), q++) : (t.appendTo(s), q = j), n.focus()
        }

        function E(b) {
            var c = p;
            p && D(a(p), d.END), c === b.get(0) ? D(b, d.END) : C(b)
        }

        function F(b) {
            var c = a.data(b.get(0), "tokeninput"), d = g.onDelete, e = b.prevAll().length;
            e > q && e--, b.remove(), p = null, n.focus(), i = i.slice(0, e).concat(i.slice(e + 1)), e < q && q--, G(i, o), j -= 1, g.tokenLimit !== null && n.show().val("").focus(), a.isFunction(d) && d.call(o, c)
        }

        function G(b, c) {
            var d = a.map(b, function (a) {
                return a[g.tokenValue]
            });
            c.val(d.join(g.tokenDelimiter))
        }

        function H() {
            u.hide().empty(), r = null
        }

        function I() {
            u.css({position: "absolute", top: a(s).offset().top + a(s).outerHeight(), left: a(s).offset().left, zindex: 999}).show()
        }

        function J() {
            g.searchingText && (u.html("<p>" + g.searchingText + "</p>"), I())
        }

        function K() {
            g.hintText && (u.html("<p>" + g.hintText + "</p>"), I())
        }

        function L(a, b) {
            return a.replace(new RegExp("(?![^&;]+;)(?!<[^<>]*)(" + b + ")(?![^<>]*>)(?![^&;]+;)", "gi"), "<b>$1</b>")
        }

        function M(a, b, c) {
            return a.replace(new RegExp("(?![^&;]+;)(?!<[^<>]*)(" + b + ")(?![^<>]*>)(?![^&;]+;)", "g"), L(b, c))
        }

        function N(b, c) {
            if (c && c.length) {
                u.empty();
                var d = a("<ul>").appendTo(u).mouseover(function (b) {
                    O(a(b.target).closest("li"))
                }).mousedown(function (b) {
                    return B(a(b.target).closest("li").data("tokeninput")), o.change(), !1
                }).hide();
                a.each(c, function (c, e) {
                    var f = g.resultsFormatter(e);
                    f = M(f, e[g.propertyToSearch], b), f = a(f).appendTo(d), c % 2 ? f.addClass(g.classes.dropdownItem) : f.addClass(g.classes.dropdownItem2), c === 0 && O(f), a.data(f.get(0), "tokeninput", e)
                }), I(), g.animateDropdown ? d.slideDown("fast") : d.show()
            } else g.noResultsText && (u.html("<p>" + g.noResultsText + "</p>"), I())
        }

        function O(b) {
            b && (r && P(a(r)), b.addClass(g.classes.selectedDropdownItem), r = b.get(0))
        }

        function P(a) {
            a.removeClass(g.classes.selectedDropdownItem), r = null
        }

        function Q() {
            var b = n.val().toLowerCase();
            b && b.length && (p && D(a(p), d.AFTER), b.length >= g.minChars ? (J(), clearTimeout(l), l = setTimeout(function () {
                R(b)
            }, g.searchDelay)) : H())
        }

        function R(b) {
            var c = b + S(), d = k.get(c);
            if (d)N(b, d); else if (g.url) {
                var e = S(), f = {};
                f.data = {};
                if (e.indexOf("?") > -1) {
                    var h = e.split("?");
                    f.url = h[0];
                    var i = h[1].split("&");
                    a.each(i, function (a, b) {
                        var c = b.split("=");
                        f.data[c[0]] = c[1]
                    })
                } else f.url = e;
                f.data[g.queryParam] = b, f.type = g.method, f.dataType = g.contentType, g.crossDomain && (f.dataType = "jsonp"), f.success = function (d) {
                    a.isFunction(g.onResult) && (d = g.onResult.call(o, d)), k.add(c, g.jsonContainer ? d[g.jsonContainer] : d), n.val().toLowerCase() === b && N(b, g.jsonContainer ? d[g.jsonContainer] : d)
                }, a.ajax(f)
            } else if (g.local_data) {
                var j = a.grep(g.local_data, function (a) {
                    return a[g.propertyToSearch].toLowerCase().indexOf(b.toLowerCase()) > -1
                });
                a.isFunction(g.onResult) && (j = g.onResult.call(o, j)), k.add(c, j), N(b, j)
            }
        }

        function S() {
            var a = g.url;
            return typeof g.url == "function" && (a = g.url.call()), a
        }

        if (a.type(f) === "string" || a.type(f) === "function") {
            g.url = f;
            var h = S();
            g.crossDomain === undefined && (h.indexOf("://") === -1 ? g.crossDomain = !1 : g.crossDomain = location.href.split(/\/+/g)[1] !== h.split(/\/+/g)[1])
        } else typeof f == "object" && (g.local_data = f);
        g.classes ? g.classes = a.extend({}, c, g.classes) : g.theme ? (g.classes = {}, a.each(c, function (a, b) {
            g.classes[a] = b + "-" + g.theme
        })) : g.classes = c;
        var i = [], j = 0, k = new a.TokenList.Cache, l, m, n = a('<input type="text"  autocomplete="off">').css({outline: "none"}).attr("id", g.idPrefix + b.id).focus(function () {
            (g.tokenLimit === null || g.tokenLimit !== j) && K()
        }).blur(function () {
            H(), a(this).val("")
        }).bind("keyup keydown blur update", y).keydown(function (b) {
            var c, f;
            switch (b.keyCode) {
                case e.LEFT:
                case e.RIGHT:
                case e.UP:
                case e.DOWN:
                    if (!a(this).val())c = t.prev(), f = t.next(), c.length && c.get(0) === p || f.length && f.get(0) === p ? b.keyCode === e.LEFT || b.keyCode === e.UP ? D(a(p), d.BEFORE) : D(a(p), d.AFTER) : b.keyCode !== e.LEFT && b.keyCode !== e.UP || !c.length ? (b.keyCode === e.RIGHT || b.keyCode === e.DOWN) && f.length && C(a(f.get(0))) : C(a(c.get(0))); else {
                        var g = null;
                        return b.keyCode === e.DOWN || b.keyCode === e.RIGHT ? g = a(r).next() : g = a(r).prev(), g.length && O(g), !1
                    }
                    break;
                case e.BACKSPACE:
                    c = t.prev();
                    if (!a(this).val().length)return p ? (F(a(p)), o.change()) : c.length && C(a(c.get(0))), !1;
                    a(this).val().length === 1 ? H() : setTimeout(function () {
                        Q()
                    }, 5);
                    break;
                case e.TAB:
                case e.ENTER:
                case e.NUMPAD_ENTER:
                case e.COMMA:
                    if (r)return B(a(r).data("tokeninput")), o.change(), !1;
                    break;
                case e.ESCAPE:
                    return H(), !0;
                default:
                    String.fromCharCode(b.which) && setTimeout(function () {
                        Q()
                    }, 5)
            }
        }), o = a(b).hide().val("").focus(function () {
            n.focus()
        }).blur(function () {
            n.blur()
        }), p = null, q = 0, r = null, s = a("<ul />").addClass(g.classes.tokenList).click(function (b) {
            var c = a(b.target).closest("li");
            c && c.get(0) && a.data(c.get(0), "tokeninput") ? E(c) : (p && D(a(p), d.END), n.focus())
        }).mouseover(function (b) {
            var c = a(b.target).closest("li");
            c && p !== this && c.addClass(g.classes.highlightedToken)
        }).mouseout(function (b) {
            var c = a(b.target).closest("li");
            c && p !== this && c.removeClass(g.classes.highlightedToken)
        }).insertBefore(o), t = a("<li />").addClass(g.classes.inputToken).appendTo(s).append(n), u = a("<div>").addClass(g.classes.dropdown).appendTo("body").hide(), v = a("<tester/>").insertAfter(n).css({position: "absolute", top: -9999, left: -9999, width: "auto", fontSize: n.css("fontSize"), fontFamily: n.css("fontFamily"), fontWeight: n.css("fontWeight"), letterSpacing: n.css("letterSpacing"), whiteSpace: "nowrap"});
        o.val("");
        var w = g.prePopulate || o.data("pre");
        g.processPrePopulate && a.isFunction(g.onResult) && (w = g.onResult.call(o, w)), w && w.length && a.each(w, function (a, b) {
            A(b), x()
        }), a.isFunction(g.onReady) && g.onReady.call(), this.clear = function () {
            s.children("li").each(function () {
                a(this).children("input").length === 0 && F(a(this))
            })
        }, this.add = function (a) {
            B(a)
        }, this.remove = function (b) {
            s.children("li").each(function () {
                if (a(this).children("input").length === 0) {
                    var c = a(this).data("tokeninput"), d = !0;
                    for (var e in b)if (b[e] !== c[e]) {
                        d = !1;
                        break
                    }
                    d && F(a(this))
                }
            })
        }, this.getTokens = function () {
            return i
        }
    }, a.TokenList.Cache = function (b) {
        var c = a.extend({max_size: 500}, b), d = {}, e = 0, f = function () {
            d = {}, e = 0
        };
        this.add = function (a, b) {
            e > c.max_size && f(), d[a] || (e += 1), d[a] = b
        }, this.get = function (a) {
            return d[a]
        }
    }
})(jQuery)
