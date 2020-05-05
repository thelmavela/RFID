<%-- 
    Document   : selectsala
    Created on : 30/04/2020, 08:10:07 PM
    Author     : Thelma del Rosario
--%>
   <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="conexion.Conexion"%>
<%@page import="java.sql.Connection"%>
<jsp:include page="navbar.jsp"></jsp:include>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Elige Sala</title>
    </head>
    <body>

        <form action="iniciarreg" method="post">
            
            <%
                String iduser=(String)request.getSession().getAttribute("iduser");
                Conexion con=new Conexion();
            Connection conn =con.getConnection();
            Statement stm=conn.createStatement();
            ResultSet rs=stm.executeQuery("select idsala,Nsala from sala where encargado="+iduser+" and activa=1");
            


            %>
            <select class="form-control" name="select">

                <%
                while(rs.next()){
                out.print("<option value='"+rs.getString(1)+"'>"+rs.getString(2)+"</option>");
                }
                
                %>
                
                
                
            </select>
                
                <%stm.close();
                conn.close();
                %>
                
                <input type="submit" class="btn btn-success" value="Ir a Registro">
        </form>

    </body>
</html>
