
<%@ page import="com.traites.domain.Payement" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'payement.label', default: 'Payement')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-payement" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-payement" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list payement">
			
				<g:if test="${payementInstance?.montant}">
				<li class="fieldcontain">
					<span id="montant-label" class="property-label"><g:message code="payement.montant.label" default="Montant" /></span>
					
						<span class="property-value" aria-labelledby="montant-label"><g:fieldValue bean="${payementInstance}" field="montant"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${payementInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="payement.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${payementInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${payementInstance?.datePayement}">
				<li class="fieldcontain">
					<span id="datePayement-label" class="property-label"><g:message code="payement.datePayement.label" default="Date Payement" /></span>
					
						<span class="property-value" aria-labelledby="datePayement-label"><g:formatDate date="${payementInstance?.datePayement}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${payementInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="payement.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${payementInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${payementInstance?.traite}">
				<li class="fieldcontain">
					<span id="traite-label" class="property-label"><g:message code="payement.traite.label" default="Traite" /></span>
					
						<span class="property-value" aria-labelledby="traite-label"><g:link controller="traite" action="show" id="${payementInstance?.traite?.id}">${payementInstance?.traite?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${payementInstance?.id}" />
					<g:link class="edit" action="edit" id="${payementInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
