
<%@ page import="domain.Cars" %>
<%@ page import="domain.Reservation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cars.label', default: 'Cars')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-cars" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/cars/list')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-cars" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list cars">
			
				<g:if test="${carsInstance?.marque}">
				<li class="fieldcontain">
					<span id="marque-label" class="property-label"><g:message code="cars.marque.label" default="Marque" /></span>
					
						<span class="property-value" aria-labelledby="marque-label"><g:fieldValue bean="${carsInstance}" field="marque"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carsInstance?.type_carburant}">
				<li class="fieldcontain">
					<span id="type_carburant-label" class="property-label"><g:message code="cars.type_carburant.label" default="Typecarburant" /></span>
					
						<span class="property-value" aria-labelledby="type_carburant-label"><g:fieldValue bean="${carsInstance}" field="type_carburant"/></span>
					
				</li>
				</g:if>
				<li class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'dateReservation', 'error')} required">
	<label for="dateReservation">
		<g:message code="reservation.dateReservation.label" default="Date Reservation" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker id="datepick" name="dateReservation" precision="day"  value="${new Date()}"  />
</li>
			<button class="but" value="click" />
			</ol>
			
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${carsInstance?.id}" />
					<g:hiddenField name="date" value="${reservationInstance?.dateReservation}" />
					<g:link class="edit" action="edit" id="${carsInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					<g:link class="reserve" action="reserve" id="${carsInstance?.id}" params="[date: '']"><g:message code="default.button.edit.label" default="Reserve" /></g:link>
					</fieldset>
			</g:form>
		</div>
		<script type="text/javascript" src="http://localhost:8080/location/js/jquery.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				var date='';
				$('.but').click(function(){
					lien=$('.reserve').attr('href');
					alert(lien);
					
					/*date=$('#datepick_day').val()+'-'+$('#datepick_month').val()+'-'+$('#datepick_year').val();
					//alert(date);
					$('.reserve').attr('params','[date: \''+date+'\']');
					alert($('.reserve').attr('params'));*/
					});
					
					
				
				});
		</script>
	</body>
</html>
