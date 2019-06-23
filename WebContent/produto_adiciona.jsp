<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    

<%@ page import="br.com.unisys.model.Categoria" %>
<%@ page import="br.com.unisys.model.CategoriaDAO" %>

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
	<h3><font color="blue">Adiciona Produto</font></h3><hr>
	
	<form action="adicionaProduto" method="post">
		<table align="center">
			<tr><td>Nome do produto:</td><td><input type="text" name="produto.nomeProduto"></td></tr>
			
			<tr><td>Categoria:</td>
		        <td><select name="produto.idCategoria">
		    			<option selected="selected" value="-1">Selecione a categoria</option>
			    		<%	
						Session sessionH = new HibernateUtil().getSession();
						sessionH.beginTransaction();
						CategoriaDAO dao = new CategoriaDAO(sessionH);
						
					    List <Categoria> listaCategorias = dao.listaCategoria(); 

					    for (Iterator <Categoria> iterator1 = listaCategorias.iterator(); iterator1.hasNext();){
				            Categoria categoria = (Categoria) iterator1.next();
				    	%>
				            <option value=<%=categoria.getIdCategoria()%>><%=categoria.getNomeCategoria()%></option>
				    	<%
				         }
						%>
					</select>
			    </td></tr>
						
			<tr><td>Preço unitário:</td><td><input type="text" name="produto.preco"></td></tr>
			
			<tr><td>Unid. em estoque:</td><td><input type="text" name="produto.estoque"></td></tr>
						    
			<tr><td>Produto bloqueado:</td>
				<td><input type="radio" name="produto.bloqueado" value="S">Sim &nbsp;&nbsp; 
					<input type="radio" name="produto.bloqueado" value="N" checked>Não </td></tr>  
			<tr><td colspan="2">&nbsp;</td></tr>  
			<tr><td colspan="2" align="right"><input type="submit" value="Salvar">&nbsp;&nbsp;<input type="reset" value="Limpar"></td></tr>
		</table>
	</form>
</body>
</html>  