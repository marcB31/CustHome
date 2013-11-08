<%@ page import="domain.Customer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
		<title>Connexion</title>
	</head>
	<body>
		<div class="body">
			<h1>Login</h1>
			<g:if test="${flash.message }">
				<div class="flash-message">${flash.message }</div>
			</g:if>
			<g:form action="authenticate" method="post">
				<div class="dialog">
					<table>
						<tr class="prop">
							<td valign="top" class="name">
								<label for="login">Login : </label>
							</td>
							<td valign="top">
								<input type="text" id="login" name="login" />
							</td>
						</tr>
						<tr class="prop">
							<td valign="top" class="name">
								<label for="password">Password : </label>
							</td>
							<td valign="top">
								<input type="password" id="password" name="password" />
							</td>
						</tr>
					</table>
				</div>
				<div class="buttons">
					<span class="bouton">
						<input type="submit" value="Connexion" />
					</span>
				</div>
			</g:form>
		</div>
	</body>
</html>