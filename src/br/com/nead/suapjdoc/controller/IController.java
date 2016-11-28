package br.com.nead.suapjdoc.controller;

import javax.ejb.Local;

@Local
public interface IController {

	public String md5(String senha);
}
