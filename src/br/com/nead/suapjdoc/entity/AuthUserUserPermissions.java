package br.com.nead.suapjdoc.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

@Entity
public class AuthUserUserPermissions implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@SequenceGenerator(name="AUTH_USER_USER_PERMISSIONS_ID_GENERATOR", sequenceName="AUTH_USER_PERMISSIONS_ID_SEQ", allocationSize=1)
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="AUTH_USER_USER_PERMISSIONS_ID_GENERATOR")
	private Integer id;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
}
