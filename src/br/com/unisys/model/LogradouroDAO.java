package br.com.unisys.model;

import java.util.List;

import org.hibernate.Session;

public class LogradouroDAO {
	
private Session session;
	
	public LogradouroDAO(Session session){
		this.session = session;
	}
	
	public void adiciona(Logradouro logradouro){
		this.session.save(logradouro);
	}
	
	public void deleta(Logradouro logradouro){
		this.session.delete(logradouro);
	}
	
	public void atualiza(Logradouro logradouro){
		this.session.update(logradouro);
	}
	
	public Logradouro retorna(long idLogradouro){
		return (Logradouro) this.session.load(Logradouro.class, idLogradouro);
	}
	
	@SuppressWarnings("unchecked")
	public List <Logradouro> listaLogradouro() {
		return this.session.createQuery("FROM Logradouro").list();
	}
}


