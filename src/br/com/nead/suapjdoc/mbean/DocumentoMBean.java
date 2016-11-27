package br.com.nead.suapjdoc.mbean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.enterprise.context.SessionScoped;
import javax.faces.application.FacesMessage;
import javax.inject.Named;
import br.com.nead.suapjdoc.dao.DocumentoDAO;
import br.com.nead.suapjdoc.entity.Documento;

@Named
@SessionScoped
public class DocumentoMBean extends AbstractMBean implements Serializable {

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
		this.selecionar();
	}

	public void salvar() {

		if( getDocumento().getAssunto().length() > 2 )
			executar();
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
				super.facesMensagens(FacesMessage.SEVERITY_ERROR, "ERRO", "");
		}
		else{
			// edicao
						
			if( dDAO.update( getDocumento() ) ){
				super.facesMensagens(FacesMessage.SEVERITY_INFO, "INFORMAÇÕES ATUALIZADAS", "");
			}
			else{
				super.facesMensagens(FacesMessage.SEVERITY_ERROR, "ERRO", "");				
			}
		}		
	}

	public void selecionar(){
		super.selecionar("/suapjdoc/obj-documento.htm");
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
