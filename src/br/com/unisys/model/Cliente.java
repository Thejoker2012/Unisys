
package br.com.unisys.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="Cliente")
@SequenceGenerator(name="seq_Cliente", sequenceName="seq_Cliente", allocationSize=1)
public class Cliente {
	
		@Id
		@GeneratedValue(generator="seq_Cliente", strategy=GenerationType.SEQUENCE)
		public long idCliente;
		@Column(length=50)
		public String nomeCliente;
		@Column(length=11)
		public String cpf;
		public Date dataNasc;
		@Column(length=1)
		public String sexo;
		@Column(length=10)
		public String telefone;
		@Column(length=10)
		public String celular;
		@Column(length=30)
		public String email;
		@ManyToOne
		@JoinColumn(name="idLogradouro", referencedColumnName="idLogradouro")
		public Logradouro logradouro = new Logradouro();
		@Column(length=10)
		public String nro;
		@Column(length=10)
		public String complemento;
				
		//construtor
		public Cliente(){
			
		}

		public long getIdCliente() {
			return idCliente;
		}

		public void setIdCliente(long idCliente) {
			this.idCliente = idCliente;
		}

		public String getNomeCliente() {
			return nomeCliente;
		}

		public void setNomeCliente(String nomeCliente) {
			this.nomeCliente = nomeCliente;
		}

		public String getCpf() {
			return cpf;
		}

		public void setCpf(String cpf) {
			this.cpf = cpf;
		}

		public Date getDataNasc() {
			return dataNasc;
		}

		public void setDataNasc(Date dataNasc) {
			this.dataNasc = dataNasc;
		}

		public String getSexo() {
			return sexo;
		}

		public void setSexo(String sexo) {
			this.sexo = sexo;
		}

		public String getTelefone() {
			return telefone;
		}

		public void setTelefone(String telefone) {
			this.telefone = telefone;
		}

		public String getCelular() {
			return celular;
		}

		public void setCelular(String celular) {
			this.celular = celular;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public Logradouro getLogradouro() {
			return logradouro;
		}

		public void setLogradouro(Logradouro logradouro) {
			this.logradouro = logradouro;
		}

		public long getIdLogradouro(){
			return this.logradouro.idLogradouro;
		}
		
		public void setIdLogradouro(long idLogradouro){
			this.logradouro.idLogradouro = idLogradouro;
		}

		public String getNro() {
			return nro;
		}

		public void setNro(String nro) {
			this.nro = nro;
		}

		public String getComplemento() {
			return complemento;
		}

		public void setComplemento(String complemento) {
			this.complemento = complemento;
		}


}


