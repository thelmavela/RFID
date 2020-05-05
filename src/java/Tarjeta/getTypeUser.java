/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Tarjeta;

import conexion.Conexion;
import java.sql.*;

/**
 *
 * @author Thelma del Rosario
 */
public class getTypeUser {
    
    public int retorna(String tarjeta) throws SQLException{
    
        Conexion con= new Conexion();
        Connection conn=con.getConnection();
        Statement stm=conn.createStatement();
        ResultSet rs= stm.executeQuery("select tipo from login where serial='"+tarjeta+"'");
        rs.next();
        int tipo=rs.getInt(1);
        rs.close();
        stm.close();
        conn.close();
        
        return tipo;
        
    
    }
    
    
}
