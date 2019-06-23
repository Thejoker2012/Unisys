<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<%@ page import="br.com.unisys.model.Cliente" %>
<%@ page import="br.com.unisys.model.ClienteDAO" %>

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
	<h3><font color="blue">Consulta Cliente</font></h3><hr>
	
      <div class="col-md-12 column">
          <table class="table table-condensed table-bordered">
            <thead>
              <tr>
              	<th>#</th>
                <th>Nome do Cliente</th>
                <th>CPF</th>
                <th>Telefone</th>
				<th>Celular</th>
				<th>Email</th>
              </tr>
            </thead>        
			<tbody>
				<%
					Session sessionH = new HibernateUtil().getSession();
					sessionH.beginTransaction();
					ClienteDAO dao = new ClienteDAO(sessionH);
					
				    List <Cliente> listaClientes = dao.listaCliente();

				    for (Iterator <Cliente> itClientes = listaClientes.iterator(); itClientes.hasNext();){
				    	Cliente cliente = (Cliente) itClientes.next();
				    %>
						<tr>
							<td><%=cliente.getIdCliente()%></td> 
							<td><%=cliente.getNomeCliente()%></td>
							<td><%=cliente.getCpf()%></td>
							<td><%=cliente.getTelefone()%></td>
							<td><%=cliente.getCelular()%></td>
							<td><%=cliente.getEmail()%></td>

							<td><a href="cliente_atualiza.jsp?idCliente=<%=cliente.getIdCliente()%>">Editar</a>
								<a href="cliente_deleta.jsp?idCliente=<%=cliente.getIdCliente()%>" onclick="return ConfirmaExclusao();">Remover</a>
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