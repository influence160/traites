<%@ page import="com.traites.domain.Carnet" %>



<div class="fieldcontain ${hasErrors(bean: carnetInstance, field: 'numero', 'error')} required">
	<label for="numero">
		<g:message code="carnet.numero.label" default="Numero" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="numero" required="" value="${carnetInstance?.numero}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carnetInstance, field: 'seriesDeTraites', 'error')} ">
	<label for="seriesDeTraites">
		<g:message code="carnet.seriesDeTraites.label" default="Series De Traites" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${carnetInstance?.seriesDeTraites?}" var="s">
    <li><g:link controller="serieDeTraites" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="serieDeTraites" action="create" params="['carnet.id': carnetInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'serieDeTraites.label', default: 'SerieDeTraites')])}</g:link>
</li>
</ul>

</div>

