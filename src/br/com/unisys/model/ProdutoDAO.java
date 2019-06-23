package br.com.unisys.model;

import java.util.List;

import org.hibernate.Session;

public class ProdutoDAO {
	
private Session session;
	
	public ProdutoDAO(Session session){
		this.session = session;
	}
	
	public void adiciona(Produto produto){
		
		this.session.save(produto);
	}
	
	public void deleta(Produto produto){
		this.session.delete(produto);
	}
	
	public void atualiza(Produto produto){
		this.session.update(produto);
	}
	
	public Produto retorna(long idProduto){
		return (Produto) this.session.load(Produto.class, idProduto);
	}
	
	@SuppressWarnings("unchecked")
	public List <Produto> listaProduto() {
		return this.session.createQuery("FROM Produto").list();
	}
	
}


