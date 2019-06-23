package br.com.unisys.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


@Entity
@Table(name="Logradouro")
@SequenceGenerator(name="seq_Logradouro", sequenceName="seq_Logradouro", allocationSize=1)
public class Logradouro {
	@Id
	@GeneratedValue(generator="seq_Logradouro", strategy=GenerationType.SEQUENCE)
	public long idLogradouro;
	public String tipoLogradouro;
	public String logradouro;
	@Column(length=20)
	public String bairro;
	@Column(length=20)
	public String cidade;
	@Column(length=2)
	public String uf;
	public String cep;
	
	//construtor
	public Logradouro(){
		
	}

	public long getIdLogradouro() {
		return idLogradouro;
	}

	public void setIdLogradouro(long idLogradouro) {
		this.idLogradouro = idLogradouro;
	}

	public String getTipoLogradouro() {
		return tipoLogradouro;
	}

	public void setTipoLogradouro(String tipoLogradouro) {
		this.tipoLogradouro = tipoLogradouro;
	}

	public String getLogradouro() {
		return logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getUf() {
		return uf;
	}

	public void setUf(String uf) {
		this.uf = uf;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

}
