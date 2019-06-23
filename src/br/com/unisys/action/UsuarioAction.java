package br.com.unisys.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.HibernateException;
import org.hibernate.Session;

import br.com.unisys.model.HibernateUtil;
import br.com.unisys.model.Usuario;
import br.com.unisys.model.UsuarioDAO;

import com.opensymphony.xwork2.ActionSupport;

public class UsuarioAction extends ActionSupport {
	
	private static final long serialVersionUID = 716155646905825865L;
	
	public Usuario usuario = new Usuario();
	
	public Usuario getUsuario(){ 
		return this.usuario;	
	}
	
	public void setUsuario(Usuario usuario){
		this.usuario = usuario;
	}
	
	@Action(value="adicionaUsuario",
	        results={@Result(name="ok", location="/msg_gravacao_ok.jsp"),
 					 @Result(name="erro", location="/msg_gravacao_erro.jsp")})
	public String adicionaUsuario(){
		
		String retorno = "";

		try{
			Session session = new HibernateUtil().getSession();
			session.beginTransaction();
		
			UsuarioDAO dao = new UsuarioDAO(session);
			dao.adiciona(usuario);
		
			session.getTransaction().commit();
			session.close();
			
			retorno = "ok";
			
            }catch(HibernateException ex){
			
			ex.printStackTrace();
			retorno = "erro";
		}
		
		return retorno;
	}

	@Action(value="atualizaUsuario",
	        results={@Result(name="ok", location="/msg_gravacao_ok.jsp"),
 					 @Result(name="erro", location="/msg_gravacao_erro.jsp")})
	public String atualizaUsuario(){
		
		String retorno = "";

		try{
			Session session = new HibernateUtil().getSession();
			session.beginTransaction();
		
			UsuarioDAO dao = new UsuarioDAO(session);
			dao.atualiza(usuario);
		
			session.getTransaction().commit();
			session.close();
			
			retorno = "ok";
			
            }catch(HibernateException ex){
			
			ex.printStackTrace();
			retorno = "erro";
		}
		
		return retorno;
	}

	@Action(value="deletaUsuario",
	        results={@Result(name="ok", location="/msg_gravacao_ok.jsp"),
 					 @Result(name="erro", location="/msg_gravacao_erro.jsp")})
	public String deletaUsuario(){
		
		String retorno = "";

		try{
			Session session = new HibernateUtil().getSession();
			session.beginTransaction();
		
			UsuarioDAO dao = new UsuarioDAO(session);
			dao.deleta(usuario);
		
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