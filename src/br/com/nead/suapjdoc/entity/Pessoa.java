package br.com.nead.suapjdoc.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Pessoa {

	@Id
	private int id;
	
	@Column
	private String nome;
}
