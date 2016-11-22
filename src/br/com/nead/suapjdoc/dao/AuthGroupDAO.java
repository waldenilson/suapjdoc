package br.com.nead.suapjdoc.dao;

import javax.persistence.Query;

import br.com.nead.suapjdoc.dao.abstractdao.AbstractDAO;
import br.com.nead.suapjdoc.entity.AuthGroup;

public class AuthGroupDAO extends AbstractDAO<AuthGroup, Integer> {

	private Query q;
	
}
