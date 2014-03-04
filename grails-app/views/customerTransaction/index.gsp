
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
				<li><g:link class="create" action="summary">Summary</g:link></li>
			</ul>
		</div>
		<div id="list-customerTransaction" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="amount" title="${message(code: 'customerTransaction.amount.label', default: 'Amount')}" />
					
						<g:sortableColumn property="currency" title="${message(code: 'customerTransaction.currency.label', default: 'Currency')}" />
					
						<th><g:message code="customerTransaction.customer.label" default="Customer" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'customerTransaction.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'customerTransaction.lastUpdated.label', default: 'Last Updated')}" />
					
						<g:sortableColumn property="paid" title="${message(code: 'customerTransaction.paid.label', default: 'Paid')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${customerTransactionInstanceList}" status="i" var="customerTransactionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${customerTransactionInstance.id}">${fieldValue(bean: customerTransactionInstance, field: "amount")}</g:link></td>
					
						<td>${fieldValue(bean: customerTransactionInstance, field: "currency")}</td>
					
						<td>${fieldValue(bean: customerTransactionInstance, field: "customer")}</td>
					
						<td><g:formatDate date="${customerTransactionInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${customerTransactionInstance.lastUpdated}" /></td>
					
						<td><g:formatBoolean boolean="${customerTransactionInstance.paid}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${customerTransactionInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
