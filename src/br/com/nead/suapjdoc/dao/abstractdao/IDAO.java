package br.com.nead.suapjdoc.dao.abstractdao;

import java.io.Serializable;
import java.util.List;

public interface IDAO<T, PK extends Serializable> {

	List<T> findAll();
	
	T findOne(PK pk);
	
	boolean update(T t);
	
	boolean save(T t);
	
	boolean remove(T t);
}
