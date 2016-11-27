package br.com.nead.suapjdoc.mbean;

import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.faces.application.FacesMessage;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;

public abstract class AbstractMBean {

	protected void facesMensagens(FacesMessage.Severity msg,String title,String desc){
		
		FacesMessage msg2 = new FacesMessage();
		msg2.setSeverity(msg);
		msg2.setSummary(title);
		msg2.setDetail(desc);
		FacesContext.getCurrentInstance().addMessage(null, msg2);

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
	
		public void selecionar(String outcome) {

			ExternalContext ec = FacesContext.getCurrentInstance().getExternalContext();  
			try {
				ec.redirect(outcome);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			
//			ConfigurableNavigationHandler configurableNavigationHandler =
//		             (ConfigurableNavigationHandler)FacesContext.
//		               getCurrentInstance().getApplication().getNavigationHandler();
//		       
//		         configurableNavigationHandler.performNavigation(outcome);
		}
		
}
