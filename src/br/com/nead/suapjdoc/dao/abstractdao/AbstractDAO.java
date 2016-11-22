package br.com.nead.suapjdoc.dao.abstractdao;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public abstract class AbstractDAO<T, PK extends Serializable> implements IDAO<T, Serializable> {

	private static EntityManager em;
	private static EntityManagerFactory emf;
	private Class<T> persistenceClass;
	
	private static EntityManagerFactory getEntityManagerFactory(){
		if( emf == null || !emf.isOpen() )
			emf = Persistence.createEntityManagerFactory("suapjdoc");
		return emf;
	}
	
	protected static EntityManager getEntityManager(){
		if(em == null || !em.isOpen())
			em = getEntityManagerFactory().createEntityManager();
		return em;
	}
	
	@SuppressWarnings("unchecked")
	private Class<T> getPersistenceClass(){
		persistenceClass = (Class<T>)( (ParameterizedType) getClass().
				getGenericSuperclass() ).getActualTypeArguments()[0];
		return persistenceClass;
	}
	
	private void fechar(){
		getEntityManager().close();
		getEntityManagerFactory().close();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<T> findAll() {
		List<T> retorno;
		
		try
		{
			List<T> l = getEntityManager().createQuery(
					"SELECT t FROM "+getPersistenceClass().getSimpleName()+" t").
					getResultList();
			retorno = l;
			
			retorno = new ArrayList<T>();
			for(T t : l){
				getEntityManager().refresh( getEntityManager().merge(t) );
				retorno.add(t);
			}
			
		}
		catch(Exception e){
			e.printStackTrace();
			retorno = new ArrayList<T>();
		}
		finally{
//			fechar();
		}
		return retorno;
	}
	
	@Override
	public T findOne(Serializable pk) {
		// TODO Auto-generated method stub
		return getEntityManager().find(getPersistenceClass(), pk);
	}
	
	@Override
	public boolean update(T t) {

		getEntityManager().getTransaction().begin();
		try
		{
			getEntityManager().merge(t);
			getEntityManager().getTransaction().commit();
			return true;
		}
		catch(Exception e ){
			e.printStackTrace();
			getEntityManager().getTransaction().rollback();
			return false;
		}
		finally{
			fechar();
		}
	}
	
	@Override
	public boolean save(T t) {
		getEntityManager().getTransaction().begin();
		try
		{
			getEntityManager().persist(t);
			getEntityManager().getTransaction().commit();
			return true;
		}
		catch(Exception e ){
			e.printStackTrace();
			getEntityManager().getTransaction().rollback();
			return false;
		}
		finally{
			fechar();
		}
	}
	
	@Override
	public boolean remove(T t) {
		getEntityManager().getTransaction().begin();
		try
		{
			getEntityManager().remove(t);
			getEntityManager().getTransaction().commit();
			return true;
		}
		catch(Exception e ){
			e.printStackTrace();
			getEntityManager().getTransaction().rollback();
			return false;
		}
		finally{
//			fechar();
		}
	}
	
}
