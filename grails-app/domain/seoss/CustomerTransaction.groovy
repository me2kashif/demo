package seoss

/**
 * Class for recording the credit card transactions
 * @author Kashif Ur Rehman
 *
 */
class CustomerTransaction {
	
	boolean paid
	Float amount
	String currency
	boolean refunded
	Customer customer
	
//Time stamp fields will be populated by grails automatically
	Date dateCreated
	Date lastUpdated

    static constraints = {
		
    }
	
	static mapping = {
		autoTimestamp true
	}
}