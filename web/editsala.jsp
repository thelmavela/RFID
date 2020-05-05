<%-- 
    Document   : index
    Created on : 13/04/2020, 10:35:16 PM
    Author     : Thelma del Rosario
--%>
   <%@page import="java.sql.*"%>
<%@page import="conexion.Conexion"%>
<jsp:include page="navbar.jsp"></jsp:include>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Editar Sala</title>
    </head>
    <body>
                
        
        <h1>Editar la Sala <%out.print(request.getParameter("id"));%></h1>
        
        <%
Conexion con2= new Conexion();
                        Connection conn2=con2.getConnection();
                        Statement stm2=conn2.createStatement();
                        ResultSet rs2=stm2.executeQuery("select * from sala where idsala="+request.getParameter("id"));
                        rs2.next();

        %>
        <div class="container">
            <div class="form-fluid">
            <form  action="editarS" method="post">
                
                <div class="form-group">
                   
                   
                   
                   <label for="text">
                       Registro
                   </label> 
                   <input class="form-control" name="id" type="text" value="<%out.print(rs2.getString(1));%>" readonly>
                   
                   </div>
                
               <div class="form-group">
                   
                   
                   
                   <label for="text">
                       Sala
                   </label> 
                   <input class="form-control" name="sala" type="text" value="<%out.print(rs2.getString(2));%>" required>
                   
                   </div>
                <div class="form-group">
                    <label for="text">
                       Encargado
                   </label>
                    
                    <select class="form-control" name="enc">
                        
                        <%Conexion con= new Conexion();
                        Connection conn=con.getConnection();
                        Statement stm=conn.createStatement();
                        ResultSet rs=stm.executeQuery("select idusuario,concat(nombre,' ',apellido) from rfid.login where tipo=1 ");
                        
                        while(rs.next()){
                        
                        out.println("<option value=\""+rs.getString(1)+"\">"+rs.getString(2)+"</option>");
                            
                        }
                        %>
                    
                    </select>
                    
                   
                   </div>
                <div class="row">
                <div class="col-xs-2">
                <div class="form-group">
                    <label for="number">
                       Maximo
                   </label> 
                   <input  class="form-control" name="max" value="0" type="number" value="<%out.print(rs2.getString(4));%>" required>
                   </div>
                </div>
                </div>
                
               
            
                   
                   <div class="form-group">
                       <input value="Editar Sala" class="btn btn-success" type="submit"></input>
                   </div>
                
            </form> 
                   

            </div>
        </div>
        <div class="container">
            
        </div>  
        <br>
        
        
        
    </body>
</html>
