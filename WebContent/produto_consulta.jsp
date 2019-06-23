<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

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

	<script type="text/javascript">
       function ConfirmaExclusao() {
           return confirm("Registro selecionado na grid será excluido!");
       }    
   	</script>
</head>
<body>
	<h3><font color="blue">Consulta Produto</font></h3><hr>
	
      <div class="col-md-12 column">
          <table class="table table-condensed table-bordered">
            <thead>
              <tr>
              	<th>#</th>
                <th>Nome do Produto</th>
                <th>Categoria</th>
                <th>Preco</th>
				<th>Estoque</th>
				<th>Bloqueado</th>
              </tr>
            </thead>        
			<tbody>
				<%
					Session sessionH = new HibernateUtil().getSession();
					sessionH.beginTransaction();
					ProdutoDAO dao = new ProdutoDAO(sessionH);
					
				    List <Produto> listaProdutos = dao.listaProduto();

				    for (Iterator <Produto> itProdutos = listaProdutos.iterator(); itProdutos.hasNext();){
				    	Produto produto = (Produto) itProdutos.next();
				    %>
						<tr>
							<td><%=produto.getIdProduto()%></td> 
							<td><%=produto.getNomeProduto()%></td>
							<td><%=produto.getCategoria().nomeCategoria%></td>
							<td><%=produto.getPreco()%></td>
							<td><%=produto.getEstoque()%></td>
							<td><%=produto.getBloqueado()%></td>

							<td><a href="produto_atualiza.jsp?idProduto=<%=produto.getIdProduto()%>">Editar</a>
								<a href="produto_deleta.jsp?idProduto=<%=produto.getIdProduto()%>" onclick="return ConfirmaExclusao();">Remover</a>
							</td>
						</tr>
				    <%
			         }
					%>
			</tbody>
		  </table>
      </div>
</body>
</html>