<%-- 
    Document   : index
    Created on : 01 Jul 2014, 2:02:13 AM
    Author     : tej
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
    <head>
        <link type="text/css" rel="stylesheet" href="css/indexs.css"/>
        <link type="text/css" rel="stylesheet" href="css/modal.css"/>
        <!-- setting a new session object that will be used in the recovery process -->
        <title>About Us - ToyToyerz&trade; </title>
    </head>
    <body background ="imgs/img.jpeg" style="background-position: center; background-attachment: fixed; background-size: cover;">
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
            }%>

        <div class="content"> 
            <div id = "tabs">
                <img id = "tab1" src ="imgs/tab.png"/>
                <img id = "tab2" src ="imgs/tab.png"/>
                <img id = "tab3" src ="imgs/tab.png"/>
                <img id = "tab4" src ="imgs/tab.png"/>
                <img id = "tab5" src ="imgs/tab.png"/>
                <img id = "tab6" src ="imgs/tab.png"/>
                <% if (log) {%>        
                <img id="tab7" src ="imgs/logout.png"/>
                <%}%>
            </div>

            <a id="tab1c" href ="index.jsp">Home</a>
            <a id="tab2c" href ="products.jsp">Products</a>
            <a id="tab3c" href ="specials.jsp">Specials</a>
            <a id="tab4c" href ="gift.jsp">Find a gift</a>
            <a id="tab5c" href ="about_us.jsp">About us</a>


            <% if (log) {%>        
            <a id="tab7c" href ="profile.jsp">My Account</a>
            <a id="tab8c" href ="logout.jsp">Log Out</a>
            <%} else {%> 
            <a id="tab6c" href ="#login_form">Sign in</a>
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
                    <div align="right">
                        <a href="remember.jsp" title="Click here we'll help you remember!">Forgot Password?</a></label><br/>
                        <a href="register.jsp" title="Not a user? Sign up today! Dont hesitate">Register Here, Now!</a>
                    </div>
                    <a class="close" href="#close"></a>
                </div>
            </form>

            <a href="#x" class="overlay" id="error"></a>
            <div class="popup">
                <h1>Error!</h1>
                <div>
                    <label style="font-size: 20px">Error on Username or Password.<br/>Please retry.</label>
                    <a href="#close"><input type="button" value="Okay"/></a>
                </div>
            </div>
            <%}%>



            <img id = "banner" src ="imgs/banner back.png"/>

            <div class = "transback">
                <div class = "abouttransback">
                <img id = "aboutlogo" src = "imgs/ToyToyerzLogo.png"/>
                     <h1> ToyToyerz&trade; <h1>

                     <h2> Who we are </h2>

                     <div id = "whoweare"><p>  Americans United for Separation of Church and State is a nonpartisan educational organization dedicated to preserving the constitutional principle of church-state separation as the only way to ensure religious freedom for all Americans.

                                    Americans United, or AU, is a 501(c)(3) nonprofit educational organization based in Washington, D.C. Founded in 1947, Americans United works in the courts, in Congress and state legislatures, at the White House and in the arena of public opinion.
                                    We address an array of pressing issues. We encourage you to learn about our projects, lawsuits and out-of-court successes. For a detailed account of AU activities in the past year, check our Annual Report. You may also want to read our Form 990. These documents are also available here.
                                    AU is led by Executive Director Barry W. Lynn and governed by AU's Board of Trustees.
                                    If you share our commitment to church-state separation, please join with us today. We welcome your support in this important cause.</p>
                    </div>
                    <h2>Our Mission</h2>
                    <div id = "mission">
                        <p> Our goal is to supply quality toys to all the major toy retailing companies around the world </p>
                    </div>
                     <h2> Developers </h2>
                    <a href = "cax.html"><img id = "caxlogo" src = "imgs/CAX_Logo_Final.png"/></a>
            </div>
            </div>
        </div>
    </body>
</html>