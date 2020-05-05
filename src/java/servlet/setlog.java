/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import conexion.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
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
public class setlog extends HttpServlet {

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
            out.println("<title>Servlet setlog</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet setlog at " + request.getContextPath() + "</h1>");
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
        try {
            String serial=request.getParameter("serial");
            String sala=request.getParameter("sala");
            Conexion con= new Conexion();
            Connection conn=con.getConnection();
            Statement stm=conn.createStatement();
            ResultSet rs=stm.executeQuery("select * from login where serial='"+serial+"'");
            
            if(rs.next()){
                
                
            String id=rs.getString(1);    
            String stat=rs.getString("registrado");
            String tipo="";
            if(stat.equals("0")){
            tipo="1";
            stat="1";
            }else{
            if(stat.equals("1")){
            tipo="2";
            stat="0";
            }
            }
            Date dt= new Date();
                SimpleDateFormat df= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String fecha=df.format(dt);
            
            String nombre=rs.getString("nombre");
            String apellido=rs.getString("apellido");
            String user=nombre+" "+apellido;
            stm.close();
            stm=conn.createStatement();
            stm.executeUpdate("insert into registro(idsala,idlogin,fecha,tipo)values('"+sala+"','"+id+"','"+fecha+"','"+tipo+"')");
            stm.close();
            stm=conn.createStatement();
            stm.executeUpdate("update login set registrado='"+stat+"' where idusuario="+id);
            stm.close();
            
            
            conn.close();
            
            if(stat.equals("1")){
           response.sendRedirect("welcome_2.jsp?sala="+sala+"&user="+user);     
            }else{
           if(stat.equals("0")){
               response.sendRedirect("thanks_1.jsp?sala="+sala+"&user="+user);
           }else{
            
                response.sendRedirect("error.jsp?msg=Error de Tarjeta&url=iniciarreg.jsp");
                
            }
            
            }
            }
            
            
            
//user
        } catch (SQLException ex) {
            Logger.getLogger(setlog.class.getName()).log(Level.SEVERE, null, ex);
        }

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
        processRequest(request, response);
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
