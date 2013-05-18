
<%@ page import="com.traites.domain.Client" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-client" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-client" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nom" title="${message(code: 'client.nom.label', default: 'Nom')}" />
					
						<g:sortableColumn property="prenom" title="${message(code: 'client.prenom.label', default: 'Prenom')}" />
					
						<g:sortableColumn property="cin" title="${message(code: 'client.cin.label', default: 'Cin')}" />
					
						<g:sortableColumn property="pere" title="${message(code: 'client.pere.label', default: 'Pere')}" />
					
						<g:sortableColumn property="grandPere" title="${message(code: 'client.grandPere.label', default: 'Grand Pere')}" />
					
						<g:sortableColumn property="mari" title="${message(code: 'client.mari.label', default: 'Mari')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${clientInstanceList}" status="i" var="clientInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${clientInstance.id}">${fieldValue(bean: clientInstance, field: "nom")}</g:link></td>
					
						<td>${fieldValue(bean: clientInstance, field: "prenom")}</td>
					
						<td>${fieldValue(bean: clientInstance, field: "cin")}</td>
					
						<td>${fieldValue(bean: clientInstance, field: "pere")}</td>
					
						<td>${fieldValue(bean: clientInstance, field: "grandPere")}</td>
					
						<td>${fieldValue(bean: clientInstance, field: "mari")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${clientInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
