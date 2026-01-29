<%-- 
    Document   : login
    Created on : 08-01-2026, 11:08:26
    Author     : tungi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="MainController" method="post">
            <input type="hidden" name="action" value="login"/>
            Username: <input type="text" name="txtUsername" required="required" /> <br/>
            Password: <input type="password" name="txtPassword" required="required"  /> <br/>
            <input type="submit" value="Login" />
        </form>
        <c:if test="not empty message">
            ${message}
        </c:if>
    </body>
</html>
