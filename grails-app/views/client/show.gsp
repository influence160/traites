
<%@ page import="com.traites.domain.Client" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-client" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-client" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list client">
			
				<g:if test="${clientInstance?.nom}">
				<li class="fieldcontain">
					<span id="nom-label" class="property-label"><g:message code="client.nom.label" default="Nom" /></span>
					
						<span class="property-value" aria-labelledby="nom-label"><g:fieldValue bean="${clientInstance}" field="nom"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.prenom}">
				<li class="fieldcontain">
					<span id="prenom-label" class="property-label"><g:message code="client.prenom.label" default="Prenom" /></span>
					
						<span class="property-value" aria-labelledby="prenom-label"><g:fieldValue bean="${clientInstance}" field="prenom"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.cin}">
				<li class="fieldcontain">
					<span id="cin-label" class="property-label"><g:message code="client.cin.label" default="Cin" /></span>
					
						<span class="property-value" aria-labelledby="cin-label"><g:fieldValue bean="${clientInstance}" field="cin"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.pere}">
				<li class="fieldcontain">
					<span id="pere-label" class="property-label"><g:message code="client.pere.label" default="Pere" /></span>
					
						<span class="property-value" aria-labelledby="pere-label"><g:fieldValue bean="${clientInstance}" field="pere"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.grandPere}">
				<li class="fieldcontain">
					<span id="grandPere-label" class="property-label"><g:message code="client.grandPere.label" default="Grand Pere" /></span>
					
						<span class="property-value" aria-labelledby="grandPere-label"><g:fieldValue bean="${clientInstance}" field="grandPere"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.mari}">
				<li class="fieldcontain">
					<span id="mari-label" class="property-label"><g:message code="client.mari.label" default="Mari" /></span>
					
						<span class="property-value" aria-labelledby="mari-label"><g:fieldValue bean="${clientInstance}" field="mari"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.adresse}">
				<li class="fieldcontain">
					<span id="adresse-label" class="property-label"><g:message code="client.adresse.label" default="Adresse" /></span>
					
						<span class="property-value" aria-labelledby="adresse-label"><g:fieldValue bean="${clientInstance}" field="adresse"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.telephone1}">
				<li class="fieldcontain">
					<span id="telephone1-label" class="property-label"><g:message code="client.telephone1.label" default="Telephone1" /></span>
					
						<span class="property-value" aria-labelledby="telephone1-label"><g:fieldValue bean="${clientInstance}" field="telephone1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.telephone2}">
				<li class="fieldcontain">
					<span id="telephone2-label" class="property-label"><g:message code="client.telephone2.label" default="Telephone2" /></span>
					
						<span class="property-value" aria-labelledby="telephone2-label"><g:fieldValue bean="${clientInstance}" field="telephone2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.notes}">
				<li class="fieldcontain">
					<span id="notes-label" class="property-label"><g:message code="client.notes.label" default="Notes" /></span>
					
						<span class="property-value" aria-labelledby="notes-label"><g:fieldValue bean="${clientInstance}" field="notes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.serieDeTraites}">
				<li class="fieldcontain">
					<span id="serieDeTraites-label" class="property-label"><g:message code="client.serieDeTraites.label" default="Serie De Traites" /></span>
					
						<g:each in="${clientInstance.serieDeTraites}" var="s">
						<span class="property-value" aria-labelledby="serieDeTraites-label"><g:link controller="serieDeTraites" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${clientInstance?.id}" />
					<g:link class="edit" action="edit" id="${clientInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
