package br.com.unisys.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionSupport;

import br.com.unisys.model.HibernateUtil;
import br.com.unisys.model.Produto;
import br.com.unisys.model.ProdutoDAO;

public class ProdutoAction extends ActionSupport {
	
	private static final long serialVersionUID = 716155646905825865L;
	
	public Produto produto = new Produto();
	
	public Produto getProduto(){ 
		return this.produto;	
	}
	
	public void setProduto(Produto produto){
		this.produto = produto;
	}
	
	@Action(value="adicionaProduto",
	        results={@Result(name="ok", location="/msg_gravacao_ok.jsp"),
 					 @Result(name="erro", location="/msg_gravacao_erro.jsp")})
	public String adicionaProduto(){
		
		String retorno = "";

		try{
			Session session = new HibernateUtil().getSession();
			session.beginTransaction();
		
			ProdutoDAO dao = new ProdutoDAO(session);
			dao.adiciona(produto);
		
			session.getTransaction().commit();
			session.close();
			
			retorno = "ok";
			
        }catch(HibernateException ex){
			
			ex.printStackTrace();
			retorno = "erro";
		}
		return retorno;
	}

	@Action(value="atualizaProduto",
	        results={@Result(name="ok", location="/msg_gravacao_ok.jsp"),
 					 @Result(name="erro", location="/msg_gravacao_erro.jsp")})
	public String atualizaUsuario(){
		
		String retorno = "";

		try{
			Session session = new HibernateUtil().getSession();
			session.beginTransaction();
		
			ProdutoDAO dao = new ProdutoDAO(session);
			dao.atualiza(produto);
		
			session.getTransaction().commit();
			session.close();
			
			retorno = "ok";
			
            }catch(HibernateException ex){
			
			ex.printStackTrace();
			retorno = "erro";
		}
		
		return retorno;
	}

	@Action(value="deletaProduto",
	        results={@Result(name="ok", location="/msg_gravacao_ok.jsp"),
 					 @Result(name="erro", location="/msg_gravacao_erro.jsp")})
	public String deletaUsuario(){
		
		String retorno = "";

		try{
			Session session = new HibernateUtil().getSession();
			session.beginTransaction();
		
			ProdutoDAO dao = new ProdutoDAO(session);
			dao.deleta(produto);
		
			session.getTransaction().commit();
			session.close();
			
			retorno = "ok";
			
            }catch(HibernateException ex){
			
			ex.printStackTrace();
			retorno = "erro";
		}
		
		return retorno;
	}
	
}