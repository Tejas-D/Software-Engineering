<%-- 
    Document   : login
    Created on : 12 Oct 2014, 12:03:21 PM
    Author     : Tejas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="html" lang="en-US">
    <head>

        <script type="text/javascript">
            if (typeof Muse == "undefined")
                window.Muse = {};
            window.Muse.assets = {"required": ["jquery-1.8.3.min.js", "museutils.js", "jquery.watch.js", "login.css"], "outOfDate": []};
        </script>

        <meta http-equiv="Content-type" content="text/html;charset=UTF-8"/>
        <meta name="generator" content="2014.2.0.284"/>
        <link rel="shortcut icon" href="images/login-favicon.ico?330450565"/>
        <title>Login</title>
        <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="css/site_global.css?365011649"/>
        <link type="text/css" rel="stylesheet" href="css/modal.css"/>
        <link type="text/css" rel="stylesheet" href="css/custom.css"/>
        <link rel="stylesheet" type="text/css" href="css/login.css?54490237" id="pagesheet"/>
        <!-- Other scripts -->
        <script type="text/javascript">
            document.documentElement.className += ' js';
        </script>
        <%session.setAttribute("step", "0");%>
    </head>
    <body>
        <%
            /*
             *Creating the string variables to check if any errors
             *have occured, and display them if so. By using 
             *parameters sent thru the header fields from the other
             *pages and servlets
             */
            String error = request.getParameter("error") == null ? "" : "Error on username or password, please try again";
            String logged = request.getParameter("logged") == null ? "" : "You arent logged in!";
            String logoff = request.getParameter("logoff") == null ? "" : request.getParameter("logoff");
            /*
             *If statment to check if the user had clicked the
             *logoff button on the login page, which then end the 
             *session by removing the attribute linked to the user 
             *that logged in.
             */
            String username = (String) session.getAttribute("user");
            boolean log = false;
            if (username == null || username == "") {
                log = false;
            } else {
                log = true;
            }
            if (logoff.equals("true")) {
                session.removeAttribute("user");
            }
        %>
        <div class="clearfix" id="page"><!-- group -->
            <div class="clip_frame grpelem" id="u75"><!-- image -->
                <img class="block" id="u75_img" src="images/banner%20back.png" alt="" width="796" height="94"/>
                <div id="logon">

                    <p align='left' style="font-size: 18px"> <big> Manufacturing Management System </big></p>
                    <hr align='left' style="width: 400px"/>
                    <a id="login_button" href ="#login_form"><input type="submit" value="Proceed"/></a>
                    <hr align='left' style="width: 400px"/>

                    <form action="LoginServlet" method="post">
                        <a href="#x" class="overlay" id="login_form"></a>
                        <div class="popup">
                            <h2>Welcome!</h2>
                            <div>
                                <label for="login">Username(Email Address)</label>
                                <input type="text" size=18 maxlength=100 name="username"/>
                            </div>
                            <div>
                                <label for="password">Password</label>
                                <input type="password" size=18 maxlength=15 name="password"/>
                            </div>
                            <input type="submit" value="Login"/>

                            <a class="close" href="#close"></a>
                        </form>
                        <div align="right">
                            <form action="PassServlet">
                                <input type="submit" value="Forgot Password" title="Click here we'll help you remember!"/>
                            </form>
                        </div>
                    </div>
                <a href="#x" class="overlay" id="forgotpass"></a>
                <div class="popup">
                    <h1>Password Recovery</h1>
                    <div>
                        <label for="login">Enter your Email:</label>
                        <input type="text" size=18 maxlength=100 name="email"/>
                        <a href="#close"><input type="button" value="Submit"/></a>
                    </div>
                </div>

                <a href="#x" class="overlay" id="error"></a>
                <div class="popup">
                    <div>
                        <p style="font-size: 20px">Error on Username or Password.<br/>Please retry.</p>
                        <a href="#login_form"><input type="button" value="Okay"/></a>
                    </div>
                </div>

                <a href="#x" class="overlay" id="login"></a>
                <div class="popup">
                    <div>
                        <p style="font-size: 20px">Restricted Access. Please Login!<br/>Please retry.</p>
                        <a href="#login_form"><input type="button" value="Okay"/></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="verticalspacer"></div>
        <div class="clip_frame grpelem" id="u81"><!-- image -->
            <img class="block" id="u81_img" src="images/cax_logo_final.png" alt="" width="59" height="38"/>
        </div>
    </div>
    <!-- JS includes -->
    <script type="text/javascript">
        if (document.location.protocol != 'https:')
            document.write('\x3Cscript src="http://musecdn2.businesscatalyst.com/scripts/4.0/jquery-1.8.3.min.js" type="text/javascript">\x3C/script>');
    </script>
    <script type="text/javascript">
        window.jQuery || document.write('\x3Cscript src="scripts/jquery-1.8.3.min.js" type="text/javascript">\x3C/script>');
    </script>
    <script src="scripts/museutils.js?4050293121" type="text/javascript"></script>
    <script src="scripts/jquery.watch.js?3946357177" type="text/javascript"></script>
    <!-- Other scripts -->
    <script type="text/javascript">             $(document).ready(function() {
            try {
                (function() {
                    var a = {}, b = function(a) {
                        if (a.match(/^rgb/))
                            return a = a.replace(/\s+/g, "").match(/([\d\,]+)/gi)[0].split(","), (parseInt(a[0]) << 16) + (parseInt(a[1]) << 8) + parseInt(a[2]);
                        if (a.match(/^\#/))
                            return parseInt(a.substr(1), 16);
                        return 0
                    };
                    (function() {
                        $('link[type="text/css"]').each(function() {
                            var b = ($(this).attr("href") || "").match(/\/?css\/([\w\-]+\.css)\?(\d+)/);
                            b && b[1] && b[2] && (a[b[1]] = b[2])
                        })
                    })();
                    (function() {
                        $("body").append('<div class="version" style="display:none; width:1px; height:1px;"></div>');
                        for (var c = $(".version"), d = 0; d < Muse.assets.required.length; ) {
                            var f = Muse.assets.required[d], g = f.match(/([\w\-\.]+)\.(\w+)$/), k = g && g[1] ? g[1] : null, g = g && g[2] ? g[2] : null;
                            switch (g.toLowerCase()) {
                                case "css":
                                    k = k.replace(/\W/gi, "_").replace(/^([^a-z])/gi, "_$1");
                                    c.addClass(k);
                                    var g = b(c.css("color")), h = b(c.css("background-color"));
                                    g != 0 || h != 0 ? (Muse.assets.required.splice(d, 1), "undefined" != typeof a[f] && (g != a[f] >>> 24 || h != (a[f] & 16777215)) && Muse.assets.outOfDate.push(f)) : d++;
                                    c.removeClass(k);
                                    break;
                                case "js":
                                    k.match(/^jquery-[\d\.]+/gi) &&
                                            typeof $ != "undefined" ? Muse.assets.required.splice(d, 1) : d++;
                                    break;
                                default:
                                    throw Error("Unsupported file type: " + g);
                            }
                        }
                        c.remove();
                        if (Muse.assets.outOfDate.length || Muse.assets.required.length)
                            c = "Some files on the server may be missing or incorrect. Clear browser cache and try again. If the problem persists please contact website author.", (d = location && location.search && location.search.match && location.search.match(/muse_debug/gi)) && Muse.assets.outOfDate.length && (c += "\nOut of date: " + Muse.assets.outOfDate.join(",")), d && Muse.assets.required.length && (c += "\nMissing: " + Muse.assets.required.join(",")), alert(c)
                    })()
                })();
                /* body */
                Muse.Utils.transformMarkupToFixBrowserProblemsPreInit();/* body */
                Muse.Utils.prepHyperlinks(true);/* body */
                Muse.Utils.fullPage('#page');/* 100% height page */
                Muse.Utils.showWidgetsWhenReady();/* body */
                Muse.Utils.transformMarkupToFixBrowserProblems();/* body */
            } catch (e) {
                if (e && 'function' == typeof e.notify)
                    e.notify();
                else
                    Muse.Assert.fail('Error calling selector function:' + e);
            }
        });
    </script>
</body>
</html>