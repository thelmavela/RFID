/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clientecorba;

import corba1.prueba;
import corba1.pruebaHelper;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;
import java.util.Scanner;
import org.omg.CORBA.ORB;
import org.omg.CosNaming.NamingContextExt;
import org.omg.CosNaming.NamingContextExtHelper;
import org.omg.CosNaming.NamingContextPackage.CannotProceed;
import org.omg.CosNaming.NamingContextPackage.InvalidName;
import org.omg.CosNaming.NamingContextPackage.NotFound;

/**
 *
 * @author Thelma del Rosario
 */
public class Clientecorba {

    /**
     * @param args the command line arguments
     */
    
    
    
    public String holis(String number) throws org.omg.CORBA.ORBPackage.InvalidName {
        // TODO code application logic here
        String[]args2=null;
       Properties props = new Properties();
props.put("-ORBInitialHost","localhost");
props.put("-ORBInitialPort","900");
         try {
            ORB orb = ORB.init(args2, props);
            org.omg.CORBA.Object objRef = orb.resolve_initial_references("NameService");
            NamingContextExt ncRef = NamingContextExtHelper.narrow(objRef);
            //
            prueba fiboImpl = pruebaHelper.narrow(ncRef.resolve_str("prueba"));
            //para capturar lo que escriba el usuario
            //ciclo infinito
                return fiboImpl.generar(number);      
                    
        } catch (Exception e) {
            System.out.println("Error: " + e);
            e.printStackTrace(System.out);
        }
        return "falla";
    }
    
}
