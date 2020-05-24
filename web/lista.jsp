<%-- 
    Document   : index
    Created on : 13/04/2020, 10:35:16 PM
    Author     : Thelma del Rosario
--%>
   <jsp:include page="navbar.jsp"></jsp:include>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="conexion.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
           <title>Lista de Usuarios</title>
    </head>
    <body>
        <h1>Registrados:</h1>
      
        
        <%Conexion con= new Conexion();
          Connection conn=con.getConnection();
          Statement stm=conn.createStatement();
          ResultSet rs=stm.executeQuery("select * from login where idusuario>0 and activo=1");
          
        %>
        <script>  
        $(document).ready(function() {
                $('#list').addClass("active");});
            
                </script>
                
        <table class="table table-bordered">
            <thead>
                    <th>
                       Usuario # 
                    </th>
                  <th>
                        Tarjeta
                    </th>
                      <th>
                        Nombre
                    </th>
                      <th>
                        Apellido
                    </th>
                      <th>
                        Edad
                    </th>
                      <th>
                        Borrar
                    </th>
                    <th>
                        Editar
                    </th>
                    
            </thead>
            <tbody>
                <%
                    while(rs.next()){
                    out.print("<tr>");
                    
                    out.print("<td>");
                    out.print(rs.getString(1));
                    out.print("</td>");
                    
                    out.print("</td>");
                    
                    out.print("<td>");
                    out.print(rs.getString(2));
                    out.print("</td>");
                    
                    out.print("<td>");
                    out.print(rs.getString(3));
                    out.print("</td>");
                    
                    out.print("<td>");
                    out.print(rs.getString(4));
                    out.print("</td>");
                    
                    out.print("<td>");
                    out.print(rs.getString(5));
                    out.print("</td>");

                    
                    out.print("<td>");
                    out.print("<form action='deluser' method='post'><button name='id' type=submit class='btn btn-warning' value='"+rs.getString(1)+"'>X</button> </form>");
                    out.print("</td>");
                    
                     out.print("<td>");
                    out.print("<form action='servedituser' method='post'><button name='id' type=submit class='btn btn-warning' value='"+rs.getString(1)+"'>E</button> </form>");
                    out.print("</td>");
                    
                    
                    out.print("</tr>");
                    }
                    

stm.close();
conn.close();
                %>
                
            </tbody>
                
            
            
        </table>>
            
   <div class="container">
            <form action="printusers" method="post" target="_blank">
                
                <input  type="submit" class="btn btn-info" value="Generar PDF">
            </form>
        </div>      
        
        
    </body>
</html>
