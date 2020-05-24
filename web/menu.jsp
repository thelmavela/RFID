<%-- 
    Document   : index
    Created on : 13/04/2020, 10:35:16 PM
    Author     : Thelma del Rosario
--%>
   <jsp:include page="navbar.jsp"></jsp:include>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Registro</title>
    </head>
    <body>
                
        
        <h1>Registrar Nuevo Usuario</h1>
        
        <div class="container">
            <div class="form-fluid">
            <form  action="nuevoR" method="post">
               <div class="form-group">
                   
                   <label for="text">
                       Nombre
                   </label> 
                   <input class="form-control" name="name" type="text" required>
                   
                   </div>
                <div class="form-group">
                    <label for="text">
                       Apellido
                   </label> 
                   <input  class="form-control" name="last" type="text" required>
                   </div>
                <div class="row">
                <div class="col-xs-2">
                <div class="form-group">
                    <label for="number">
                       Edad
                   </label> 
                   <input  class="form-control" name="edad" value="0" type="number" required>
                   </div>
                </div>
                </div>
                
               
                <div class="form-group">
                    <label for="text">
                       Contraseña
                   </label> 
                   <input  class="form-control" name="pass" type="password" required> 
                   </div>
                <div class="form-group">
                   
                   <label for="text">
                       Tarjeta:
                   </label> 
                   <input readonly class="form-control" id="tarjeta" name="card" type="text" value="00-00-00-02" required>
                   
                   </div>
                 <div class="form-group">
                    
                     <br>
                     <div class="form-group">
                     <label for="checkbox">Admin?</label>
                     <input type="checkbox" value="1" name="admin">
                     
                     </div>
                                   <h2 id='ready'></h2>

                 <h1 id="card"  class="btn btn-info" align="center">Leer Tarjeta</h1>  
                              <h1 id='cerrar' style='display:none' required class="btn btn-dark" onclick="location.href='cerrarpuerto?redir=lista.jsp'">Abandonar...</h1>
                   </div>
                   
                   <div class="form-group">
                       <input value="Registrar Nuevo" class="btn btn-success" type="submit"></input>
                   </div>
                
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

                        alert(responseText);
                });
                
        });
});
            </script>
            </div>
        </div>
        <div class="container">
            
        </div>  
        <br>
        
        
        
    </body>
</html>
