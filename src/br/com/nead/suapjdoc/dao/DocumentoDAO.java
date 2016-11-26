package br.com.nead.suapjdoc.dao;

import java.util.List;

import javax.persistence.Query;

import br.com.nead.suapjdoc.dao.abstractdao.AbstractDAO;
import br.com.nead.suapjdoc.entity.Documento;

public class DocumentoDAO extends AbstractDAO<Documento, Integer> {

	private Query q;

	@SuppressWarnings("unchecked")
	public List<Documento> buscarPorAssunto(String texto) {
		q = getEntityManager().createQuery("SELECT d FROM Documento d WHERE d.assunto ILIKE :assunto");
		q.setParameter( "assunto", texto );
		return q.getResultList();
	}

}
