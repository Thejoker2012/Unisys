package br.com.unisys.model;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

public class UsuarioDAO {
	
private Session session;
	
	public UsuarioDAO(Session session){
		this.session = session;
	}
	
	public void adiciona(Usuario usuario){
		
		this.session.save(usuario);
	}
	
	public void deleta(Usuario usuario){
		this.session.delete(usuario);
	}
	
	public void atualiza(Usuario usuario){
		this.session.update(usuario);
	}
	
	public Usuario retorna(long idUsuario){
		return (Usuario) this.session.load(Usuario.class, idUsuario);
	}
	
	@SuppressWarnings("unchecked")
	public List <Usuario> listaUsuario() {
		return this.session.createQuery("FROM Usuario").list();
	}
	
	@SuppressWarnings("unchecked")
	public List <Usuario> validaLogin(String nomeUsuario, String senha) {
		Criteria crit = session.createCriteria(Usuario.class); 
		crit.add(Restrictions.eq("nomeUsuario",nomeUsuario));
		crit.add(Restrictions.eq("senha",senha));
		List<Usuario> results = crit.list(); 
		return results;
	}

}


