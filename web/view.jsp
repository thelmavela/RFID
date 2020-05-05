<%-- 
    Document   : view
    Created on : 1/05/2020, 09:55:27 PM
    Author     : Thelma del Rosario
--%>

<%@ page language="java" contentType="application/pdf; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

    <%@ page import= "java.io.*" %>

    <%
String file=request.getParameter("file");
String filename=request.getParameter("name");
//CODIGO JSP 

FileInputStream ficheroInput = new FileInputStream( getServletContext().getRealPath("/")+"\\reportes\\"+file+"\\"+filename);

int tamanoInput = ficheroInput.available();

byte[] datosPDF = new byte[tamanoInput];

ficheroInput.read( datosPDF, 0, tamanoInput);

 

response.setHeader("Content-disposition","inline;"+filename );

response.setContentType("application/pdf");

response.setContentLength(tamanoInput);

response.getOutputStream().write(datosPDF);

 

ficheroInput.close();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Visor PDF</title>

</head>

<body>

 

</body>

</html>
