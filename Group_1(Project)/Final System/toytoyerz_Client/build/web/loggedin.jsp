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
    <%session.setAttribute("step", "0");%>
    <title> 
        <%
            /*
            *creating a string variable to retrieve the active session
            *object that contains a attribute, that signifies if the user 
            *logged in or not
             */
            String username = (String)session.getAttribute("user");
            boolean logged = false;
            out.println("ToyToyerz&trade;: Welcome " + username );
            %>
    </title>
</head>
<body background ="imgs/img.jpeg" style="background-position: center; background-attachment: fixed; background-size: cover;">
    <%
        /*
        *checking if the user is logged in, else 
        *redirecting to the index page,
        *and stating he needs to login
        */
        if(username == null || username == ""){
            response.sendRedirect("index.jsp?logged=false");
            logged = false;
        }else{
            logged = true;
        }
        %>

    <div class="content"> 
        <div id = "tabs">
            <img id = "tab1" src ="imgs/tab.png"/>
            <img id = "tab2" src ="imgs/tab.png"/>
            <img id = "tab3" src ="imgs/tab.png"/>
            <img id = "tab4" src ="imgs/tab.png"/>
            <img id = "tab5" src ="imgs/tab.png"/>
            <img id = "tab6" src ="imgs/tab.png"/>
            <% if(logged){%>        
            <img id="tab7" src ="imgs/logout.png"/>
            <%}%>
        </div>

        <a id="tab1c" href ="index.jsp">Home</a>
        <a id="tab2c" href ="products.jsp">Products</a>
        <a id="tab3c" href ="specials.jsp">Specials</a>
        <a id="tab4c" href ="gift.jsp">Find a gift</a>
        <a id="tab5c" href ="about_us.jsp">About us</a>
        
        <% if(logged){%>        
            <a id="tab7c" href ="profile.jsp">My Account</a>
            <a id="tab8c" href ="logout.jsp">Log Out</a>
        <%}else{%>
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

        <div class = "transback"></div>
        <div class = "dynamic1">
            <div>
                <img src="imgs/stock.gif" style="border-radius: 15px;"/>
            </div>
        </div>
        <div class = "dynamic2">
            <img id = "specials" src ="imgs/specials/special.png"/>
        </div>
        <div class = "dynamic3">
            <img id = "logo" src = "imgs/company logos.png"/>
        </div>

    </div>
</body>
</html>