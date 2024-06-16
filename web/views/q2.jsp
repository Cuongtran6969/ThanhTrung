<%-- 
    Document   : q2.jsp
    Created on : 15 Jun, 2024, 8:35:48 PM
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
<!--        de bai: them sinh vien vao lop hoc
        cu 1 lan mk add vao thi no se hien danh sach sinh vien -->
     <form action="" method="POST">
       Name: <input name="name" type="text" /> </br>
       Class: <input name="class" type="text" /> </br>
       Gender: <input name="gender" type="radio" /> Male
               <input name="gender" type="radio" /> Female </br>
               Subjects:<input name="subject" type="checkbox" value="Toan" /> Toan
                <input name="subject" type="checkbox" value="Van" /> Van
                <input name="subject" type="checkbox" value="Anh" /> Anh
                <input name="subject" type="checkbox" value="Ly" /> Ly </br>
        <button type="submit">create</button>       
     </form>

    <h2>Parameter Details</h2>
    <p>Name: ${name}</p>
    <p>Class: ${class_raw}</p>
    <p>Gender: ${gender}</p>
    <h3>Subjects:</h3>
    <ul>
        <c:forEach var="subject" items="${subjects}">
            <li>${subject}</li>
        </c:forEach>
    </ul>
    </body>
</html>
