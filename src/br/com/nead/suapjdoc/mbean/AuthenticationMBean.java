package br.com.nead.suapjdoc.mbean;

import javax.annotation.PostConstruct;
import javax.enterprise.context.SessionScoped;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.inject.Named;
import javax.servlet.http.HttpServletResponse;
import br.com.nead.suapjdoc.dao.AuthUserDAO;
import br.com.nead.suapjdoc.entity.AuthUser;
import java.io.IOException;
import java.io.Serializable;


@Named
@SessionScoped
public class AuthenticationMBean extends AbstractMBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private AuthUser usuario;
	private Boolean usuarioLogado;
	String senha_usuario;
		
	private AuthUserDAO udao;
	
	@PostConstruct
	public void init(){
		setUsuario(new AuthUser());
		setUsuarioLogado(false);		
		udao = new AuthUserDAO();
	}
		
	public void autenticar()
	{		
		getUsuario().setPassword( super.md5( getUsuario().getPassword() ) );
		AuthUser user = udao.buscarAcesso( getUsuario() );
		if( user != null )
		{
			setUsuarioLogado(true);
			setUsuario( user );
			
			senha_usuario = new AuthUserDAO().findOne( getUsuario().getId() ).getPassword();
						
			super.selecionar("/suapjdoc/documentos.htm");
		}
		else
			super.facesMensagens(FacesMessage.SEVERITY_WARN, "Autenticação", "Tente novamente");			
	}
		
	public void sair(){
		init();
		HttpServletResponse response = (HttpServletResponse) 
		FacesContext.getCurrentInstance().getExternalContext().getResponse();  
		try {
			response.sendRedirect("/suapjdoc/");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
	public AuthUser getUsuario() {
		return usuario;
	}

	public void setUsuario(AuthUser usuario) {
		this.usuario = usuario;
	}

	public Boolean getUsuarioLogado() {
		return usuarioLogado;
	}

	public void setUsuarioLogado(Boolean usuarioLogado) {
		this.usuarioLogado = usuarioLogado;
	}

}
