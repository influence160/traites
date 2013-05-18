<%@ page import="com.traites.domain.Client" %>



<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'nom', 'error')} required">
	<label for="nom">
		<g:message code="client.nom.label" default="Nom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nom" required="" value="${clientInstance?.nom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'prenom', 'error')} required">
	<label for="prenom">
		<g:message code="client.prenom.label" default="Prenom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="prenom" required="" value="${clientInstance?.prenom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'cin', 'error')} ">
	<label for="cin">
		<g:message code="client.cin.label" default="Cin" />
		
	</label>
	<g:textField name="cin" value="${clientInstance?.cin}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'pere', 'error')} ">
	<label for="pere">
		<g:message code="client.pere.label" default="Pere" />
		
	</label>
	<g:textField name="pere" value="${clientInstance?.pere}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'grandPere', 'error')} ">
	<label for="grandPere">
		<g:message code="client.grandPere.label" default="Grand Pere" />
		
	</label>
	<g:textField name="grandPere" value="${clientInstance?.grandPere}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'mari', 'error')} ">
	<label for="mari">
		<g:message code="client.mari.label" default="Mari" />
		
	</label>
	<g:textField name="mari" value="${clientInstance?.mari}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'adresse', 'error')} ">
	<label for="adresse">
		<g:message code="client.adresse.label" default="Adresse" />
		
	</label>
	<g:textField name="adresse" value="${clientInstance?.adresse}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'telephone1', 'error')} ">
	<label for="telephone1">
		<g:message code="client.telephone1.label" default="Telephone1" />
		
	</label>
	<g:textField name="telephone1" pattern="${clientInstance.constraints.telephone1.matches}" value="${clientInstance?.telephone1}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'telephone2', 'error')} ">
	<label for="telephone2">
		<g:message code="client.telephone2.label" default="Telephone2" />
		
	</label>
	<g:textField name="telephone2" pattern="${clientInstance.constraints.telephone2.matches}" value="${clientInstance?.telephone2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="client.notes.label" default="Notes" />
		
	</label>
	<g:textArea name="notes" cols="40" rows="5" maxlength="1000" value="${clientInstance?.notes}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'serieDeTraites', 'error')} ">
	<label for="serieDeTraites">
		<g:message code="client.serieDeTraites.label" default="Serie De Traites" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${clientInstance?.serieDeTraites?}" var="s">
    <li><g:link controller="serieDeTraites" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="serieDeTraites" action="create" params="['client.id': clientInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'serieDeTraites.label', default: 'SerieDeTraites')])}</g:link>
</li>
</ul>

</div>

