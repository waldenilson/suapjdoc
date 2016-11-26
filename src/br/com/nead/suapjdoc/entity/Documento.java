package br.com.nead.suapjdoc.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Documento implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@SequenceGenerator(name="DOCUMENTO_ID_GENERATOR", sequenceName="DOCUMENTO_ID_SEQ", allocationSize=1)
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="DOCUMENTO_ID_GENERATOR")
	private int id;
	
	private Integer numero;
	private Integer ano;
	private String setor;
	private String remetente;

	@Column(name="instituicao_destinatario")
	private String instituicaoDestinatario;
	private String destinatario;
	private String signatario;
	
	@Column(name="cargo_signatario")
	private String cargoSignatario;
	private String assunto;
	private String mensagem;

	@Column(name="data_documento")
	@Temporal(TemporalType.TIMESTAMP)
	private Date dataDocumento;
	
	@Column(name="data_cadastro")
	@Temporal(TemporalType.TIMESTAMP)
	private Date dataCadastro;
	
	private String tipo;
	
	@ManyToOne
	@JoinColumn(name="auth_user_id")
	private AuthUser authUserId;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Integer getNumero() {
		return numero;
	}

	public void setNumero(Integer numero) {
		this.numero = numero;
	}

	public Integer getAno() {
		return ano;
	}

	public void setAno(Integer ano) {
		this.ano = ano;
	}

	public String getSetor() {
		return setor;
	}

	public void setSetor(String setor) {
		this.setor = setor;
	}

	public String getRemetente() {
		return remetente;
	}

	public void setRemetente(String remetente) {
		this.remetente = remetente;
	}

	public String getInstituicaoDestinatario() {
		return instituicaoDestinatario;
	}

	public void setInstituicaoDestinatario(String instituicaoDestinatario) {
		this.instituicaoDestinatario = instituicaoDestinatario;
	}

	public String getDestinatario() {
		return destinatario;
	}

	public void setDestinatario(String destinatario) {
		this.destinatario = destinatario;
	}

	public String getSignatario() {
		return signatario;
	}

	public void setSignatario(String signatario) {
		this.signatario = signatario;
	}

	public String getCargoSignatario() {
		return cargoSignatario;
	}

	public void setCargoSignatario(String cargoSignatario) {
		this.cargoSignatario = cargoSignatario;
	}

	public String getAssunto() {
		return assunto;
	}

	public void setAssunto(String assunto) {
		this.assunto = assunto;
	}

	public String getMensagem() {
		return mensagem;
	}

	public void setMensagem(String mensagem) {
		this.mensagem = mensagem;
	}

	public Date getDataDocumento() {
		return dataDocumento;
	}

	public void setDataDocumento(Date dataDocumento) {
		this.dataDocumento = dataDocumento;
	}

	public Date getDataCadastro() {
		return dataCadastro;
	}

	public void setDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public AuthUser getAuthUserId() {
		return authUserId;
	}

	public void setAuthUserId(AuthUser authUserId) {
		this.authUserId = authUserId;
	}

}
