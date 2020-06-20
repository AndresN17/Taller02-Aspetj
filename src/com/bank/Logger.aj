package com.bank;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;


public aspect Logger {
	
	pointcut success() : call(* create*(..) );
    after() : success() { 

    	//Muestro mensaje de la transaccion
    	System.out.println("Se ha realizado la transaccion createUser.");
    			
    	//Creo o sobreescribo el archivo log.txt con la transaccion.
    	File file=new File("log.txt");
    	Date date=new Date();
    	DateFormat dtformat= new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
    	String strDate=dtformat.format(date);
    	String transaction="CreateUser";
    	String logMssg=transaction+" "+strDate+"\n";
    	
    	try(BufferedWriter bf=new BufferedWriter(new FileWriter(file,true))){
			bf.write(logMssg);
		}catch(IOException i){
			System.out.println(i);
		}	
    	
    }

}

