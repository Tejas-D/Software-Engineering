<%-- 
    Document   : perform-sales
    Created on : 16 Oct 2014, 7:53:29 PM
    Author     : RD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="html" lang="en-US">
    <head>

        <script type="text/javascript">
            if (typeof Muse == "undefined")
                window.Muse = {};
            window.Muse.assets = {"required": ["jquery-1.8.3.min.js", "museutils.js", "jquery.musemenu.js", "jquery.watch.js", "perform-sales.css"], "outOfDate": []};
        </script>

        <meta http-equiv="Content-type" content="text/html;charset=UTF-8"/>
        <meta name="generator" content="2014.2.0.284"/>
        <link rel="shortcut icon" href="images/favicon.ico?330450565"/>
        <%session.setAttribute("step", "0");%>
        <%
            /*
             *creating a string variable to retrieve the active session
             *object that contains a attribute, that signifies if the user 
             *logged in or not
             */
            String username = (String) session.getAttribute("user");
            boolean logged = false;
        %>
        <title>Perform Sales</title>
        <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="css/site_global.css?3977984863"/>
        <link rel="stylesheet" type="text/css" href="css/perform-sales.css?479362686" id="pagesheet"/>
        <link type="text/css" rel="stylesheet" href="css/modal.css"/>
        <link type="text/css" rel="stylesheet" href="css/custom.css"/>
        <!-- Other scripts -->
        <script type="text/javascript">
            document.documentElement.className += ' js';
        </script>
        <!-- JS includes -->
        <!--[if lt IE 9]>
        <script src="scripts/html5shiv.js?4241844378" type="text/javascript"></script>
        <![endif]-->
        <%
            /*
             *checking if the user is logged in, else 
             *redirecting to the index page,
             *and stating he needs to login
             */
            if (username == null || username == "") {
                response.sendRedirect("login.jsp#login");
                logged = false;
            } else {
                logged = true;
            }

            String level = (String) session.getAttribute("clearance");
        %>
    </head>
    <body>
        <a href="#x" class="overlay" id="error"></a>
        <div class="popup">
            <div>
                <p style="font-size: 20px">Access Denied. Please contact the Admin.</p>
                <a href="#"><input type="button" value="Okay"/></a>
            </div>
        </div>
        <div class="clearfix" id="page"><!-- group -->
            <nav class="MenuBar clearfix grpelem" id="menuu2425"><!-- vertical box -->
                <%if (logged && level.equals("1")) {%>
                <div class="MenuItemContainer clearfix colelem" id="u2426"><!-- horizontal box -->
                    <a class="nonblock nontext MenuItem MenuItemWithSubMenu clearfix grpelem" id="u2427" href="index.jsp"><!-- horizontal box --><div class="MenuItemLabel clearfix grpelem" id="u2428-4"><!-- content --><p>Home</p></div></a>
                </div>
                <div class="MenuItemContainer clearfix colelem" id="u2433"><!-- horizontal box -->
                    <a class="nonblock nontext MenuItem MenuItemWithSubMenu clearfix grpelem" id="u2436" href="http://localhost:8080/toytoyerz_final/GetQuoteInfo"><!-- horizontal box --><div class="MenuItemLabel clearfix grpelem" id="u2439-4"><!-- content --><p>Generate Quotes</p></div></a>
                </div>
                <div class="MenuItemContainer clearfix colelem" id="u2465"><!-- horizontal box -->
                    <a class="nonblock nontext MenuItem MenuItemWithSubMenu MuseMenuActive clearfix grpelem" id="u2468" href="http://localhost:8080/toytoyerz_final/GetSalesInfo"><!-- horizontal box --><div class="MenuItemLabel clearfix grpelem" id="u2469-4"><!-- content --><p>Perform Sales</p></div></a>
                </div>
                <div class="MenuItemContainer clearfix colelem" id="u2524"><!-- horizontal box -->
                    <a class="nonblock nontext MenuItem MenuItemWithSubMenu clearfix grpelem" id="u2525" href="http://localhost:8080/toytoyerz_final/ViewQuotes"><!-- horizontal box --><div class="MenuItemLabel clearfix grpelem" id="u2528-4"><!-- content --><p>View Quotes</p></div></a>
                </div>
                <div class="MenuItemContainer clearfix colelem" id="u2597"><!-- horizontal box -->
                    <a class="nonblock nontext MenuItem MenuItemWithSubMenu clearfix grpelem" id="u2598" href="http://localhost:8080/toytoyerz_final/ViewInvoices"><!-- horizontal box --><div class="MenuItemLabel clearfix grpelem" id="u2600-4"><!-- content --><p>View Invoices</p></div></a>
                </div>
                <div class="MenuItemContainer clearfix colelem" id="u2684"><!-- horizontal box -->
                    <a class="nonblock nontext MenuItem MenuItemWithSubMenu clearfix grpelem" id="u2685" href="http://localhost:8080/toytoyerz_final/StockCat"><!-- horizontal box --><div class="MenuItemLabel clearfix grpelem" id="u2687-4"><!-- content --><p>Add Stock</p></div></a>
                </div>
                <div class="MenuItemContainer clearfix colelem" id="u2785"><!-- horizontal box -->
                    <a class="nonblock nontext MenuItem MenuItemWithSubMenu clearfix grpelem" id="u2788" href="http://localhost:8080/toytoyerz_final/GetPartsInfo"><!-- horizontal box --><div class="MenuItemLabel clearfix grpelem" id="u2789-4"><!-- content --><p>Add Parts</p></div></a>
                </div>
                <div class="MenuItemContainer clearfix colelem" id="u2900"><!-- horizontal box -->
                    <a class="nonblock nontext MenuItem MenuItemWithSubMenu clearfix grpelem" id="u2903" href="http://localhost:8080/toytoyerz_final/ViewStock"><!-- horizontal box --><div class="MenuItemLabel clearfix grpelem" id="u2904-4"><!-- content --><p>View Stock</p></div></a>
                </div>
                <div class="MenuItemContainer clearfix colelem" id="u3029"><!-- horizontal box -->
                    <a class="nonblock nontext MenuItem MenuItemWithSubMenu clearfix grpelem" id="u3032" href="plant-performance.jsp"><!-- horizontal box --><div class="MenuItemLabel clearfix grpelem" id="u3034-4"><!-- content --><p>Plant Performance</p></div></a>
                </div>
                <div class="MenuItemContainer clearfix colelem" id="u3172"><!-- horizontal box -->
                    <a class="nonblock nontext MenuItem MenuItemWithSubMenu clearfix grpelem" id="u3175" href="http://localhost:8080/toytoyerz_final/ViewEmployees"><!-- horizontal box --><div class="MenuItemLabel clearfix grpelem" id="u3178-4"><!-- content --><p>View Employees</p></div></a>
                </div>
                <div class="MenuItemContainer clearfix colelem" id="u3329"><!-- horizontal box -->
                    <a class="nonblock nontext MenuItem MenuItemWithSubMenu clearfix grpelem" id="u3332" href="http://localhost:8080/toytoyerz_final/ViewCompanies"><!-- horizontal box --><div class="MenuItemLabel clearfix grpelem" id="u3335-4"><!-- content --><p>View Companies</p></div></a>
                </div>
                <%} else if (logged && level.equals("2")) {%>
                <div class="MenuItemContainer clearfix colelem" id="u2426"><!-- horizontal box -->
                    <a class="nonblock nontext MenuItem MenuItemWithSubMenu clearfix grpelem" id="u2427" href="index.jsp"><!-- horizontal box --><div class="MenuItemLabel clearfix grpelem" id="u2428-4"><!-- content --><p>Home</p></div></a>
                </div>
                <div class="MenuItemContainer clearfix colelem" id="u2433"><!-- horizontal box -->
                    <a class="nonblock nontext MenuItem MenuItemWithSubMenu clearfix grpelem" id="u2436" href="http://localhost:8080/toytoyerz_final/GetQuoteInfo"><!-- horizontal box --><div class="MenuItemLabel clearfix grpelem" id="u2439-4"><!-- content --><p>Generate Quotes</p></div></a>
                </div>
                <div class="MenuItemContainer clearfix colelem" id="u2465"><!-- horizontal box -->
                    <a class="nonblock nontext MenuItem MenuItemWithSubMenu MuseMenuActive clearfix grpelem" id="u2468" href="http://localhost:8080/toytoyerz_final/GetSalesInfo"><!-- horizontal box --><div class="MenuItemLabel clearfix grpelem" id="u2469-4"><!-- content --><p>Perform Sales</p></div></a>
                </div>
                <div class="MenuItemContainer clearfix colelem" id="u2524"><!-- horizontal box -->
                    <a class="nonblock nontext MenuItem MenuItemWithSubMenu clearfix grpelem" id="u2525" href="http://localhost:8080/toytoyerz_final/ViewQuotes"><!-- horizontal box --><div class="MenuItemLabel clearfix grpelem" id="u2528-4"><!-- content --><p>View Quotes</p></div></a>
                </div>
                <div class="MenuItemContainer clearfix colelem" id="u2597"><!-- horizontal box -->
                    <a class="nonblock nontext MenuItem MenuItemWithSubMenu clearfix grpelem" id="u2598" href="http://localhost:8080/toytoyerz_final/ViewInvoices"><!-- horizontal box --><div class="MenuItemLabel clearfix grpelem" id="u2600-4"><!-- content --><p>View Invoices</p></div></a>
                </div>
                <div class="MenuItemContainer clearfix colelem" id="u2684"><!-- horizontal box -->
                    <a class="nonblock nontext MenuItem MenuItemWithSubMenu clearfix grpelem" id="u2685" href="perform-sales.jsp#error"><!-- horizontal box --><div class="MenuItemLabel clearfix grpelem" id="u2687-4"><!-- content --><p>Add Stock</p></div></a>
                </div>
                <div class="MenuItemContainer clearfix colelem" id="u2785"><!-- horizontal box -->
                    <a class="nonblock nontext MenuItem MenuItemWithSubMenu clearfix grpelem" id="u2788" href="perform-sales.jsp#error"><!-- horizontal box --><div class="MenuItemLabel clearfix grpelem" id="u2789-4"><!-- content --><p>Add Parts</p></div></a>
                </div>
                <div class="MenuItemContainer clearfix colelem" id="u2900"><!-- horizontal box -->
                    <a class="nonblock nontext MenuItem MenuItemWithSubMenu clearfix grpelem" id="u2903" href="perform-sales.jsp#error"><!-- horizontal box --><div class="MenuItemLabel clearfix grpelem" id="u2904-4"><!-- content --><p>View Stock</p></div></a>
                </div>
                <div class="MenuItemContainer clearfix colelem" id="u3029"><!-- horizontal box -->
                    <a class="nonblock nontext MenuItem MenuItemWithSubMenu clearfix grpelem" id="u3032" href="perform-sales.jsp#error"><!-- horizontal box --><div class="MenuItemLabel clearfix grpelem" id="u3034-4"><!-- content --><p>Plant Performance</p></div></a>
                </div>
                <div class="MenuItemContainer clearfix colelem" id="u3172"><!-- horizontal box -->
                    <a class="nonblock nontext MenuItem MenuItemWithSubMenu clearfix grpelem" id="u3175" href="perform-sales.jsp#error"><!-- horizontal box --><div class="MenuItemLabel clearfix grpelem" id="u3178-4"><!-- content --><p>View Employees</p></div></a>
                </div>
                <div class="MenuItemContainer clearfix colelem" id="u3329"><!-- horizontal box -->
                    <a class="nonblock nontext MenuItem MenuItemWithSubMenu clearfix grpelem" id="u3332" href="perform-sales.jsp#error"><!-- horizontal box --><div class="MenuItemLabel clearfix grpelem" id="u3335-4"><!-- content --><p>View Companies</p></div></a>
                </div>
                <%}%>
            </nav>
            <div class="clip_frame grpelem" id="u2423"><!-- image -->
                <img class="block" id="u2423_img" src="images/banner%20back.png" alt="" width="511" height="60"/>
            </div>
            <div class="shadow clearfix grpelem" id="u2442"><!-- group -->
                <div class="clearfix grpelem" id="u2445-4"><!-- content -->
                    <p>Welcome:<%out.println(username);%></p>
                        </div>
                        <a id='logout' href="logout.jsp">Log Out</a>
            </div>
            <div class="verticalspacer"></div>
            <div class="clip_frame grpelem" id="u2440" data-mu-ie-matrix="progid:DXImageTransform.Microsoft.Matrix(M11=0.9994,M12=-0.0349,M21=0.0349,M22=0.9994,SizingMethod='auto expand')" data-mu-ie-matrix-dx="-1" data-mu-ie-matrix-dy="-1"><!-- image -->
                <img class="block" id="u2440_img" src="images/cax_logo_final.png" alt="" width="59" height="38"/>
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
        <script src="scripts/jquery.musemenu.js?4027237583" type="text/javascript"></script>
        <script src="scripts/jquery.watch.js?3946357177" type="text/javascript"></script>
        <!-- Other scripts -->
        <script type="text/javascript">
            $(document).ready(function() {
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
                    Muse.Utils.initWidget('.MenuBar', function(elem) {
                        return $(elem).museMenu();
                    });/* unifiedNavBar */
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