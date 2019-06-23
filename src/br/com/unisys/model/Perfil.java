package br.com.unisys.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="Perfil")
@SequenceGenerator(name="seq_Perfil", sequenceName="seq_Perfil", allocationSize=1)
public class Perfil {

	@Id
	@GeneratedValue(generator="seq_Perfil", strategy=GenerationType.SEQUENCE)
	public long idPerfil;
	@Column(length=20)
	public String perfil;
	@Column(length=50)
	public String descricao;
	
	//construtor
	public Perfil(){
		
	}

	public long getIdPerfil() {
		return idPerfil;
	}

	public void setIdPerfil(long idPerfil) {
		this.idPerfil = idPerfil;
	}

	public String getPerfil() {
		return perfil;
	}

	public void setPerfil(String perfil) {
		this.perfil = perfil;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}


}
