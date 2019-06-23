<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    

<%@ page import="br.com.unisys.model.Categoria" %>
<%@ page import="br.com.unisys.model.CategoriaDAO" %>

<%@ page import="br.com.unisys.model.Produto" %>
<%@ page import="br.com.unisys.model.ProdutoDAO" %>

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
	<h3><font color="blue">Atualiza Produto</font></h3><hr>
	
	<% 
		long _idProduto = Long.parseLong(request.getParameter("idProduto"));
			   
		Session sessionH = new HibernateUtil().getSession();
		sessionH.beginTransaction();
		
		ProdutoDAO daoProduto = new ProdutoDAO(sessionH);
		Produto produto = new Produto();
			
		produto = daoProduto.retorna(_idProduto);
			
		String _nomeProduto = produto.getNomeProduto();
		
		long _idCategoria = produto.getIdCategoria();
		String _categoria = produto.getCategoria().getNomeCategoria();

		String _preco = String.valueOf(produto.getPreco());
		String _estoque = String.valueOf(produto.getEstoque());

		String _bloqueado = produto.getBloqueado();
		String _sim = (_bloqueado.equals("S"))?"checked":"";
		String _nao = (_bloqueado.equals("N"))?"checked":"";

	%>
	
	<form action="atualizaProduto" method="post">
		
		<input type="hidden" name="produto.idProduto" value="<%=_idProduto%>">
		
		<table align="center">
			<tr><td>Nome do produto:</td><td><input type="text" name="produto.nomeProduto" value=<%=_nomeProduto %>></td></tr>
			
			<tr><td>Categoria:</td>
		        <td><select name="produto.idCategoria">
		    			<option selected="selected" value="<%=_idCategoria%>"><%=_categoria%></option> 
			    		<%	
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
						
			<tr><td>Preço unitário:</td><td><input type="text" name="produto.preco" value=<%=_preco %>></td></tr>
			
			<tr><td>Unid. em estoque:</td><td><input type="text" name="produto.estoque" value=<%=_estoque %>></td></tr>
						    
			<tr><td>Produto bloqueado:</td>
				<td><input type="radio" name="produto.bloqueado" value="S" <%=_sim %>>Sim &nbsp;&nbsp; 
					<input type="radio" name="produto.bloqueado" value="N" <%=_nao %>>Não </td></tr>  
		
			<tr><td colspan="2">&nbsp;</td></tr>  
			<tr><td colspan="2" align="right"><input type="submit" value="Salvar">&nbsp;&nbsp;<input type="reset" value="Limpar"></td></tr>
					
		</table>

	</form>
</body>