<%@ page import="com.traites.domain.SerieDeTraites" %>



<div class="fieldcontain ${hasErrors(bean: serieDeTraitesInstance, field: 'articleAchete', 'error')} ">
	<label for="articleAchete">
		<g:message code="serieDeTraites.articleAchete.label" default="Article Achete" />
		
	</label>
	<g:textField name="articleAchete" value="${serieDeTraitesInstance?.articleAchete}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: serieDeTraitesInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="serieDeTraites.notes.label" default="Notes" />
		
	</label>
	<g:textField name="notes" value="${serieDeTraitesInstance?.notes}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: serieDeTraitesInstance, field: 'carnet', 'error')} required">
	<label for="carnet">
		<g:message code="serieDeTraites.carnet.label" default="Carnet" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="carnet" name="carnet.id" from="${com.traites.domain.Carnet.list()}" optionKey="id" required="" value="${serieDeTraitesInstance?.carnet?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: serieDeTraitesInstance, field: 'client', 'error')} required">
	<label for="client">
		<g:message code="serieDeTraites.client.label" default="Client" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="client" name="client.id" from="${com.traites.domain.Client.list()}" optionKey="id" required="" value="${serieDeTraitesInstance?.client?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: serieDeTraitesInstance, field: 'traites', 'error')} ">
	<label for="traites">
		<g:message code="serieDeTraites.traites.label" default="Traites" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${serieDeTraitesInstance?.traites?}" var="t">
    <li><g:link controller="traite" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="traite" action="create" params="['serieDeTraites.id': serieDeTraitesInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'traite.label', default: 'Traite')])}</g:link>
</li>
</ul>

</div>

