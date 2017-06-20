<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
	
	<title>${produto.titulo} - Casa do Código</title>

		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
		
		<link href="https://plus.googlecom/108540024862647200608" rel="publisher"/>
		<link href="https://cdn.rawgit.com/alura-cursos/spring-mvc-i-criando-aplicacoes-web-master/master/src/main/webapp/resources/css/cssbase-min.css" rel="stylesheet" type="text/css" media="all" />
		<link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet'/>
		<link href="https://cdn.rawgit.com/alura-cursos/spring-mvc-i-criando-aplicacoes-web-master/master/src/main/webapp/resources/css/fonts.css" rel="stylesheet" type="text/css" media="all" />
		<link href="https://cdn.rawgit.com/alura-cursos/spring-mvc-i-criando-aplicacoes-web-master/master/src/main/webapp/resources/css/fontello-ie7.css" rel="stylesheet" type="text/css" media="all" />
		<link href="https://cdn.rawgit.com/alura-cursos/spring-mvc-i-criando-aplicacoes-web-master/master/src/main/webapp/resources/css/fontello-embedded.css" rel="stylesheet" type="text/css" media="all" />
		<link href="https://cdn.rawgit.com/alura-cursos/spring-mvc-i-criando-aplicacoes-web-master/master/src/main/webapp/resources/css/fontello.css" rel="stylesheet" type="text/css" media="all" />
		<link href="https://cdn.rawgit.com/alura-cursos/spring-mvc-i-criando-aplicacoes-web-master/master/src/main/webapp/resources/css/style.css" rel="stylesheet" type="text/css" media="all" />
		<link href="https://cdn.rawgit.com/alura-cursos/spring-mvc-i-criando-aplicacoes-web-master/master/src/main/webapp/resources/css/layout-colors.css" rel="stylesheet" type="text/css" media="all" />
		<link href="https://cdn.rawgit.com/alura-cursos/spring-mvc-i-criando-aplicacoes-web-master/master/src/main/webapp/resources/css/responsive-style.css" rel="stylesheet" type="text/css" media="all" />
		<link href="https://cdn.rawgit.com/alura-cursos/spring-mvc-i-criando-aplicacoes-web-master/master/src/main/webapp/resources/css/guia-do-programador-style.css" rel="stylesheet" type="text/css"  media="all"  />
	    <link href="https://cdn.rawgit.com/alura-cursos/spring-mvc-i-criando-aplicacoes-web-master/master/src/main/webapp/resources/css/produtos.css" rel="stylesheet" type="text/css"  media="all"  />	
	    <link href="https://cdn.rawgit.com/alura-cursos/spring-mvc-i-criando-aplicacoes-web-master/master/src/main/webapp/resources/css/book-collection.css" rel="stylesheet" type="text/css"  media="all"  />
	    <link href="https://cdn.rawgit.com/alura-cursos/spring-mvc-i-criando-aplicacoes-web-master/master/src/main/webapp/resources/css/checkout-style.css" rel="stylesheet" type="text/css"  media="all"  />
	   	
</head>
<body>

  <header id="layout-header">
		<div class="clearfix container">
			<a href="${s:mvcUrl('HC#index').build()}" id="logo">
				<img src="https://cdn.rawgit.com/alura-cursos/spring-mvc-i-criando-aplicacoes-web-master/master/src/main/webapp/resources/imagens/cdc-logo.svg" />
			</a>
			<div id="header-content">
				<nav id="main-nav">
					
					<ul class="clearfix">
						<li><a href="${s:mvcUrl('CCC#itens').build()}" rel="nofollow">Carrinho ( ${carrinhoCompras.quantidade} )</a></li>

						<li><a href="/pages/sobre-a-casa-do-codigo" rel="nofollow">Sobre Nós</a></li>

						<li><a href="/pages/perguntas-frequentes" rel="nofollow">Perguntas Frequentes</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</header>
	<nav class="categories-nav">
		<ul class="container">
		
			<li class="category"><a href="${s:mvcUrl('HC#index').build()}" class="block clearfix">Home</a></li>
			<li class="category"><a href="/collections/livros-de-agile">
					Agile </a></li>
			<li class="category"><a href="/collections/livros-de-front-end">
					Front End </a></li>
			<li class="category"><a href="/collections/livros-de-games">
					Games </a></li>
			<li class="category"><a href="/collections/livros-de-java">
					Java </a></li>
			<li class="category"><a href="/collections/livros-de-mobile">
					Mobile </a></li>
			<li class="category"><a
				href="/collections/livros-desenvolvimento-web"> Web </a></li>
			<li class="category"><a href="/collections/outros"> Outros </a></li>
		</ul>
	</nav>

	<article id="${produto.id}">
		  <header id="product-highlight" class="clearfix">
		    <div id="product-overview" class="container">
		      <img width="280px" height="395px" src="http://cdn.shopify.com/s/files/1/0155/7645/products/css-eficiente-featured_large.png?v=1435245145" class="product-featured-image" />
		      <h1 class="product-title">${produto.titulo}</h1>
		      <p class="product-author">
		        <span class="product-author-link">
		          
		        </span>
		      </p>	
			
		    <p class="book-description">
		    	${produto.descricao}
		    </p>
		    </div>
		  </header>
	
	  
	  <section class="buy-options clearfix">  
	  <form:form servletRelativeAction="/carrinho/add" method="post" cssClass="container">
	    <ul id="variants" class="clearfix">
	    	<input type="hidden" name="produtoId" value="${produto.id}" />
	    	<c:forEach items="${produto.precos}" var="preco">
	    	  <li class="buy-option">
	            <input type="radio" name="tipoPreco" class="variant-radio" id="tipo" value="${preco.tipo}"  checked="checked"  />
	            <label  class="variant-label">
	              ${preco.tipo} 
	            </label>
	            <small class="compare-at-price">R$ 39,90</small>
	            <p class="variant-price">${preco.valor}</p>
	          </li>
	    	</c:forEach>           
	    </ul>
	    <button type="submit" class="submit-image icon-basket-alt" alt="Compre Agora" title="Compre Agora${produto.titulo}"></button>
	   </form:form>
	  
	</section>
	  
	<div class="container">
	  <section class="summary">
	    <ul>
	      	<li><h3>E muito mais... <a href='/pages/sumario-java8'>veja o sumário</a>.</h3></li>
	    </ul>
	  </section>
	  
	  <section class="data product-detail">
	    <h2 class="section-title">Dados do livro:</h2>
	    <p>Número de páginas: <span>${produto.paginas }</span></p>
	    <p></p>
	    <p>Data de publicação: <fmt:formatDate pattern="dd/MM/yyyy" value="${produto.dataLancamento.time }" /> </p>
	    <p>Encontrou um erro? <a href='/submissao-errata' target='_blank'>Submeta uma errata</a></p>
	  </section>
	</div>
	
	</article>	

	<%@include file="/WEB-INF/views/rodape.jsp" %>
	
</body>
</html>