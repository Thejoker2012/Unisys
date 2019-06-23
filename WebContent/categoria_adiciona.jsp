<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<h3><font color="blue">Adiciona Categoria</font></h3><hr>

	<form action="adicionaCategoria" method="post">
		<table align="center">
			<tr><td>Nome da Categoria:</td>
				<td><input type="text" name="categoria.nomeCategoria"></td></tr>
			<tr><td>Descrição:</td>
				<td><input type="text" name="categoria.descricao"></td></tr>
			<tr><td colspan="2">&nbsp;</td></tr>  
			<tr><td colspan="2" align="right"><input type="submit" value="Salvar">&nbsp;&nbsp;<input type="reset" value="Limpar"></td></tr>
		</table>	
	</form>
	</body>
</html>