package br.com.unisys.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.HibernateException;
import org.hibernate.Session;

import br.com.unisys.model.Cliente;
import br.com.unisys.model.ClienteDAO;
import br.com.unisys.model.HibernateUtil;

import com.opensymphony.xwork2.ActionSupport;

public class ClienteAction extends ActionSupport {
		
	private static final long serialVersionUID = -2890031628770541727L;
	
	public Cliente cliente = new Cliente();
	
	public Cliente getCliente(){ 
		return this.cliente;	
	}
	
	public void setCliente(Cliente cliente){
		this.cliente = cliente;
	}
	
	@Action(value="adicionaCliente",
	        results={@Result(name="ok", location="/msg_gravacao_ok.jsp"),
 					 @Result(name="erro", location="/msg_gravacao_erro.jsp")})
	public String adicionaCliente(){
		
		String retorno = "";

		try{
			Session session = new HibernateUtil().getSession();
			session.beginTransaction();
		
			ClienteDAO dao = new ClienteDAO(session);
			dao.adiciona(cliente);
		
			session.getTransaction().commit();
			session.close();
			
			retorno = "ok";
			
            }catch(HibernateException ex){
			
			ex.printStackTrace();
			retorno = "erro";
		}
		
		return retorno;
	}

	
	@Action(value="atualizaCliente",
	        results={@Result(name="ok", location="/msg_gravacao_ok.jsp"),
 					 @Result(name="erro", location="/msg_gravacao_erro.jsp")})
	public String atualizaCliente(){
		
		String retorno = "";

		try{
			Session session = new HibernateUtil().getSession();
			session.beginTransaction();
		
			ClienteDAO dao = new ClienteDAO(session);
			dao.atualiza(cliente);
		
			session.getTransaction().commit();
			session.close();
			
			retorno = "ok";
			
            }catch(HibernateException ex){
			
			ex.printStackTrace();
			retorno = "erro";
		}
		
		return retorno;
	}

	
	@Action(value="deletaCliente",
	        results={@Result(name="ok", location="/msg_gravacao_ok.jsp"),
 					 @Result(name="erro", location="/msg_gravacao_erro.jsp")})
	public String deletaCliente(){
		
		String retorno = "";

		try{
			Session session = new HibernateUtil().getSession();
			session.beginTransaction();
		
			ClienteDAO dao = new ClienteDAO(session);
			dao.deleta(cliente);
		
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
