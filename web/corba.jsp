<%-- 
    Document   : corba
    Created on : 23/04/2020, 09:07:59 PM
    Author     : Thelma del Rosario
--%>   <jsp:include page="navbar.jsp"></jsp:include>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Validar Usuarios</title>
    </head>
    <body onload=" $('#tarjeta').val('Esperando tarjeta...');">
        <h1>Validacion de Usuarios (Tarjetas)</h1>
        
        <form action="corba1" id="formu" method="post">
            
           <div class="row"> 
               
               <div class=" col-xs-2">
                   <label for="text">Tarjeta:</label>       
                        <h2 id='ready'></h2>
            <input class="form-control" type="text" name="numero" id="tarjeta" readonly>
                                          <h1 id='cerrar' style='display:none' required class="btn btn-dark" onclick="location.href='cerrarpuerto?redir=lista.jsp'">Abandonar...</h1>

               </div>
           </div>
                               
<h1 id="card"  class="btn btn-info" align="center">Leer Tarjeta</h1>  
        </form>
  
        
                          <script>
            $(document).ready(function() {
                $('#reg').addClass("active");
       
                $('#card').click(function(event) {
                    $('#card').attr("disabled",true);
                    $('#ready').text("Esperando...");
                    $('#cerrar').show();
                    
                     $.post('waitcard', {
                }, function(responseText) {
                        $('#ready').text("Listo");
                        $('#cerrar').hide();
                        $('#tarjeta').val(responseText);
                        $('#formu').submit();

                });
                
        });
});
            </script>
        
    </body>
</html>
