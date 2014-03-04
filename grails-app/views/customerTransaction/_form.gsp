<%@ page import="seoss.CustomerTransaction" %>



<div class="fieldcontain ${hasErrors(bean: customerTransactionInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="customerTransaction.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount" value="${fieldValue(bean: customerTransactionInstance, field: 'amount')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerTransactionInstance, field: 'currency', 'error')} ">
	<label for="currency">
		<g:message code="customerTransaction.currency.label" default="Currency" />
		
	</label>
	<g:textField name="currency" value="${customerTransactionInstance?.currency}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerTransactionInstance, field: 'customer', 'error')} required">
	<label for="customer">
		<g:message code="customerTransaction.customer.label" default="Customer" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="customer" name="customer.id" from="${seoss.Customer.list()}" optionKey="id" required="" value="${customerTransactionInstance?.customer?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerTransactionInstance, field: 'paid', 'error')} ">
	<label for="paid">
		<g:message code="customerTransaction.paid.label" default="Paid" />
		
	</label>
	<g:checkBox name="paid" value="${customerTransactionInstance?.paid}" />
</div>

<div class="fieldcontain ${hasErrors(bean: customerTransactionInstance, field: 'refunded', 'error')} ">
	<label for="refunded">
		<g:message code="customerTransaction.refunded.label" default="Refunded" />
		
	</label>
	<g:checkBox name="refunded" value="${customerTransactionInstance?.refunded}" />
</div>

