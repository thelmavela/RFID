package Tarjeta;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author pabluck
 */
import conexion.Conexion;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import gnu.io.CommPortIdentifier; 
import gnu.io.SerialPort;
import gnu.io.SerialPortEvent; 
import gnu.io.SerialPortEventListener;
import java.awt.Component;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Enumeration;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;


public class SerialComm implements SerialPortEventListener {
	static SerialPort serialPort;
      
        
	private static final String PORT = "COM5";
	
	private BufferedReader input;
	
	private OutputStream output;
	
	private static final int TIME_OUT = 2000;
	String tipo="0";
	private static final int DATA_RATE = 9600;
	public String initialize(String tipo) throws IOException {
		//tipo 1= login
                //tipo 2= Registro
                this.tipo=tipo;
                System.setProperty("gnu.io.rxtx.SerialPorts", PORT);

		CommPortIdentifier portId = null;
		Enumeration portEnum = CommPortIdentifier.getPortIdentifiers();
		while (portEnum.hasMoreElements()) {
			CommPortIdentifier currPortId = (CommPortIdentifier) portEnum.nextElement();
			if (currPortId.getName().equals(PORT)) {
				portId = currPortId;
				break;
			}
		}
		if (portId == null) {
                    Component frame = null;
                    JOptionPane.showMessageDialog(frame, "No se encontró el puerto");
                    
			//System.out.println("No se encontró el puerto");
			return "NA";
		}

		try {
			serialPort = (SerialPort) portId.open(this.getClass().getName(),
					TIME_OUT);
			serialPort.setSerialPortParams(DATA_RATE,
					SerialPort.DATABITS_8,
					SerialPort.STOPBITS_1,
					SerialPort.PARITY_NONE);
			input = new BufferedReader(new InputStreamReader(serialPort.getInputStream()));
			output = serialPort.getOutputStream();
                        
                        
                        
                        
			serialPort.addEventListener(this);
			serialPort.notifyOnDataAvailable(true);
                     
                        
                        
                        
		} catch (Exception e) {
			System.err.println(e.toString());
		}
               
               return "";
	}

	public synchronized void close() {
		if (serialPort != null) {
			serialPort.removeEventListener();
			serialPort.close();
		}
	}
        
        public void cerrar() throws IOException{
            input.close();
            output.close();
        serialPort.removeEventListener();
			serialPort.close();
        }
        
	public synchronized void serialEvent(SerialPortEvent oEvent) {
            
            System.out.println("si llega");
		if (oEvent.getEventType() == SerialPortEvent.DATA_AVAILABLE) {
			try {
				String inputLine=input.readLine();
				System.out.println(inputLine);
				
				if (true) {
					if (inputLine.startsWith("Card UID")) {
                                            
                                       //id manda los bips a arduino
                                            id = cuid( inputLine.substring(10).trim(),tipo );
                                          
                                             if(id.equals("1")||id.equals("2")){
                                            output.write(id.getBytes());
                                             input.close();
                                              output.close();
                                             serialPort.removeEventListener();
                                              serialPort.close();
                                            }
                                            
                                              
                                             
                                             
					}else{
                                        
                                        }
				}
				
			} catch (Exception e) {
				System.err.println(e.toString());
			}
		}
		
	}
         String id="0";
         public String cuid(String id, String tipo) throws IOException, SQLException {
       //tipo 1 login, 2 registro
		Conexion con= new Conexion();
                Connection conn=con.getConnection();
                Statement stm=conn.createStatement();
                ResultSet rs= stm.executeQuery("select * from login where serial='"+id+"'");
             
              
                
              FileWriter fichero = null;
        PrintWriter pw = null;
        try
        {
            File fl= new File("c:\\Prueba\\id.card");
            if(fl.exists()){
            fl.delete();
            }
            
            File f= new File("c:\\Prueba\\id.card");
            f.createNewFile();
            fichero = new FileWriter(f);
            
            pw = new PrintWriter(fichero);
            pw.println(id);
            fichero.close();
             
              if(rs.next()){
                  
                 return "1";
                }
            
            
             
              
        }catch(Exception e){
            System.out.println(e);
            
            if(tipo.equals("1")){
                return "2";}
            else{ return "1";}
        
        }
        return "2";
	}
         

   
}
