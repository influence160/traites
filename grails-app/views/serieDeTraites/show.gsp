
<%@ page import="com.traites.domain.SerieDeTraites" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'serieDeTraites.label', default: 'SerieDeTraites')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:javascript>
			var viewObject = {
				serieDeTraitesId: ${serieDeTraitesInstance?.id}
			};
		</g:javascript>
		<a href="#show-serieDeTraites" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-serieDeTraites" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list serieDeTraites">
			
				<g:if test="${serieDeTraitesInstance?.articleAchete}">
				<li class="fieldcontain">
					<span id="articleAchete-label" class="property-label"><g:message code="serieDeTraites.articleAchete.label" default="Article Achete" /></span>
					
						<span class="property-value" aria-labelledby="articleAchete-label"><g:fieldValue bean="${serieDeTraitesInstance}" field="articleAchete"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serieDeTraitesInstance?.carnet}">
				<li class="fieldcontain">
					<span id="carnet-label" class="property-label"><g:message code="serieDeTraites.carnet.label" default="Carnet" /></span>
					
						<span class="property-value" aria-labelledby="carnet-label"><g:link controller="carnet" action="show" id="${serieDeTraitesInstance?.carnet?.id}">${serieDeTraitesInstance?.carnet?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${serieDeTraitesInstance?.client}">
				<li class="fieldcontain">
					<span id="client-label" class="property-label"><g:message code="serieDeTraites.client.label" default="Client" /></span>
					
						<span class="property-value" aria-labelledby="client-label"><g:link controller="client" action="show" id="${serieDeTraitesInstance?.client?.id}">${serieDeTraitesInstance?.client?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${serieDeTraitesInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="serieDeTraites.dateCreated.label" default="Date de création" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${serieDeTraitesInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${serieDeTraitesInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="serieDeTraites.lastUpdated.label" default="Dernière modification" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${serieDeTraitesInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
				
				<g:if test="${serieDeTraitesInstance?.id}">
				<li class="fieldcontain">
					<span id="montant-label" class="property-label"><g:message code="serieDeTraites.montant.label" default="Montant total" /></span>
					
						<span id="montant-total" class="property-value" aria-labelledby="montant-label"><g:fieldValue bean="${serieDeTraitesInstance}" field="montant"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${serieDeTraitesInstance?.id}">
				<li class="fieldcontain">
					<span id="montantPaye-label" class="property-label"><g:message code="serieDeTraites.montantPaye.label" default="Montant payé" /></span>
					
						<span id="montant-paye" class="property-value" aria-labelledby="montantPaye-label"><g:fieldValue bean="${serieDeTraitesInstance}" field="montantPaye"/></span>
					
				</li>
				</g:if>
			
<%--				<g:if test="${serieDeTraitesInstance?.traites}">--%>
<%--				<li class="fieldcontain">--%>
<%--					<span id="traites-label" class="property-label"><g:message code="serieDeTraites.traites.label" default="Traites" /></span>--%>
<%--					--%>
<%--						<g:each in="${serieDeTraitesInstance.traites}" var="t">--%>
<%--						<span class="property-value" aria-labelledby="traites-label"><g:link controller="traite" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>--%>
<%--						</g:each>--%>
<%--					--%>
<%--				</li>--%>
<%--				</g:if>--%>
				
				<g:if test="${serieDeTraitesInstance?.id}">
				<li class="fieldcontain">
					<span id="nombreDeTraites-label" class="property-label"><g:message code="serieDeTraites.nombreDeTraites.label" default="Nombre de traites" /></span>
					
						<span class="property-value" aria-labelledby="nombreDeTraites-label"><g:fieldValue bean="${serieDeTraitesInstance}" field="nombreDeTraites"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serieDeTraitesInstance?.notes}">
				<li class="fieldcontain">
					<span id="notes-label" class="property-label"><g:message code="serieDeTraites.notes.label" default="Notes" /></span>
					
						<span class="property-value" aria-labelledby="notes-label"><g:fieldValue bean="${serieDeTraitesInstance}" field="notes"/></span>
					
				</li>
				</g:if>
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${serieDeTraitesInstance?.id}" />
					<g:link class="edit" action="edit" id="${serieDeTraitesInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
