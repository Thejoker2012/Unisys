<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="s" uri="/struts-tags" %>    

<%@ page import="br.com.unisys.model.Logradouro" %>
<%@ page import="br.com.unisys.model.LogradouroDAO" %>

<%@ page import="br.com.unisys.model.Cliente" %>
<%@ page import="br.com.unisys.model.ClienteDAO" %>

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
	<h3><font color="blue">Deleta Cliente</font></h3><hr>
	
	<% 
		long _idCliente = Long.parseLong(request.getParameter("idCliente"));

		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		
		Session sessionH = new HibernateUtil().getSession();
		sessionH.beginTransaction();
		
		ClienteDAO daoCliente = new ClienteDAO(sessionH);
		Cliente cliente = new Cliente();
			
		cliente = daoCliente.retorna(_idCliente);
			
		String _nomeCliente = cliente.getNomeCliente();
		String _cpf = cliente.getCpf();
		String _dataNasc = sdf.format(cliente.getDataNasc());
		
		String _sexo = cliente.getSexo();
		String _checkedFem = (_sexo.equals("F"))?"checked":"";
		String _checkedMasc = (_sexo.equals("M"))?"checked":"";
		
		String _telefone = cliente.getTelefone();
		String _celular = cliente.getCelular();
		String _email = cliente.getEmail();
		
		long _idLogradouro = cliente.getIdLogradouro();
		String _logradouro = cliente.getLogradouro().getLogradouro();
		String _nro = cliente.getNro();
		String _complemento = cliente.getComplemento();
		
	%>
	
	<form action="deletaCliente" method="post">
	
		<input type="hidden" name="cliente.idCliente" value="<%=_idCliente %>">

		<table align="center">
			<tr><td>Nome do Cliente</td>
			    <td><input type="text" name="cliente.nomeCliente" value="<%=_nomeCliente %>" size="50" maxlength="50"></td></tr>
			<tr><td>Cpf</td>
			    <td><input type="text" name="cliente.cpf" value="<%=_cpf %>" size="11" maxlength="11"></td></tr>
			<tr><td>Data de Nascimento</td>
			 	<td><input type="text" name="cliente.dataNasc" value="<%=_dataNasc %>"></td></tr>
			<tr><td>Sexo</td>
			        <td><input type="radio" name="cliente.sexo" value="M" <%=_checkedMasc %>>Masculino &nbsp;
			        	<input type="radio" name="cliente.sexo" value="F" <%=_checkedFem %>>Feminino</td></tr>
			<tr><td>Telefone</td>
			        <td><input type="text" name="cliente.telefone" value="<%=_telefone %>" size="10" maxlength="10"></td></tr>
			<tr><td>Celular</td>
			        <td><input type="text" name="cliente.celular" value="<%=_celular %>" size="10" maxlength="10"></td></tr>
			<tr><td>e-Mail</td>
			        <td><input type="text" name="cliente.email" value="<%=_email %>" size="30" maxlength="30"></td></tr>
			<tr><td>Logradouro</td>
				<td><select name="cliente.idLogradouro">
						<option selected="selected" value="<%=_idLogradouro%>"><%=_logradouro%></option> 
					<%
						LogradouroDAO dao = new LogradouroDAO(sessionH);
						
					    List <Logradouro> listaLogradouros = dao.listaLogradouro(); 

					    for (Iterator <Logradouro> itLogradouro = listaLogradouros.iterator(); itLogradouro.hasNext();){
				            Logradouro logradouro = (Logradouro) itLogradouro.next();
				    %>
				            <option value="<%=logradouro.getIdLogradouro()%>"><%=logradouro.getLogradouro()%></option>
				    <%
				         }
					%>
					</select> &nbsp; Nro. <input type="text" value="<%=_nro %>" size="5" maxlength="10" name="cliente.nro">
					          &nbsp; Compl. <input type="text" value="<%=_complemento %>" size="10" maxlength="10" name="cliente.complemento">
				</td></tr>
				
				<tr><td colspan="2">&nbsp;</td></tr>  
				<tr><td colspan="2" align="right"><input type="submit" value="Confirmar Exclusão"></td></tr>	
		</table>
	
	</form>
</body>