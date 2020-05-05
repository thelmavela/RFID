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
         <%
    String mensaje2=request.getParameter("msg");
        String mensaje1="Algo salió mal";

    String pagina=request.getParameter("url");


    %>
       <META HTTP-EQUIV="REFRESH" CONTENT="3;URL=<%out.print(pagina);%>"> 
        <title>Bien</title>
    </head>
   
    <body onload="swal('<%out.print(mensaje1);%>','<%out.print(mensaje2);%>','error')"
    </body>
</html>
