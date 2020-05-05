<%-- 
    Document   : iniciarreg
    Created on : 25/04/2020, 08:50:53 PM
    Author     : Thelma del Rosario
--%>
   <jsp:include page="navbar.jsp"></jsp:include>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body onload=" $('#inireg').addClass('active');">
        <h1>Pasa tu Tarjeta:</h1>
                <h2>Sala: <%
                String sala= request.getParameter("sala");    
            out.print(sala);
                %></h2>

        <h2 id="ready"></h2>
        <div class="row">
        <div class="col-xs-2">
        <input class="form-control" type="text" id="tarjeta" readonly value="Sin Tarjeta leida">
        </div>
        
        <h1 id='cerrar' style='display:none' required class="btn btn-dark" onclick="location.href='cerrarpuerto?redir=lista.jsp'">Abandonar...</h1>

        
<script>
            $(document).ready(function() {
               
                    $('#ready').text("Esperando...");
                    $('#cerrar').show();
                    
                     $.post('waitcard', {
                }, function(responseText) {
                        $('#ready').text("Listo");
                        $('#cerrar').hide();
                        $('#tarjeta').val(responseText);
                        window.location.href='setlog?serial='+responseText+'&sala='+<%out.print(sala);%>;

                });
                
       
});
            </script>        
        
    </body>
</html>
