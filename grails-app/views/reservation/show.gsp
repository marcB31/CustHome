
<%@ page import="domain.Reservation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reservation.label', default: 'Reservation')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-reservation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-reservation" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list reservation">
			
				<g:if test="${reservationInstance?.cars}">
				<li class="fieldcontain">
					<span id="cars-label" class="property-label"><g:message code="reservation.cars.label" default="Cars" /></span>
					
						<g:each in="${reservationInstance.cars}" var="c">
						<span class="property-value" aria-labelledby="cars-label"><g:link controller="cars" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${reservationInstance?.cars_id}">
				<li class="fieldcontain">
					<span id="cars_id-label" class="property-label"><g:message code="reservation.cars_id.label" default="Carsid" /></span>
					
						<span class="property-value" aria-labelledby="cars_id-label"><g:fieldValue bean="${reservationInstance}" field="cars_id"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservationInstance?.customer_id}">
				<li class="fieldcontain">
					<span id="customer_id-label" class="property-label"><g:message code="reservation.customer_id.label" default="Customerid" /></span>
					
						<span class="property-value" aria-labelledby="customer_id-label"><g:fieldValue bean="${reservationInstance}" field="customer_id"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservationInstance?.dateReservation}">
				<li class="fieldcontain">
					<span id="dateReservation-label" class="property-label"><g:message code="reservation.dateReservation.label" default="Date Reservation" /></span>
					
						<span class="property-value" aria-labelledby="dateReservation-label"><g:formatDate date="${reservationInstance?.dateReservation}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${reservationInstance?.id}" />
					<g:link class="edit" action="edit" id="${reservationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
