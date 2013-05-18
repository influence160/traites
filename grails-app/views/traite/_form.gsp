<%@ page import="com.traites.domain.Traite" %>



<div class="fieldcontain ${hasErrors(bean: traiteInstance, field: 'montant', 'error')} required">
	<label for="montant">
		<g:message code="traite.montant.label" default="Montant" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="montant" step="0.001" min="0.0" required="" value="${fieldValue(bean: traiteInstance, field: 'montant')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: traiteInstance, field: 'echeance', 'error')} ">
	<label for="echeance">
		<g:message code="traite.echeance.label" default="Echeance" />
		
	</label>
	<g:datePicker name="echeance" format="yyyy-MM-dd" precision="day"  value="${traiteInstance?.echeance}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: traiteInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="traite.notes.label" default="Notes" />
		
	</label>
	<g:textArea name="notes" cols="40" rows="5" maxlength="1000" value="${traiteInstance?.notes}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: traiteInstance, field: 'numero', 'error')} required">
	<label for="numero">
		<g:message code="traite.numero.label" default="Numero" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="numero" required="" value="${fieldValue(bean: traiteInstance, field: 'numero')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: traiteInstance, field: 'paye', 'error')} ">
	<label for="paye">
		<g:message code="traite.paye.label" default="Paye" />
		
	</label>
	<g:checkBox name="paye" value="${traiteInstance?.paye}" />
</div>

<div class="fieldcontain ${hasErrors(bean: traiteInstance, field: 'payements', 'error')} ">
	<label for="payements">
		<g:message code="traite.payements.label" default="Payements" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${traiteInstance?.payements?}" var="p">
    <li><g:link controller="payement" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="payement" action="create" params="['traite.id': traiteInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'payement.label', default: 'Payement')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: traiteInstance, field: 'serieDeTraites', 'error')} required">
	<label for="serieDeTraites">
		<g:message code="traite.serieDeTraites.label" default="Serie De Traites" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="serieDeTraites" name="serieDeTraites.id" from="${com.traites.domain.SerieDeTraites.list()}" optionKey="id" required="" value="${traiteInstance?.serieDeTraites?.id}" class="many-to-one"/>
</div>

