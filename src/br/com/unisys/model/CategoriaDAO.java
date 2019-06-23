package br.com.unisys.model;

import java.util.List;

import org.hibernate.Session;

public class CategoriaDAO {
	
private Session session;
	
	public CategoriaDAO(Session session){
		this.session = session;
	}
		
	public void adiciona(Categoria categoria){//save(objeto) Salva o objeto
		this.session.save(categoria);
	}
	
	public void deleta(Categoria categoria){//delete(objeto) Deletao objeto
		this.session.delete(categoria);
	}
	
	public void atualiza(Categoria categoria){//update(objeto) Atualiza o objeto
		this.session.update(categoria);
	}
	
	public Categoria retorna(long idCategoria){//load(Objeto) Carrega o objeto
		return (Categoria) this.session.load(Categoria.class, idCategoria);
	}
	
	@SuppressWarnings("unchecked")
	public List <Categoria> listaCategoria() {
		//return this.session.createSQLQuery("SELECT idCategoria,nomeCategoria,descricao FROM unisys.categoria").list();
		return this.session.createQuery("FROM Categoria").list();
	}
}
