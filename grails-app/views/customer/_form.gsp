<%@ page import="domain.Customer" %>



<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'login', 'error')} required">
	<label for="login">
		<g:message code="customer.login.label" default="Login" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="login" maxlength="100" required="" value="${customerInstance?.login}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="customer.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" maxlength="50" required="" value="${customerInstance?.password}"/>
</div>

