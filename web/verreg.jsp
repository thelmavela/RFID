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
        <title>Lista de Registros al día: <%out.print(request.getParameter("date"));%></title>
    </head>
    <body>
        <h1>Registrados:</h1>
      
        
        <%Conexion con= new Conexion();
          Connection conn=con.getConnection();
          Statement stm=conn.createStatement();
          ResultSet rs=stm.executeQuery("SELECT idsala as 'Numero de Sala', idlogin as 'Numero de Usuario', concat(login.nombre,' ',login.apellido) as 'Nombre Usuario', Fecha,(SELECT IF(registro.tipo=1, 'Entrada', 'Salida')) as Tipo FROM registro, login where registro.idlogin=login.idusuario and fecha LIKE '"+request.getParameter("date")+"%'");
          
        %>
        <script>  
        $(document).ready(function() {
                $('#salas').addClass("active");});
            
                </script>
                 <div class="container">
            <form action="printregistros" method="post" target="_blank">
                
                <input class="form-control" onlyread type="text" name="date" value="<%out.print(request.getParameter("date"));%>">
                
        <table class="table table-bordered">
            <thead>
                    <th>
                       Sala
                    </th>
                  <th>
                        IDUsuario
                    </th>
                      <th>
                        Nombre Usuario
                    </th>
                      <th>
                        Fecha de Registro
                    </th>
                      <th>
                        Tipo
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

                    
                    out.print("</tr>");
                    }
                    

stm.close();
conn.close();
                %>
                
            </tbody>
                
            
            
        </table>>
            
  
                
                <input type="submit" class="btn btn-info" value="Generar PDF">
            </form>
        </div>      
        
        
    </body>
</html>
