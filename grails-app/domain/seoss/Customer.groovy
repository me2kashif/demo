package seoss

/**
 * Class for my Customers
 * @author Kashif Ur Rehman
 *
 */
class Customer {
	
	String firstName
	String lastName

    static constraints = {
    }
	
	
	String toString(){
		return "$lastName" + " " + "$firstName"
	}
}
