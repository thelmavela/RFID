<%-- 
    Document   : welcome
    Created on : 15/04/2020, 08:18:28 PM
    Author     : Thelma del Rosario
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="conexion.Conexion"%>
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
    <title>Gracias por tu Visita</title>
    </head>
    <body onload="contar();">
        
        <div class="row">
            
            <div class='col-xs-3' >
                
                <h2>Usuario:</h2>
                
            </div>
           
            <div class='col-xs-3' >
                
                <h2>
                    <%out.println(request.getParameter("user"));%>
                </h2>
                
            </div>
            
                  
            
        </div>
        
          <div class='jumbotron'>
                        
              <h1>¡Pasa Buen día! Vuelve Pronto</h1>
              <h4>Redirigiendo...</h4>
              <h4 id="time"></h4>
              <script>
       var seconds = 4; //número de segundos a contar
function secondPassed() {

  var minutes = Math.round((seconds - 30)/60); //calcula el número de minutos
  var remainingSeconds = seconds % 60; //calcula los segundos
  //si los segundos usan sólo un dígito, añadimos un cero a la izq
  if (remainingSeconds < 10) { 
    remainingSeconds = "0" + remainingSeconds; 
  } 
  document.getElementById('countdown').innerHTML = remainingSeconds; 
  if (seconds == 0) { 
    clearInterval(countdownTimer); 
    window.location.href='iniciarreg.jsp?sala=<%out.print(request.getParameter("sala"));%>';
    document.getElementById('countdown').innerHTML = "Buzz Buzz"; 
  } else { 
    seconds--; 
  } 
} 

var countdownTimer = setInterval(secondPassed, 1000);
              </script>
              <label id="countdown"></label>
                    </div>
        
        
    </body>
</html>
