   <jsp:include page="navbar.jsp"></jsp:include>
<%-- 
    Document   : index
    Created on : 13/04/2020, 10:35:16 PM
    Author     : Thelma del Rosario
--%>

<%@page import="dto.User"%>
<%@page import="dto.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>Editar Usuario</title>
    </head>
    <body>
     
        
        <%
        User user1=(User)request.getSession().getAttribute("user");
        

        %>
        
        <div class="container">
            <div class="form-fluid">
            <form  action="editarT" method="post">
               <div class="form-group">
                   
                   <label for="text">
                       Cliente:
                   </label> 
                   <input readonly class="form-control" name="usr" type="text" value="<%out.print(user1.getId());%>">
                   
                   </div>
                <div class="form-group">
                   
                   <label for="text">
                       Tarjeta:
                   </label> 
                   <input readonly class="form-control" id="tarjeta" name="card" type="text" value="<%out.print(user1.getCard());%>">
                   
                   </div>
                
                <div class="form-group">
                   
                   <label for="text">
                       Nombre
                   </label> 
                   <input class="form-control" name="name" type="text" value="<%out.print(user1.getNombre());%>">
                   
                   </div>
                <div class="form-group">
                    <label for="text">
                       Apellido
                   </label> 
                   <input  class="form-control" name="last" type="text" value="<%out.print(user1.getLast());%>">
                   </div>
                <div class="row">
                <div class="col-xs-2">
                <div class="form-group">
                    <label for="number">
                       Edad
                   </label> 
                    <input  class="form-control" name="edad" type="number" value="<%out.print(user1.getEdad());%>">
                   </div>
                </div>
                </div>
                
                <div class="form-group">
                    <label for="text">
                       Contraseña (dejar igual para no cambiar)
                   </label> 
                   <input  class="form-control" name="Facultad" type="password" value="<%out.print(user1.getpass());%>">
                   </div>
                
                 <div class="form-group">
                     <label for="text">Acerca tu tarjeta y luego da click en leer...</label>
                     <br>
                     
                      
                                   <h2 id='ready'></h2>

                 <h1 id="card"  class="btn btn-info" align="center">Leer Tarjeta</h1>  
                              <h1 id='cerrar' style='display:none' class="btn btn-dark" onclick="location.href='cerrarpuerto?redir=lista.jsp'">Abandonar...</h1>
                   </div>
                   
                   <div class="form-group">
                       <input value="Editar" class="btn btn-success" type="submit"></input>
                   </div>
                
            </form> 
                   

                          <script>
            $(document).ready(function() {
       
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
        
        
        
    </body>
</html>
