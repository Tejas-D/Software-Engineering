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
    <title>Registration: ToyToyerz&trade;</title>
</head>
<body background ="imgs/img.jpeg" style="background-position: center; background-attachment: fixed; background-size: cover;">

    <div class="content"> 
        <div id = "tabs">
            <img id = "tab1" src ="imgs/tab.png"/>
            <img id = "tab2" src ="imgs/tab.png"/>
            <img id = "tab3" src ="imgs/tab.png"/>
            <img id = "tab4" src ="imgs/tab.png"/>
            <img id = "tab5" src ="imgs/tab.png"/>
            <img id = "tab6" src ="imgs/tab.png"/>
        </div>

        <a id="tab1c" href ="index.jsp">Home</a>
        <a id="tab2c" href ="products.jsp">Products</a>
        <a id="tab3c" href ="specials.jsp">Specials</a>
        <a id="tab4c" href ="gift.jsp">Find a gift</a>
        <a id="tab5c" href ="about_us.jsp">About us</a>
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

        <img id = "banner" src ="imgs/banner back.png"/>

        <div class = "regtransback">
            <%
                /*
                 *Creating string variables to hold values if
                 *any errors occur, which will be seen in the
                 *header field
                 */
                String invalid = "";
                String companyNameError = "";
                String companyAddressError = "";
                String nameError = "";
                String surnameError = "";
                String teleError = "";
                String accNoError = "";
                String swiftCodeError = "";
                String vatError = "";
                String faxError = "";
                String taxError = "";
                String lengthError = "";
                String matchError = "";
                String emailError = "";
                String answerError = "";

                //checking if the header field for parameters that will show success, errors or email exists
                String errors = request.getParameter("errors") == null ? "" : request.getParameter("errors");
                String exists = request.getParameter("exist") == null ? "" : "The email address has been registered before!";

                /*
                 *checking the errors variable, which checks if the header for
                 *that parameter contains numbers in correspondence to the error
                 *occured in which field
                 */
                if (errors.contains("0")) {
                    invalid = "Invalid charaters have been used";
                }
                if (errors.contains("1")) {
                    companyNameError = "Error on Company name";
                }
                if (errors.contains("2")) {
                    nameError = "Error on your Name";
                }
                if (errors.contains("3")) {
                    surnameError = "Error on your Surname";
                }
                if (errors.contains("4")) {
                    teleError = "Your phone number is too short";
                }
                if (errors.contains("5")) {
                    emailError = "Error in your email";
                }
                if (errors.contains("6")) {
                    faxError = "Error on your fax number";
                }
                if (errors.contains("7")) {
                    lengthError = "Password is to short";
                }
                if (errors.contains("8")) {
                    matchError = "Passwords dont match";
                }
            %>
            <div class="register">
                <table style="align:top">
                    <tr>
                        <td colspan="2" valign="top" align="center">
                            <!-- Printing out an error if the email address is in use already -->
                            <h2 style="color:red"><%out.println(exists);%></h2>
                            <form action="RegisterServlet" method="post" style="font-size:20">
                                <b>
                                    <table style="font-size:20pt">
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <!-- Printing out an error if there are unknown characters present-->
                                            <td style="font-size:14pt; color:black;"><%out.println(invalid);%></td>
                                        </tr>
                                        <tr>
                                            <td>Company Name:</td>
                                            <td></td>
                                            <td><input type="text" name="companyname"/></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <!-- Printing out an a message if  there is an error -->
                                            <td style="font-size:14pt; color:black;"><%out.println(companyNameError);%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Company Address:</td>
                                            <td></td>
                                            <td><input type="text" name="companyaddress"/></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <!-- Printing out an a message if  there is an error -->
                                            <td style="font-size:14pt; color:black;"><%out.println(companyAddressError);%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Contact Name:</td>
                                            <td></td>
                                            <td><input type="text" name="contactname"/></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <!-- Printing out an a message if  there is an error -->
                                            <td style="font-size:14pt; color:black;"><%out.println(nameError);%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Company Surname:</td>
                                            <td></td>
                                            <td><input type="text" name="contactsurname"/></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <!-- Printing out an a message if  there is an error -->
                                            <td style="font-size:14pt; color:black;"><%out.println(surnameError);%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Telephone:</td>
                                            <td></td>
                                            <td><input type="number" name="telenumber"/></td>
                                            <td>10 Digit Telephone Number</td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <!-- Printing out an a message if  there is an error -->
                                            <td style="font-size:14pt; color:black;"><%out.println(teleError);%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Email Address:</td>
                                            <td></td>
                                            <td><input type="text" name="email"/></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <!-- Printing out an a message if  there is an error -->
                                            <td style="font-size:14pt; color:black;"><%out.println(emailError);%></td>
                                        </tr>
                                        <tr>
                                            <td>Account Number:</td>
                                            <td></td>
                                            <td><input type="number" name="accountnumber"/></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <!-- Printing out an a message if  there is an error -->
                                            <td style="font-size:14pt; color:black;"><%out.println(accNoError);%></td>
                                        </tr>
                                        <tr>
                                            <td>Swift Code/CSV:</td>
                                            <td></td>
                                            <td><input type="number" name="swiftcode"/></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <!-- Printing out an a message if  there is an error -->
                                            <td style="font-size:14pt; color:black;"></td>
                                        </tr>
                                        <tr>
                                            <td>VAT Number:</td>
                                            <td></td>
                                            <td><input type="number" name="vat"/></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <!-- Printing out an a message if  there is an error -->
                                            <td style="font-size:14pt; color:black;"></td>
                                        </tr>
                                        <tr>
                                            <td>Fax Number:</td>
                                            <td></td>
                                            <td><input type="number" name="faxnumber"/></td>
                                            <td>10 Digit Fax Number</td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <!-- Printing out an a message if  there is an error -->
                                            <td style="font-size:14pt; color:black;"><%out.println(faxError);%></td>
                                        </tr>
                                        <tr>
                                            <td>Tax No:</td>
                                            <td></td>
                                            <td><input type="text" name="taxno"/></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <!-- Printing out an a message if  there is an error -->
                                            <td style="font-size:14pt; color:black;"></td>
                                        </tr>
                                        <tr>
                                            <td>Password:</td>
                                            <td></td>
                                            <td><input type="password" name="pass"/></td>
                                            <td>More than 8 characters</td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <!-- Printing out an a message if  there is an error -->
                                            <td style="font-size:14pt; color:black;"><%out.println(lengthError);%></td>
                                        </tr>
                                        <tr>
                                            <td>Confirm Password:</td>
                                            <td></td>
                                            <td><input type="password" name="conpass"/></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <!-- Printing out an a message if  there is an error -->
                                            <td style="font-size:14pt; color:black;"><%out.println(matchError);%></td>
                                        </tr>
                                        <tr>
                                            <td style="font-size:14pt">
                                                <input type="submit" value="Sign Up"/>
                                                <input type="reset" value="Reset"/>
                                            </td>
                                            <td colspan="3">
                                                <a href="index.jsp" style="text-decoration:none; font-size:14pt;">Back to index page</a>
                                            </td>
                                        </tr>
                                    </table>
                                </b>
                            </form>
                        </td>
                    </tr>            
                </table>
            </div>
        </div>                                
    </div>
</body>
</html>