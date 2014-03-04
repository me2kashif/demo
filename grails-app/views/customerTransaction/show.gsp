
<%@ page import="seoss.CustomerTransaction" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'customerTransaction.label', default: 'CustomerTransaction')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-customerTransaction" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="summary">Summary</g:link></li>
			</ul>
		</div>
		<div id="show-customerTransaction" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list customerTransaction">
			
				<g:if test="${customerTransactionInstance?.amount}">
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="customerTransaction.amount.label" default="Amount" /></span>
					
						<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${customerTransactionInstance}" field="amount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerTransactionInstance?.currency}">
				<li class="fieldcontain">
					<span id="currency-label" class="property-label"><g:message code="customerTransaction.currency.label" default="Currency" /></span>
					
						<span class="property-value" aria-labelledby="currency-label"><g:fieldValue bean="${customerTransactionInstance}" field="currency"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerTransactionInstance?.customer}">
				<li class="fieldcontain">
					<span id="customer-label" class="property-label"><g:message code="customerTransaction.customer.label" default="Customer" /></span>
					
						<span class="property-value" aria-labelledby="customer-label"><g:link controller="customer" action="show" id="${customerTransactionInstance?.customer?.id}">${customerTransactionInstance?.customer?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerTransactionInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="customerTransaction.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${customerTransactionInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerTransactionInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="customerTransaction.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${customerTransactionInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerTransactionInstance?.paid}">
				<li class="fieldcontain">
					<span id="paid-label" class="property-label"><g:message code="customerTransaction.paid.label" default="Paid" /></span>
					
						<span class="property-value" aria-labelledby="paid-label"><g:formatBoolean boolean="${customerTransactionInstance?.paid}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerTransactionInstance?.refunded}">
				<li class="fieldcontain">
					<span id="refunded-label" class="property-label"><g:message code="customerTransaction.refunded.label" default="Refunded" /></span>
					
						<span class="property-value" aria-labelledby="refunded-label"><g:formatBoolean boolean="${customerTransactionInstance?.refunded}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:customerTransactionInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${customerTransactionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
