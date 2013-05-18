
<%@ page import="com.traites.domain.Traite" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'traite.label', default: 'Traite')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-traite" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-traite" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list traite">
			
				<g:if test="${traiteInstance?.montant}">
				<li class="fieldcontain">
					<span id="montant-label" class="property-label"><g:message code="traite.montant.label" default="Montant" /></span>
					
						<span class="property-value" aria-labelledby="montant-label"><g:fieldValue bean="${traiteInstance}" field="montant"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${traiteInstance?.echeance}">
				<li class="fieldcontain">
					<span id="echeance-label" class="property-label"><g:message code="traite.echeance.label" default="Echeance" /></span>
					
						<span class="property-value" aria-labelledby="echeance-label"><g:formatDate date="${traiteInstance?.echeance}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${traiteInstance?.notes}">
				<li class="fieldcontain">
					<span id="notes-label" class="property-label"><g:message code="traite.notes.label" default="Notes" /></span>
					
						<span class="property-value" aria-labelledby="notes-label"><g:fieldValue bean="${traiteInstance}" field="notes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${traiteInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="traite.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${traiteInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${traiteInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="traite.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${traiteInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${traiteInstance?.numero}">
				<li class="fieldcontain">
					<span id="numero-label" class="property-label"><g:message code="traite.numero.label" default="Numero" /></span>
					
						<span class="property-value" aria-labelledby="numero-label"><g:fieldValue bean="${traiteInstance}" field="numero"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${traiteInstance?.paye}">
				<li class="fieldcontain">
					<span id="paye-label" class="property-label"><g:message code="traite.paye.label" default="Paye" /></span>
					
						<span class="property-value" aria-labelledby="paye-label"><g:formatBoolean boolean="${traiteInstance?.paye}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${traiteInstance?.payements}">
				<li class="fieldcontain">
					<span id="payements-label" class="property-label"><g:message code="traite.payements.label" default="Payements" /></span>
					
						<g:each in="${traiteInstance.payements}" var="p">
						<span class="property-value" aria-labelledby="payements-label"><g:link controller="payement" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${traiteInstance?.serieDeTraites}">
				<li class="fieldcontain">
					<span id="serieDeTraites-label" class="property-label"><g:message code="traite.serieDeTraites.label" default="Serie De Traites" /></span>
					
						<span class="property-value" aria-labelledby="serieDeTraites-label"><g:link controller="serieDeTraites" action="show" id="${traiteInstance?.serieDeTraites?.id}">${traiteInstance?.serieDeTraites?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${traiteInstance?.id}" />
					<g:link class="edit" action="edit" id="${traiteInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
