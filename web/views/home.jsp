<%-- 
    Document   : home.jsp
    Created on : 11 Jun, 2024, 8:20:20 PM
    Author     : HP
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:set var="acc" value="${sessionScope.currAcc}"></c:set>
        <h1>hello my name is: ${acc.getFirstName()}</h1>
    </body>
</html>
