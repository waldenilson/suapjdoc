package br.com.nead.suapjdoc.controller;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.ejb.Stateless;

/**
 * Session Bean implementation class Controller
 */
@Stateless
public class Controller implements IController {

    /**
     * Default constructor. 
     */
    public Controller() {
        // TODO Auto-generated constructor stub
    }

	   public String md5(String senha) 
	   {  
		   try 
	       {  
			   MessageDigest md = MessageDigest.getInstance("MD5");  
	           BigInteger hash = new BigInteger(1, md.digest(senha.getBytes()));  
	           return  hash.toString(16);           
	       }
		   catch (NoSuchAlgorithmException  e)
	       {  
			   e.printStackTrace();  
	       	   return "null";
	       }  
	   } 

}
