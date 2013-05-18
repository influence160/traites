
<%@ page import="com.traites.domain.Payement" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'payement.label', default: 'Payement')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-payement" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-payement" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="montant" title="${message(code: 'payement.montant.label', default: 'Montant')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'payement.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="datePayement" title="${message(code: 'payement.datePayement.label', default: 'Date Payement')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'payement.lastUpdated.label', default: 'Last Updated')}" />
					
						<th><g:message code="payement.traite.label" default="Traite" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${payementInstanceList}" status="i" var="payementInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${payementInstance.id}">${fieldValue(bean: payementInstance, field: "montant")}</g:link></td>
					
						<td><g:formatDate date="${payementInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${payementInstance.datePayement}" /></td>
					
						<td><g:formatDate date="${payementInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: payementInstance, field: "traite")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${payementInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
