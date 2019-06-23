package br.com.unisys.model;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.SequenceGenerator;
import javax.persistence.GeneratedValue;
import javax.persistence.Entity;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
@Table(name="Usuario")
@SequenceGenerator(name="seq_Usuario", sequenceName="seq_Usuario", allocationSize=1)
public class Usuario {
	
	//Campos
	@Id
	@GeneratedValue(generator="seq_Usuario", strategy=GenerationType.SEQUENCE)
	public long idUsuario;
	@Column(length=20)
	public String nomeUsuario;
	@Column(length=8)
	public String senha;
	//Relacionamento com Perfil
	@ManyToOne
	@JoinColumn(name="idPerfil", referencedColumnName="idPerfil")
	public Perfil perfil = new Perfil();
	@Column(length=1)
	public String bloqueado;
	
	//Construtor
	public Usuario(){
		
	}

	public long getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(long idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getNomeUsuario() {
		return nomeUsuario;
	}

	public void setNomeUsuario(String nomeUsuario) {
		this.nomeUsuario = nomeUsuario;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public Perfil getPerfil() {
		return perfil;
	}

	public void setPerfil(Perfil perfil) {
		this.perfil = perfil;
	}

	public long getIdPerfil(){
		return this.perfil.idPerfil;
	}
	
	public void setIdPerfil(long idPerfil){
		this.perfil.idPerfil = idPerfil;
	}
	
	
	public String getBloqueado() {
		return bloqueado;
	}

	public void setBloqueado(String bloqueado) {
		this.bloqueado = bloqueado;
	}
	
}
