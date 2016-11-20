package br.com.nead.suapjdoc.mbean;

import java.io.Serializable;

import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

@Named
@SessionScoped
public class AuthenticationMBean implements Serializable {

	/**
	 * 	ATIVIDADE 03
	 */
	private static final long serialVersionUID = 1L;
	
	private String login, senha;
	
	public AuthenticationMBean(){
		System.out.println("Construtor");		
	}

	public void acessar(){
		if(getLogin().equals("admin") && getSenha().equals("admin"))
			System.out.println("Acessando sistema.");			
		else{
			System.out.println("Login e/ou senha incorreto(s). \nLogin: "+getLogin()+" Senha: "+getSenha());
		}
	}
	
	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

}
