package seoss



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CustomerTransactionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CustomerTransaction.list(params), model:[customerTransactionInstanceCount: CustomerTransaction.count()]
    }

    def show(CustomerTransaction customerTransactionInstance) {
        respond customerTransactionInstance
    }

    def create() {
        respond new CustomerTransaction(params)
    }

    @Transactional
    def save(CustomerTransaction customerTransactionInstance) {
        if (customerTransactionInstance == null) {
            notFound()
            return
        }

        if (customerTransactionInstance.hasErrors()) {
            respond customerTransactionInstance.errors, view:'create'
            return
        }

        customerTransactionInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'customerTransactionInstance.label', default: 'CustomerTransaction'), customerTransactionInstance.id])
                redirect customerTransactionInstance
            }
            '*' { respond customerTransactionInstance, [status: CREATED] }
        }
    }

    def edit(CustomerTransaction customerTransactionInstance) {
        respond customerTransactionInstance
    }

    @Transactional
    def update(CustomerTransaction customerTransactionInstance) {
        if (customerTransactionInstance == null) {
            notFound()
            return
        }

        if (customerTransactionInstance.hasErrors()) {
            respond customerTransactionInstance.errors, view:'edit'
            return
        }

        customerTransactionInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CustomerTransaction.label', default: 'CustomerTransaction'), customerTransactionInstance.id])
                redirect customerTransactionInstance
            }
            '*'{ respond customerTransactionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CustomerTransaction customerTransactionInstance) {

        if (customerTransactionInstance == null) {
            notFound()
            return
        }

        customerTransactionInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CustomerTransaction.label', default: 'CustomerTransaction'), customerTransactionInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'customerTransactionInstance.label', default: 'CustomerTransaction'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	/**
	 * method for providing the summary as instructed
	 * using GORM
	 * @return
	 */
	def summary() {
		respond  CustomerTransaction.findAllWhere(paid:false), model: [refundedTransactionsInstanceList: CustomerTransaction.findAllWhere(refunded:true), successfullTransactionsInstanceList: CustomerTransaction.findAllWhere(paid:true, refunded:false)]
	}
}
