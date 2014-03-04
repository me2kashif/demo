
<%@ page import="seoss.CustomerTransaction" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'customerTransaction.label', default: 'CustomerTransaction')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-customerTransaction" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-customerTransaction" class="content scaffold-list" role="main">
			<h1><g:message code="customertransaction.failed.list.label" /></h1>
			<table>
			<thead>
					<tr>
						<g:sortableColumn property="id" title="${message(code: 'customerTransaction.id.label', default: 'Id')}" />
						<th><g:message code="customerTransaction.customer.label" default="Customer" /></th>
						<g:sortableColumn property="amount" title="${message(code: 'customerTransaction.amount.label', default: 'Amount')}" />
						<g:sortableColumn property="dateCreated" title="${message(code: 'customerTransaction.refunded.label', default: 'Date Created')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${customerTransactionInstanceList}" status="i" var="customerTransactionInstance">
					<tr class="${(i % 2) == 0 ? 'even-failed' : 'odd-failed'}">
						<td><g:link action="show" id="${customerTransactionInstance.id}">${fieldValue(bean: customerTransactionInstance, field: "id")}</g:link></td>
						<td>${fieldValue(bean: customerTransactionInstance, field: "customer")}</td>
						<td><g:link action="show" id="${customerTransactionInstance.id}">${fieldValue(bean: customerTransactionInstance, field: "amount")}</g:link></td>
						<td>${fieldValue(bean: customerTransactionInstance, field: "dateCreated")}</td>					
					</tr>
				</g:each>
				</tbody>
			</table>
		</div>
		
		<!-- For Refunded Charges -->
		
		
		<div id="list-customerTransaction" class="content scaffold-list" role="main">
			<h1><g:message code="customertransaction.refunded.list.label" /></h1>
			<table>
			<thead>
					<tr>
						<g:sortableColumn property="id" title="${message(code: 'customerTransaction.id.label', default: 'Id')}" />
						<th><g:message code="customerTransaction.customer.label" default="Customer" /></th>
						<g:sortableColumn property="amount" title="${message(code: 'customerTransaction.amount.label', default: 'Amount')}" />
						<g:sortableColumn property="lastUpdated" title="${message(code: 'customerTransaction.lastUpdate.label', default: 'Last Updated')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${refundedTransactionsInstanceList}" status="i" var="failedCustomerTransactionInstance">
					<tr class="${(i % 2) == 0 ? 'even-refunded' : 'odd-refunded'}">
						<td><g:link action="show" id="${failedCustomerTransactionInstance.id}">${fieldValue(bean: failedCustomerTransactionInstance, field: "id")}</g:link></td>
						<td>${fieldValue(bean: failedCustomerTransactionInstance, field: "customer")}</td>
						<td><g:link action="show" id="${failedCustomerTransactionInstance.id}">${fieldValue(bean: failedCustomerTransactionInstance, field: "amount")}</g:link></td>
						<td>${fieldValue(bean: failedCustomerTransactionInstance, field: "lastUpdated")}</td>					
					</tr>
				</g:each>
				</tbody>
			</table>
		</div>
		
				<!-- For Successfull Charges -->
		
		<div id="list-customerTransaction" class="content scaffold-list" role="main">
			<h1><g:message code="customertransaction.successful.list.label" /></h1>
			<table>
			<thead>
					<tr>
						<g:sortableColumn property="id" title="${message(code: 'customerTransaction.id.label', default: 'Id')}" />
						<th><g:message code="customerTransaction.customer.label" default="Customer" /></th>
						<g:sortableColumn property="amount" title="${message(code: 'customerTransaction.amount.label', default: 'Amount')}" />
						<g:sortableColumn property="dateCreated" title="${message(code: 'customerTransaction.refunded.label', default: 'Date Created')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${successfullTransactionsInstanceList}" status="i" var="sCustomerTransactionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${sCustomerTransactionInstance.id}">${fieldValue(bean: sCustomerTransactionInstance, field: "id")}</g:link></td>
						<td>${fieldValue(bean: sCustomerTransactionInstance, field: "customer")}</td>
						<td><g:link action="show" id="${sCustomerTransactionInstance.id}">${fieldValue(bean: sCustomerTransactionInstance, field: "amount")}</g:link></td>
						<td>${fieldValue(bean: sCustomerTransactionInstance, field: "dateCreated")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
		</div>
	</body>
</html>
