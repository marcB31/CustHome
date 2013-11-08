<%@page import="domain.Cars"%>
<div id="search">
	<g:form url='[controller : "Cars", action:"result"]' id="carsSearchForm" name="carsSearchForm" method="get" >
		<div class="fieldcontain ${hasErrors(bean: carsInstance, field: 'marque', 'error')} required">
	<label for="marque">
		<g:message code="cars.marque.label" default="Marque" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="marque" from="${domain.Cars$Marque?.values()}" keys="${domain.Cars$Marque.values()*.name()}" required="" value="${carsInstance?.marque?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carsInstance, field: 'type_carburant', 'error')} required">
	<label for="type_carburant">
		<g:message code="cars.type_carburant.label" default="Typecarburant" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="type_carburant" from="${domain.Cars$Carburant?.values()}" keys="${domain.Cars$Carburant.values()*.name()}" required="" value="${carsInstance?.type_carburant?.name()}"/>
</div>
	</g:form>
</div>