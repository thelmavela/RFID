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

        <form action="verreg.jsp">
            
        <div class="row">
            <div class="col-xs-2">
                          <div class="input-group date" data-provide="datepicker">
                              <input type="date" class="form-control" name="date">
    <div class="input-group-addon">
        <span class="glyphicon glyphicon-th"></span>
    </div>
</div>

            </div>
        </div> 
            <br>
             <input type="submit" class="btn btn-success" value="Ver Lista">
        </form>

    </body>
</html>
