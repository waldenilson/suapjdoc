package br.com.nead.suapjdoc.dao;

import java.util.List;

import javax.persistence.Query;
import br.com.nead.suapjdoc.dao.abstractdao.AbstractDAO;
import br.com.nead.suapjdoc.entity.AuthUser;

public class AuthUserDAO extends AbstractDAO<AuthUser, Integer> {

	private Query q;

	@SuppressWarnings("unchecked")
	public AuthUser buscarAcesso(AuthUser usuario)
	{
		q = getEntityManager().createQuery("SELECT a FROM AuthUser a WHERE a.username = :login AND a.password = :senha AND a.isActive = TRUE");
		q.setParameter( "login", usuario.getUsername() );
		q.setParameter( "senha", usuario.getPassword() );
		List<AuthUser> l = q.getResultList();
		if(l.isEmpty())
			return null;
		else
			return l.get(0);
	}

	@SuppressWarnings("unchecked")
	public List<AuthUser> buscarPorNome(String texto) {
		q = getEntityManager().createQuery("SELECT a FROM AuthUser a WHERE a.firstName ILIKE :texto OR a.lastName ILIKE :texto");
		q.setParameter( "texto", texto );
		return q.getResultList();
	}

}
