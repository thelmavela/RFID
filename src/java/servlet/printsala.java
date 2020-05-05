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
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JRParameter;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.view.JasperViewer;
/**
 *
 * @author Thelma del Rosario
 */
public class printsala extends HttpServlet {

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
            out.println("<title>Servlet printsala</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet printsala at " + request.getContextPath() + "</h1>");
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
        try {
            Conexion con= new Conexion();
            Connection conn=con.getConnection();
            Map parameters = new HashMap();
            parameters.put("numsala", "1");
           // JasperReport jr= JasperCompileManager.compileReport("C:\\Users\\Thelma del Rosario\\Documents\\NetBeansProjects\\CORBA\\RFIDUacam\\web\\reportes\\laboratorios.jrxml");
            System.out.println(getServletContext().getRealPath("/"));
           JasperReport jr= JasperCompileManager.compileReport(  getServletContext().getRealPath("/")+ "\\reportes\\laboratorios.jrxml");
            JasperPrint print = JasperFillManager.fillReport(jr, parameters, conn);
            
            File fl= new File("C:\\ReportesRFID\\reporte1");
            if(!fl.exists()){
            fl.mkdirs();
            }
            
            JasperExportManager.exportReportToPdfFile(print, getServletContext().getRealPath("/")+ "\\reportes\\reporte1\\ReporteLab.pdf");
                        JasperExportManager.exportReportToPdfFile(print, "C:\\ReportesRFID\\reporte1\\ReporteLab.pdf");

            response.sendRedirect("view.jsp?file=reporte1&name=ReporteLab.pdf");
            
            
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
