<%-- 
    Document   : index
    Created on : 20/04/2020, 07:01:45 PM
    Author     : Thelma del Rosario
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="Bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="Bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="Bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="Bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
      <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    </head>
        <title>Modulo de Registro Inicial</title>
    </head>
    <body>
        
        <div class="row" style="margin-top: 10%">
        <div class="col-sm-4"></div>
        
        <div class="col-sm-4" align="center" >
         <form action="login" method='post'>
 <div class="form-group">
     <img width="80%" src="img/UAC.jfif">
 </div>
             <div class="form-group">
    <label for="email">Usuario:</label>
    <input type="texts" class="form-control" id="email" name="user">
  </div>
  <div class="form-group">
    <label for="pwd">Password:</label>
    <input type="password" class="form-control" id="pwd" name="pwd">
  </div>

  <button type="submit" class="btn btn-success">Ingresar</button>
  
</form> 
     
        </div>
        </div>
        <div class="row" style="margin-top: 1%">
            <div class="col-lg-12" align="center">
            
                
                <%request.getSession().setAttribute("login", null);%>
        <button id="card"  class="btn btn-info" align="center">Ingreso con Tarjeta</button>   
        
              
            
                <script>
            $(document).ready(function() {
       
                $('#card').click(function(event) {
                    $('#card').attr("disabled",true);
                    $('#ready').text("Esperando...");
                    $('#cerrar').show();
                    
                     $.post('waituser', {
                         file: "1"
                }, function(responseText) {
                        $('#ready').text("Listo");
                         setTimeout(function() {
       window.location.href = responseText;
      }, 1000);
                });
                
        });
});
            </script>
        
            <h2 id='ready'></h2>
        
        
        
            <button id='cerrar' style='display:none' class="btn btn-dark" onclick="location.href='cerrarpuerto?redir=index.jsp'">Abandonar...</button>
                
                
            </div>  
    </div> 
        
        <h3 id='ready' style="color:red"></h3>
        </body>
</html>