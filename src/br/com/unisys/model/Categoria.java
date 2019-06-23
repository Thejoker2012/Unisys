package br.com.unisys.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="Categoria")
@SequenceGenerator(name="seq_Categoria", sequenceName="seq_Categoria", allocationSize=1)

//@Entity Anotação usada para criar (Entidade) no BD
//@Table Anotação usada para criar Tabela no BD
//@sequence generator Anotação usada para criar a sequence no BD Oracle

public class Categoria {

	@Id
	@GeneratedValue(generator="seq_Categoria", strategy=GenerationType.SEQUENCE)
	public long idCategoria;
	@Column(length=20)
	public String nomeCategoria;
	@Column(length=50)
	public String descricao;
	
	//construtor
	public Categoria(){
		
	}

	public long getIdCategoria() {
		return idCategoria;
	}

	public void setIdCategoria(long idCategoria) {
		this.idCategoria = idCategoria;
	}

	public String getNomeCategoria() {
		return nomeCategoria;
	}

	public void setNomeCategoria(String nomeCategoria) {
		this.nomeCategoria = nomeCategoria;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
}
