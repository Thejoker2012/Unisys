<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>

<head>
  <meta charset="utf-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
   		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>.:: SGV - Sistema de Gerenciamento de Viagens ::.</title>
		<link rel="shortcut icon" href="bootstrap/img/sgv_icon.gif">	
		
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> -->
	<script src="bootstrap/js/jquery.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap-theme.css" rel="stylesheet">
		<style id="holderjs-style" type="text/css"></style>
  <decorator:head />
  
  <body role="document">

    <!-- Fixed navbar -->
    <!-- <div class="navbar navbar-default navbar-fixed-top" role="navigation">-->
    <div class="navbar navbar-default" role="navigation">
      <div class="container">
		<img src="bootstrap/img/logo_reis_viagens.png" align=left 150%>
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="index.jsp">Home</a></li>
            <li class="dropdown" disabled>
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Administração <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="perfil_adiciona.jsp">Cadastra Perfis</a></li>
                <li><a href="usuario_adiciona.jsp">Cadastra Usuários</a></li>
                <li><a href="usuario_consulta.jsp">Consulta Usuários</a></li>
               <!-- <li class="divider"></li>
                <li class="dropdown-header">Nav header</li>
                <li><a href="#">Separated link</a></li>
                <li><a href="#">One more separated link</a></li>-->
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Consultas <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
              	<li><a href="cliente_consulta.jsp">Clientes</a></li>
                <li><a href="fornecedor_consulta_hoteis.jsp">Hotéis</a></li>
                <li><a href="fornecedor_consulta_restaurantes.jsp">Restaurantes</a></li>
                <li><a href="fornecedor_consulta_transportes.jsp">Transportes</a></li>
                <li><a href="pacote_consulta.jsp">Pacotes</a></li>
                <li><a href="venda_consulta.jsp">Vendas de Pacotes</a></li>
               <!-- <li class="divider"></li>
                <li class="dropdown-header">Nav header</li>
                <li><a href="#">Separated link</a></li>
                <li><a href="#">One more separated link</a></li>-->
              </ul>
            </li>
			<li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Cadastros <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="cliente_adiciona.jsp">Cliente</a></li>
                <li><a href="fornecedor_adiciona.jsp">Fornecedor</a></li>
                <li><a href="pacote_adiciona.jsp">Pacotes</a></li>
                <li><a href="venda_adiciona.jsp">Venda de Pacotes</a></li>
              </ul>
            </li>
			<li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Relatórios <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="filtro_rel_pacotes.jsp">Lista de Pacotes</a></li>
                <li><a href="filtro_rel_clientes.jsp">Lista de Clientes</a></li>
                <li><a href="filtro_rel_perfil.jsp">Lista de Perfis</a></li>
              </ul>
            </li>
			<li><a href="login_off.jsp"><i class="glyphicon glyphicon-user"></i>Sair</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>
    <div class="container theme-showcase" role="main">
    <div id="content">
      <decorator:body />
    </div>
    	<!-- 
    	<div id="erros" >
    		<ul>
    			<c:forEach items="${errors}" var="error" >
    				<li> ${error.message } </li>
    			</c:forEach>
    		</ul>
    	</div>
    	-->
    </div>
  </body>
</html>