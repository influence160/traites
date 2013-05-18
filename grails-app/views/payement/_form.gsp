<%@ page import="com.traites.domain.Payement" %>



<div class="fieldcontain ${hasErrors(bean: payementInstance, field: 'montant', 'error')} required">
	<label for="montant">
		<g:message code="payement.montant.label" default="Montant" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="montant" step="0.001" min="0.0" required="" value="${fieldValue(bean: payementInstance, field: 'montant')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: payementInstance, field: 'datePayement', 'error')} required">
	<label for="datePayement">
		<g:message code="payement.datePayement.label" default="Date Payement" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="datePayement" precision="day"  value="${payementInstance?.datePayement}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: payementInstance, field: 'traite', 'error')} required">
	<label for="traite">
		<g:message code="payement.traite.label" default="Traite" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="traite" name="traite.id" from="${com.traites.domain.Traite.list()}" optionKey="id" required="" value="${payementInstance?.traite?.id}" class="many-to-one"/>
</div>

