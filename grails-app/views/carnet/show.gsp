
<%@ page import="com.traites.domain.Carnet" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'carnet.label', default: 'Carnet')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-carnet" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-carnet" class="content scaffold-show" role="main">
			<h1><g:message code="carnet.show.label" args="${[carnetInstance?.numero]}" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list carnet">
<%--					<g:if test="${serieDeTraitesInstance?.lastUpdated}">--%>
<%--				<li class="fieldcontain">--%>
<%--					<span id="lastUpdated-label" class="property-label"><g:message code="serieDeTraites.lastUpdated.label" default="Last Updated" /></span>--%>
<%--					--%>
<%--						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${serieDeTraitesInstance?.lastUpdated}" /></span>--%>
<%--					--%>
<%--				</li>--%>
<%--				</g:if>--%>
				<g:if test="${carnetInstance?.seriesDeTraites}">
					<li class="fieldcontain">
						<span id="serieDeTraites-label" class="table-property-label"><g:message code="serieDeTraites.label" default="Series de traites" /></span>

					<table>
						<thead>
							<tr>
							
								<th><g:message code="serieDeTraites.client.label" default="Client" /></th>
								
								<g:sortableColumn property="articleAchete" title="${message(code: 'serieDeTraites.articleAchete.label', default: 'Article Achete')}" />
							
								<g:sortableColumn property="dateCreated" title="${message(code: 'serieDeTraites.dateCreated.label', default: 'Date Created')}" />
							
								<g:sortableColumn property="lastUpdated" title="${message(code: 'serieDeTraites.lastUpdated.label', default: 'Last Updated')}" />
							
							</tr>
						</thead>
						<tbody>
						<g:each in="${carnetInstance?.seriesDeTraites}" status="i" var="serieDeTraitesInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
								<td><g:link controller="client" action="show" id="${serieDeTraitesInstance.client.id}" >${serieDeTraitesInstance.client.nom + " " + serieDeTraitesInstance.client.prenom}</g:link></td>
							
								<td><g:link controller="serieDeTraites" action="show" id="${serieDeTraitesInstance.id}">${fieldValue(bean: serieDeTraitesInstance, field: "articleAchete")}</g:link></td>
																					
								<td><g:formatDate date="${serieDeTraitesInstance.dateCreated}" /></td>
							
								<td><g:formatDate date="${serieDeTraitesInstance.lastUpdated}" /></td>
							
							</tr>
						</g:each>
						</tbody>
					</table>
					</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${carnetInstance?.id}" />
					<g:link class="edit" action="edit" id="${carnetInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
