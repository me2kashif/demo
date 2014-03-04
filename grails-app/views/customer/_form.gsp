<%@ page import="seoss.Customer" %>



<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'firstName', 'error')} ">
	<label for="firstName">
		<g:message code="customer.firstName.label" default="First Name" />
		
	</label>
	<g:textField name="firstName" value="${customerInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="customer.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${customerInstance?.lastName}"/>
</div>

