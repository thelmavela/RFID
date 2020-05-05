    <%-- 
    Document   : navbar
    Created on : 16/04/2020, 08:37:26 PM
    Author     : Thelma del Rosario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    </head>
    <%
      try{
        Integer x=(Integer)request.getSession().getAttribute("login");
        System.out.println(x);
        //0 no logueado
        if(x==0){
              request.getRequestDispatcher("index.jsp").forward(request, response);

        }
        
        }catch(Exception e){
            System.out.println("catch no entra" + e);
        request.getRequestDispatcher("index.jsp").forward(request, response);
        }
        %>
    <body>
         
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="exit">Inicio</a>
    </div>
    <ul class="nav navbar-nav">
      
      <li id="reg"><a href="menu.jsp">Registrar</a></li>
      <li id="list"><a href="lista.jsp">Lista Usuarios</a></li>
      <li class="dropdown" id="salas">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Salas y Labs
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="abrirsala.jsp">Ver Salas</a></li>
          <li><a href="regsala.jsp">Agregar Salas</a></li>
          <li><a href="verregoption.jsp">Ver Registros</a></li>
           
        </ul>
      </li>
      <%
          String style="";
          try{
          String x=(String)request.getSession().getAttribute("sala");
          if(x.equals("S")){
          style="display:''";
          }else{
          style="display:none";
          }
          
          }catch(Exception e){
          style="display:none";
          }
          

      %>
      <li id="inireg" ><a href="selectsala.jsp" style="<%out.print(style);%>">Ver Registro</a></li>
      <li id="corba" ><a href="corba.jsp">Validar Tarjetas</a></li>
      

    </ul>
      <ul class="nav navbar-nav navbar-right">
                <li ><a  href="exit">Salir</a></li>

      </ul>
  </div>
</nav>
        
    </body>
</html>
