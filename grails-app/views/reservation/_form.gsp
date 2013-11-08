<%@ page import="domain.Reservation" %>



<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'cars', 'error')} ">
	<label for="cars">
		<g:message code="reservation.cars.label" default="Cars" />
		
	</label>
	<g:select name="cars" from="${domain.Cars.list()}" multiple="multiple" optionKey="id" size="5" value="${reservationInstance?.cars*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'cars_id', 'error')} required">
	<label for="cars_id">
		<g:message code="reservation.cars_id.label" default="Carsid" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cars_id" type="number" value="${reservationInstance.cars_id}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'customer_id', 'error')} required">
	<label for="customer_id">
		<g:message code="reservation.customer_id.label" default="Customerid" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="customer_id" type="number" value="${reservationInstance.customer_id}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'dateReservation', 'error')} required">
	<label for="dateReservation">
		<g:message code="reservation.dateReservation.label" default="Date Reservation" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateReservation" precision="day"  value="${reservationInstance?.dateReservation}"  />
</div>

