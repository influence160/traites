
<%@ page import="com.traites.domain.SerieDeTraites" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'serieDeTraites.label', default: 'SerieDeTraites')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-serieDeTraites" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-serieDeTraites" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="articleAchete" title="${message(code: 'serieDeTraites.articleAchete.label', default: 'Article Achete')}" />
					
						<g:sortableColumn property="notes" title="${message(code: 'serieDeTraites.notes.label', default: 'Notes')}" />
					
						<th><g:message code="serieDeTraites.carnet.label" default="Carnet" /></th>
					
						<th><g:message code="serieDeTraites.client.label" default="Client" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'serieDeTraites.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'serieDeTraites.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${serieDeTraitesInstanceList}" status="i" var="serieDeTraitesInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${serieDeTraitesInstance.id}">${fieldValue(bean: serieDeTraitesInstance, field: "articleAchete")}</g:link></td>
					
						<td>${fieldValue(bean: serieDeTraitesInstance, field: "notes")}</td>
					
						<td>${fieldValue(bean: serieDeTraitesInstance, field: "carnet")}</td>
					
						<td>${fieldValue(bean: serieDeTraitesInstance, field: "client")}</td>
					
						<td><g:formatDate date="${serieDeTraitesInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${serieDeTraitesInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${serieDeTraitesInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
