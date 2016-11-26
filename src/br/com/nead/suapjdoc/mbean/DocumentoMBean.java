package br.com.nead.suapjdoc.mbean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.enterprise.context.SessionScoped;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.inject.Named;
import br.com.nead.suapjdoc.dao.DocumentoDAO;
import br.com.nead.suapjdoc.entity.Documento;

@Named
@SessionScoped
public class DocumentoMBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private DocumentoDAO dDAO;
	private Documento documento;
	private List<Documento> documentos;
	
	@PostConstruct
	public void init(){
		setDocumento( new Documento() );
		this.dDAO = new DocumentoDAO();
		this.documentos = new ArrayList<Documento>();
	}
	
	public void novo(){
		init();
	}

	public void salvar() {

		if( getDocumento().getAssunto().length() > 2 )
		{
			if( !getDocumento().getNumero().equals("") )
				executar();
			else
				facesMensagens(FacesMessage.SEVERITY_WARN, "Informe um número válido.", "");
		}
		else
			facesMensagens(FacesMessage.SEVERITY_WARN, "Informe no minimo 3 letras para o campo assunto.", "");

	}

	private void executar(){
		if( getDocumento().getId() == null )
		{
			// cadastro
			if( dDAO.save( getDocumento() ) ){
				//salvou
			}
			else
				facesMensagens(FacesMessage.SEVERITY_ERROR, "ERRO", "");
		}
		else{
			// edicao
						
			if( dDAO.update( getDocumento() ) ){
				facesMensagens(FacesMessage.SEVERITY_INFO, "INFORMAÇÕES ATUALIZADAS", "");
			}
			else{
				facesMensagens(FacesMessage.SEVERITY_ERROR, "ERRO", "");				
			}
		}		
	}

	private void facesMensagens(FacesMessage.Severity msg,String title,String desc){
		
		FacesMessage msg2 = new FacesMessage();
		msg2.setSeverity(msg);
		msg2.setSummary(title);
		msg2.setDetail(desc);
		FacesContext.getCurrentInstance().addMessage(null, msg2);

	}

	public Documento getDocumento() {
		return documento;
	}

	public void setDocumento(Documento documento) {
		this.documento = documento;
	}

	public List<Documento> getDocumentos() {
		setDocumentos( dDAO.findAll() );
		return documentos;
	}

	public void setDocumentos(List<Documento> documentos) {
		this.documentos = documentos;
	}

}
