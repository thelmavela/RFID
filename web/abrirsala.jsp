<%-- 
    Document   : abrirsala
    Created on : 22/04/2020, 08:04:16 PM
    Author     : Thelma del Rosario
--%>

<jsp:include page="navbar.jsp"></jsp:include>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="conexion.Conexion"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
           <title>Salas y Laboratorios</title>
    </head>
    <body>
        
      
        
        <%Conexion con= new Conexion();
          Connection conn=con.getConnection();
          Statement stm=conn.createStatement();
          ResultSet rs=stm.executeQuery("select idsala,nsala,activa,max,encargado,concat(login.nombre,' ',login.apellido) as encarg from sala,login where active=1 and encargado=login.idusuario");
          
        %>
        <script>  
        $(document).ready(function() {
                $('#sala').addClass("active");});
            
                </script>
                
             <h1>Salas disponibles:</h1>   
      <table class="table table-bordered">
            <thead>
                    <th>
                       Registro sala 
                    </th>
                  <th>
                        Nombre
                    </th>
                      <th>
                        Estado:
                    </th>
                      <th>
                        Total de alumnos:
                    </th>
                      <th>
                        Encargado:
                    </th>
                      <th>
                        Editar
                    </th>
                    <th>
                        Borrar
                    </th>
                      <th>
                        Abrir/Cerrar
                    </th>
                    
            </thead>
            <tbody>
                <%
                    while(rs.next()){
                    out.print("<tr>");
                    
                    out.print("<td>");
                    out.print(rs.getString("idsala"));
                    out.print("</td>");
                    
                    out.print("</td>");
                    
                    out.print("<td>");
                    out.print(rs.getString("nsala"));
                    out.print("</td>");
                    
                    out.print("<td>");
                    
                    if(rs.getString("activa").equals("0")){
                    out.print("Cerrada");
                    }else{
                    out.print("Abierta");
                    }
                    
                    out.print("</td>");
                    
                    out.print("<td>");
                    out.print(rs.getString("max"));
                    out.print("</td>");
                    
                    out.print("<td>");
                    out.print(rs.getString("encarg"));
                    out.print("</td>");

                    
                    out.print("<td>");
                    out.print("<form action='editsala.jsp' method='post'><button name='id' type=submit class='btn btn-warning' value='"+rs.getString(1)+"'>E</button> </form>");
                    out.print("</td>");
                    
                     out.print("<td>");
                    out.print("<form action='delsala' method='post'><button name='id' type=submit class='btn btn-warning' value='"+rs.getString(1)+"'>X</button> </form>");
                    out.print("</td>");
                    
                    out.print("<td>");
                    String letra="";
                    if(rs.getString("activa").equals("1")){
                    letra="C";
                    }else{
                    letra="A";
                    }
                    out.print("<form action='abrirsala?sala="+rs.getString(1)+"' method='post'><button name='id' type=submit class='btn btn-warning' value='"+rs.getString(1)+"'>"+letra+"</button> </form>");
                    out.print("</td>");
                    
                    out.print("</tr>");
                    }
                    

stm.close();
conn.close();
                %>
                
            </tbody>
                
            
            
        </table>>
            
            
        <div class="container">
            <form action="printsala" method="post" target="_blank">
                
                <input type="submit" class="btn btn-info" value="Generar PDF">
            </form>
        </div>
             
             
        
        
    </body>
</html>

