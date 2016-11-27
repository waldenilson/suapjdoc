package br.com.nead.suapjdoc.mbean;

import java.io.Serializable;

import javax.enterprise.context.RequestScoped;
//import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

@Named
@RequestScoped
public class FormularioMBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String nome;
		
	public FormularioMBean(){
		System.out.println("Criando uma instancia do MBean.");
	}

	public void executar(){
		System.out.println("Metodo executar. Nome: "+getNome());		
	}
	
	public String getNome() {
		System.out.println("get nome: "+this.nome);
		return nome;
	}

	public void setNome(String nome) {
		System.out.println("set nome: "+nome);
		this.nome = nome;
	}
	
}
