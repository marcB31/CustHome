<%@ page import="domain.Cars" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cars.label', default: 'Cars')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-cars" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/cars/list')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				<li><g:link class="search" action="search"><g:message code="default.search.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>

		</div>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
		<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="marque" title="${message(code: 'cars.marque.label', default: 'Marque')}" />
					
						<g:sortableColumn property="type_carburant" title="${message(code: 'cars.type_carburant.label', default: 'Typecarburant')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${carsInstanceList}" status="i" var="carsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${carsInstance.id}">${fieldValue(bean: carsInstance, field: "marque")}</g:link></td>
					
						<td>${fieldValue(bean: carsInstance, field: "type_carburant")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
	</body>
</html>
