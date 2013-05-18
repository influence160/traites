
<%@ page import="com.traites.domain.Traite" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'traite.label', default: 'Traite')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-traite" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-traite" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="montant" title="${message(code: 'traite.montant.label', default: 'Montant')}" />
					
						<g:sortableColumn property="echeance" title="${message(code: 'traite.echeance.label', default: 'Echeance')}" />
					
						<g:sortableColumn property="notes" title="${message(code: 'traite.notes.label', default: 'Notes')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'traite.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'traite.lastUpdated.label', default: 'Last Updated')}" />
					
						<g:sortableColumn property="numero" title="${message(code: 'traite.numero.label', default: 'Numero')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${traiteInstanceList}" status="i" var="traiteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${traiteInstance.id}">${fieldValue(bean: traiteInstance, field: "montant")}</g:link></td>
					
						<td><g:formatDate date="${traiteInstance.echeance}" /></td>
					
						<td>${fieldValue(bean: traiteInstance, field: "notes")}</td>
					
						<td><g:formatDate date="${traiteInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${traiteInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: traiteInstance, field: "numero")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${traiteInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
