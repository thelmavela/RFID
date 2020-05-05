/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import conexion.Conexion;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;

/**
 *
 * @author Thelma del Rosario
 */
public class printregistros extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet printregistros</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet printregistros at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
String date=request.getParameter("date");

try {
            Conexion con= new Conexion();
            Connection conn=con.getConnection();
            Map parameters = new HashMap();
            parameters.put("fecha", date+"%");
           // JasperReport jr= JasperCompileManager.compileReport("C:\\Users\\Thelma del Rosario\\Documents\\NetBeansProjects\\CORBA\\RFIDUacam\\web\\reportes\\laboratorios.jrxml");
            System.out.println(getServletContext().getRealPath("/"));
           JasperReport jr= JasperCompileManager.compileReport(  getServletContext().getRealPath("/")+ "\\reportes\\regpordia.jrxml");
            JasperPrint print = JasperFillManager.fillReport(jr, parameters, conn);
            
            File fl= new File("C:\\ReportesRFID\\reporte3");
            if(!fl.exists()){
            fl.mkdirs();
            }
            
            JasperExportManager.exportReportToPdfFile(print, getServletContext().getRealPath("/")+ "\\reportes\\reporte3\\Registros"+date+".pdf");
                        JasperExportManager.exportReportToPdfFile(print, "C:\\ReportesRFID\\reporte3\\Registros"+date+".pdf");

            response.sendRedirect("view.jsp?file=reporte3&name=Registros"+date+".pdf");
            
            
        } catch (JRException ex) {
            Logger.getLogger(printsala.class.getName()).log(Level.SEVERE, null, ex);
        }


    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
