<%-- 
    Document   : logout
    Created on : 16 Oct 2014, 10:48:25 PM
    Author     : RD
--%>
<%
session.invalidate();
response.sendRedirect("login.jsp");
%>