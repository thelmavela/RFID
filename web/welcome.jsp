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
    <META HTTP-EQUIV="REFRESH" CONTENT="3;URL=<%String redirect=request.getParameter("redirect");out.print(request.getParameter("redirect"));%>"> 
    <title>¡Bienvenido a la sala!</title>
    </head>
    <body>
        
        <div class="row">
            
            <div class='col-xs-3' >
                
                <h2>Usuario:</h2>
                
            </div>
           
            <div class='col-xs-3' >
                
                <h2><%
                    
                    Conexion con= new Conexion();
                    Connection conn=con.getConnection();
                    Statement stm=conn.createStatement();
                    ResultSet rs=stm.executeQuery("select * from login where serial='"+request.getParameter("id")+"'");
                    
                    if(rs.next()){
                    request.getSession().setAttribute("iduser", rs.getString(1));
                    out.print(rs.getString(3)+" "+rs.getString(4));
                    conn.close();
                    }else{response.sendRedirect("error.jsp?msg=Usuario no registrado&url=index.jsp");}

                %></h2>
                
            </div>
            
                  
            
        </div>
        
          <div class='jumbotron'>
                        
              <h1>¡Buen día!</h1>
              <h4>Redirigiendo...</h4>
                    </div>
        
        
    </body>
</html>
