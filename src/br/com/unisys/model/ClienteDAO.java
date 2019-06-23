package br.com.unisys.model;

import java.util.List;

import org.hibernate.Session;

public class ClienteDAO {
	
private Session session;
	
	public ClienteDAO(Session session){
		this.session = session;
	}
	
	public void adiciona(Cliente cliente){
		this.session.save(cliente);
	}
	
	public void deleta(Cliente cliente){
		this.session.delete(cliente);
	}
	
	public void atualiza(Cliente cliente){
		this.session.update(cliente);
	}
	
	public Cliente retorna(long idCliente){
		return (Cliente) this.session.load(Cliente.class, idCliente);
	}
	
	@SuppressWarnings("unchecked")
	public List <Cliente> listaCliente() {
		return this.session.createQuery("FROM Cliente").list();
	}
}


