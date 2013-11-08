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
		<div>${ carsInstance.id }</div>
		<div>${ dat }</div>
	</body>
</html>
