<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    

<%@ page import="br.com.unisys.model.Perfil" %>
<%@ page import="br.com.unisys.model.PerfilDAO" %>

<%@ page import="br.com.unisys.model.HibernateUtil" %>
<%@ page import="org.hibernate.Session" %>

<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
	<h3><font color="blue">Adiciona Usuário</font></h3><hr>
	
	<form action="adicionaUsuario" method="post">
		<table align="center">
			<tr><td>Nome do usuário:</td><td><input type="text" name="usuario.nomeUsuario"></td></tr>
			<tr><td>Senha de acesso:</td><td><input type="password" name="usuario.senha"></td></tr>
			<tr><td>Perfil:</td>
		        <td><select name="usuario.idPerfil">
		    			<option selected="selected" value="-1">Selecione o pefil</option>
			    		<%	
						Session sessionH = new HibernateUtil().getSession();
						sessionH.beginTransaction();
						PerfilDAO dao = new PerfilDAO(sessionH);
						
					    List <Perfil> listaPerfis = dao.listaPerfil(); 

					    for (Iterator <Perfil> iterator1 = listaPerfis.iterator(); iterator1.hasNext();){
				            Perfil perfil = (Perfil) iterator1.next();
				    	%>
				            <option value=<%=perfil.getIdPerfil()%>><%=perfil.getPerfil()%></option>
				    	<%
				         }
						%>
					</select>
			    </td></tr>
			<tr><td>Acesso bloqueado:</td>
				<td><input type="radio" name="usuario.bloqueado" value="S">Sim &nbsp;&nbsp; 
					<input type="radio" name="usuario.bloqueado" value="N" checked>Não </td></tr>  
			<tr><td colspan="2">&nbsp;</td></tr>  
			<tr><td colspan="2" align="right"><input type="submit" value="Salvar">&nbsp;&nbsp;<input type="reset" value="Limpar"></td></tr>
		</table>
	</form>
</body>
</html>  