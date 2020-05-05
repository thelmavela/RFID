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
            <title>Registro Sala</title>
    </head>
    <body>
                
        
        <h1>Registrar Nueva Sala</h1>
        
        <div class="container">
            <div class="form-fluid">
            <form  action="nuevaS" method="post">
               <div class="form-group">
                   
                   <label for="text">
                       Sala
                   </label> 
                   <input class="form-control" name="sala" type="text" required>
                   
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
                   <input  class="form-control" name="max" value="0" type="number" required>
                   </div>
                </div>
                </div>
                
               
            
                   
                   <div class="form-group">
                       <input value="Registrar Sala" class="btn btn-success" type="submit"></input>
                   </div>
                
            </form> 
                   

            </div>
        </div>
        <div class="container">
            
        </div>  
        <br>
        
        
        
    </body>
</html>
