<%-- 
    Document   : logout
    Created on : 01 Jul 2014, 4:47:46 AM
    Author     : tej
--%>
<%
session.invalidate();
response.sendRedirect("index.jsp");
%>