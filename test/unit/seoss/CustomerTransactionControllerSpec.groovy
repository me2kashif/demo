package seoss



import grails.test.mixin.*
import spock.lang.*

@TestFor(CustomerTransactionController)
@Mock(CustomerTransaction)
class CustomerTransactionControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.customerTransactionInstanceList
            model.customerTransactionInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.customerTransactionInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def customerTransaction = new CustomerTransaction()
            customerTransaction.validate()
            controller.save(customerTransaction)

        then:"The create view is rendered again with the correct model"
            model.customerTransactionInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            customerTransaction = new CustomerTransaction(params)

            controller.save(customerTransaction)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/customerTransaction/show/1'
            controller.flash.message != null
            CustomerTransaction.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def customerTransaction = new CustomerTransaction(params)
            controller.show(customerTransaction)

        then:"A model is populated containing the domain instance"
            model.customerTransactionInstance == customerTransaction
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def customerTransaction = new CustomerTransaction(params)
            controller.edit(customerTransaction)

        then:"A model is populated containing the domain instance"
            model.customerTransactionInstance == customerTransaction
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/customerTransaction/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def customerTransaction = new CustomerTransaction()
            customerTransaction.validate()
            controller.update(customerTransaction)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.customerTransactionInstance == customerTransaction

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            customerTransaction = new CustomerTransaction(params).save(flush: true)
            controller.update(customerTransaction)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/customerTransaction/show/$customerTransaction.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/customerTransaction/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def customerTransaction = new CustomerTransaction(params).save(flush: true)

        then:"It exists"
            CustomerTransaction.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(customerTransaction)

        then:"The instance is deleted"
            CustomerTransaction.count() == 0
            response.redirectedUrl == '/customerTransaction/index'
            flash.message != null
    }
}
