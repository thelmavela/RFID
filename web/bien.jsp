<%-- 
    Document   : bien
    Created on : 9/04/2020, 09:02:58 PM
    Author     : Thelma del Rosario
--%>
   <jsp:include page="navbar.jsp"></jsp:include>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   
        <meta http-equiv="refresh" content="2; url=<%out.print(request.getParameter("pagina"));%>">
        <title>Bien</title>
    </head>
   
    <body onload="swal('<%out.print(request.getParameter("msg1")+"','"+request.getParameter("msg2")+"','success'");%>);">
    </body>
</html>
