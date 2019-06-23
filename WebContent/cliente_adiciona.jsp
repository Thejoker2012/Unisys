<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="s" uri="/struts-tags" %>    

<%@ page import="br.com.unisys.model.Logradouro" %>
<%@ page import="br.com.unisys.model.LogradouroDAO" %>

<%@ page import="br.com.unisys.model.Usuario" %>
<%@ page import="br.com.unisys.model.UsuarioDAO" %>

<%@ page import="br.com.unisys.model.HibernateUtil" %>
<%@ page import="org.hibernate.Session" %>

<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>


<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
	<h3><font color="blue">Adiciona Cliente</font></h3><hr>
	<form action="adicionaCliente" method="post">
		<table align="center">
			<tr><td>Nome do Cliente</td>
			    <td><input type="text" name="cliente.nomeCliente" size="50" maxlength="50"></td></tr>
			<tr><td>Cpf</td>
			    <td><input type="text" name="cliente.cpf" size="11" maxlength="11"></td></tr>
			<tr><td>Data de Nascimento</td>
			 	<td><input type="text" name="cliente.dataNasc"></td></tr>
			<tr><td>Sexo</td>
			        <td><input type="radio" name="cliente.sexo" value="M" checked>Masculino &nbsp;
			        	<input type="radio" name="cliente.sexo" value="F">Feminino</td></tr>
			<tr><td>Telefone</td>
			        <td><input type="text" name="cliente.telefone" size="10" maxlength="10"></td></tr>
			<tr><td>Celular</td>
			        <td><input type="text" name="cliente.celular" size="10" maxlength="10"></td></tr>
			<tr><td>e-Mail</td>
			        <td><input type="text" name="cliente.email" size="30" maxlength="30"></td></tr>
			<tr><td>Logradouro</td>
				<td><select name="cliente.idLogradouro">
						<option selected="selected" value="-1">Selecione o logradouro</option> 
					<%
						Session sessionH = new HibernateUtil().getSession();
						sessionH.beginTransaction();
						LogradouroDAO dao = new LogradouroDAO(sessionH);
						
					    List <Logradouro> listaLogradouros = dao.listaLogradouro(); 

					    for (Iterator <Logradouro> itLogradouro = listaLogradouros.iterator(); itLogradouro.hasNext();){
				            Logradouro logradouro = (Logradouro) itLogradouro.next();
				    %>
				            <option value="<%=logradouro.getIdLogradouro()%>"><%=logradouro.getLogradouro()%></option>
				    <%
				         }
					%>
					</select> &nbsp; Nro. <input type="text" size="5" maxlength="10" name="cliente.nro">
					          &nbsp; Compl. <input type="text" size="10" maxlength="10" name="cliente.complemento">
				</td></tr>
				
			<tr><td colspan="2">&nbsp;</td></tr>
					
			<tr><td align="center"></td>
				<td colspan="2" align="right"><input type="submit" name="btnSalvar" value="Salvar"> &nbsp; &nbsp;
				                             <input type="reset" name="btnLimpar" value="Limpar"></td></tr>			 			
		</table>

		<input type="hidden" name="cliente.idUsuario" value="${sessionScope.idUsuario}">
		
		<%  
			Date dataAtual = new Date();   
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");  
			String dataCadastro = sdf.format(dataAtual);  
		%>  
    
		<input type="hidden" name="cliente.dataCadastro" value="<%=dataCadastro%>">

	</form>
</body>