
<%@ page import="com.traites.domain.Traite" %>
<div id="list-traite" class="content scaffold-list">
	<div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
		<span id="ui-dialog-title-list-traite" class="ui-dialog-title"> </span>
		<a class="ui-dialog-titlebar-close ui-corner-all" href="#" role="button">
			<span class="ui-icon ui-icon-closethick">close</span>
		</a>
	</div>
	<h1><g:message code="default.list.label" args="[entityName]" /></h1>
	<g:if test="${flash.message}">
	<div class="message" role="status">${flash.message}</div>
	</g:if>
	<table>
		<thead>
			<tr>
			
				<g:sortableColumn property="montant" title="${message(code: 'traite.montant.label', default: 'Montant')}" />
			
				<g:sortableColumn property="echeance" title="${message(code: 'traite.echeance.label', default: 'Echeance')}" />
			
				<g:sortableColumn property="notes" title="${message(code: 'traite.notes.label', default: 'Notes')}" />
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'traite.dateCreated.label', default: 'Date Created')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'traite.lastUpdated.label', default: 'Last Updated')}" />
			
				<g:sortableColumn property="numero" title="${message(code: 'traite.numero.label', default: 'Numero')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${serieDeTraitesInstance.traites}" status="i" var="traiteInstance">
			<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
			
				<td><g:link action="show" id="${traiteInstance.id}">${fieldValue(bean: traiteInstance, field: "montant")}</g:link></td>
			
				<td><g:formatDate date="${traiteInstance.echeance}" /></td>
			
				<td>${fieldValue(bean: traiteInstance, field: "notes")}</td>
			
				<td><g:formatDate date="${traiteInstance.dateCreated}" /></td>
			
				<td><g:formatDate date="${traiteInstance.lastUpdated}" /></td>
			
				<td>${fieldValue(bean: traiteInstance, field: "numero")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<g:paginate total="${serieDeTraitesInstance.traites.size()}" />
	</div>
</div>