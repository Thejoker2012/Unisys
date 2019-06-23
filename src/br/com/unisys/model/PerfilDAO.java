package br.com.unisys.model;

import java.util.List;

import org.hibernate.Session;

public class PerfilDAO {
	
private Session session;
	
	public PerfilDAO(Session session){
		this.session = session;
	}
	
	public void adiciona(Perfil perfil){
		this.session.save(perfil);
	}
	
	public void deleta(Perfil perfil){
		this.session.delete(perfil);
	}
	
	public void atualiza(Perfil perfil){
		this.session.update(perfil);
	}
	
	public Perfil retorna(long idperfil){
		return (Perfil) this.session.load(Perfil.class, idperfil);
	}
	
	@SuppressWarnings("unchecked")
	public List <Perfil> listaPerfil() {
		//return this.session.createSQLQuery("SELECT idPerfil,perfil,descricao FROM unisys.perfil").list();
		return this.session.createQuery("FROM Perfil").list();
	}
}
