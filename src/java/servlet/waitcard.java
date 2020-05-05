/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Tarjeta.SerialComm;
import Tarjeta.getTypeUser;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Thelma del Rosario
 */
public class waitcard extends HttpServlet {

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
            out.println("<title>Servlet waitcard</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet waitcard at " + request.getContextPath() + "</h1>");
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
        
        
     
        
         SerialComm sm= new SerialComm();
        
        
         sm.initialize("2");
        
         
         //esperando archivo
         
         int archivo=0;
         //bandera para esperar archivo creado
   File f1= new File("C:\\prueba\\id.card");
     while(archivo==0){
     
         
         if(f1.exists()){
             
        PrintWriter out =  response.getWriter();
    
        
         String tarjeta="";
        while(tarjeta.equals("")){
            
        FileReader fr = new FileReader (f1);
         BufferedReader br = new BufferedReader(fr);
         tarjeta=br.readLine();
                    System.out.println(tarjeta);
                    
                    if(tarjeta==null){
                    tarjeta="";
                    }
                     
                     fr.close();
         br.close();
}
         
         if(tarjeta.equals("exit")){
         sm.cerrar();
          f1.delete();
         sm.close();
         out.print("Sin Tarjeta");
         
         
         
         return;
         }else{
         
         }
                out.print(tarjeta);

             System.out.println("Tarjeta : "+tarjeta);
          f1.delete();
         
         sm.cerrar();
       archivo=1;
         }
          
        
          
         
      
         
     
     }
         
        f1.delete();
         
         sm.cerrar();
        
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
